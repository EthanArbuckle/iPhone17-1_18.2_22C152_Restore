@interface OrgApacheLuceneUtilBytesRefBuilder
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilBytesRefBuilder)init;
- (char)byteAtWithInt:(int)a3;
- (id)bytes;
- (id)get;
- (id)toBytesRef;
- (int)length;
- (unint64_t)hash;
- (void)appendWithByte:(char)a3;
- (void)appendWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)appendWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)appendWithOrgApacheLuceneUtilBytesRefBuilder:(id)a3;
- (void)clear;
- (void)copyBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)copyBytesWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)copyBytesWithOrgApacheLuceneUtilBytesRefBuilder:(id)a3;
- (void)copyCharsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)copyCharsWithJavaLangCharSequence:(id)a3;
- (void)copyCharsWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
- (void)growWithInt:(int)a3;
- (void)setByteAtWithInt:(int)a3 withByte:(char)a4;
- (void)setLengthWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilBytesRefBuilder

- (OrgApacheLuceneUtilBytesRefBuilder)init
{
  p_ref = &self->ref_;
  v4 = new_OrgApacheLuceneUtilBytesRef_init();
  JreStrongAssignAndConsume((id *)p_ref, v4);
  return self;
}

- (id)bytes
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  return ref->bytes_;
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

- (char)byteAtWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref || (bytes = ref->bytes_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = bytes->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *((unsigned char *)&bytes->super.size_ + a3 + 4);
}

- (void)setByteAtWithInt:(int)a3 withByte:(char)a4
{
  ref = self->ref_;
  if (!ref || (bytes = ref->bytes_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = bytes->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *((unsigned char *)&bytes->super.size_ + a3 + 4) = a4;
}

- (void)growWithInt:(int)a3
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  p_bytes = (id *)&ref->bytes_;
  v10 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_((unsigned int *)ref->bytes_, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  JreStrongAssign(p_bytes, v10);
}

- (void)appendWithByte:(char)a3
{
  ref = self->ref_;
  if (!ref
    || ([(OrgApacheLuceneUtilBytesRefBuilder *)self growWithInt:(ref->length_ + 1)],
        uint64_t v6 = self->ref_,
        (bytes = v6->bytes_) == 0))
  {
    JreThrowNullPointerException();
  }
  int length = v6->length_;
  v6->length_ = length + 1;
  uint64_t size = bytes->super.size_;
  if (length < 0 || length >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, length);
  }
  *((unsigned char *)&bytes->super.size_ + length + 4) = a3;
}

- (void)appendWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  [(OrgApacheLuceneUtilBytesRefBuilder *)self growWithInt:(ref->length_ + a5)];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v7, self->ref_->bytes_, self->ref_->length_, v6);
  self->ref_->length_ += v6;
}

- (void)appendWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 4);
  uint64_t v4 = *((unsigned int *)a3 + 5);
  uint64_t v5 = *((void *)a3 + 1);
  [(OrgApacheLuceneUtilBytesRefBuilder *)self appendWithByteArray:v5 withInt:v3 withInt:v4];
}

- (void)appendWithOrgApacheLuceneUtilBytesRefBuilder:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 get];
  [(OrgApacheLuceneUtilBytesRefBuilder *)self appendWithOrgApacheLuceneUtilBytesRef:v4];
}

- (void)clear
{
}

- (void)copyBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  [(OrgApacheLuceneUtilBytesRefBuilder *)self clear];
  [(OrgApacheLuceneUtilBytesRefBuilder *)self appendWithByteArray:a3 withInt:v6 withInt:v5];
}

- (void)copyBytesWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  [(OrgApacheLuceneUtilBytesRefBuilder *)self clear];
  [(OrgApacheLuceneUtilBytesRefBuilder *)self appendWithOrgApacheLuceneUtilBytesRef:a3];
}

- (void)copyBytesWithOrgApacheLuceneUtilBytesRefBuilder:(id)a3
{
  [(OrgApacheLuceneUtilBytesRefBuilder *)self clear];
  [(OrgApacheLuceneUtilBytesRefBuilder *)self appendWithOrgApacheLuceneUtilBytesRefBuilder:a3];
}

- (void)copyCharsWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 length];
  [(OrgApacheLuceneUtilBytesRefBuilder *)self copyCharsWithJavaLangCharSequence:a3 withInt:0 withInt:v5];
}

- (void)copyCharsWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  [(OrgApacheLuceneUtilBytesRefBuilder *)self growWithInt:(3 * a5)];
  int v9 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_(a3, v6, a5, (uint64_t)self->ref_->bytes_);
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  ref->length_ = v9;
}

- (void)copyCharsWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  [(OrgApacheLuceneUtilBytesRefBuilder *)self growWithInt:(3 * a5)];
  int v9 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithCharArray_withInt_withInt_withByteArray_((uint64_t)a3, a4, a5, (uint64_t)self->ref_->bytes_);
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  ref->length_ = v9;
}

- (id)get
{
  return self->ref_;
}

- (id)toBytesRef
{
  ref = self->ref_;
  if (!ref) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = JavaUtilArrays_copyOfWithByteArray_withInt_(ref->bytes_, ref->length_);
  id v4 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (unint64_t)hash
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBytesRefBuilder;
  [(OrgApacheLuceneUtilBytesRefBuilder *)&v3 dealloc];
}

@end