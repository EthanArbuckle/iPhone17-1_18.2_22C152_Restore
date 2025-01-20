@interface SGDPowerLog
+ (void)endDissectionOfMessage:(id)a3 inContext:(unint64_t)a4;
+ (void)endIngestOfMessages:(unint64_t)a3;
+ (void)logPrewarmWithLastPrewarmTime:(double)a3;
+ (void)pluginEndDeletion:(id)a3;
+ (void)pluginEndProcessingSearchableItem:(id)a3;
+ (void)pluginEndSetup:(id)a3;
+ (void)pluginStartDeletion:(id)a3;
+ (void)pluginStartProcessingSearchableItem:(id)a3;
+ (void)pluginStartSetup:(id)a3;
+ (void)startDissectionOfMessage:(id)a3 inContext:(unint64_t)a4;
+ (void)startIngestOfMessages:(unint64_t)a3;
@end

@implementation SGDPowerLog

+ (void)pluginEndDeletion:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)pluginStartDeletion:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)pluginEndProcessingSearchableItem:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)pluginStartProcessingSearchableItem:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)pluginEndSetup:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)pluginStartSetup:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"plugin";
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  PLLogRegisteredEvent();
}

+ (void)endIngestOfMessages:(unint64_t)a3
{
}

+ (void)startIngestOfMessages:(unint64_t)a3
{
}

+ (void)logPrewarmWithLastPrewarmTime:(double)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "Pre-warming suggestd", v10, 2u);
  }

  v11 = @"secondsSinceLast";
  v5 = NSNumber;
  if (a3 == 0.0)
  {
    double v7 = -1.0;
  }
  else
  {
    id v4 = objc_opt_new();
    [v4 timeIntervalSinceReferenceDate];
    double v7 = v6 - a3;
  }
  v8 = [v5 numberWithDouble:v7];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  if (a3 != 0.0) {
  PLLogRegisteredEvent();
  }
}

+ (void)endDissectionOfMessage:(id)a3 inContext:(unint64_t)a4
{
}

+ (void)startDissectionOfMessage:(id)a3 inContext:(unint64_t)a4
{
}

@end