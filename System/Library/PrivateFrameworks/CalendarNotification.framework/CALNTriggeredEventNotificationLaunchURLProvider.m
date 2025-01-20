@interface CALNTriggeredEventNotificationLaunchURLProvider
+ (id)_launchURLForEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5;
+ (id)_travelLaunchURLForEventID:(id)a3 hypothesis:(id)a4;
+ (id)launchURLForOptionalEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5;
+ (id)launchURLForOptionalEventOccurrenceID:(id)a3;
@end

@implementation CALNTriggeredEventNotificationLaunchURLProvider

+ (id)launchURLForOptionalEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  *a5 = 0;
  if (v7)
  {
    v9 = [NSURL URLWithString:v7];
    if (v9)
    {
      v10 = [(id)objc_opt_class() _launchURLForEventID:v9 hypothesis:v8 isTravelLaunchURL:a5];
    }
    else
    {
      v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CALNTriggeredEventNotificationLaunchURLProvider launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:]((uint64_t)v7, v11);
      }

      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)launchURLForOptionalEventOccurrenceID:(id)a3
{
  return 0;
}

+ (id)_launchURLForEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9
    && ([a1 _travelLaunchURLForEventID:v8 hypothesis:v9],
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = v10;
    *a5 = 1;
    id v12 = v11;
  }
  else
  {
    id v12 = v8;
    id v11 = 0;
  }

  return v12;
}

+ (id)_travelLaunchURLForEventID:(id)a3 hypothesis:(id)a4
{
  v4 = [a3 absoluteString];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 stringByAppendingString:@"?travel=true"];
    id v7 = [NSURL URLWithString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)launchURLForOptionalEventID:(uint64_t)a1 hypothesis:(NSObject *)a2 isTravelLaunchURL:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not get launch URL because unable to get event ID url for event ID = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end