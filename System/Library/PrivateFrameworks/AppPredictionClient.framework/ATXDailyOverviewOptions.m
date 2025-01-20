@interface ATXDailyOverviewOptions
+ (BOOL)supportsSecureCoding;
- (ATXDailyOverviewOptions)initWithCoder:(id)a3;
- (ATXDailyOverviewOptions)initWithFocusFilter:(int64_t)a3 isModernDashboardLayout:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXDailyOverviewOptions:(id)a3;
- (BOOL)isModernDashboardLayout;
- (int64_t)focusFilter;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXDailyOverviewOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyOverviewOptions)initWithFocusFilter:(int64_t)a3 isModernDashboardLayout:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ATXDailyOverviewOptions;
  v6 = [(ATXDailyOverviewOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_focusFilter = a3;
    v6->_isModernDashboardLayout = a4;
    v8 = v6;
  }

  return v7;
}

- (ATXDailyOverviewOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"focusFilter"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isModernDashboardLayout"];

  return [(ATXDailyOverviewOptions *)self initWithFocusFilter:v5 isModernDashboardLayout:v6];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t focusFilter = self->_focusFilter;
  id v5 = a3;
  [v5 encodeInteger:focusFilter forKey:@"focusFilter"];
  [v5 encodeBool:self->_isModernDashboardLayout forKey:@"isModernDashboardLayout"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXDailyOverviewOptions *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXDailyOverviewOptions *)self isEqualToATXDailyOverviewOptions:v5];

  return v6;
}

- (BOOL)isEqualToATXDailyOverviewOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 focusFilter];
  if (v5 == [(ATXDailyOverviewOptions *)self focusFilter])
  {
    int v6 = [v4 isModernDashboardLayout];
    int v7 = v6 ^ [(ATXDailyOverviewOptions *)self isModernDashboardLayout] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t focusFilter = self->_focusFilter;
  return focusFilter ^ [(ATXDailyOverviewOptions *)self isModernDashboardLayout];
}

- (int64_t)focusFilter
{
  return self->_focusFilter;
}

- (BOOL)isModernDashboardLayout
{
  return self->_isModernDashboardLayout;
}

@end