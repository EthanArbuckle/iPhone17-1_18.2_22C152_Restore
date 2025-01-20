@interface HMBMutableModelContainer
- (void)setTypeName:(id)a3 forModelClass:(Class)a4;
@end

@implementation HMBMutableModelContainer

- (void)setTypeName:(id)a3 forModelClass:(Class)a4
{
  id v6 = a3;
  v7 = [(HMBModelContainer *)self nameToClassTransform];
  [v7 setObject:a4 forKey:v6];

  id v8 = [(HMBModelContainer *)self classToNameTransform];
  [v8 setObject:v6 forKey:a4];
}

@end