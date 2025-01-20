@interface JavaUtilConcurrentConcurrentHashMap
+ (BOOL)casTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6;
+ (const)__metadata;
+ (id)comparableClassForWithId:(id)a3;
+ (id)newKeySetWithInt:(int)a3;
+ (id)tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4;
+ (id)untreeifyWithJavaUtilConcurrentConcurrentHashMap_Node:(id)a3;
+ (int)compareComparablesWithIOSClass:(id)a3 withId:(id)a4 withId:(id)a5;
+ (int)resizeStampWithInt:(int)a3;
+ (int)spreadWithInt:(int)a3;
+ (int)tableSizeForWithInt:(int)a3;
+ (void)ensureLoadedWithIOSClass:(id)a3;
+ (void)initialize;
+ (void)setTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a5;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeWithId:(id)a3 withId:(id)a4;
- (BOOL)replaceWithId:(id)a3 withId:(id)a4 withId:(id)a5;
- (JavaUtilConcurrentConcurrentHashMap)init;
- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3;
- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3 withFloat:(float)a4 withInt:(int)a5;
- (JavaUtilConcurrentConcurrentHashMap)initWithJavaUtilMap:(id)a3;
- (NSString)description;
- (id)elements;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)helpTransferWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a4;
- (id)keySet;
- (id)keySetWithId:(id)a3;
- (id)keys;
- (id)putIfAbsentWithId:(id)a3 withId:(id)a4;
- (id)putValWithId:(id)a3 withId:(id)a4 withBoolean:(BOOL)a5;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)replaceNodeWithId:(id)a3 withId:(id)a4 withId:(id)a5;
- (id)replaceWithId:(id)a3 withId:(id)a4;
- (id)values;
- (int)size;
- (int64_t)mappingCount;
- (unint64_t)hash;
- (unint64_t)sumCount;
- (void)__javaClone;
- (void)addCountWithLong:(int64_t)a3 withInt:(int)a4;
- (void)clear;
- (void)dealloc;
- (void)fullAddCountWithLong:(int64_t)a3 withJavaUtilConcurrentConcurrentHashMap_CounterHashCode:(id)a4 withBoolean:(BOOL)a5;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)transferWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a4;
- (void)treeifyBinWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4;
- (void)tryPresizeWithInt:(int)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilConcurrentConcurrentHashMap

+ (int)spreadWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaUtilConcurrentConcurrentHashMap__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return a3 & 0x7FFFFFFF ^ HIWORD(a3);
}

+ (int)tableSizeForWithInt:(int)a3
{
  return sub_1001B9948(a3);
}

+ (id)comparableClassForWithId:(id)a3
{
  return JavaUtilConcurrentConcurrentHashMap_comparableClassForWithId_(a3);
}

+ (int)compareComparablesWithIOSClass:(id)a3 withId:(id)a4 withId:(id)a5
{
  return JavaUtilConcurrentConcurrentHashMap_compareComparablesWithIOSClass_withId_withId_(a3, a4, a5);
}

+ (id)tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4
{
  return JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_((uint64_t)a3, a4);
}

+ (BOOL)casTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6
{
  return JavaUtilConcurrentConcurrentHashMap_casTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withJavaUtilConcurrentConcurrentHashMap_Node_withJavaUtilConcurrentConcurrentHashMap_Node_((uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6);
}

+ (void)setTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a5
{
}

- (JavaUtilConcurrentConcurrentHashMap)init
{
  return self;
}

- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilConcurrentConcurrentHashMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (JavaUtilConcurrentConcurrentHashMap)initWithInt:(int)a3 withFloat:(float)a4 withInt:(int)a5
{
  return self;
}

- (int)size
{
  int64_t v2 = -[JavaUtilConcurrentConcurrentHashMap sumCount]_0((uint64_t)self);
  uint64_t v3 = 0x7FFFFFFFLL;
  if (v2 < 0x7FFFFFFF) {
    uint64_t v3 = v2;
  }
  return v3 & ~(v3 >> 63);
}

- (unint64_t)sumCount
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 64));
  unint64_t result = atomic_load((unint64_t *)(a1 + 40));
  if (v1 && *(int *)(v1 + 8) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(v1 + 24 + 8 * v3);
      if (v4)
      {
        unint64_t v5 = atomic_load((unint64_t *)(v4 + 64));
        result += v5;
      }
      ++v3;
    }
    while (v3 < *(int *)(v1 + 8));
  }
  return result;
}

