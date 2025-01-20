@interface SharedDefaults
+ (NSString)measureUnits;
+ (id)defaults;
+ (id)getDefaultValues;
+ (int64_t)currentMeasureUnits;
+ (void)setupSpecifier:(id)a3;
- (SharedDefaults)init;
- (int64_t)cachedMeasureUnits;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCachedMeasureUnits:(int64_t)a3;
@end

@implementation SharedDefaults

- (SharedDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)SharedDefaults;
  v2 = [(SharedDefaults *)&v6 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [(id)objc_opt_class() measureUnits];
    [v3 addObserver:v2 forKeyPath:v4 options:5 context:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(id)objc_opt_class() measureUnits];
  [v3 removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)SharedDefaults;
  [(SharedDefaults *)&v5 dealloc];
}

+ (id)defaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2D88;
  block[3] = &unk_4158;
  block[4] = a1;
  if (qword_8428 != -1) {
    dispatch_once(&qword_8428, block);
  }
  v2 = (void *)qword_8420;

  return v2;
}

+ (NSString)measureUnits
{
  return (NSString *)@"kMeasureUnitsV1";
}

+ (id)getDefaultValues
{
  return &__NSDictionary0__struct;
}

+ (void)setupSpecifier:(id)a3
{
  id v10 = a3;
  v4 = [v10 propertyForKey:PSDefaultsKey];
  uint64_t v5 = [v10 propertyForKey:PSKeyNameKey];
  objc_super v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && [v4 isEqualToString:@"com.apple.measure"])
  {
    v8 = [a1 getDefaultValues];
    v9 = [v8 objectForKeyedSubscript:v6];
    if (v9) {
      [v10 setProperty:v9 forKey:PSDefaultValueKey];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v8 = [(id)objc_opt_class() measureUnits];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = +[NSUserDefaults standardUserDefaults];
    v11 = [(id)objc_opt_class() measureUnits];
    id v13 = [v10 valueForKeyPath:v11];

    if (v13) {
      id v12 = [v13 integerValue];
    }
    else {
      id v12 = (id)sub_2B80();
    }
    [(SharedDefaults *)self setCachedMeasureUnits:v12];
  }
}

+ (int64_t)currentMeasureUnits
{
  v2 = [a1 defaults];
  id v3 = [v2 cachedMeasureUnits];

  return (int64_t)v3;
}

- (int64_t)cachedMeasureUnits
{
  return self->_cachedMeasureUnits;
}

- (void)setCachedMeasureUnits:(int64_t)a3
{
  self->_cachedMeasureUnits = a3;
}

@end