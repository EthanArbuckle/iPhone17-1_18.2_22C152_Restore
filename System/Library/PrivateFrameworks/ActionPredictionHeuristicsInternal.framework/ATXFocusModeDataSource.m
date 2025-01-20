@interface ATXFocusModeDataSource
- (ATXFocusModeDataSource)initWithDevice:(id)a3;
- (void)isFocusModeActive:(id)a3;
@end

@implementation ATXFocusModeDataSource

- (void)isFocusModeActive:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  v4 = +[ATXHeuristicResultCache sharedInstance];
  id v7 = 0;
  uint64_t v5 = [v4 isFocusModeActiveWithError:&v7];
  id v6 = v7;

  v3[2](v3, v5, v6);
}

- (ATXFocusModeDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFocusModeDataSource;
  id v6 = [(ATXFocusModeDataSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end