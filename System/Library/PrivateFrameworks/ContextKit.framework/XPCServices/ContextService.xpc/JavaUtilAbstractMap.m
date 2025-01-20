@interface JavaUtilAbstractMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)clone;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)putAllWithJavaUtilMap:(id)a3;
@end

@implementation JavaUtilAbstractMap

- (void)clear
{
  id v2 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v2) {
    JreThrowNullPointerException();
  }
  [v2 clear];
}

- (BOOL)containsKeyWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v4) {
    goto LABEL_13;
  }
  id v5 = [v4 iterator];
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      do
      {
        unsigned __int8 v7 = [v6 hasNext];
        if ((v7 & 1) == 0) {
          break;
        }
        id v8 = [v6 next];
        if (!v8) {
          goto LABEL_13;
        }
      }
      while ((objc_msgSend(a3, "isEqual:", objc_msgSend(v8, "getKey")) & 1) == 0);
      return v7;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_13;
  }
  do
  {
    unsigned __int8 v7 = [v6 hasNext];
    if ((v7 & 1) == 0) {
      break;
    }
    id v9 = [v6 next];
    if (!v9) {
      goto LABEL_13;
    }
  }
  while ([v9 getKey]);
  return v7;
}

- (BOOL)containsValueWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v4) {
    goto LABEL_13;
  }
  id v5 = [v4 iterator];
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      do
      {
        unsigned __int8 v7 = [v6 hasNext];
        if ((v7 & 1) == 0) {
          break;
        }
        id v8 = [v6 next];
        if (!v8) {
          goto LABEL_13;
        }
      }
      while ((objc_msgSend(a3, "isEqual:", objc_msgSend(v8, "getValue")) & 1) == 0);
      return v7;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_13;
  }
  do
  {
    unsigned __int8 v7 = [v6 hasNext];
    if ((v7 & 1) == 0) {
      break;
    }
    id v9 = [v6 next];
    if (!v9) {
      goto LABEL_13;
    }
  }
  while ([v9 getValue]);
  return v7;
}

- (id)entrySet
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_21;
  }
  unsigned int v5 = [(id)JavaUtilMap_class_() isInstance:a3];
  if (!v5) {
    return v5;
  }
  v6 = (void *)JavaUtilMap_class_();
  if (!a3)
  {
    [(JavaUtilAbstractMap *)self size];
    JreThrowNullPointerException();
  }
  if (([v6 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  unsigned int v7 = [(JavaUtilAbstractMap *)self size];
  if (v7 != [a3 size])
  {
LABEL_26:
    LOBYTE(v5) = 0;
    return v5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(JavaUtilAbstractMap *)self entrySet];
  id v9 = v8;
  if (!v8) {
    JreThrowNullPointerException();
  }
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10)
  {
LABEL_21:
    LOBYTE(v5) = 1;
    return v5;
  }
  uint64_t v11 = *(void *)v19;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v9);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (!v13) {
        JreThrowNullPointerException();
      }
      id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) getKey];
      id v15 = [v13 getValue];
      id v16 = [a3 getWithId:v14];
      if (v15)
      {
        unsigned int v5 = [v15 isEqual:v16];
        if (!v5) {
          return v5;
        }
      }
      else if (v16 || ([a3 containsKeyWithId:v14] & 1) == 0)
      {
        goto LABEL_26;
      }
    }
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    LOBYTE(v5) = 1;
  }
  while (v10);
  return v5;
}

- (id)getWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = [v4 iterator];
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      while (([v6 hasNext] & 1) != 0)
      {
        id v7 = [v6 next];
        if (!v7) {
          goto LABEL_16;
        }
        id v8 = v7;
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v7, "getKey"))) {
          goto LABEL_12;
        }
      }
      return 0;
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_16;
  }
  while (([v6 hasNext] & 1) != 0)
  {
    id v9 = [v6 next];
    if (!v9) {
      goto LABEL_16;
    }
    id v8 = v9;
    if (![v9 getKey])
    {
LABEL_12:
      return [v8 getValue];
    }
  }
  return 0;
}

- (unint64_t)hash
{
  id v2 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v2 || (id v3 = [v2 iterator]) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  id v4 = v3;
  if (![v3 hasNext]) {
    return 0;
  }
  int v5 = 0;
  do
  {
    id v6 = [v4 next];
    if (!v6) {
      goto LABEL_9;
    }
    v5 += [v6 hash];
  }
  while (([v4 hasNext] & 1) != 0);
  return v5;
}