- (BOOL)isEmpty
{
  return (uint64_t)-[JavaUtilConcurrentConcurrentHashMap sumCount]_0((uint64_t)self) < 1;
}

- (id)getWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = [a3 hash];
  if ((atomic_load_explicit(JavaUtilConcurrentConcurrentHashMap__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = (id)atomic_load((unint64_t *)&self->table_);
  if (!result) {
    return result;
  }
  int v7 = *((_DWORD *)result + 2);
  BOOL v8 = __OFSUB__(v7, 1);
  int v9 = v7 - 1;
  if (v9 < 0 != v8) {
    return 0;
  }
  uint64_t v10 = v5 & 0x7FFFFFFF ^ HIWORD(v5);
  id result = JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_((uint64_t)result, v9 & v10);
  if (!result) {
    return result;
  }
  v11 = result;
  int v12 = *((_DWORD *)result + 2);
  if (v12 == v10) {
    goto LABEL_13;
  }
  if ((v12 & 0x80000000) == 0)
  {
    while (1)
    {
      v11 = (void *)v11[4];
      if (!v11) {
        break;
      }
      if (*((_DWORD *)v11 + 2) == v10)
      {
LABEL_13:
        id v13 = (id)v11[2];
        if (v13 == a3 || v13 && (objc_msgSend(a3, "isEqual:") & 1) != 0) {
          return (id)atomic_load(v11 + 3);
        }
      }
    }
    return 0;
  }
  id result = [result findWithInt:v10 withId:a3];
  v11 = result;
  if (result) {
    return (id)atomic_load(v11 + 3);
  }
  return result;
}

- (BOOL)containsKeyWithId:(id)a3
{
  return [(JavaUtilConcurrentConcurrentHashMap *)self getWithId:a3] != 0;
}

- (BOOL)containsValueWithId:(id)a3
{
  if (!a3)
  {
    BOOL v8 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v8);
  }
  id v3 = (id)atomic_load((unint64_t *)&self->table_);
  if (v3)
  {
    unsigned int v5 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_(v3, *((_DWORD *)v3 + 2), 0, *((_DWORD *)v3 + 2));
    for (i = v5; ; unsigned int v5 = i)
    {
      id v3 = -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v5);
      if (!v3) {
        break;
      }
      id v7 = (id)atomic_load((unint64_t *)v3 + 3);
      if (v7 == a3 || v7 && (objc_msgSend(a3, "isEqual:") & 1) != 0)
      {
        LOBYTE(v3) = 1;
        return (char)v3;
      }
    }
  }
  return (char)v3;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  return (id)sub_1001BA500((uint64_t)self, a3, a4, 0);
}

- (id)putValWithId:(id)a3 withId:(id)a4 withBoolean:(BOOL)a5
{
  return (id)sub_1001BA500((uint64_t)self, a3, a4, a5);
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  if (!a3
    || (sub_1001BA950((uint64_t)self, (int)[a3 size]),
        long long v14 = 0u,
        long long v15 = 0u,
        long long v12 = 0u,
        long long v13 = 0u,
        (id v5 = objc_msgSend(a3, "entrySet", 0)) == 0))
  {
LABEL_12:
    JreThrowNullPointerException();
  }
  v6 = v5;
  id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (!v11) {
          goto LABEL_12;
        }
        sub_1001BA500((uint64_t)self, [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) getKey], objc_msgSend(v11, "getValue"), 0);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)removeWithId:(id)a3
{
  return (id)sub_1001BAB8C((uint64_t)self, a3, 0, 0);
}

