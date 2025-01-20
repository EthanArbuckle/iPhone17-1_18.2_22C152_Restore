@interface JavaUtilConcurrentConcurrentHashMap_ValuesView
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_ValueIterator)iterator;
- (JavaUtilConcurrentConcurrentHashMap_ValuesView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_ValuesView

- (JavaUtilConcurrentConcurrentHashMap_ValuesView)initWithJavaUtilConcurrentConcurrentHashMap:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->super.map_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak containsValueWithId:a3];
}

- (BOOL)removeWithId:(id)a3
{
  if (a3)
  {
    v4 = -[JavaUtilConcurrentConcurrentHashMap_ValuesView iterator]_0((uint64_t)self);
    if (!v4) {
      JreThrowNullPointerException();
    }
    v5 = v4;
    while ([(JavaUtilConcurrentConcurrentHashMap_BaseIterator *)v5 hasNext])
    {
      if (objc_msgSend(a3, "isEqual:", -[JavaUtilConcurrentConcurrentHashMap_ValueIterator next](v5, "next")))
      {
        [(JavaUtilConcurrentConcurrentHashMap_BaseIterator *)v5 remove];
        return 1;
      }
    }
  }
  return 0;
}

- (JavaUtilConcurrentConcurrentHashMap_ValueIterator)iterator
{
  id Weak = (unint64_t *)objc_loadWeak((id *)(a1 + 8));
  if (!Weak) {
    JreThrowNullPointerException();
  }
  v2 = Weak;
  v3 = (_DWORD *)atomic_load(Weak + 3);
  if (v3) {
    int v4 = v3[2];
  }
  else {
    int v4 = 0;
  }
  v5 = [JavaUtilConcurrentConcurrentHashMap_ValueIterator alloc];
  JavaUtilConcurrentConcurrentHashMap_BaseIterator_initWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_withInt_withInt_withJavaUtilConcurrentConcurrentHashMap_((uint64_t)v5, v3, v4, 0, v4, v2);
  return v5;
}

- (BOOL)addWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100420918;
}

@end