@interface VSSubscriptionFetchOptionDescription
- (BOOL)isContainer;
- (Class)allowedClass;
- (NSPredicate)allowedValuePredicate;
- (NSString)key;
- (VSSubscriptionFetchOptionDescription)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (unint64_t)minCount;
- (void)setAllowedClass:(Class)a3;
- (void)setAllowedValuePredicate:(id)a3;
- (void)setContainer:(BOOL)a3;
- (void)setDefaultValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setMinCount:(unint64_t)a3;
@end

@implementation VSSubscriptionFetchOptionDescription

- (VSSubscriptionFetchOptionDescription)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSSubscriptionFetchOptionDescription;
  v2 = [(VSSubscriptionFetchOptionDescription *)&v10 init];
  v3 = v2;
  if (v2)
  {
    key = v2->_key;
    v2->_key = (NSString *)&stru_1F34B2EC8;

    uint64_t v5 = objc_opt_class();
    Class allowedClass = v3->_allowedClass;
    v3->_Class allowedClass = (Class)v5;

    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    allowedValuePredicate = v3->_allowedValuePredicate;
    v3->_allowedValuePredicate = (NSPredicate *)v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  uint64_t v5 = [(VSSubscriptionFetchOptionDescription *)self key];
  [(VSSubscriptionFetchOptionDescription *)v4 setKey:v5];

  v6 = [(VSSubscriptionFetchOptionDescription *)self defaultValue];
  [(VSSubscriptionFetchOptionDescription *)v4 setDefaultValue:v6];

  [(VSSubscriptionFetchOptionDescription *)v4 setContainer:[(VSSubscriptionFetchOptionDescription *)self isContainer]];
  [(VSSubscriptionFetchOptionDescription *)v4 setMinCount:[(VSSubscriptionFetchOptionDescription *)self minCount]];
  [(VSSubscriptionFetchOptionDescription *)v4 setAllowedClass:[(VSSubscriptionFetchOptionDescription *)self allowedClass]];
  uint64_t v7 = [(VSSubscriptionFetchOptionDescription *)self allowedValuePredicate];
  [(VSSubscriptionFetchOptionDescription *)v4 setAllowedValuePredicate:v7];

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (BOOL)isContainer
{
  return self->_container;
}

- (void)setContainer:(BOOL)a3
{
  self->_container = a3;
}

- (unint64_t)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(unint64_t)a3
{
  self->_minCount = a3;
}

- (Class)allowedClass
{
  return self->_allowedClass;
}

- (void)setAllowedClass:(Class)a3
{
}

- (NSPredicate)allowedValuePredicate
{
  return self->_allowedValuePredicate;
}

- (void)setAllowedValuePredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValuePredicate, 0);
  objc_storeStrong((id *)&self->_allowedClass, 0);
  objc_storeStrong(&self->_defaultValue, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end