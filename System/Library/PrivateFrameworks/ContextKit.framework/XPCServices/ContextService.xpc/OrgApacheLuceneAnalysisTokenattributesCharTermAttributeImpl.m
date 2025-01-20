@interface OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl)init;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)appendWithJavaLangStringBuilder:(id)a3;
- (id)appendWithNSString:(id)a3;
- (id)appendWithOrgApacheLuceneAnalysisTokenattributesCharTermAttribute:(id)a3;
- (id)buffer;
- (id)clone;
- (id)getBytesRef;
- (id)resizeBufferWithInt:(int)a3;
- (id)setEmpty;
- (id)setLengthWithInt:(int)a3;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (int)length;
- (uint64_t)appendNull;
- (unint64_t)hash;
- (unsigned)charAtWithInt:(int)a3;
- (void)clear;
- (void)copyBufferWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3;
- (void)dealloc;
- (void)growTermBufferWithInt:(int)a3;
- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl

- (OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl)init
{
  return self;
}

- (void)copyBufferWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  sub_1000C2110((char *)self, a5, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v9, self->termBuffer_, 0, v8);
  self->termLength_ = v8;
}

- (id)buffer
{
  return self->termBuffer_;
}

- (id)resizeBufferWithInt:(int)a3
{
  return (id)sub_1000C21B8((uint64_t)self, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)growTermBufferWithInt:(int)a3
{
  sub_1000C2110((char *)self, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)setLengthWithInt:(int)a3
{
  uint64_t v8 = *((void *)self + 2);
  if (!v8) {
    JreThrowNullPointerException();
  }
  if (*(_DWORD *)(v8 + 8) < a3)
  {
    CFStringRef v9 = JreStrcat("$I$IC", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"length ");
    v10 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  *((_DWORD *)self + 6) = a3;
  return self;
}

- (id)setEmpty
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

- (id)getBytesRef
{
  builder = self->builder_;
  if (!builder) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)builder copyCharsWithCharArray:self->termBuffer_ withInt:0 withInt:self->termLength_];
  uint64_t v4 = self->builder_;
  return [(OrgApacheLuceneUtilBytesRefBuilder *)v4 get];
}

- (int)length
{
  return self->termLength_;
}

- (unsigned)charAtWithInt:(int)a3
{
  if (self->termLength_ <= a3)
  {
    uint64_t v6 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v6);
  }
  termBuffer = self->termBuffer_;
  if (!termBuffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = termBuffer->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *((_WORD *)&termBuffer->super.size_ + a3 + 2);
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  int termLength = self->termLength_;
  if (termLength < a3 || termLength < a4)
  {
    CFStringRef v9 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v9);
  }
  uint64_t v6 = *(void *)&a3;
  termBuffer = self->termBuffer_;
  return +[NSString stringWithCharacters:termBuffer offset:v6 length:(a4 - v6)];
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3) {
    sub_1000C266C((uint64_t)self, (__CFString *)a3, 0, (uint64_t)[a3 length]);
  }
  else {
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)(uint64_t)self appendNull];
  }
  return self;
}

- (uint64_t)appendNull
{
  sub_1000C21B8(a1, *(_DWORD *)(a1 + 24) + 4, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    JreThrowNullPointerException();
  }
  int v10 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v10 + 1;
  uint64_t v11 = *(unsigned int *)(v9 + 8);
  if (v10 < 0 || v10 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v10);
  }
  *(_WORD *)(v9 + 12 + 2 * v10) = 110;
  uint64_t v12 = *(void *)(a1 + 16);
  int v13 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v13 + 1;
  uint64_t v14 = *(unsigned int *)(v12 + 8);
  if (v13 < 0 || v13 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v13);
  }
  *(_WORD *)(v12 + 12 + 2 * v13) = 117;
  uint64_t v15 = *(void *)(a1 + 16);
  int v16 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v16 + 1;
  uint64_t v17 = *(unsigned int *)(v15 + 8);
  if (v16 < 0 || v16 >= (int)v17) {
    IOSArray_throwOutOfBoundsWithMsg(v17, v16);
  }
  *(_WORD *)(v15 + 12 + 2 * v16) = 108;
  uint64_t v18 = *(void *)(a1 + 16);
  int v19 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v19 + 1;
  uint64_t v20 = *(unsigned int *)(v18 + 8);
  if (v19 < 0 || v19 >= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v19);
  }
  *(_WORD *)(v18 + 12 + 2 * v19) = 108;
  return a1;
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return (id)sub_1000C266C((uint64_t)self, (__CFString *)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (id)appendWithChar:(unsigned __int16)a3
{
  uint64_t v10 = sub_1000C21B8((uint64_t)self, self->termLength_ + 1, a3, v3, v4, v5, v6, v7);
  if (!v10) {
    JreThrowNullPointerException();
  }
  uint64_t v11 = v10;
  int termLength = self->termLength_;
  self->termLength_ = termLength + 1;
  uint64_t v13 = *(unsigned int *)(v10 + 8);
  if (termLength < 0 || termLength >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, termLength);
  }
  *(_WORD *)(v11 + 12 + 2 * termLength) = a3;
  return self;
}

