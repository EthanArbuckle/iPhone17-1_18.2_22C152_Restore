@interface JavaUtilWeakHashMap_Entry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilWeakHashMap_Entry)initWithId:(id)a3 withId:(id)a4 withJavaLangRefReferenceQueue:(id)a5;
- (NSString)description;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilWeakHashMap_Entry

- (JavaUtilWeakHashMap_Entry)initWithId:(id)a3 withId:(id)a4 withJavaLangRefReferenceQueue:(id)a5
{
  return self;
}

- (id)getKey
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilWeakHashMap_Entry;
  return [(JavaLangRefReference *)&v3 get];
}

- (id)getValue
{
  return self->value_;
}

- (id)setValueWithId:(id)a3
{
  p_value = &self->value_;
  id v4 = *p_value;
  JreStrongAssign(p_value, a3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  LODWORD(v5) = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (a3 && ([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    v10.receiver = self;
    v10.super_class = (Class)JavaUtilWeakHashMap_Entry;
    id v7 = [(JavaLangRefReference *)&v10 get];
    if (v7)
    {
      if (a3)
      {
        LODWORD(v5) = objc_msgSend(v7, "isEqual:", objc_msgSend(a3, "getKey"));
        if (!v5) {
          return (char)v5;
        }
LABEL_11:
        id value = self->value_;
        id v5 = [a3 getValue];
        if (value) {
          LOBYTE(v5) = [value isEqual:v5];
        }
        else {
          LOBYTE(v5) = v5 == 0;
        }
        return (char)v5;
      }
    }
    else if (a3)
    {
      if ([a3 getKey])
      {
        LOBYTE(v5) = 0;
        return (char)v5;
      }
      goto LABEL_11;
    }
    JreThrowNullPointerException();
  }
  return (char)v5;
}

- (unint64_t)hash
{
  int hash = self->hash__;
  id value = self->value_;
  if (value) {
    LODWORD(value) = [value hash];
  }
  return (int)value + hash;
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)JavaUtilWeakHashMap_Entry;
  id v2 = [(JavaLangRefReference *)&v11 get];
  return (NSString *)JreStrcat("@C@", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilWeakHashMap_Entry;
  [(JavaLangRefReference *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FD838;
}

@end