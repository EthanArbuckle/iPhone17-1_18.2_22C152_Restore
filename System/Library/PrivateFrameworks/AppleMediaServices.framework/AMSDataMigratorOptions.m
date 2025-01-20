@interface AMSDataMigratorOptions
+ (id)_stringFromOptionsArray:(id)a3 atIndex:(unint64_t)a4;
- (AMSDataMigratorOptions)init;
- (AMSDataMigratorOptions)initWithOptionsArray:(id)a3;
- (NSArray)optionsArray;
- (NSString)currentBuildVersion;
- (NSString)previousBuildVersion;
- (unint64_t)scenario;
- (void)setCurrentBuildVersion:(id)a3;
- (void)setPreviousBuildVersion:(id)a3;
- (void)setScenario:(unint64_t)a3;
@end

@implementation AMSDataMigratorOptions

- (AMSDataMigratorOptions)init
{
  return [(AMSDataMigratorOptions *)self initWithOptionsArray:0];
}

- (AMSDataMigratorOptions)initWithOptionsArray:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSDataMigratorOptions;
  v5 = [(AMSDataMigratorOptions *)&v12 init];
  if (v5)
  {
    uint64_t v6 = +[AMSDataMigratorOptions _stringFromOptionsArray:v4 atIndex:0];
    currentBuildVersion = v5->_currentBuildVersion;
    v5->_currentBuildVersion = (NSString *)v6;

    uint64_t v8 = +[AMSDataMigratorOptions _stringFromOptionsArray:v4 atIndex:1];
    previousBuildVersion = v5->_previousBuildVersion;
    v5->_previousBuildVersion = (NSString *)v8;

    v10 = +[AMSDataMigratorOptions _stringFromOptionsArray:v4 atIndex:2];
    v5->_scenario = [v10 integerValue];
  }
  return v5;
}

- (NSArray)optionsArray
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AMSDataMigratorOptions *)self currentBuildVersion];
  id v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_1EDCA7308;
  }
  uint64_t v6 = [(AMSDataMigratorOptions *)self previousBuildVersion];
  v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_1EDCA7308;
  }
  v13[1] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSDataMigratorOptions scenario](self, "scenario"));
  v10 = [v9 stringValue];
  v13[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

  return (NSArray *)v11;
}

+ (id)_stringFromOptionsArray:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] <= a4)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  if ([v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
}

- (NSString)previousBuildVersion
{
  return self->_previousBuildVersion;
}

- (void)setPreviousBuildVersion:(id)a3
{
}

- (unint64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(unint64_t)a3
{
  self->_scenario = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBuildVersion, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
}

@end