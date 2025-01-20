@interface HKTimeScopeControl
+ (HKTimeScopeControl)controlWithFrame:(CGRect)a3 timeScopes:(id)a4;
- (HKTimeScopeControl)initWithFrame:(CGRect)a3 timeScopes:(id)a4;
- (double)minimumWidth;
- (int64_t)_indexForTimeScope:(int64_t)a3;
- (int64_t)_timeScopeForIndex:(int64_t)a3;
- (int64_t)selectedTimeScope;
- (void)setSelectedTimeScope:(int64_t)a3;
@end

@implementation HKTimeScopeControl

+ (HKTimeScopeControl)controlWithFrame:(CGRect)a3 timeScopes:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = -[_HKTimeScopeControlBar initWithFrame:timeScopes:]([_HKTimeScopeControlBar alloc], "initWithFrame:timeScopes:", v8, x, y, width, height);

  return (HKTimeScopeControl *)v9;
}

- (HKTimeScopeControl)initWithFrame:(CGRect)a3 timeScopes:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKTimeScopeControl;
  v11 = -[HKTimeScopeControl initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_timeScopes, a4);
  }

  return v12;
}

- (int64_t)_timeScopeForIndex:(int64_t)a3
{
  v3 = [(NSArray *)self->_timeScopes objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)_indexForTimeScope:(int64_t)a3
{
  timeScopes = self->_timeScopes;
  int64_t v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(NSArray *)timeScopes indexOfObject:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v5;
  }
}

- (double)minimumWidth
{
  return 0.0;
}

- (int64_t)selectedTimeScope
{
  return self->_selectedTimeScope;
}

- (void)setSelectedTimeScope:(int64_t)a3
{
  self->_selectedTimeScope = a3;
}

- (void).cxx_destruct
{
}

@end