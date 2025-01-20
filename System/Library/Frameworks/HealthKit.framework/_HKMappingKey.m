@interface _HKMappingKey
- (BOOL)isEqual:(id)a3;
- (id)initWithObject:(void *)a3 andKey:;
- (uint64_t)objectMatches:(uint64_t)result;
- (unint64_t)hash;
@end

@implementation _HKMappingKey

- (id)initWithObject:(void *)a3 andKey:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_HKMappingKey;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", v5);
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (uint64_t)objectMatches:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v3 = (objc_class *)NSString;
    id v4 = a2;
    id v5 = objc_msgSend([v3 alloc], "initWithFormat:", @"%p", v4);

    uint64_t v6 = [*(id *)(v2 + 8) isEqualToString:v5];
    return v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HKMappingKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    id v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      uint64_t v6 = v4;
      if ([v6[1] isEqual:self->_addressOfObject]) {
        char v7 = [v6[2] isEqual:self->_key];
      }
      else {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_key hash];
  return [(NSString *)self->_addressOfObject hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_key, 0);

  objc_storeStrong((id *)&self->_addressOfObject, 0);
}

@end