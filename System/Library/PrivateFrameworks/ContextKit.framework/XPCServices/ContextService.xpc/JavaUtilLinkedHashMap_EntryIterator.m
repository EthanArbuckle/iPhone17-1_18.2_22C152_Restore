@interface JavaUtilLinkedHashMap_EntryIterator
+ (const)__metadata;
- (JavaUtilLinkedHashMap_EntryIterator)initWithJavaUtilLinkedHashMap:(id)a3;
- (id)next;
@end

@implementation JavaUtilLinkedHashMap_EntryIterator

- (id)next
{
  v2 = (id *)(a1 + 8);
  if (*((_DWORD *)objc_loadWeak((id *)(a1 + 8)) + 11) != *(_DWORD *)(a1 + 32))
  {
    v6 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_10;
  }
  v3 = *(id **)(a1 + 16);
  if (v3 == *((id **)objc_loadWeak(v2) + 10))
  {
    v6 = new_JavaUtilNoSuchElementException_init();
LABEL_10:
    objc_exception_throw(v6);
  }
  if (!v3) {
    JreThrowNullPointerException();
  }
  id Weak = objc_loadWeak(v3 + 5);
  JreStrongAssign((id *)(a1 + 16), Weak);
  return JreStrongAssign((id *)(a1 + 24), v3);
}

- (JavaUtilLinkedHashMap_EntryIterator)initWithJavaUtilLinkedHashMap:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004065E8;
}

@end