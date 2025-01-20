@interface MOCategoryShieldPolicy
+ (id)allPolicyWithExcludedContent:(id)a3;
+ (id)nonePolicy;
+ (id)specificPolicyWithCategories:(id)a3 excludedContent:(id)a4;
- (MOCategoryShieldPolicy)initWithPolicy:(int64_t)a3 specificCategories:(id)a4 excludedContent:(id)a5;
- (NSArray)excludedContent;
- (NSArray)specificCategories;
- (int64_t)policy;
@end

@implementation MOCategoryShieldPolicy

- (int64_t)policy
{
  return self->_policy;
}

- (MOCategoryShieldPolicy)initWithPolicy:(int64_t)a3 specificCategories:(id)a4 excludedContent:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOCategoryShieldPolicy;
  v11 = [(MOCategoryShieldPolicy *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_policy = a3;
    objc_storeStrong((id *)&v11->_specificCategories, a4);
    objc_storeStrong((id *)&v12->_excludedContent, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedContent, 0);
  objc_storeStrong((id *)&self->_specificCategories, 0);
}

+ (id)nonePolicy
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPolicy:0 specificCategories:0 excludedContent:0];
  return v2;
}

+ (id)specificPolicyWithCategories:(id)a3 excludedContent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPolicy:1 specificCategories:v6 excludedContent:v5];

  return v7;
}

+ (id)allPolicyWithExcludedContent:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPolicy:2 specificCategories:0 excludedContent:v3];

  return v4;
}

- (NSArray)specificCategories
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)excludedContent
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

@end