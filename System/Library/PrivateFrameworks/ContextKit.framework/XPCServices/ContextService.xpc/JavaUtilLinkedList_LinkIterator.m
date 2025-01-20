@interface JavaUtilLinkedList_LinkIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (BOOL)hasPrevious;
- (JavaUtilLinkedList_LinkIterator)initWithJavaUtilLinkedList:(id)a3 withInt:(int)a4;
- (id)next;
- (id)previous;
- (int)nextIndex;
- (int)previousIndex;
- (void)__javaClone;
- (void)addWithId:(id)a3;
- (void)dealloc;
- (void)remove;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilLinkedList_LinkIterator

- (JavaUtilLinkedList_LinkIterator)initWithJavaUtilLinkedList:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)addWithId:(id)a3
{
  list = self->list_;
  if (!list) {
    goto LABEL_6;
  }
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    v11 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v11);
  }
  id Weak = objc_loadWeak((id *)&self->link_);
  if (!Weak
    || (v7 = (id *)*((void *)Weak + 3),
        id v8 = objc_loadWeak((id *)&self->link_),
        v9 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(a3, v8, v7), v10 = (id *)objc_loadWeak((id *)&self->link_), JreStrongAssign(v10 + 3, v9), !v7))
  {
LABEL_6:
    JreThrowNullPointerException();
  }
  objc_storeWeak(v7 + 2, v9);
  objc_storeWeak((id *)&self->link_, v9);
  self->lastLink_ = 0;
  *(int32x2_t *)&self->pos_ = vadd_s32(*(int32x2_t *)&self->pos_, (int32x2_t)0x100000001);
  ++*(&self->list_->super.super.modCount_ + 1);
  ++self->list_->super.super.modCount_;
}

- (BOOL)hasNext
{
  id Weak = objc_loadWeak((id *)&self->link_);
  if (!Weak || (list = self->list_) == 0) {
    JreThrowNullPointerException();
  }
  return Weak[3] != *(void *)&list->size_;
}

- (BOOL)hasPrevious
{
  id Weak = objc_loadWeak((id *)&self->link_);
  list = self->list_;
  if (!list) {
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
    id v8 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_10;
  }
  id Weak = objc_loadWeak((id *)&self->link_);
  if (!Weak) {
    goto LABEL_7;
  }
  v5 = (void *)Weak[3];
  if (v5 == *(void **)&self->list_->size_)
  {
    id v8 = new_JavaUtilNoSuchElementException_init();
LABEL_10:
    objc_exception_throw(v8);
  }
  self->lastLink_ = (JavaUtilLinkedList_Link *)objc_storeWeak((id *)&self->link_, v5);
  ++self->pos_;
  id v6 = objc_loadWeak((id *)&self->link_);
  if (!v6) {
    goto LABEL_7;
  }
  return (id)*((void *)v6 + 1);
}

- (int)nextIndex
{
  return self->pos_ + 1;
}

- (id)previous
{
  list = self->list_;
  if (!list) {
LABEL_7:
  }
    JreThrowNullPointerException();
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    id v8 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_10;
  }
  if (objc_loadWeak((id *)&self->link_) == *(id *)&self->list_->size_)
  {
    id v8 = new_JavaUtilNoSuchElementException_init();
LABEL_10:
    objc_exception_throw(v8);
  }
  self->lastLink_ = (JavaUtilLinkedList_Link *)objc_loadWeak((id *)&self->link_);
  id Weak = (id *)objc_loadWeak((id *)&self->link_);
  if (!Weak) {
    goto LABEL_7;
  }
  id v5 = objc_loadWeak(Weak + 2);
  objc_storeWeak((id *)&self->link_, v5);
  --self->pos_;
  lastLink = self->lastLink_;
  if (!lastLink) {
    goto LABEL_7;
  }
  return lastLink->data_;
}

- (int)previousIndex
{
  return self->pos_;
}

- (void)remove
{
  list = self->list_;
  if (!list) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    v9 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_12;
  }
  lastLink = self->lastLink_;
  if (!lastLink)
  {
    v9 = new_JavaLangIllegalStateException_init();
LABEL_12:
    objc_exception_throw(v9);
  }
  p_isa = (id *)&lastLink->next_->super.isa;
  id Weak = (id *)objc_loadWeak((id *)&lastLink->previous_);
  if (!p_isa) {
    goto LABEL_9;
  }
  v7 = Weak;
  objc_storeWeak(p_isa + 2, Weak);
  if (!v7) {
    goto LABEL_9;
  }
  JreStrongAssign(v7 + 3, p_isa);
  id v8 = self->lastLink_;
  if (v8 == objc_loadWeak((id *)&self->link_)) {
    --self->pos_;
  }
  objc_storeWeak((id *)&self->link_, v7);
  self->lastLink_ = 0;
  ++self->expectedModCount_;
  --*(&self->list_->super.super.modCount_ + 1);
  ++self->list_->super.super.modCount_;
}

- (void)setWithId:(id)a3
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  if (self->expectedModCount_ != list->super.super.modCount_)
  {
    id v5 = new_JavaUtilConcurrentModificationException_init();
    goto LABEL_10;
  }
  lastLink = self->lastLink_;
  if (!lastLink)
  {
    id v5 = new_JavaLangIllegalStateException_init();
LABEL_10:
    objc_exception_throw(v5);
  }
  JreStrongAssign(&lastLink->data_, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedList_LinkIterator;
  [(JavaUtilLinkedList_LinkIterator *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedList_LinkIterator;
  [(JavaUtilLinkedList_LinkIterator *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004194B8;
}

- (void).cxx_destruct
{
}

@end