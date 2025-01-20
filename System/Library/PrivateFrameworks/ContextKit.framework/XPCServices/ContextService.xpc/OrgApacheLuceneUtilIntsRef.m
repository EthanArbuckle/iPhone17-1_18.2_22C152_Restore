@interface OrgApacheLuceneUtilIntsRef
+ (id)deepCopyOfWithOrgApacheLuceneUtilIntsRef:(id)a3;
+ (void)initialize;
- (BOOL)intsEqualsWithOrgApacheLuceneUtilIntsRef:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)description;
- (OrgApacheLuceneUtilIntsRef)init;
- (OrgApacheLuceneUtilIntsRef)initWithInt:(int)a3;
- (OrgApacheLuceneUtilIntsRef)initWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilIntsRef

- (OrgApacheLuceneUtilIntsRef)init
{
  return self;
}

- (OrgApacheLuceneUtilIntsRef)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilIntsRef)initWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->offset_ = a4;
  self->length_ = a5;
  return self;
}

- (id)clone
{
  ints = self->ints_;
  uint64_t v3 = *(void *)&self->offset_;
  v4 = [OrgApacheLuceneUtilIntsRef alloc];
  JreStrongAssign((id *)&v4->ints_, ints);
  *(void *)&v4->offset_ = v3;
  return v4;
}

- (unint64_t)hash
{
  uint64_t offset = self->offset_;
  int v3 = self->length_ + offset;
  if ((int)offset >= v3) {
    return 0;
  }
  int v5 = 0;
  do
  {
    ints = self->ints_;
    if (!ints) {
      JreThrowNullPointerException();
    }
    uint64_t size = ints->super.size_;
    if (offset < 0 || offset >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, offset);
    }
    int v5 = *(&ints->super.size_ + ++offset) + 31 * v5;
  }
  while (v3 != offset);
  return v5;
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
  return [(OrgApacheLuceneUtilIntsRef *)self intsEqualsWithOrgApacheLuceneUtilIntsRef:a3];
}

- (BOOL)intsEqualsWithOrgApacheLuceneUtilIntsRef:(id)a3
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
      ints = self->ints_;
      if (!ints) {
        break;
      }
      uint64_t size = ints->super.size_;
      if (offset < 0 || offset >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, offset);
      }
      if (!v7) {
        break;
      }
      int v12 = *(&ints->super.size_ + offset + 1);
      uint64_t v13 = *(unsigned int *)(v7 + 8);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v8);
      }
      int v14 = *(_DWORD *)(v7 + 12 + 4 * (int)v8);
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

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    if (self) {
LABEL_28:
    }
      JreThrowNullPointerException();
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self == a3) {
    return 0;
  }
  ints = self->ints_;
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t offset = self->offset_;
  v21 = self;
  uint64_t v9 = *((unsigned int *)a3 + 4);
  int v10 = JavaLangMath_minWithInt_withInt_(self->length_, *((_DWORD *)a3 + 5));
  int v11 = v10 + offset;
  if ((int)offset > v10 + (int)offset) {
    int v11 = offset;
  }
  uint64_t v12 = v11;
  while (v12 != offset)
  {
    if (!ints) {
      goto LABEL_28;
    }
    uint64_t size = ints->super.size_;
    if (offset < 0 || offset >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, offset);
    }
    if (!v7) {
      goto LABEL_28;
    }
    int v14 = *(&ints->super.size_ + offset + 1);
    uint64_t v15 = *(unsigned int *)(v7 + 8);
    if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v9);
    }
    int v16 = *(_DWORD *)(v7 + 12 + 4 * (int)v9);
    ++offset;
    uint64_t v9 = (v9 + 1);
    BOOL v17 = v14 == v16;
    BOOL v18 = v14 <= v16;
    if (v14 < v16) {
      int v19 = -1;
    }
    else {
      int v19 = v3;
    }
    if (v18) {
      int v3 = v19;
    }
    else {
      int v3 = 1;
    }
    if (!v17) {
      return v3;
    }
  }
  return v21->length_ - *((_DWORD *)a3 + 5);
}

- (NSString)description
{
  int v3 = new_JavaLangStringBuilder_init();
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
      ints = self->ints_;
      if (!ints) {
        JreThrowNullPointerException();
      }
      uint64_t size = ints->super.size_;
      if (offset < 0 || offset >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, offset);
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toHexStringWithInt_(*(&ints->super.size_ + ++offset))];
    }
    while (v6 != offset);
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:93];
  return [(JavaLangStringBuilder *)v3 description];
}

+ (id)deepCopyOfWithOrgApacheLuceneUtilIntsRef:(id)a3
{
  return OrgApacheLuceneUtilIntsRef_deepCopyOfWithOrgApacheLuceneUtilIntsRef_((uint64_t)a3);
}

- (BOOL)isValid
{
  ints = self->ints_;
  if (!ints)
  {
    CFStringRef v13 = @"ints is null";
    goto LABEL_19;
  }
  int length = self->length_;
  if (length < 0)
  {
    BOOL v17 = @"length is negative: ";
LABEL_13:
    uint64_t v15 = "$I";
LABEL_18:
    CFStringRef v13 = JreStrcat((unsigned __int8 *)v15, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v17);
LABEL_19:
    int v16 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v16);
  }
  int size = ints->super.size_;
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
    BOOL v17 = @"offset is negative: ";
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
    BOOL v17 = @"offset+length out of bounds: offset=";
    uint64_t v15 = "$I$I$I";
    goto LABEL_18;
  }
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilIntsRef;
  [(OrgApacheLuceneUtilIntsRef *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneUtilIntsRef *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilIntsRef_EMPTY_INTS_, +[IOSIntArray newArrayWithLength:0]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilIntsRef__initialized);
  }
}

@end