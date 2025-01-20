@interface HMBLocalDatabaseConfiguration
- (HMBLocalDatabaseConfiguration)init;
- (HMBModelContainer)modelContainer;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setModelContainer:(id)a3;
@end

@implementation HMBLocalDatabaseConfiguration

- (void).cxx_destruct
{
}

- (void)setModelContainer:(id)a3
{
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(HMBLocalDatabaseConfiguration *)+[HMBMutableLocalDatabaseConfiguration allocWithZone:a3] init];
  v5 = [(HMBLocalDatabaseConfiguration *)self modelContainer];
  [(HMBLocalDatabaseConfiguration *)v4 setModelContainer:v5];

  return v4;
}

- (HMBLocalDatabaseConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMBLocalDatabaseConfiguration;
  v2 = [(HMBLocalDatabaseConfiguration *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HMBModelContainer);
    modelContainer = v2->_modelContainer;
    v2->_modelContainer = v3;
  }
  return v2;
}

@end