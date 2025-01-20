@interface ATXInterruptingNotificationsHelper
- (ATXInterruptingNotificationsHelper)init;
- (BOOL)checkIfStartEventWasTheInterruptedEvent:(id)a3;
- (BOOL)doesCurrentAppLaunchInterruptPreviousAppLaunch:(id)a3;
- (id)interruptingAppsessions;
- (void)checkAppLaunchEndEvent:(id)a3;
- (void)checkAppLaunchStartEvent:(id)a3;
- (void)checkNotificationEvent:(id)a3;
- (void)recordInterruptingAppSession;
@end

@implementation ATXInterruptingNotificationsHelper

- (ATXInterruptingNotificationsHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXInterruptingNotificationsHelper;
  v2 = [(ATXInterruptingNotificationsHelper *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recentNotifications = v2->_recentNotifications;
    v2->_recentNotifications = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    potentialInterruptingAppLaunchEvents = v2->_potentialInterruptingAppLaunchEvents;
    v2->_potentialInterruptingAppLaunchEvents = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    interruptingAppSessions = v2->_interruptingAppSessions;
    v2->_interruptingAppSessions = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)checkNotificationEvent:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 bundleID];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    int v6 = [v9 usageType];

    if (v6 == 17)
    {
      recentNotifications = self->_recentNotifications;
      v8 = [v9 bundleID];
      [(NSMutableDictionary *)recentNotifications setObject:v9 forKeyedSubscript:v8];
    }
  }
}

- (void)checkAppLaunchStartEvent:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!self->_previousStartEvent)
  {
    objc_storeStrong((id *)&self->_curenStartEvent, a3);
    objc_storeStrong((id *)&self->_previousStartEvent, a3);
    goto LABEL_10;
  }
  if ([(ATXInterruptingNotificationsHelper *)self doesCurrentAppLaunchInterruptPreviousAppLaunch:v5])
  {
    [(NSMutableArray *)self->_potentialInterruptingAppLaunchEvents addObject:v7];
    p_curenStartEvent = &self->_curenStartEvent;
LABEL_8:
    objc_storeStrong((id *)p_curenStartEvent, a3);
    goto LABEL_9;
  }
  if (![(ATXInterruptingNotificationsHelper *)self checkIfStartEventWasTheInterruptedEvent:v7])
  {
    p_curenStartEvent = &self->_previousStartEvent;
    goto LABEL_8;
  }
  [(ATXInterruptingNotificationsHelper *)self recordInterruptingAppSession];
LABEL_9:
  [(NSMutableDictionary *)self->_recentNotifications removeAllObjects];
LABEL_10:
}

- (void)checkAppLaunchEndEvent:(id)a3
{
  id v5 = a3;
  int v6 = v5;
  if (!self->_previousEndEvent)
  {
    v21 = (BMAppInFocus *)v5;
    curenEndEvent = self->_curenEndEvent;
    self->_curenEndEvent = v21;
LABEL_10:

    goto LABEL_11;
  }
  curenStartEvent = self->_curenStartEvent;
  if (curenStartEvent)
  {
    v8 = [(BMAppInFocus *)curenStartEvent bundleID];
    id v9 = [v6 bundleID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      objc_storeStrong((id *)&self->_curenEndEvent, a3);
      curenEndEvent = [(NSMutableArray *)self->_potentialInterruptingAppLaunchEvents lastObject];
      v12 = [curenEndEvent bundleID];
      v13 = [v6 bundleID];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
        v16 = [(BMAppInFocus *)self->_curenStartEvent absoluteTimestamp];
        v17 = [(BMAppInFocus *)self->_curenEndEvent absoluteTimestamp];
        v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];

        [v18 duration];
        if (v19 <= 60.0)
        {
          v22 = [curenEndEvent bundleID];
          v23 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v22];
          uint64_t v36 = [v23 unsignedIntegerValue];

          v24 = [(BMAppInFocus *)self->_previousEndEvent bundleID];
          v25 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v24];
          uint64_t v26 = [v25 unsignedIntegerValue];

          id v27 = objc_alloc(MEMORY[0x1E4F4B108]);
          v28 = [curenEndEvent bundleID];
          v29 = [(BMAppInFocus *)self->_previousEndEvent bundleID];
          v30 = [(BMAppInFocus *)self->_curenStartEvent absoluteTimestamp];
          v31 = [(BMAppInFocus *)self->_curenEndEvent absoluteTimestamp];
          v32 = (ATXInterruptingAppSessionEvent *)[v27 initWithInterruptingBundleID:v28 interruptedBundleID:v29 eventStartTime:v30 eventEndTime:v31 interruptingCategory:v36 interruptedCategory:v26];
          interruptingAppSessionEvent = self->_interruptingAppSessionEvent;
          self->_interruptingAppSessionEvent = v32;

          v34 = self->_previousEndEvent;
          potentialInterruptedEndEvent = self->_potentialInterruptedEndEvent;
          self->_potentialInterruptedEndEvent = v34;
        }
        else
        {
          potentialInterruptedEndEvent = self->_interruptingAppSessionEvent;
          self->_interruptingAppSessionEvent = 0;
        }
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  previousEndEvent = self->_previousEndEvent;
  self->_previousEndEvent = (BMAppInFocus *)v6;
}

- (BOOL)doesCurrentAppLaunchInterruptPreviousAppLaunch:(id)a3
{
  id v4 = a3;
  id v5 = [(BMAppInFocus *)self->_previousStartEvent bundleID];
  int v6 = [v4 bundleID];
  char v7 = [v5 isEqualToString:v6];

  recentNotifications = self->_recentNotifications;
  id v9 = [v4 bundleID];
  int v10 = [(NSMutableDictionary *)recentNotifications objectForKeyedSubscript:v9];

  BOOL v11 = 0;
  if ((v7 & 1) == 0 && v10)
  {
    v12 = [v4 absoluteTimestamp];
    v13 = [v10 absoluteTimestamp];
    [v12 timeIntervalSinceDate:v13];
    BOOL v11 = v14 <= 30.0;
  }
  return v11;
}

- (id)interruptingAppsessions
{
  return self->_interruptingAppSessions;
}

- (BOOL)checkIfStartEventWasTheInterruptedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BMAppInFocus *)self->_potentialInterruptedEndEvent bundleID];
  int v6 = [v4 bundleID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [v4 absoluteTimestamp];
    id v9 = [(BMAppInFocus *)self->_curenEndEvent absoluteTimestamp];
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 <= 10.0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)recordInterruptingAppSession
{
  if (self->_interruptingAppSessionEvent) {
    -[NSMutableArray addObject:](self->_interruptingAppSessions, "addObject:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingAppSessions, 0);
  objc_storeStrong((id *)&self->_potentialInterruptingAppLaunchEvents, 0);
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_interruptingAppSessionEvent, 0);
  objc_storeStrong((id *)&self->_potentialInterruptedEndEvent, 0);
  objc_storeStrong((id *)&self->_previousEndEvent, 0);
  objc_storeStrong((id *)&self->_previousStartEvent, 0);
  objc_storeStrong((id *)&self->_curenEndEvent, 0);
  objc_storeStrong((id *)&self->_curenStartEvent, 0);
}

@end