@interface WDUserDefaults
- (HKKeyValueDomain)keyValueDomain;
- (WDUserDefaults)initWithHealthStore:(id)a3;
- (void)setKeyValueDomain:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)valueForKey:(id)a3 callback:(id)a4;
@end

@implementation WDUserDefaults

- (WDUserDefaults)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDUserDefaults;
  v5 = [(WDUserDefaults *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F0A470] healthAppDefaultsDomainWithHealthStore:v4];
    keyValueDomain = v5->_keyValueDomain;
    v5->_keyValueDomain = (HKKeyValueDomain *)v6;
  }
  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
}

- (void)valueForKey:(id)a3 callback:(id)a4
{
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end