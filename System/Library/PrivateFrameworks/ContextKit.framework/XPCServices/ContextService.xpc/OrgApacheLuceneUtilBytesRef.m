@interface OrgApacheLuceneUtilBytesRef
+ (id)deepCopyOfWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (id)getUTF8SortedAsUTF16Comparator;
+ (id)getUTF8SortedAsUnicodeComparator;
+ (void)initialize;
- (BOOL)bytesEqualsWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)description;
- (OrgApacheLuceneUtilBytesRef)init;
- (OrgApacheLuceneUtilBytesRef)initWithByteArray:(id)a3;
- (OrgApacheLuceneUtilBytesRef)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (OrgApacheLuceneUtilBytesRef)initWithInt:(int)a3;
- (OrgApacheLuceneUtilBytesRef)initWithJavaLangCharSequence:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)utf8ToString;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilBytesRef

- (OrgApacheLuceneUtilBytesRef)init
{
  if (!OrgApacheLuceneUtilBytesRef_EMPTY_BYTES_) {
    JreThrowNullPointerException();
  }
  int v3 = *(_DWORD *)(OrgApacheLuceneUtilBytesRef_EMPTY_BYTES_ + 8);
  JreStrongAssign((id *)&self->bytes_, (void *)OrgApacheLuceneUtilBytesRef_EMPTY_BYTES_);
  self->offset_ = 0;
  self->length_ = v3;
  return self;
}

- (OrgApacheLuceneUtilBytesRef)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->offset_ = a4;
  self->length_ = a5;
  return self;
}

- (OrgApacheLuceneUtilBytesRef)initWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  JreStrongAssign((id *)&self->bytes_, a3);
  self->offset_ = 0;
  self->length_ = v4;
  return self;
}

- (OrgApacheLuceneUtilBytesRef)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilBytesRef)initWithJavaLangCharSequence:(id)a3
{
  return self;
}

- (BOOL)bytesEqualsWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    goto LABEL_21;
  }
  int length = self->length_;
  if (length != *((_DWORD *)a3 + 5)) {
    return 0;
  }
  uint64_t offset = self->offset_;
  int v6 = offset + length;
  if ((int)offset < v6)
  {
    uint64_t v7 = *((void *)a3 + 1);
    uint64_t v8 = *((unsigned int *)a3 + 4);
    uint64_t v9 = v6;
    while (1)
    {
      bytes = self->bytes_;
      if (!bytes) {
        break;
      }
      uint64_t size = bytes->super.size_;
      if (offset < 0 || offset >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, offset);
      }
      if (!v7) {
        break;
      }
      int v12 = *((unsigned __int8 *)&bytes->super.size_ + offset + 4);
      uint64_t v13 = *(unsigned int *)(v7 + 8);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v8);
      }
      int v14 = *(unsigned __int8 *)(v7 + 12 + (int)v8);
      BOOL result = v12 == v14;
      ++offset;
      uint64_t v8 = (v8 + 1);
      if (v12 != v14 || v9 == offset) {
        return result;
      }
    }
LABEL_21:
    JreThrowNullPointerException();
  }
  return 1;
}

- (id)clone
{
  bytes = self->bytes_;
  uint64_t v3 = *(void *)&self->offset_;
  int v4 = [OrgApacheLuceneUtilBytesRef alloc];
  JreStrongAssign((id *)&v4->bytes_, bytes);
  *(void *)&v4->offset_ = v3;
  return v4;
}

- (unint64_t)hash
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilStringHelper__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)OrgApacheLuceneUtilStringHelper_murmurhash3_x86_32WithOrgApacheLuceneUtilBytesRef_withInt_((uint64_t)self, OrgApacheLuceneUtilStringHelper_GOOD_FAST_HASH_SEED_);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(OrgApacheLuceneUtilBytesRef *)self bytesEqualsWithOrgApacheLuceneUtilBytesRef:a3];
}

- (id)utf8ToString
{
  uint64_t v3 = +[IOSCharArray arrayWithLength:self->length_];
  uint64_t v4 = OrgApacheLuceneUtilUnicodeUtil_UTF8toUTF16WithByteArray_withInt_withInt_withCharArray_((uint64_t)self->bytes_, self->offset_, self->length_, (uint64_t)v3);
  return +[NSString stringWithCharacters:v3 offset:0 length:v4];
}

- (NSString)description
{
  uint64_t v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithChar:91];
  uint64_t offset = self->offset_;
  int v5 = self->length_ + offset;
  if ((int)offset < v5)
  {
    uint64_t v6 = v5;
    do
    {
      if (offset > self->offset_) {
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
      }
      bytes = self->bytes_;
      if (!bytes) {
        JreThrowNullPointerException();
      }
      uint64_t size = bytes->super.size_;
      if (offset < 0 || offset >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, offset);
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toHexStringWithInt_(*((unsigned __int8 *)&bytes->super.size_ + offset++ + 4))];
    }
    while (v6 != offset);
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:93];
  return [(JavaLangStringBuilder *)v3 description];
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = (void *)qword_100560158;
  if (!qword_100560158) {
    JreThrowNullPointerException();
  }
  return [v5 compareWithId:self withId:a3];
}

+ (id)getUTF8SortedAsUnicodeComparator
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBytesRef__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560158;
}

+ (id)getUTF8SortedAsUTF16Comparator
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBytesRef__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560160;
}

+ (id)deepCopyOfWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilBytesRef_deepCopyOfWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
}

- (BOOL)isValid
{
  bytes = self->bytes_;
  if (!bytes)
  {
    CFStringRef v13 = @"bytes is null";
    goto LABEL_19;
  }
  int length = self->length_;
  if (length < 0)
  {
    v17 = @"length is negative: ";
LABEL_13:
    v15 = "$I";
LABEL_18:
    CFStringRef v13 = JreStrcat((unsigned __int8 *)v15, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v17);
LABEL_19:
    v16 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v16);
  }
  int size = bytes->super.size_;
  if (length > size)
  {
    int v14 = @"length is out of bounds: ";
LABEL_16:
    CFStringRef v13 = JreStrcat("$I$I", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v14);
    goto LABEL_19;
  }
  int offset = self->offset_;
  if (offset < 0)
  {
    v17 = @"offset is negative: ";
    goto LABEL_13;
  }
  if (offset > size)
  {
    int v14 = @"offset out of bounds: ";
    goto LABEL_16;
  }
  if (offset + length < 0)
  {
    int v14 = @"offset+length is negative: offset=";
    goto LABEL_16;
  }
  if (offset + length > size)
  {
    v17 = @"offset+length out of bounds: offset=";
    v15 = "$I$I$I";
    goto LABEL_18;
  }
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBytesRef;
  [(OrgApacheLuceneUtilBytesRef *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneUtilBytesRef *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilBytesRef_EMPTY_BYTES_, +[IOSByteArray newArrayWithLength:0]);
    JreStrongAssignAndConsume((id *)&qword_100560158, [OrgApacheLuceneUtilBytesRef_UTF8SortedAsUnicodeComparator alloc]);
    JreStrongAssignAndConsume((id *)&qword_100560160, [OrgApacheLuceneUtilBytesRef_UTF8SortedAsUTF16Comparator alloc]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilBytesRef__initialized);
  }
}

@end