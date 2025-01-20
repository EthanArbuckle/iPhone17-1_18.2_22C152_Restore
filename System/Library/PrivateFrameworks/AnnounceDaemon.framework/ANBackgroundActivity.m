@interface ANBackgroundActivity
- (ANBackgroundActivity)init;
- (BOOL)shouldDefer;
- (NSBackgroundActivityScheduler)backgroundActivity;
- (void)scheduleWithBlock:(id)a3;
@end

@implementation ANBackgroundActivity

- (ANBackgroundActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANBackgroundActivity;
  v2 = [(ANBackgroundActivity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.announce.activity.dailyanalytics"];
    backgroundActivity = v2->_backgroundActivity;
    v2->_backgroundActivity = (NSBackgroundActivityScheduler *)v3;

    [(NSBackgroundActivityScheduler *)v2->_backgroundActivity setPreregistered:1];
    [(NSBackgroundActivityScheduler *)v2->_backgroundActivity setQualityOfService:9];
    [(NSBackgroundActivityScheduler *)v2->_backgroundActivity setCheckInHandler:&__block_literal_global_21];
  }
  return v2;
}

void __28__ANBackgroundActivity_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (ANLogHandleBackgroundActivity_once != -1) {
    dispatch_once(&ANLogHandleBackgroundActivity_once, &__block_literal_global_20);
  }
  v0 = (id)ANLogHandleBackgroundActivity_logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    v2 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v0, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily checked in.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)scheduleWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ANBackgroundActivity *)self backgroundActivity];
  [v5 scheduleWithBlock:v4];
}

- (BOOL)shouldDefer
{
  v2 = [(ANBackgroundActivity *)self backgroundActivity];
  char v3 = [v2 shouldDefer];

  return v3;
}

- (NSBackgroundActivityScheduler)backgroundActivity
{
  return self->_backgroundActivity;
}

- (void).cxx_destruct
{
}

@end