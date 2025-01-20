@interface JavaUtilConcurrentConcurrentHashMap_Node
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_Node)initWithInt:(int)a3 withId:(id)a4 withId:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6;
- (NSString)description;
- (id)findWithInt:(int)a3 withId:(id)a4;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_Node

- (JavaUtilConcurrentConcurrentHashMap_Node)initWithInt:(int)a3 withId:(id)a4 withId:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6
{
  self->hash__ = a3;
  JreStrongAssign(&self->key_, a4);
  JreVolatileStrongAssign((atomic_ullong *)&self->val_, a5);
  JreStrongAssign((id *)&self->next_, a6);
  return self;
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return (id)atomic_load((unint64_t *)&self->val_);
}

- (unint64_t)hash
{
  id key = self->key_;
  if (!key
    || (unsigned int v4 = [key hash], (v5 = (void *)atomic_load((unint64_t *)&self->val_)) == 0))
  {
    JreThrowNullPointerException();
  }
  return (int)([v5 hash] ^ v4);
}

- (NSString)description
{
  atomic_load((unint64_t *)&self->val_);
  return (NSString *)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->key_);
}

- (id)setValueWithId:(id)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
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
          v8 = v5;
          if (v7 == self->key_ || (LODWORD(v5) = objc_msgSend(v7, "isEqual:"), v5))
          {
            unint64_t v9 = atomic_load((unint64_t *)&self->val_);
            if (v8 == (void *)v9)
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

- (id)findWithInt:(int)a3 withId:(id)a4
{
  if (!a4) {
    return 0;
  }
  do
  {
    if (self->hash__ == a3)
    {
      id key = self->key_;
      if (key == a4 || key && (objc_msgSend(a4, "isEqual:") & 1) != 0) {
        break;
      }
    }
    self = self->next_;
  }
  while (self);
  return self;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->val_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_Node;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_Node;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 __javaClone];
  JreRetainVolatile(&self->val_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041EB88;
}

@end