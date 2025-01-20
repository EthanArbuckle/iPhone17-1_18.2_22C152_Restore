@interface JavaUtilConcurrentConcurrentHashMap_EntrySetView
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_EntrySetView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_EntrySetView

- (JavaUtilConcurrentConcurrentHashMap_EntrySetView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  LODWORD(v5) = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (a3 && ([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id v5 = [a3 getKey];
    if (v5)
    {
      id v7 = v5;
      id Weak = objc_loadWeak((id *)&self->super.map_);
      if (!Weak) {
        goto LABEL_15;
      }
      id v5 = [Weak getWithId:v7];
      if (!v5) {
        return (char)v5;
      }
      if (!a3) {
LABEL_15:
      }
        JreThrowNullPointerException();
      id v9 = v5;
      id v5 = [a3 getValue];
      if (v5)
      {
        if (v5 == v9)
        {
          LOBYTE(v5) = 1;
        }
        else
        {
          LOBYTE(v5) = [v5 isEqual:v9];
        }
      }
    }
  }
  return (char)v5;
}

- (BOOL)removeWithId:(id)a3
{
  if (![(id)JavaUtilMap_Entry_class_() isInstance:a3]) {
    return 0;
  }
  id v5 = (void *)JavaUtilMap_Entry_class_();
  if (!a3)
  {
    if ([0 getKey]) {
LABEL_13:
    }
      JreThrowNullPointerException();
    return 0;
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  id v6 = [a3 getKey];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = [a3 getValue];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    goto LABEL_13;
  }
  return [Weak removeWithId:v7 withId:v9];
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
  id v6 = [JavaUtilConcurrentConcurrentHashMap_EntryIterator alloc];
  JavaUtilConcurrentConcurrentHashMap_BaseIterator_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_withJavaUtilConcurrentConcurrentHashMap_((uint64_t)v6, v4, v5, 0, v5, v3);
  return v6;
}

- (BOOL)addWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak || !a3) {
    JreThrowNullPointerException();
  }
  return sub_1001BA500((uint64_t)Weak, [a3 getKey], objc_msgSend(a3, "getValue"), 0) == 0;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        v7 |= -[JavaUtilConcurrentConcurrentHashMap_EntrySetView addWithId:](self, "addWithId:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7 & 1;
}

- (unint64_t)hash
{
  id Weak = (unint64_t *)objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  unint64_t result = atomic_load(Weak + 3);
  if (result)
  {
    v4 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_((void *)result, *(_DWORD *)(result + 8), 0, *(_DWORD *)(result + 8));
    unint64_t result = (unint64_t)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v4);
    if (result)
    {
      int v5 = 0;
      do
      {
        v5 += [(id)result hash];
        unint64_t result = (unint64_t)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v4);
      }
      while (result);
      return v5;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [(id)JavaUtilSet_class_() isInstance:a3];
  if (v5)
  {
    id v6 = (void *)JavaUtilSet_class_();
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

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100420B40;
}

@end