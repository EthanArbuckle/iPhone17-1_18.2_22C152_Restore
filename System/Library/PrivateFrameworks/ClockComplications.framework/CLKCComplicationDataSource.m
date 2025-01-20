@interface CLKCComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasSensitiveUI;
+ (BOOL)wantsToSkipPauseWhenEnteringTritium;
+ (int64_t)tritiumUpdatePriority;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (BOOL)supportsTapAction;
- (CLKCComplication)complication;
- (CLKCComplicationDataSource)init;
- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5 context:(id)a6;
- (CLKCComplicationDataSourceContext)context;
- (CLKCComplicationDataSourceDelegate)delegate;
- (CLKDevice)device;
- (id)alwaysOnTemplate;
- (id)complicationApplicationIdentifier;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)privacyTemplate;
- (id)sampleTemplate;
- (int64_t)family;
- (unint64_t)timelineAnimationBehavior;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getDesiredUpdateIntervalWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)getTimelineEntriesBeforeDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)getTimelineStartDateWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CLKCComplicationDataSource

+ (int64_t)tritiumUpdatePriority
{
  return 0;
}

- (CLKCComplicationDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKCComplicationDataSource;
  v2 = [(CLKCComplicationDataSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    context = v2->_context;
    v2->_context = (CLKCComplicationDataSourceContext *)v3;
  }
  return v2;
}

- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKCComplicationDataSource;
  v11 = [(CLKCComplicationDataSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_complication, a3);
    v12->_family = a4;
    objc_storeStrong((id *)&v12->_device, a5);
    uint64_t v13 = objc_opt_new();
    context = v12->_context;
    v12->_context = (CLKCComplicationDataSourceContext *)v13;
  }
  return v12;
}

- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5 context:(id)a6
{
  id v11 = a6;
  v12 = [(CLKCComplicationDataSource *)self initWithComplication:a3 family:a4 forDevice:a5];
  uint64_t v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_context, a6);
  }

  return v13;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (BOOL)supportsTapAction
{
  return 1;
}

+ (BOOL)hasSensitiveUI
{
  return 0;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 0;
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

- (id)sampleTemplate
{
  return 0;
}

- (id)lockedTemplate
{
  return 0;
}

- (id)privacyTemplate
{
  return 0;
}

- (id)alwaysOnTemplate
{
  return 0;
}

+ (BOOL)wantsToSkipPauseWhenEnteringTritium
{
  return 0;
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
}

- (CLKCComplication)complication
{
  return self->_complication;
}

- (int64_t)family
{
  return self->_family;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKCComplicationDataSourceContext)context
{
  return self->_context;
}

- (CLKCComplicationDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLKCComplicationDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_complication, 0);
}

- (id)currentSwitcherTemplate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  NSRequestConcreteImplementation();
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F196D8]) initPrivate];

  return v2;
}

- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)getTimelineStartDateWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)getTimelineEntriesBeforeDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)getDesiredUpdateIntervalWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

@end