- (id)replaceNodeWithId:(id)a3 withId:(id)a4 withId:(id)a5
{
  return (id)sub_1001BAB8C((uint64_t)self, a3, a4, a5);
}

- (void)clear
{
  unint64_t v2 = atomic_load((unint64_t *)&self->table_);
  if (v2)
  {
    int v4 = 0;
    unint64_t v5 = 0;
    while (v4 < *(_DWORD *)(v2 + 8))
    {
      v6 = (unint64_t *)JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_(v2, v4);
      if (v6)
      {
        id v7 = v6;
        int v8 = *((_DWORD *)v6 + 2);
        if (v8 == -1879048193)
        {
          unint64_t v2 = sub_1001BB070((uint64_t)self, v2, (uint64_t)v6);
          int v4 = 0;
          if (!v2) {
            break;
          }
        }
        else
        {
          objc_sync_enter(v6);
          if (JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_(v2, v4) == v7)
          {
            unint64_t v9 = (unint64_t)v7;
            if ((v8 & 0x80000000) == 0) {
              goto LABEL_26;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                JreThrowClassCastException();
              }
              unint64_t v9 = atomic_load(v7 + 6);
              if (v9)
              {
LABEL_26:
                do
                {
                  --v5;
                  unint64_t v9 = *(void *)(v9 + 32);
                }
                while (v9);
              }
            }
            JavaUtilConcurrentConcurrentHashMap_setTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withJavaUtilConcurrentConcurrentHashMap_Node_(v2, v4++, 0);
          }
          objc_sync_exit(v7);
        }
      }
      else
      {
        ++v4;
      }
    }
    if (v5)
    {
      sub_1001BB1FC((uint64_t)self, v5, -1);
    }
  }
}

- (id)keySet
{
  p_keySet_ConcurrentHashMap = &self->keySet_ConcurrentHashMap_;
  if (self->keySet_ConcurrentHashMap_) {
    return self->keySet_ConcurrentHashMap_;
  }
  int v4 = new_JavaUtilConcurrentConcurrentHashMap_KeySetView_initWithJavaUtilConcurrentConcurrentHashMap_withId_(self, 0);
  return JreStrongAssignAndConsume((id *)p_keySet_ConcurrentHashMap, v4);
}

- (id)values
{
  p_values = &self->values_;
  id result = self->values_;
  if (!result)
  {
    unint64_t v5 = [JavaUtilConcurrentConcurrentHashMap_ValuesView alloc];
    objc_storeWeak((id *)&v5->super.map_, self);
    return JreStrongAssignAndConsume((id *)p_values, v5);
  }
  return result;
}

- (id)entrySet
{
  p_entrySet = &self->entrySet_;
  id result = self->entrySet_;
  if (!result)
  {
    unint64_t v5 = [JavaUtilConcurrentConcurrentHashMap_EntrySetView alloc];
    objc_storeWeak((id *)&v5->super.map_, self);
    return JreStrongAssignAndConsume((id *)p_entrySet, v5);
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t result = atomic_load((unint64_t *)&self->table_);
  if (result)
  {
    id v3 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_((void *)result, *(_DWORD *)(result + 8), 0, *(_DWORD *)(result + 8));
    unint64_t result = (unint64_t)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v3);
    if (result)
    {
      unint64_t v4 = result;
      int v5 = 0;
      do
      {
        v6 = *(void **)(v4 + 16);
        if (!v6
          || (unsigned int v7 = [v6 hash],
              (int v8 = (void *)atomic_load((unint64_t *)(v4 + 24))) == 0))
        {
          JreThrowNullPointerException();
        }
        v5 += [v8 hash] ^ v7;
        unint64_t v4 = (unint64_t)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v3);
      }
      while (v4);
      return v5;
    }
  }
  return result;
}

