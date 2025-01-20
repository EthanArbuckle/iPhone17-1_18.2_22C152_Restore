@interface OrgApacheLuceneUtilCharsRef
+ (id)deepCopyOfWithOrgApacheLuceneUtilCharsRef:(id)a3;
+ (id)getUTF16SortedAsUTF8Comparator;
+ (void)initialize;
- (BOOL)charsEqualsWithOrgApacheLuceneUtilCharsRef:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)description;
- (OrgApacheLuceneUtilCharsRef)init;
- (OrgApacheLuceneUtilCharsRef)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (OrgApacheLuceneUtilCharsRef)initWithInt:(int)a3;
- (OrgApacheLuceneUtilCharsRef)initWithNSString:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (int)compareToWithId:(id)a3;
- (int)length;
- (unint64_t)hash;
- (unsigned)charAtWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilCharsRef

- (OrgApacheLuceneUtilCharsRef)init
{
  *(void *)&self->offset_ = 0;
  return self;
}

- (OrgApacheLuceneUtilCharsRef)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilCharsRef)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->offset_ = a4;
  self->length_ = a5;
  return self;
}

- (OrgApacheLuceneUtilCharsRef)initWithNSString:(id)a3
{
  return self;
}

- (id)clone
{
  chars = self->chars_;
  uint64_t v3 = *(void *)&self->offset_;
  v4 = [OrgApacheLuceneUtilCharsRef alloc];
  JreStrongAssign((id *)&v4->chars_, chars);
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
    chars = self->chars_;
    if (!chars) {
      JreThrowNullPointerException();
    }
    uint64_t size = chars->super.size_;
    if (offset < 0 || offset >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, offset);
    }
    int v5 = 31 * v5 + *((unsigned __int16 *)&chars->super.size_ + offset++ + 2);
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
  return [(OrgApacheLuceneUtilCharsRef *)self charsEqualsWithOrgApacheLuceneUtilCharsRef:a3];
}

- (BOOL)charsEqualsWithOrgApacheLuceneUtilCharsRef:(id)a3
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
      chars = self->chars_;
      if (!chars) {
        break;
      }
      uint64_t size = chars->super.size_;
      if (offset < 0 || offset >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, offset);
      }
      if (!v7) {
        break;
      }
      int v12 = *((unsigned __int16 *)&chars->super.size_ + offset + 2);
      uint64_t v13 = *(unsigned int *)(v7 + 8);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v8);
      }
      int v14 = *(unsigned __int16 *)(v7 + 12 + 2 * (int)v8);
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
  chars = self->chars_;
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
    if (!chars) {
      goto LABEL_28;
    }
    uint64_t size = chars->super.size_;
    if (offset < 0 || offset >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, offset);
    }
    if (!v7) {
      goto LABEL_28;
    }
    unsigned int v14 = *((unsigned __int16 *)&chars->super.size_ + offset + 2);
    uint64_t v15 = *(unsigned int *)(v7 + 8);
    if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v9);
    }
    unsigned int v16 = *(unsigned __int16 *)(v7 + 12 + 2 * (int)v9);
    ++offset;
    uint64_t v9 = (v9 + 1);
    BOOL v17 = v14 == v16;
    BOOL v18 = v14 > v16;
    if (v14 < v16) {
      int v19 = -1;
    }
    else {
      int v19 = v3;
    }
    if (v18) {
      int v3 = 1;
    }
    else {
      int v3 = v19;
    }
    if (!v17) {
      return v3;
    }
  }
  return v21->length_ - *((_DWORD *)a3 + 5);
}

- (NSString)description
{
  return +[NSString stringWithCharacters:self->chars_ offset:self->offset_ length:self->length_];
}

- (int)length
{
  return self->length_;
}

- (unsigned)charAtWithInt:(int)a3
{
  if (a3 < 0 || self->length_ <= a3)
  {
    uint64_t v8 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v8);
  }
  chars = self->chars_;
  if (!chars) {
    JreThrowNullPointerException();
  }
  int offset = self->offset_;
  uint64_t size = chars->super.size_;
  int v6 = offset + a3;
  if (offset + a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (offset + a3));
  }
  return *((_WORD *)&chars->super.size_ + v6 + 2);
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  if (a3 < 0 || (int v4 = a4 - a3, a4 < a3) || self->length_ < a4)
  {
    uint64_t v9 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v9);
  }
  chars = self->chars_;
  int v6 = self->offset_ + a3;
  uint64_t v7 = [OrgApacheLuceneUtilCharsRef alloc];
  JreStrongAssign((id *)&v7->chars_, chars);
  v7->offset_ = v6;
  v7->length_ = v4;
  return v7;
}

+ (id)getUTF16SortedAsUTF8Comparator
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilCharsRef__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_1005604B0;
}

+ (id)deepCopyOfWithOrgApacheLuceneUtilCharsRef:(id)a3
{
  return OrgApacheLuceneUtilCharsRef_deepCopyOfWithOrgApacheLuceneUtilCharsRef_((uint64_t)a3);
}

- (BOOL)isValid
{
  chars = self->chars_;
  if (!chars)
  {
    CFStringRef v13 = @"chars is null";
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
    unsigned int v16 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v16);
  }
  int size = chars->super.size_;
  if (length > size)
  {
    unsigned int v14 = @"length is out of bounds: ";
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
    unsigned int v14 = @"offset out of bounds: ";
    goto LABEL_16;
  }
  if (offset + length < 0)
  {
    unsigned int v14 = @"offset+length is negative: offset=";
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
  v3.super_class = (Class)OrgApacheLuceneUtilCharsRef;
  [(OrgApacheLuceneUtilCharsRef *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneUtilCharsRef *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilCharsRef_EMPTY_CHARS_, +[IOSCharArray newArrayWithLength:0]);
    JreStrongAssignAndConsume((id *)&qword_1005604B0, [OrgApacheLuceneUtilCharsRef_UTF16SortedAsUTF8Comparator alloc]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilCharsRef__initialized);
  }
}

@end