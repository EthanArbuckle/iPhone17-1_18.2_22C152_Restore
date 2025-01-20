@interface _NSCoreDataException
+ (id)exceptionWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:;
- (_NSCoreDataException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (id)errorObjectWithUserInfo:(id)a3;
- (id)initWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:;
- (uint64_t)_setDomain:(uint64_t)result;
- (void)dealloc;
@end

@implementation _NSCoreDataException

+ (id)exceptionWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:
{
  id v9 = objc_alloc((Class)self);
  id v10 = -[_NSCoreDataException initWithName:code:reason:userInfo:](v9, a2, a3, a4, a5);

  return v10;
}

- (id)initWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:
{
  if (result)
  {
    id v5 = a5;
    id v9 = result;
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11 = (void *)[a5 objectForKey:*MEMORY[0x1E4F28A50]];
    if (!a3)
    {
      v12 = v11;
      if (v11)
      {
        a3 = [v11 code];
        if (v5)
        {
          v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v5];
          if ([v12 userInfo]) {
            objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v12, "userInfo"));
          }
          [v13 removeObjectForKey:v10];
          id v5 = (id)[v13 copy];
        }
        else
        {
          id v5 = (id)[v12 userInfo];
        }
      }
      else
      {
        a3 = 134060;
      }
    }
    v14.receiver = v9;
    v14.super_class = (Class)_NSCoreDataException;
    result = objc_msgSendSuper2(&v14, sel_initWithName_reason_userInfo_, a2, a4, v5);
    if (result) {
      *((void *)result + 5) = a3;
    }
  }
  return result;
}

- (_NSCoreDataException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  return (_NSCoreDataException *)-[_NSCoreDataException initWithName:code:reason:userInfo:](self, (uint64_t)a3, 0, (uint64_t)a4, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSCoreDataException;
  [(_NSCoreDataException *)&v3 dealloc];
}

- (uint64_t)_setDomain:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 48);
    if (v4 != a2)
    {

      result = [a2 copy];
      *(void *)(v3 + 48) = result;
    }
  }
  return result;
}

- (id)errorObjectWithUserInfo:(id)a3
{
  id v5 = (void *)[(_NSCoreDataException *)self userInfo];
  if (a3)
  {
    v6 = (void *)[v5 mutableCopy];
    [v6 addEntriesFromDictionary:a3];
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = v5;
  }
  if (self)
  {
    if (self->_domain) {
      domain = self->_domain;
    }
    else {
      domain = (NSString *)*MEMORY[0x1E4F281F8];
    }
    if (self->_code) {
      int64_t code = self->_code;
    }
    else {
      int64_t code = 134060;
    }
  }
  else
  {
    domain = 0;
    int64_t code = 0;
  }
  uint64_t v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:domain code:code userInfo:v7];

  return v10;
}

@end