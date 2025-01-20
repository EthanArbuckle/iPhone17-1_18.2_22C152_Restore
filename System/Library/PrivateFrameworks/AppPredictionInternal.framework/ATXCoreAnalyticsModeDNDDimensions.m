@interface ATXCoreAnalyticsModeDNDDimensions
- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 isDND:(BOOL)a4;
- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 nullableIsDND:(id)a4;
- (NSNumber)isDND;
- (NSString)mode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreAnalyticsDictionary;
- (id)powerset;
@end

@implementation ATXCoreAnalyticsModeDNDDimensions

- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 nullableIsDND:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCoreAnalyticsModeDNDDimensions;
  v9 = [(ATXCoreAnalyticsModeDNDDimensions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    objc_storeStrong((id *)&v10->_isDND, a4);
  }

  return v10;
}

- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 isDND:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  v9 = [(ATXCoreAnalyticsModeDNDDimensions *)self initWithMode:v7 nullableIsDND:v8];

  return v9;
}

- (id)powerset
{
  v3 = objc_opt_new();
  [v3 addObject:self];
  BOOL v4 = [[ATXCoreAnalyticsModeDNDDimensions alloc] initWithMode:0 nullableIsDND:0];
  [v3 addObject:v4];
  v5 = [[ATXCoreAnalyticsModeDNDDimensions alloc] initWithMode:0 nullableIsDND:self->_isDND];
  [v3 addObject:v5];
  v6 = [[ATXCoreAnalyticsModeDNDDimensions alloc] initWithMode:self->_mode nullableIsDND:0];
  [v3 addObject:v6];
  id v7 = [v3 allObjects];

  return v7;
}

- (id)coreAnalyticsDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"mode";
  mode = self->_mode;
  BOOL v4 = mode;
  if (!mode)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"isDND";
  v10[0] = v4;
  isDND = self->_isDND;
  v6 = isDND;
  if (!isDND)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (isDND)
  {
    if (mode) {
      goto LABEL_7;
    }
  }
  else
  {

    if (mode) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[ATXCoreAnalyticsModeDNDDimensions allocWithZone:a3];
  mode = self->_mode;
  isDND = self->_isDND;
  return [(ATXCoreAnalyticsModeDNDDimensions *)v4 initWithMode:mode nullableIsDND:isDND];
}

- (NSString)mode
{
  return self->_mode;
}

- (NSNumber)isDND
{
  return self->_isDND;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isDND, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end