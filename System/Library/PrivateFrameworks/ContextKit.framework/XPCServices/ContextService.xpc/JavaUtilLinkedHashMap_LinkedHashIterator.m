@interface JavaUtilLinkedHashMap_LinkedHashIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilLinkedHashMap_LinkedHashIterator)initWithJavaUtilLinkedHashMap:(id)a3;
- (void)__javaClone;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilLinkedHashMap_LinkedHashIterator

- (BOOL)hasNext
{
  next = self->next_;
  return next != *((JavaUtilLinkedHashMap_LinkedEntry **)objc_loadWeak((id *)&self->this$0_) + 10);
}

- (void)remove
{
  v3 = &self->this$0_;
  if (*((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 11) != self->expectedModCount_)
  {
    v6 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_8;
  }
  p_lastReturned = &self->lastReturned_;
  if (!self->lastReturned_)
  {
    v6 = new_JavaLangIllegalStateException_init();
LABEL_8:
    objc_exception_throw(v6);
  }
  id Weak = objc_loadWeak((id *)v3);
  if (!*p_lastReturned) {
    JreThrowNullPointerException();
  }
  [Weak removeWithId:(*p_lastReturned)->super.key_];
  JreStrongAssign((id *)&self->lastReturned_, 0);
  self->expectedModCount_ = *((_DWORD *)objc_loadWeak((id *)v3) + 11);
}

- (JavaUtilLinkedHashMap_LinkedHashIterator)initWithJavaUtilLinkedHashMap:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedHashMap_LinkedHashIterator;
  [(JavaUtilLinkedHashMap_LinkedHashIterator *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedHashMap_LinkedHashIterator;
  [(JavaUtilLinkedHashMap_LinkedHashIterator *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100406378;
}

- (void).cxx_destruct
{
}

@end