@interface CoreMLVersion
+ (id)getInternalFrameworkVersion;
- (CoreMLVersion)init;
- (NSNumber)frameworkVersionNumber;
- (void)setFrameworkVersionNumber:(id)a3;
@end

@implementation CoreMLVersion

- (void).cxx_destruct
{
}

- (void)setFrameworkVersionNumber:(id)a3
{
}

- (NSNumber)frameworkVersionNumber
{
  return self->_frameworkVersionNumber;
}

- (CoreMLVersion)init
{
  v5.receiver = self;
  v5.super_class = (Class)CoreMLVersion;
  v2 = [(CoreMLVersion *)&v5 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInteger:9];
    [(CoreMLVersion *)v2 setFrameworkVersionNumber:v3];
  }
  return v2;
}

+ (id)getInternalFrameworkVersion
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [v2 frameworkVersionNumber];

  return v3;
}

@end