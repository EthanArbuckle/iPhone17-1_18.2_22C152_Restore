@interface HMFSystemPreference
- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6;
- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6;
- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6 parent:(id)a7;
- (NSString)domain;
- (NSString)propertyDescription;
@end

@implementation HMFSystemPreference

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6 parent:(id)a7
{
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMFSystemPreference;
  v13 = [(HMFPreference *)&v20 initWithKey:a3 options:a4 defaultValue:a6 parent:a7];
  if (v13)
  {
    if (v12) {
      v14 = (void *)[v12 copy];
    }
    else {
      v14 = (void *)*MEMORY[0x1E4F1D3D8];
    }
    objc_storeStrong((id *)&v13->_domain, v14);
    if (v12) {

    }
    v15 = v13;
    v16 = [(HMFPreference *)v15 key];
    v17 = [(HMFSystemPreference *)v15 domain];
    v18 = (void *)CFPreferencesCopyAppValue(v16, v17);

    if (v18)
    {
      [(HMFPreference *)v15 setValue:v18];
    }
  }

  return v13;
}

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6
{
  return [(HMFSystemPreference *)self initWithKey:a3 options:a4 domain:0 defaultValue:a5 parent:a6];
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6
{
  return [(HMFSystemPreference *)self initWithKey:a3 options:a4 domain:a5 defaultValue:a6 parent:0];
}

- (NSString)propertyDescription
{
  v3 = NSString;
  v4 = [(HMFSystemPreference *)self domain];
  v5 = [(HMFPreference *)self key];
  v6 = [(HMFPreference *)self value];
  v7 = [v3 stringWithFormat:@", Domain = %@, Key = %@, Value = %@", v4, v5, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
}

@end