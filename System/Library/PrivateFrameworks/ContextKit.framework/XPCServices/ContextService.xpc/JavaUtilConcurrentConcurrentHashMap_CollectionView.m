@interface JavaUtilConcurrentConcurrentHashMap_CollectionView
+ (const)__metadata;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_CollectionView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3;
- (NSString)description;
- (id)getMap;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_CollectionView

- (JavaUtilConcurrentConcurrentHashMap_CollectionView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3
{
  return self;
}

- (id)getMap
{
  return objc_loadWeak((id *)&self->map_);
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  [Weak clear];
}

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak size];
}

- (BOOL)isEmpty
{
  id Weak = objc_loadWeak((id *)&self->map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak isEmpty];
}

- (id)iterator
{
  return 0;
}

- (BOOL)containsWithId:(id)a3
{
  return 0;
}

- (BOOL)removeWithId:(id)a3
{
  return 0;
}

- (id)toArray
{
  id Weak = objc_loadWeak((id *)&self->map_);
  if (!Weak) {
LABEL_22:
  }
    JreThrowNullPointerException();
  uint64_t v4 = (uint64_t)[Weak mappingCount];
  if (v4 >= 2147483640)
  {
LABEL_23:
    v16 = new_JavaLangOutOfMemoryError_initWithNSString_(off_10055C3A8);
    objc_exception_throw(v16);
  }
  signed int v5 = v4;
  v6 = +[IOSObjectArray arrayWithLength:(int)v4 type:NSObject_class_()];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v7 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      int v12 = v9;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(self);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        if (v12 + v11 == v5)
        {
          if (v5 > 2147483638) {
            goto LABEL_23;
          }
          if (v5 >= 1073741819) {
            signed int v5 = 2147483639;
          }
          else {
            v5 += (v5 >> 1) + 1;
          }
          v6 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v6, v5);
        }
        if (!v6) {
          goto LABEL_22;
        }
        IOSObjectArray_Set((uint64_t)v6, v12 + (int)v11++, v13);
      }
      while (v8 != v11);
      unint64_t v8 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self countByEnumeratingWithState:&v17 objects:v21 count:16];
      int v9 = v12 + v11;
    }
    while (v8);
    unsigned int v14 = v12 + v11;
  }
  else
  {
    unsigned int v14 = 0;
  }
  if (v14 != v5) {
    return JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v6, v14);
  }
  return v6;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->map_);
  if (!Weak) {
    goto LABEL_28;
  }
  uint64_t v6 = (uint64_t)[Weak mappingCount];
  if (v6 >= 2147483640)
  {
LABEL_31:
    long long v19 = new_JavaLangOutOfMemoryError_initWithNSString_(off_10055C3A8);
    objc_exception_throw(v19);
  }
  if (!a3) {
LABEL_28:
  }
    JreThrowNullPointerException();
  unint64_t v7 = a3;
  if (*((_DWORD *)a3 + 2) < (int)v6)
  {
    unint64_t v7 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v6);
    objc_opt_class();
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
  }
  signed int v8 = v7[2];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v9 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    unint64_t v10 = v9;
    id v20 = a3;
    int v11 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      int v14 = v11;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(self);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        if (v14 + v13 == v8)
        {
          if (v8 > 2147483638) {
            goto LABEL_31;
          }
          if (v8 >= 1073741819) {
            signed int v8 = 2147483639;
          }
          else {
            v8 += (v8 >> 1) + 1;
          }
          v16 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v7, v8);
          if (!v16) {
            goto LABEL_28;
          }
          unint64_t v7 = v16;
        }
        IOSObjectArray_Set((uint64_t)v7, v14 + (int)v13++, v15);
      }
      while (v10 != v13);
      unint64_t v10 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self countByEnumeratingWithState:&v21 objects:v25 count:16];
      int v11 = v14 + v13;
    }
    while (v10);
    signed int v17 = v14 + v13;
    a3 = v20;
  }
  else
  {
    signed int v17 = 0;
  }
  if (v7 == a3 && v17 < v8)
  {
    IOSObjectArray_Set((uint64_t)a3, v17, 0);
  }
  else if (v17 == v8)
  {
    return v7;
  }
  else
  {
    return JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v7, v17);
  }
  return a3;
}

- (NSString)description
{
  v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithChar:91];
  id v4 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self iterator];
  if (!v4) {
    goto LABEL_16;
  }
  signed int v5 = v4;
  if ([v4 hasNext])
  {
    uint64_t v6 = (JavaUtilConcurrentConcurrentHashMap_CollectionView *)[v5 next];
    unint64_t v7 = v6 == self ? @"(this Collection)" : (__CFString *)v6;
    [(JavaLangStringBuilder *)v3 appendWithId:v7];
    if ([v5 hasNext])
    {
      while (1)
      {
        id v8 = [(JavaLangStringBuilder *)v3 appendWithChar:44];
        if (!v8) {
          break;
        }
        [v8 appendWithChar:32];
        unint64_t v9 = (JavaUtilConcurrentConcurrentHashMap_CollectionView *)[v5 next];
        if (v9 == self) {
          CFStringRef v10 = @"(this Collection)";
        }
        else {
          CFStringRef v10 = (const __CFString *)v9;
        }
        [(JavaLangStringBuilder *)v3 appendWithId:v10];
        if (([v5 hasNext] & 1) == 0) {
          goto LABEL_12;
        }
      }
LABEL_16:
      JreThrowNullPointerException();
    }
  }
LABEL_12:
  id v11 = [(JavaLangStringBuilder *)v3 appendWithChar:93];
  if (!v11) {
    goto LABEL_16;
  }
  return (NSString *)[v11 description];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  return sub_1001C0C4C(self, a3);
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  id v4 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self iterator];
  if (!v4) {
    goto LABEL_8;
  }
  signed int v5 = v4;
  BOOL v6 = 0;
  if ([v4 hasNext])
  {
    while (a3)
    {
      if (objc_msgSend(a3, "containsWithId:", objc_msgSend(v5, "next")))
      {
        [v5 remove];
        BOOL v6 = 1;
      }
      if (([v5 hasNext] & 1) == 0) {
        return v6;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  return v6;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  id v4 = [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)self iterator];
  if (!v4) {
    goto LABEL_8;
  }
  signed int v5 = v4;
  BOOL v6 = 0;
  if ([v4 hasNext])
  {
    while (a3)
    {
      if ((objc_msgSend(a3, "containsWithId:", objc_msgSend(v5, "next")) & 1) == 0)
      {
        [v5 remove];
        BOOL v6 = 1;
      }
      if (([v5 hasNext] & 1) == 0) {
        return v6;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  return v6;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_CollectionView;
  [(JavaUtilConcurrentConcurrentHashMap_CollectionView *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004204C0;
}

- (void).cxx_destruct
{
}

@end