- (NSString)description
{
  id v3 = (_DWORD *)atomic_load((unint64_t *)&self->table_);
  if (v3) {
    int v4 = v3[2];
  }
  else {
    int v4 = 0;
  }
  int v5 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_(v3, v4, 0, v4);
  v6 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v6 appendWithChar:123];
  id v7 = -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v5);
  if (v7)
  {
    id v8 = v7;
    while (1)
    {
      unint64_t v9 = (JavaUtilConcurrentConcurrentHashMap *)*((void *)v8 + 2);
      uint64_t v10 = (JavaUtilConcurrentConcurrentHashMap *)atomic_load((unint64_t *)v8 + 3);
      v11 = v9 == self ? @"(this Map)" : (__CFString *)v9;
      [(JavaLangStringBuilder *)v6 appendWithId:v11];
      [(JavaLangStringBuilder *)v6 appendWithChar:61];
      long long v12 = v10 == self ? @"(this Map)" : (__CFString *)v10;
      [(JavaLangStringBuilder *)v6 appendWithId:v12];
      id v13 = -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v5);
      if (!v13) {
        break;
      }
      id v8 = v13;
      id v14 = [(JavaLangStringBuilder *)v6 appendWithChar:44];
      if (!v14) {
        goto LABEL_19;
      }
      [v14 appendWithChar:32];
    }
  }
  id v15 = [(JavaLangStringBuilder *)v6 appendWithChar:125];
  if (!v15) {
LABEL_19:
  }
    JreThrowNullPointerException();
  return (NSString *)[v15 description];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_31;
  }
  LODWORD(v5) = [(id)JavaUtilMap_class_() isInstance:a3];
  if (!v5) {
    return (char)v5;
  }
  v6 = (void *)JavaUtilMap_class_();
  if (a3 && ([v6 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  id v7 = (_DWORD *)atomic_load((unint64_t *)&self->table_);
  if (v7) {
    int v8 = v7[2];
  }
  else {
    int v8 = 0;
  }
  unint64_t v9 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_(v7, v8, 0, v8);
  uint64_t v10 = (unint64_t *)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v9);
  if (v10)
  {
    do
    {
      unint64_t v11 = atomic_load(v10 + 3);
      if (!a3) {
        goto LABEL_33;
      }
      id v5 = [a3 getWithId:v10[2]];
      if (!v5) {
        return (char)v5;
      }
      if (v5 != (id)v11)
      {
        LODWORD(v5) = [v5 isEqual:v11];
        if (!v5) {
          return (char)v5;
        }
      }
      uint64_t v10 = (unint64_t *)-[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v9);
    }
    while (v10);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    if (!a3) {
      goto LABEL_33;
    }
  }
  id v12 = objc_msgSend(a3, "entrySet", (void)v22);
  if (!v12) {
LABEL_33:
  }
    JreThrowNullPointerException();
  id v13 = v12;
  id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v14)
  {
LABEL_31:
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v23;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (!v18) {
        goto LABEL_33;
      }
      id v5 = [*(id *)(*((void *)&v22 + 1) + 8 * i) getKey];
      if (!v5) {
        return (char)v5;
      }
      id v19 = v5;
      id v5 = [v18 getValue];
      if (!v5) {
        return (char)v5;
      }
      id v20 = v5;
      id v5 = [(JavaUtilConcurrentConcurrentHashMap *)self getWithId:v19];
      if (!v5) {
        return (char)v5;
      }
      if (v20 != v5)
      {
        LODWORD(v5) = [v20 isEqual:v5];
        if (!v5) {
          return (char)v5;
        }
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    LOBYTE(v5) = 1;
  }
  while (v15);
  return (char)v5;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (qword_100560BA8 != -1) {
    dispatch_once(&qword_100560BA8, &stru_10041ED28);
  }
  id v5 = +[IOSObjectArray arrayWithLength:16 type:qword_100560BA0];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (v5->super.size_ >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [JavaUtilConcurrentConcurrentHashMap_Segment alloc];
      JavaUtilConcurrentLocksReentrantLock_init((uint64_t)v7);
      v7->loadFactor_ = 0.75;
      IOSObjectArray_SetAndConsume((uint64_t)v5, v6++, v7);
    }
    while (v6 < v5->super.size_);
  }
  if (!a3 || (id v8 = [a3 putFields]) == 0) {
    JreThrowNullPointerException();
  }
  unint64_t v9 = v8;
  [v8 putWithNSString:@"segments" withId:v5];
  [v9 putWithNSString:@"segmentShift" withInt:28];
  [v9 putWithNSString:@"segmentMask" withInt:15];
  [a3 writeFields];
  uint64_t v10 = (int *)atomic_load((unint64_t *)&self->table_);
  if (v10)
  {
    unint64_t v11 = new_JavaUtilConcurrentConcurrentHashMap_Traverser_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_(v10, v10[2], 0, v10[2]);
    id v12 = -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v11);
    if (v12)
    {
      id v13 = v12;
      do
      {
        [a3 writeObjectWithId:v13[2]];
        unint64_t v14 = atomic_load(v13 + 3);
        [a3 writeObjectWithId:v14];
        id v13 = -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0((uint64_t)v11);
      }
      while (v13);
    }
  }
  [a3 writeObjectWithId:0];
  [a3 writeObjectWithId:0];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  atomic_store(0xFFFFFFFF, (unsigned int *)&self->sizeCtl_);
  if (!a3) {
LABEL_48:
  }
    JreThrowNullPointerException();
  int v4 = self;
  [a3 defaultReadObject];
  id v5 = [a3 readObject];
  id v6 = [a3 readObject];
  if (!v5) {
    goto LABEL_12;
  }
  id v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  v43 = v4;
  LODWORD(v8) = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  do
  {
    unsigned int v11 = [v5 hash];
    if ((atomic_load_explicit(JavaUtilConcurrentConcurrentHashMap__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v10 = new_JavaUtilConcurrentConcurrentHashMap_Node_initWithInt_withId_withId_withJavaUtilConcurrentConcurrentHashMap_Node_(v11 & 0x7FFFFFFF ^ HIWORD(v11), v5, v7, v10);
    id v5 = [a3 readObject];
    id v12 = [a3 readObject];
    --v9;
    unint64_t v8 = (v8 + 1);
    if (!v5) {
      break;
    }
    id v7 = v12;
  }
  while (v12);
  int v4 = v43;
  if (!v9)
  {
LABEL_12:
    atomic_store(0, (unsigned int *)&v4->sizeCtl_);
    return;
  }
  if (-v9 > 0x1FFFFFFF) {
    int v13 = 0x40000000;
  }
  else {
    int v13 = sub_1001B9948((v8 >> 1) - v9 + 1);
  }
  uint64_t v14 = v13;
  if (qword_100560B98 != -1) {
    dispatch_once(&qword_100560B98, &stru_10041EBF8);
  }
  id v15 = +[IOSObjectArray arrayWithLength:v14 type:qword_100560B90];
  objc_opt_class();
  if (v15 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_49:
  }
    JreThrowClassCastException();
  uint64_t v41 = v14;
  if (!v10)
  {
    unint64_t v17 = 0;
    goto LABEL_47;
  }
  int v16 = v14 - 1;
  unint64_t v17 = 0;
  uint64_t v45 = (uint64_t)v15;
  int v44 = v16;
  do
  {
    while (1)
    {
      while (1)
      {
LABEL_20:
        uint64_t v18 = (uint64_t)v10;
        p_next = (id *)&v10->next_;
        uint64_t v10 = v10->next_;
        uint64_t v20 = *((unsigned int *)p_next - 6);
        int v21 = v20 & v16;
        id v22 = JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_((uint64_t)v15, v20 & v16);
        long long v23 = v22;
        if (!v22) {
          goto LABEL_37;
        }
        long long v24 = *(void **)(v18 + 16);
        if ((*((_DWORD *)v22 + 2) & 0x80000000) == 0) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_49;
        }
        v39 = (void *)atomic_load((unint64_t *)(v18 + 24));
        if (!sub_1001BC100((uint64_t)v23, v20, v24, v39)) {
          ++v17;
        }
        if (!v10) {
          goto LABEL_47;
        }
      }
      unint64_t v25 = v17;
      int v26 = 0;
      v27 = v22;
      do
      {
        if (*((_DWORD *)v27 + 2) == v20)
        {
          v28 = (void *)v27[2];
          if (v28 == v24) {
            goto LABEL_44;
          }
          if (v28)
          {
            if (!v24) {
              goto LABEL_48;
            }
            if ([v24 isEqual:v41])
            {
LABEL_44:
              id v15 = (IOSObjectArray *)v45;
              unint64_t v17 = v25;
              int v16 = v44;
              if (!v10) {
                goto LABEL_47;
              }
              goto LABEL_20;
            }
          }
        }
        ++v26;
        v27 = (void *)v27[4];
      }
      while (v27);
      BOOL v29 = v26 < 8;
      id v15 = (IOSObjectArray *)v45;
      unint64_t v17 = v25;
      int v16 = v44;
      if (!v29) {
        break;
      }
LABEL_37:
      ++v17;
      JreStrongAssign(p_next, v23);
      JavaUtilConcurrentConcurrentHashMap_setTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withJavaUtilConcurrentConcurrentHashMap_Node_((uint64_t)v15, v21, v18);
      if (!v10) {
        goto LABEL_47;
      }
    }
    unint64_t v42 = v17 + 1;
    JreStrongAssign(p_next, v23);
    v30 = 0;
    v31 = 0;
    do
    {
      int v32 = *(_DWORD *)(v18 + 8);
      v33 = *(void **)(v18 + 16);
      v34 = (void *)atomic_load((unint64_t *)(v18 + 24));
      v35 = [JavaUtilConcurrentConcurrentHashMap_TreeNode alloc];
      JavaUtilConcurrentConcurrentHashMap_TreeNode_initWithInt_withId_withId_withJavaUtilConcurrentConcurrentHashMap_Node_withJavaUtilConcurrentConcurrentHashMap_TreeNode_((uint64_t)v35, v32, v33, v34, 0, 0);
      v36 = v35;
      v37 = v36;
      if (JreStrongAssign(v36 + 8, v30))
      {
        if (!v30) {
          goto LABEL_48;
        }
        JreStrongAssign(v30 + 4, v36);
        v37 = v31;
      }
      uint64_t v18 = *(void *)(v18 + 32);
      v30 = v36;
      v31 = v37;
    }
    while (v18);
    v38 = [JavaUtilConcurrentConcurrentHashMap_TreeBin alloc];
    JavaUtilConcurrentConcurrentHashMap_TreeBin_initWithJavaUtilConcurrentConcurrentHashMap_TreeNode_((uint64_t)v38, v37);
    id v15 = (IOSObjectArray *)v45;
    JavaUtilConcurrentConcurrentHashMap_setTabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withJavaUtilConcurrentConcurrentHashMap_Node_(v45, v21, (uint64_t)v38);
    unint64_t v17 = v42;
  }
  while (v10);
LABEL_47:
  v40 = v43;
  JreVolatileStrongAssign((atomic_ullong *)&v43->table_, v15);
  atomic_store(v41 - (v41 >> 2), (unsigned int *)&v43->sizeCtl_);
  atomic_store(v17, (unint64_t *)&v40->baseCount_);
}

- (id)putIfAbsentWithId:(id)a3 withId:(id)a4
{
  return (id)sub_1001BA500((uint64_t)self, a3, a4, 1);
}

- (BOOL)removeWithId:(id)a3 withId:(id)a4
{
  if (!a3)
  {
    id v5 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v5);
  }
  return a4 && sub_1001BAB8C((uint64_t)self, a3, 0, a4) != 0;
}

