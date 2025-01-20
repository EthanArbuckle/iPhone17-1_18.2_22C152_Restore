@interface HFDifference
+ (id)difference:(id)a3;
+ (id)difference:(id)a3 priority:(unint64_t)a4;
+ (id)difference:(id)a3 priority:(unint64_t)a4 withBlock:(id)a5;
- (HFDifference)initWithKey:(id)a3;
- (HFDifference)initWithKey:(id)a3 priority:(unint64_t)a4;
- (NSDictionary)userInfo;
- (NSString)key;
- (id)_subclass_description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilder;
- (id)withPriority:(unint64_t)a3;
- (unint64_t)priority;
- (void)setKey:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HFDifference

- (HFDifference)initWithKey:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDifference;
  v7 = [(HFDifference *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    key = v7->_key;
    v7->_key = (NSString *)v8;

    v7->_priority = a4;
  }

  return v7;
}

- (HFDifference)initWithKey:(id)a3
{
  return [(HFDifference *)self initWithKey:a3 priority:2];
}

+ (id)difference:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKey:v4];

  return v5;
}

+ (id)difference:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithKey:v6];

  [v7 setPriority:a4];
  return v7;
}

+ (id)difference:(id)a3 priority:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  if ((*((unsigned int (**)(id))a5 + 2))(a5))
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithKey:v8];
    [v9 setPriority:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)withPriority:(unint64_t)a3
{
  id v4 = (void *)[(HFDifference *)self copy];
  [v4 setPriority:a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFDifference *)self key];
  id v6 = (void *)[v4 initWithKey:v5];

  objc_msgSend(v6, "setPriority:", -[HFDifference priority](self, "priority"));
  v7 = [(HFDifference *)self userInfo];
  id v8 = (void *)[v7 copy];
  [v6 setUserInfo:v8];

  return v6;
}

- (id)descriptionBuilder
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F58188]) initWithObject:self];
  unint64_t v4 = [(HFDifference *)self priority] - 1;
  if (v4 > 3) {
    v5 = @"none";
  }
  else {
    v5 = off_26408E730[v4];
  }
  id v6 = [(HFDifference *)self key];
  [v3 appendString:v6 withName:@"key"];

  [v3 appendString:v5 withName:@"priority"];
  v7 = [(HFDifference *)self userInfo];

  if (v7)
  {
    id v8 = [(HFDifference *)self userInfo];
    [v3 appendDictionarySection:v8 withName:@"userInfo" skipIfEmpty:1];
  }
  return v3;
}

__CFString *__34__HFDifference_descriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) priority];
  if ((unint64_t)(v1 - 1) > 3) {
    return @"none";
  }
  else {
    return off_26408E730[v1 - 1];
  }
}

- (id)description
{
  v2 = [(HFDifference *)self descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)_subclass_description
{
  return 0;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end