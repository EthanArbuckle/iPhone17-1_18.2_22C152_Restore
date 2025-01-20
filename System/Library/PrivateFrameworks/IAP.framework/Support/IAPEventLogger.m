@interface IAPEventLogger
+ (void)AddToStr:(id)a3 WithKey:(id)a4 AndValue:(id)a5;
+ (void)LogMsg:(int)a3 WithDictionary:(id)a4 andKeys:(id)a5;
+ (void)LogMsg:(int)a3 WithKey:(id)a4 AndValue:(id)a5;
+ (void)LogMsg:(int)a3 WithStr:(id)a4;
@end

@implementation IAPEventLogger

+ (void)LogMsg:(int)a3 WithStr:(id)a4
{
  if (qword_100032008 != -1) {
    dispatch_once(&qword_100032008, &stru_10002D9C8);
  }
  if (qword_100031FF8)
  {
    if (a3 > 2) {
      v6 = "IapLoggerEventTypeUnknown";
    }
    else {
      v6 = (&off_10002D9E8)[a3];
    }
    asl_set((asl_object_t)qword_100032000, "IapLoggerEventType", v6);
    if (asl_log((asl_object_t)qword_100031FF8, (asl_object_t)qword_100032000, 4, "%s", (const char *)[a4 cStringUsingEncoding:1]))
    {
      syslog(3, "Error writing to the Event Log file. status=%d");
    }
  }
  else
  {
    syslog(3, "Could not write to the Event Log file");
  }
}

+ (void)LogMsg:(int)a3 WithKey:(id)a4 AndValue:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  v6 = +[NSString stringWithFormat:@"%@ = %@;", a4, a5];
  +[IAPEventLogger LogMsg:v5 WithStr:v6];
}

+ (void)LogMsg:(int)a3 WithDictionary:(id)a4 andKeys:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  +[IAPEventLogger LogMsg:*(void *)&a3 WithStr:@"AccessoryInfo = {"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = [a4 objectForKey:v12];
        if (v13) {
          +[IAPEventLogger LogMsg:WithKey:AndValue:](IAPEventLogger, "LogMsg:WithKey:AndValue:", v7, +[NSString stringWithFormat:@"    %@", v12], v13);
        }
      }
      id v9 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  +[IAPEventLogger LogMsg:v7 WithStr:@"} // End AccessoryInfo"];
}

+ (void)AddToStr:(id)a3 WithKey:(id)a4 AndValue:(id)a5
{
  [a3 appendFormat:@"%@ = %@;", a4, a5];
}

@end