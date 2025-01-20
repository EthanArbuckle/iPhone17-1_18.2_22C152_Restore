@interface OrgApacheLuceneUtilIntsRefBuilder
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilIntsRefBuilder)init;
- (id)get;
- (id)ints;
- (id)toIntsRef;
- (int)intAtWithInt:(int)a3;
- (int)length;
- (unint64_t)hash;
- (void)appendWithInt:(int)a3;
- (void)clear;
- (void)copyIntsWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)copyIntsWithOrgApacheLuceneUtilIntsRef:(id)a3;
- (void)copyUTF8BytesWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
- (void)growWithInt:(int)a3;
- (void)setIntAtWithInt:(int)a3 withInt:(int)a4;
- (void)setLengthWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilIntsRefBuilder

- (OrgApacheLuceneUtilIntsRefBuilder)init
{
  p_ref = &self->ref_;
  v4 = new_OrgApacheLuceneUtilIntsRef_init();
  JreStrongAssignAndConsume((id *)p_ref, v4);
  return self;
}

- (id)ints
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  return ref->ints_;
}

- (int)length
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  return ref->length_;
}

- (void)setLengthWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  ref->length_ = a3;
}

- (void)clear
{
}

- (int)intAtWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref || (ints = ref->ints_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = ints->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&ints->super.size_ + a3 + 1);
}

- (void)setIntAtWithInt:(int)a3 withInt:(int)a4
{
  ref = self->ref_;
  if (!ref || (ints = ref->ints_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = ints->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *(&ints->super.size_ + a3 + 1) = a4;
}

- (void)appendWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref
    || ([(OrgApacheLuceneUtilIntsRefBuilder *)self growWithInt:(ref->length_ + 1)],
        v6 = self->ref_,
        (ints = v6->ints_) == 0))
  {
    JreThrowNullPointerException();
  }
  int length = v6->length_;
  v6->length_ = length + 1;
  uint64_t size = ints->super.size_;
  if (length < 0 || length >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, length);
  }
  *(&ints->super.size_ + length + 1) = a3;
}

- (void)growWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  p_ints = (id *)&ref->ints_;
  v10 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)ref->ints_, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  JreStrongAssign(p_ints, v10);
}

- (void)copyIntsWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  [(OrgApacheLuceneUtilIntsRefBuilder *)self growWithInt:*(void *)&a5];
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, ref->ints_, 0, v5);
  self->ref_->length_ = v5;
}

- (void)copyIntsWithOrgApacheLuceneUtilIntsRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 4);
  uint64_t v4 = *((unsigned int *)a3 + 5);
  uint64_t v5 = *((void *)a3 + 1);
  [(OrgApacheLuceneUtilIntsRefBuilder *)self copyIntsWithIntArray:v5 withInt:v3 withInt:v4];
}

- (void)copyUTF8BytesWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3
    || ([(OrgApacheLuceneUtilIntsRefBuilder *)self growWithInt:*((unsigned int *)a3 + 5)],
        int v5 = OrgApacheLuceneUtilUnicodeUtil_UTF8toUTF32WithOrgApacheLuceneUtilBytesRef_withIntArray_((uint64_t)a3, (uint64_t)self->ref_->ints_), (ref = self->ref_) == 0))
  {
    JreThrowNullPointerException();
  }
  ref->length_ = v5;
}

- (id)get
{
  return self->ref_;
}

- (id)toIntsRef
{
  id v2 = [(OrgApacheLuceneUtilIntsRefBuilder *)self get];
  return OrgApacheLuceneUtilIntsRef_deepCopyOfWithOrgApacheLuceneUtilIntsRef_((uint64_t)v2);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (unint64_t)hash
{
  id v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilIntsRefBuilder;
  [(OrgApacheLuceneUtilIntsRefBuilder *)&v3 dealloc];
}

@end