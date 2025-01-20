@interface JavaUtilLinkedList_ReverseLinkIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilLinkedList_ReverseLinkIterator)initWithJavaUtilLinkedList:(id)a3 withJavaUtilLinkedList:(id)a4;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilLinkedList_ReverseLinkIterator

- (JavaUtilLinkedList_ReverseLinkIterator)initWithJavaUtilLinkedList:(id)a3 withJavaUtilLinkedList:(id)a4
{
  return self;
}

- (BOOL)hasNext
{
  link = self->link_;
  if (!link || (id Weak = objc_loadWeak((id *)&link->previous_), (list = self->list_) == 0)) {
    JreThrowNullPointerException();
  }
  return Weak != *(id *)&list->size_;
}

- (id)next
{
  list = self->list_;
  if (!list) {
LABEL_7:
  }
    JreThrowNullPointerException();
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    v8 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_10;
  }
  if (![(JavaUtilLinkedList_ReverseLinkIterator *)self hasNext])
  {
    v8 = new_JavaUtilNoSuchElementException_init();
LABEL_10:
    objc_exception_throw(v8);
  }
  link = self->link_;
  if (!link) {
    goto LABEL_7;
  }
  id Weak = objc_loadWeak((id *)&link->previous_);
  JreStrongAssign((id *)&self->link_, Weak);
  self->canRemove_ = 1;
  v6 = self->link_;
  if (!v6) {
    goto LABEL_7;
  }
  return v6->data_;
}

- (void)remove
{
  list = self->list_;
  if (!list) {
LABEL_8:
  }
    JreThrowNullPointerException();
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    v9 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_11;
  }
  if (!self->canRemove_)
  {
    v9 = new_JavaLangIllegalStateException_init();
LABEL_11:
    objc_exception_throw(v9);
  }
  p_link = &self->link_;
  link = self->link_;
  if (!link) {
    goto LABEL_8;
  }
  id Weak = (id *)objc_loadWeak((id *)&link->previous_);
  if (!Weak) {
    goto LABEL_8;
  }
  v7 = Weak;
  p_isa = (id *)&(*p_link)->next_->super.isa;
  JreStrongAssign(Weak + 3, p_isa);
  if (!p_isa) {
    goto LABEL_8;
  }
  objc_storeWeak(p_isa + 2, v7);
  JreStrongAssign((id *)&self->link_, p_isa);
  --*(&self->list_->super.super.modCount_ + 1);
  ++self->list_->super.super.modCount_;
  ++self->expectedModCount_;
  self->canRemove_ = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedList_ReverseLinkIterator;
  [(JavaUtilLinkedList_ReverseLinkIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004196C8;
}

@end