- (BOOL)isEmpty
{
  return [(JavaUtilAbstractMap *)self size] == 0;
}

- (id)keySet
{
  p_keySet = &self->keySet_;
  id result = self->keySet_;
  if (!result)
  {
    int v5 = [JavaUtilAbstractMap_1AbstractMapKeySet alloc];
    objc_storeWeak((id *)&v5->this$0_, self);
    JavaUtilAbstractSet_init(v5, v6);
    JreStrongAssignAndConsume((id *)p_keySet, v5);
    return self->keySet_;
  }
  return result;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  id v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (!a3 || (id v4 = objc_msgSend(a3, "entrySet", (void)v11)) == 0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  int v5 = v4;
  id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_12;
        }
        -[JavaUtilAbstractMap putWithId:withId:](self, "putWithId:withId:", [*(id *)(*((void *)&v11 + 1) + 8 * i) getKey], objc_msgSend(v10, "getValue"));
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)removeWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = [v4 iterator];
  id v6 = v5;
  if (a3)
  {
    if (v5)
    {
      while (([v6 hasNext] & 1) != 0)
      {
        id v7 = [v6 next];
        if (!v7) {
          goto LABEL_16;
        }
        uint64_t v8 = v7;
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v7, "getKey"))) {
          goto LABEL_12;
        }
      }
      return 0;
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_16;
  }
  while (([v6 hasNext] & 1) != 0)
  {
    id v9 = [v6 next];
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v8 = v9;
    if (![v9 getKey])
    {
LABEL_12:
      [v6 remove];
      return [v8 getValue];
    }
  }
  return 0;
}

- (int)size
{
  id v2 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 size];
}

- (NSString)description
{
  if ([(JavaUtilAbstractMap *)self isEmpty]) {
    return (NSString *)@"{}";
  }
  id v4 = new_JavaLangStringBuilder_initWithInt_(28 * [(JavaUtilAbstractMap *)self size]);
  [(JavaLangStringBuilder *)v4 appendWithChar:123];
  id v5 = [(JavaUtilAbstractMap *)self entrySet];
  if (!v5 || (id v6 = [v5 iterator]) == 0) {
LABEL_19:
  }
    JreThrowNullPointerException();
  id v7 = v6;
  if ([v6 hasNext])
  {
    do
    {
      id v8 = [v7 next];
      if (!v8) {
        goto LABEL_19;
      }
      id v9 = v8;
      id v10 = (JavaUtilAbstractMap *)[v8 getKey];
      if (v10 == self) {
        [(JavaLangStringBuilder *)v4 appendWithNSString:@"(this Map)"];
      }
      else {
        [(JavaLangStringBuilder *)v4 appendWithId:v10];
      }
      [(JavaLangStringBuilder *)v4 appendWithChar:61];
      long long v11 = (JavaUtilAbstractMap *)[v9 getValue];
      if (v11 == self) {
        [(JavaLangStringBuilder *)v4 appendWithNSString:@"(this Map)"];
      }
      else {
        [(JavaLangStringBuilder *)v4 appendWithId:v11];
      }
      if ([v7 hasNext]) {
        [(JavaLangStringBuilder *)v4 appendWithNSString:@", "];
      }
    }
    while (([v7 hasNext] & 1) != 0);
  }
  [(JavaLangStringBuilder *)v4 appendWithChar:125];
  return [(JavaLangStringBuilder *)v4 description];
}

- (id)values
{
  p_valuesCollection = &self->valuesCollection_;
  id result = self->valuesCollection_;
  if (!result)
  {
    id v5 = [JavaUtilAbstractMap_1AbstractMapValuesCollection alloc];
    objc_storeWeak((id *)&v5->this$0_, self);
    JavaUtilAbstractCollection_init(v5, v6);
    JreStrongAssignAndConsume((id *)p_valuesCollection, v5);
    return self->valuesCollection_;
  }
  return result;
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)JavaUtilAbstractMap;
  id v2 = [(JavaUtilAbstractMap *)&v4 clone];
  objc_opt_class();
  if (!v2) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign(v2 + 1, 0);
  JreStrongAssign(v2 + 2, 0);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilAbstractMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040C2A8;
}

@end