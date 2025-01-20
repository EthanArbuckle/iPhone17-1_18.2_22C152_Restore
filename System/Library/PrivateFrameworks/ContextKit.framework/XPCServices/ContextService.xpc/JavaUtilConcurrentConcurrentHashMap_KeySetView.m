@interface JavaUtilConcurrentConcurrentHashMap_KeySetView
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_KeySetView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3 withId:(id)a4;
- (id)getMappedValue;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_KeySetView

- (JavaUtilConcurrentConcurrentHashMap_KeySetView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3 withId:(id)a4
{
  return self;
}

- (id)getMappedValue
{
  return self->value_;
}

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak containsKeyWithId:a3];
}

- (BOOL)removeWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak removeWithId:a3] != 0;
}

- (id)iterator
{
  id Weak = (unint64_t *)objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  v3 = Weak;
  v4 = (_DWORD *)atomic_load(Weak + 3);
  if (v4) {
    int v5 = v4[2];
  }
  else {
    int v5 = 0;
  }
  v6 = [JavaUtilConcurrentConcurrentHashMap_KeyIterator alloc];
  JavaUtilConcurrentConcurrentHashMap_BaseIterator_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_withJavaUtilConcurrentConcurrentHashMap_((uint64_t)v6, v4, v5, 0, v5, v3);
  return v6;
}

- (BOOL)addWithId:(id)a3
{
  id value = self->value_;
  if (!value)
  {
    v7 = new_JavaLangUnsupportedOperationException_init();
    objc_exception_throw(v7);
  }
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return sub_1001BA500((uint64_t)Weak, a3, value, 1) == 0;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  id value = self->value_;
  if (!value)
  {
    v15 = new_JavaLangUnsupportedOperationException_init();
    objc_exception_throw(v15);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  if (!a3) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    p_map = &self->super.map_;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id Weak = objc_loadWeak((id *)p_map);
        if (!Weak) {
          goto LABEL_14;
        }
        v8 |= sub_1001BA500((uint64_t)Weak, v12, value, 1) == 0;
      }
      id v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (unint64_t)hash
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t result = [(JavaUtilConcurrentConcurrentHashMap_KeySetView *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    unint64_t v4 = result;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(self);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (!v8) {
          JreThrowNullPointerException();
        }
        v5 += [v8 hash];
      }
      unint64_t v4 = [(JavaUtilConcurrentConcurrentHashMap_KeySetView *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
    return v5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [(id)JavaUtilSet_class_() isInstance:a3];
  if (v5)
  {
    uint64_t v6 = (void *)JavaUtilSet_class_();
    if (a3 && ([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    if (a3 == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      unsigned int v5 = sub_1001C0C4C(self, a3);
      if (v5)
      {
        if (!a3) {
          JreThrowNullPointerException();
        }
        LOBYTE(v5) = [a3 containsAllWithJavaUtilCollection:self];
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_KeySetView;
  [(JavaUtilConcurrentConcurrentHashMap_KeySetView *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100420750;
}

@end