- (BOOL)replaceWithId:(id)a3 withId:(id)a4 withId:(id)a5
{
  if (!a3 || !a4 || !a5)
  {
    id v6 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v6);
  }
  return sub_1001BAB8C((uint64_t)self, a3, a5, a4) != 0;
}

- (id)replaceWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4)
  {
    id v6 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v6);
  }
  return (id)sub_1001BAB8C((uint64_t)self, a3, a4, 0);
}

- (id)keys
{
  id v3 = (_DWORD *)atomic_load((unint64_t *)&self->table_);
  if (v3) {
    int v4 = v3[2];
  }
  else {
    int v4 = 0;
  }
  id v5 = [JavaUtilConcurrentConcurrentHashMap_KeyIterator alloc];
  JavaUtilConcurrentConcurrentHashMap_BaseIterator_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_withJavaUtilConcurrentConcurrentHashMap_((uint64_t)v5, v3, v4, 0, v4, self);
  return v5;
}

- (id)elements
{
  id v3 = (_DWORD *)atomic_load((unint64_t *)&self->table_);
  if (v3) {
    int v4 = v3[2];
  }
  else {
    int v4 = 0;
  }
  id v5 = [JavaUtilConcurrentConcurrentHashMap_ValueIterator alloc];
  JavaUtilConcurrentConcurrentHashMap_BaseIterator_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_withJavaUtilConcurrentConcurrentHashMap_((uint64_t)v5, v3, v4, 0, v4, self);
  return v5;
}