- (id)appendWithNSString:(id)a3
{
  if (a3)
  {
    id v10 = [a3 length];
    objc_msgSend(a3, "getChars:sourceEnd:destination:destinationBegin:", 0, v10, sub_1000C21B8((uint64_t)self, self->termLength_ + (int)v10, v11, v12, v13, v14, v15, v16), self->termLength_);
    self->termLength_ += (int)v10;
  }
  else
  {
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)(uint64_t)self appendNull];
  }
  return self;
}

- (id)appendWithJavaLangStringBuilder:(id)a3
{
  if (a3)
  {
    id v10 = [a3 length];
    objc_msgSend(a3, "getCharsWithInt:withInt:withCharArray:withInt:", 0, v10, sub_1000C21B8((uint64_t)self, self->termLength_ + (int)v10, v11, v12, v13, v14, v15, v16), self->termLength_);
    self->termLength_ += (int)v10;
  }
  else
  {
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)(uint64_t)self appendNull];
  }
  return self;
}

- (id)appendWithOrgApacheLuceneAnalysisTokenattributesCharTermAttribute:(id)a3
{
  if (a3)
  {
    uint64_t v10 = (uint64_t)[a3 length];
    id v11 = [a3 buffer];
    uint64_t v18 = (void *)sub_1000C21B8((uint64_t)self, self->termLength_ + (int)v10, v12, v13, v14, v15, v16, v17);
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v11, 0, v18, self->termLength_, v10);
    self->termLength_ += v10;
  }
  else
  {
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)(uint64_t)self appendNull];
  }
  return self;
}

- (unint64_t)hash
{
  int termLength = self->termLength_;
  return (int)(OrgApacheLuceneUtilArrayUtil_hashCodeWithCharArray_withInt_withInt_((uint64_t)self->termBuffer_, 0, termLength)- termLength+ 32 * termLength);
}

- (void)clear
{
  self->termLength_ = 0;
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl;
  uint64_t v3 = [(OrgApacheLuceneUtilAttributeImpl *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssignAndConsume(v3 + 2, +[IOSCharArray newArrayWithLength:self->termLength_]);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->termBuffer_, 0, v3[2], 0, self->termLength_);
  uint64_t v4 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
  JreStrongAssignAndConsume(v3 + 1, v4);
  objc_msgSend(v3[1], "copyBytesWithOrgApacheLuceneUtilBytesRef:", -[OrgApacheLuceneUtilBytesRefBuilder get](self->builder_, "get"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    objc_opt_class();
    if (!a3) {
      goto LABEL_19;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    int termLength = self->termLength_;
    if (termLength != *((_DWORD *)a3 + 6)) {
      return 0;
    }
    if (termLength >= 1)
    {
      uint64_t v6 = 0;
      while (1)
      {
        termBuffer = self->termBuffer_;
        if (!termBuffer) {
          break;
        }
        uint64_t size = termBuffer->super.size_;
        if ((int)v6 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v6);
        }
        int v9 = *((unsigned __int16 *)&termBuffer->super.size_ + v6 + 2);
        uint64_t v10 = *((void *)a3 + 2);
        uint64_t v11 = *(unsigned int *)(v10 + 8);
        if ((int)v6 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v6);
        }
        int v12 = *(unsigned __int16 *)(v10 + 12 + 2 * v6);
        BOOL result = v9 == v12;
        if (v9 == v12 && (int)++v6 < self->termLength_) {
          continue;
        }
        return result;
      }
LABEL_19:
      JreThrowNullPointerException();
    }
  }
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithCharacters:self->termBuffer_ offset:0 length:self->termLength_];
}

- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a3, "reflectWithIOSClass:withNSString:withId:", OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_(), @"term", -[OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl description](self, "description"));
  uint64_t v5 = OrgApacheLuceneAnalysisTokenattributesTermToBytesRefAttribute_class_();
  id v6 = [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)self getBytesRef];
  [a3 reflectWithIOSClass:v5 withNSString:@"bytes" withId:v6];
}

- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3
{
  uint64_t v5 = (void *)OrgApacheLuceneAnalysisTokenattributesCharTermAttribute_class_();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  termBuffer = self->termBuffer_;
  uint64_t termLength = self->termLength_;
  [a3 copyBufferWithCharArray:termBuffer withInt:0 withInt:termLength];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl;
  [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v3 dealloc];
}

@end