@interface HFCacheEntry
- (HFCacheEntry)initWithKey:(id)a3 object:(id)a4 cost:(unint64_t)a5;
- (id)description;
- (id)key;
- (id)object;
- (unint64_t)cost;
@end

@implementation HFCacheEntry

- (HFCacheEntry)initWithKey:(id)a3 object:(id)a4 cost:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCacheEntry;
  v11 = [(HFCacheEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_key, a3);
    objc_storeStrong(&v12->_object, a4);
    v12->_cost = a5;
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFCacheEntry *)self key];
  id v5 = (id)[v3 appendObject:v4 withName:@"key"];

  v6 = [(HFCacheEntry *)self object];
  id v7 = (id)[v3 appendObject:v6 withName:@"object"];

  id v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFCacheEntry cost](self, "cost"), @"cost");
  id v9 = [v3 build];

  return v9;
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end