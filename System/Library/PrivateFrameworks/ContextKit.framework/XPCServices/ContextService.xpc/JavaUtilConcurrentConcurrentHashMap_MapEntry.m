@interface JavaUtilConcurrentConcurrentHashMap_MapEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_MapEntry)initWithId:(id)a3 withId:(id)a4 withJavaUtilConcurrentConcurrentHashMap:(id)a5;
- (NSString)description;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_MapEntry

- (JavaUtilConcurrentConcurrentHashMap_MapEntry)initWithId:(id)a3 withId:(id)a4 withJavaUtilConcurrentConcurrentHashMap:(id)a5
{
  return self;
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return self->val_;
}

- (unint64_t)hash
{
  id key = self->key_;
  if (!key || (unsigned int v4 = [key hash], (val = self->val_) == 0)) {
    JreThrowNullPointerException();
  }
  return (int)([val hash] ^ v4);
}

- (NSString)description
{
  return (NSString *)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->key_);
}

- (BOOL)isEqual:(id)a3
{
  LODWORD(v5) = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    uint64_t v6 = (void *)JavaUtilMap_Entry_class_();
    if (a3)
    {
      if (([v6 isInstance:a3] & 1) == 0) {
        JreThrowClassCastException();
      }
      id v5 = [a3 getKey];
      if (v5)
      {
        id v7 = v5;
        id v5 = [a3 getValue];
        if (v5)
        {
          id v8 = v5;
          if (v7 == self->key_ || (LODWORD(v5) = objc_msgSend(v7, "isEqual:"), v5))
          {
            if (v8 == self->val_)
            {
              LOBYTE(v5) = 1;
            }
            else
            {
              LOBYTE(v5) = objc_msgSend(v8, "isEqual:");
            }
          }
        }
      }
    }
    else
    {
      id v5 = [0 getKey];
      if (v5) {
        JreThrowNullPointerException();
      }
    }
  }
  return (char)v5;
}

- (id)setValueWithId:(id)a3
{
  if (!a3)
  {
    v9 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v9);
  }
  p_id val = &self->val_;
  id val = self->val_;
  JreStrongAssign(&self->val_, a3);
  id v7 = p_val[1];
  if (!v7) {
    JreThrowNullPointerException();
  }
  [v7 putWithId:self->key_ withId:a3];
  return val;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_MapEntry;
  [(JavaUtilConcurrentConcurrentHashMap_MapEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100420108;
}

@end