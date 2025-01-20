@interface NVMComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appIdentifier;
+ (id)formatter;
+ (id)localizedAppName;
- (NVMComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)currentSwitcherTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation NVMComplicationDataSource

+ (id)formatter
{
  if (qword_82E0 != -1) {
    dispatch_once(&qword_82E0, &stru_41C0);
  }
  v2 = (void *)qword_82D8;

  return v2;
}

+ (id)appIdentifier
{
  return @"com.apple.VoiceMemos";
}

+ (id)localizedAppName
{
  return (id)_RCLocalizedFrameworkString(@"VOICE_MEMOS_APP_NAME", @"Voice Memos app name");
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if ([v6 isRunningGraceOrLater])
  {
    v7 = [a1 formatter];
    unsigned __int8 v8 = [v7 supportsFamily:a3 forDevice:v6];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NVMComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NVMComplicationDataSource;
  return [(NVMComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
}

- (id)currentSwitcherTemplate
{
  v3 = [(id)objc_opt_class() formatter];
  id v4 = [(NVMComplicationDataSource *)self family];
  v5 = [(NVMComplicationDataSource *)self device];
  objc_super v6 = [v3 switcherTemplateWithFamily:v4 forDevice:v5];

  return v6;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void *))a3;
    v5 = [(id)objc_opt_class() formatter];
    id v6 = [(NVMComplicationDataSource *)self family];
    v7 = [(NVMComplicationDataSource *)self device];
    id v10 = [v5 formattedTemplateWithFamily:v6 forDevice:v7];

    unsigned __int8 v8 = +[NSDate date];
    v9 = +[CLKComplicationTimelineEntry entryWithDate:v8 complicationTemplate:v10];

    v4[2](v4, v9);
  }
}

@end