- (int64_t)mappingCount
{
  int64_t v2 = -[JavaUtilConcurrentConcurrentHashMap sumCount]_0((uint64_t)self);
  return v2 & ~(v2 >> 63);
}

+ (id)newKeySetWithInt:(int)a3
{
  return JavaUtilConcurrentConcurrentHashMap_newKeySetWithInt_(*(uint64_t *)&a3);
}

- (id)keySetWithId:(id)a3
{
  if (!a3)
  {
    id v5 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v5);
  }
  id v3 = new_JavaUtilConcurrentConcurrentHashMap_KeySetView_initWithJavaUtilConcurrentConcurrentHashMap_withId_(self, a3);
  return v3;
}

+ (int)resizeStampWithInt:(int)a3
{
  return JavaUtilConcurrentConcurrentHashMap_resizeStampWithInt_(a3);
}

- (void)addCountWithLong:(int64_t)a3 withInt:(int)a4
{
}

- (id)helpTransferWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a4
{
  return (id)sub_1001BB070((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (void)tryPresizeWithInt:(int)a3
{
}

- (void)transferWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a4
{
}

- (void)treeifyBinWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4
{
}

+ (id)untreeifyWithJavaUtilConcurrentConcurrentHashMap_Node:(id)a3
{
  return JavaUtilConcurrentConcurrentHashMap_untreeifyWithJavaUtilConcurrentConcurrentHashMap_Node_((uint64_t)a3);
}

- (void)fullAddCountWithLong:(int64_t)a3 withJavaUtilConcurrentConcurrentHashMap_CounterHashCode:(id)a4 withBoolean:(BOOL)a5
{
}

+ (void)ensureLoadedWithIOSClass:(id)a3
{
  if ((atomic_load_explicit(JavaUtilConcurrentConcurrentHashMap__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
}

- (void)dealloc
{
  JreReleaseVolatile(&self->table_);
  JreReleaseVolatile(&self->nextTable_);
  JreReleaseVolatile(&self->counterCells_);

  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap;
  [(JavaUtilConcurrentConcurrentHashMap *)&v3 __javaClone];
  JreRetainVolatile(&self->table_);
  JreRetainVolatile(&self->nextTable_);
  JreRetainVolatile(&self->counterCells_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dword_100560B30 = ~(-1 << (32 - dword_10055C218));
    dword_100560B34 = 32 - dword_10055C218;
    Runtime = (void *)JavaLangRuntime_getRuntime();
    if (!Runtime) {
      JreThrowNullPointerException();
    }
    JavaUtilConcurrentConcurrentHashMap_NCPU_ = [Runtime availableProcessors];
    if (qword_100560BA8 != -1) {
      dispatch_once(&qword_100560BA8, &stru_10041ED28);
    }
    objc_super v3 = (JavaLangRefWeakReference *)IOSClass_arrayType(qword_100560BA0, 1u);
    int v13 = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"segments", v3);
    if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v14 = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"segmentMask", (JavaLangRefWeakReference *)JavaLangInteger_TYPE_);
    if ((atomic_load_explicit(JavaLangInteger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v15 = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"segmentShift", (JavaLangRefWeakReference *)JavaLangInteger_TYPE_);
    id v4 = +[IOSObjectArray newArrayWithObjects:&v13 count:3 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560B38, v4);
    id v5 = new_JavaUtilConcurrentAtomicAtomicInteger_init();
    JreStrongAssignAndConsume((id *)&JavaUtilConcurrentConcurrentHashMap_counterHashCodeGenerator_, v5);
    id v6 = new_JavaLangThreadLocal_init();
    JreStrongAssignAndConsume((id *)&JavaUtilConcurrentConcurrentHashMap_threadCounterHashCode_, v6);
    Unsafe = (void *)SunMiscUnsafe_getUnsafe();
    JreStrongAssign((id *)&qword_100560B40, Unsafe);
    unint64_t v8 = (void *)JavaUtilConcurrentConcurrentHashMap_class_();
    if (!qword_100560B40) {
      JreThrowNullPointerException();
    }
    uint64_t v9 = v8;
    qword_100560B48 = (uint64_t)objc_msgSend((id)qword_100560B40, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend(v8, "getDeclaredField:", @"sizeCtl", v13, v14, v15));
    qword_100560B50 = (uint64_t)objc_msgSend((id)qword_100560B40, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend(v9, "getDeclaredField:", @"transferIndex"));
    qword_100560B58 = (uint64_t)objc_msgSend((id)qword_100560B40, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend(v9, "getDeclaredField:", @"baseCount"));
    qword_100560B60 = (uint64_t)objc_msgSend((id)qword_100560B40, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend(v9, "getDeclaredField:", @"cellsBusy"));
    if (qword_100560BD8 != -1) {
      dispatch_once(&qword_100560BD8, &stru_100420F98);
    }
    qword_100560B68 = (uint64_t)objc_msgSend((id)qword_100560B40, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend((id)qword_100560BD0, "getDeclaredField:", @"value"));
    if (qword_100560B98 != -1) {
      dispatch_once(&qword_100560B98, &stru_10041EBF8);
    }
    uint64_t v10 = IOSClass_arrayType(qword_100560B90, 1u);
    qword_100560B70 = (int)[(id)qword_100560B40 arrayBaseOffsetWithIOSClass:v10];
    int v11 = [(id)qword_100560B40 arrayIndexScaleWithIOSClass:v10];
    if ((v11 & (v11 - 1)) != 0)
    {
      id v12 = new_JavaLangError_initWithNSString_(@"data type scale not a power of two");
      objc_exception_throw(v12);
    }
    dword_100560B78 = 31 - JavaLangInteger_numberOfLeadingZerosWithInt_(v11);
    JavaUtilConcurrentLocksLockSupport_class_();
    if ((atomic_load_explicit(JavaUtilConcurrentConcurrentHashMap__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    atomic_store(1u, (unsigned __int8 *)JavaUtilConcurrentConcurrentHashMap__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041E898;
}

@end