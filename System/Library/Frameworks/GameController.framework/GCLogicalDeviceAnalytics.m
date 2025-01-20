@interface GCLogicalDeviceAnalytics
- (GCLogicalDeviceAnalytics)initWithAnonymousIdentifier:(id)a3 bundleIdentifier:(id)a4 productCategory:(id)a5;
- (NSMutableArray)sessionIntervals;
- (NSObject)controllerID;
- (NSString)bundleID;
- (NSString)productCategory;
- (double)sessionActiveDuration;
- (double)sessionTotalDuration;
- (id)description;
- (void)flushSessionAndSendCAEvent;
- (void)pauseSession;
- (void)resumeSession;
- (void)setSessionIntervals:(id)a3;
@end

@implementation GCLogicalDeviceAnalytics

- (GCLogicalDeviceAnalytics)initWithAnonymousIdentifier:(id)a3 bundleIdentifier:(id)a4 productCategory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GCLogicalDeviceAnalytics;
  v12 = [(GCLogicalDeviceAnalytics *)&v18 init];
  if (v12)
  {
    uint64_t v13 = +[NSMutableArray array];
    sessionIntervals = v12->_sessionIntervals;
    v12->_sessionIntervals = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_bundleID, a4);
    p_productCategory = &v12->_productCategory;
    objc_storeStrong((id *)&v12->_productCategory, a5);
    p_controllerID = &v12->_controllerID;
    objc_storeStrong((id *)&v12->_controllerID, a3);
    if (!v12->_bundleID)
    {
      v12->_bundleID = (NSString *)@"N/A";
    }
    if (!*p_productCategory)
    {
      *p_productCategory = (NSString *)@"N/A";
    }
    if (!*p_controllerID)
    {
      *p_controllerID = @"N/A";
    }
  }

  return v12;
}

- (double)sessionActiveDuration
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_sessionIntervals;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "duration", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)sessionTotalDuration
{
  if (!self->_firstSessionStartTime) {
    return 0.0;
  }
  id v3 = objc_alloc((Class)&off_26D2BFC48);
  firstSessionStartTime = self->_firstSessionStartTime;
  uint64_t v5 = +[NSDate date];
  double v6 = (void *)[v3 initWithStartDate:firstSessionStartTime endDate:v5];
  [v6 duration];
  double v8 = v7;

  return v8;
}

- (void)resumeSession
{
  if (!self->_curSessionStartTime)
  {
    id v3 = +[NSDate date];
    curSessionStartTime = self->_curSessionStartTime;
    self->_curSessionStartTime = v3;

    if (!self->_firstSessionStartTime) {
      objc_storeStrong((id *)&self->_firstSessionStartTime, self->_curSessionStartTime);
    }
    if (gc_isInternalBuild())
    {
      uint64_t v5 = getGCAnalyticsLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138412290;
        double v7 = self;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Resume session - %@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)pauseSession
{
  if (self->_curSessionStartTime)
  {
    sessionIntervals = self->_sessionIntervals;
    id v4 = objc_alloc((Class)&off_26D2BFC48);
    curSessionStartTime = self->_curSessionStartTime;
    int v6 = +[NSDate date];
    double v7 = (void *)[v4 initWithStartDate:curSessionStartTime endDate:v6];
    [(NSMutableArray *)sessionIntervals addObject:v7];

    double v8 = self->_curSessionStartTime;
    self->_curSessionStartTime = 0;

    if (gc_isInternalBuild())
    {
      id v9 = getGCAnalyticsLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        long long v11 = self;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Pause session - %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)flushSessionAndSendCAEvent
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "%@ - ERROR! Attempting to flush a session that has already been flushed. Create a new devie analytics instance instead.", (uint8_t *)&v2, 0xCu);
}

id __54__GCLogicalDeviceAnalytics_flushSessionAndSendCAEvent__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(v2 + 40);
  v11[0] = @"bundleID";
  v11[1] = @"productCategory";
  uint64_t v13 = *(void *)(v2 + 32);
  v11[2] = @"controllerID";
  v11[3] = @"sessionTotalDuration";
  [(id)v2 sessionTotalDuration];
  LODWORD(v4) = llround(v3);
  uint64_t v5 = +[NSNumber numberWithInt:v4];
  v14 = v5;
  v11[4] = @"sessionActionDuration";
  [*(id *)(a1 + 32) sessionActiveDuration];
  LODWORD(v7) = llround(v6);
  double v8 = +[NSNumber numberWithInt:v7];
  v15 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:v11 count:5];

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(GCLogicalDeviceAnalytics *)self controllerID];
  uint64_t v5 = [(GCLogicalDeviceAnalytics *)self productCategory];
  double v6 = [(GCLogicalDeviceAnalytics *)self bundleID];
  [(GCLogicalDeviceAnalytics *)self sessionTotalDuration];
  uint64_t v8 = v7;
  [(GCLogicalDeviceAnalytics *)self sessionActiveDuration];
  int v10 = +[NSString stringWithFormat:@"<%@ for %@ (%@) - %@, total = %f, active = %f>", v3, v4, v5, v6, v8, v9];

  return v10;
}

- (NSObject)controllerID
{
  return self->_controllerID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (NSMutableArray)sessionIntervals
{
  return self->_sessionIntervals;
}

- (void)setSessionIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIntervals, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_storeStrong((id *)&self->_firstSessionStartTime, 0);

  objc_storeStrong((id *)&self->_curSessionStartTime, 0);
}

@end