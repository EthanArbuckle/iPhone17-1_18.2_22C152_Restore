@interface OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl)init;
- (id)clone;
- (id)type;
- (int)endOffset;
- (int)getPositionIncrement;
- (int)getPositionLength;
- (int)startOffset;
- (unint64_t)hash;
- (void)clear;
- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3;
- (void)dealloc;
- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3;
- (void)setOffsetWithInt:(int)a3 withInt:(int)a4;
- (void)setPositionIncrementWithInt:(int)a3;
- (void)setPositionLengthWithInt:(int)a3;
- (void)setTypeWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl

- (OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl)init
{
  HIDWORD(self->type_) = 1;
  self->positionIncrement_ = 1;
  return self;
}

- (void)setPositionIncrementWithInt:(int)a3
{
  if (a3 < 0)
  {
    CFStringRef v8 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"Increment must be zero or greater: ");
    v9 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
  HIDWORD(self->type_) = a3;
}

- (int)getPositionIncrement
{
  return HIDWORD(self->type_);
}

- (void)setPositionLengthWithInt:(int)a3
{
  self->positionIncrement_ = a3;
}

- (int)getPositionLength
{
  return self->positionIncrement_;
}

- (int)startOffset
{
  return *(&self->super.termLength_ + 1);
}

- (int)endOffset
{
  return self->startOffset_;
}

- (void)setOffsetWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || a4 < a3)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"startOffset must be non-negative, and endOffset must be >= startOffset, startOffset=");
    v9 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
  *(&self->super.termLength_ + 1) = a3;
  self->startOffset_ = a4;
}

- (id)type
{
  return *(id *)&self->endOffset_;
}

- (void)setTypeWithNSString:(id)a3
{
}

- (void)clear
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
  [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v3 clear];
  self->positionIncrement_ = 1;
  HIDWORD(self->type_) = 1;
  self->startOffset_ = 0;
  *(&self->super.termLength_ + 1) = 0;
  JreStrongAssign((id *)&self->endOffset_, OrgApacheLuceneAnalysisTokenattributesTypeAttribute_DEFAULT_TYPE_);
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
  id v2 = [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a3) {
        JreThrowNullPointerException();
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if (*(&self->super.termLength_ + 1) == *((_DWORD *)a3 + 7)
        && self->startOffset_ == *((_DWORD *)a3 + 8)
        && HIDWORD(self->type_) == *((_DWORD *)a3 + 11)
        && self->positionIncrement_ == *((_DWORD *)a3 + 12))
      {
        uint64_t v5 = *(void **)&self->endOffset_;
        uint64_t v6 = *(void *)((char *)a3 + 36);
        if (v5)
        {
          unsigned int v7 = [v5 isEqual:v6];
          if (!v7) {
            return v7;
          }
          goto LABEL_16;
        }
        if (!v6)
        {
LABEL_16:
          v9.receiver = self;
          v9.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
          LOBYTE(v7) = [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v9 isEqual:a3];
          return v7;
        }
      }
    }
    LOBYTE(v7) = 0;
    return v7;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
  unsigned int v3 = [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v10 hash];
  int v4 = *(&self->super.termLength_ + 1) - v3 + 32 * v3;
  int v5 = self->startOffset_ - v4 + 32 * v4;
  int v6 = HIDWORD(self->type_) - v5 + 32 * v5;
  int v7 = self->positionIncrement_ - v6 + 32 * v6;
  CFStringRef v8 = *(void **)&self->endOffset_;
  if (v8) {
    return (int)([v8 hash] - v7 + 32 * v7);
  }
  return v7;
}

- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v7 copyToWithOrgApacheLuceneUtilAttributeImpl:a3];
    int v6 = (void *)OrgApacheLuceneAnalysisTokenattributesOffsetAttribute_class_();
    if (a3)
    {
      if ([v6 isInstance:a3])
      {
        [a3 setOffsetWithInt:*((unsigned int *)&self->super.termLength_ + 1) withInt:self->startOffset_];
        if ([(id)OrgApacheLuceneAnalysisTokenattributesPositionIncrementAttribute_class_() isInstance:a3])
        {
          [a3 setPositionIncrementWithInt:HIDWORD(self->type_)];
          if ([(id)OrgApacheLuceneAnalysisTokenattributesPositionLengthAttribute_class_() isInstance:a3])
          {
            [a3 setPositionLengthWithInt:self->positionIncrement_];
            if ([(id)OrgApacheLuceneAnalysisTokenattributesTypeAttribute_class_() isInstance:a3])
            {
              [a3 setTypeWithNSString:*(void *)&self->endOffset_];
              return;
            }
          }
        }
      }
LABEL_13:
      JreThrowClassCastException();
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_14;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  objc_msgSend(a3, "copyBufferWithCharArray:withInt:withInt:", -[OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl buffer](self, "buffer"), 0, -[OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl length](self, "length"));
  *((_DWORD *)a3 + 11) = HIDWORD(self->type_);
  *((_DWORD *)a3 + 12) = self->positionIncrement_;
  *((_DWORD *)a3 + 7) = *(&self->super.termLength_ + 1);
  *((_DWORD *)a3 + 8) = self->startOffset_;
  int v5 = *(void **)&self->endOffset_;
  JreStrongAssign((id *)((char *)a3 + 36), v5);
}

- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
  -[OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl reflectWithWithOrgApacheLuceneUtilAttributeReflector:](&v9, "reflectWithWithOrgApacheLuceneUtilAttributeReflector:");
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = OrgApacheLuceneAnalysisTokenattributesOffsetAttribute_class_();
  [a3 reflectWithIOSClass:v5 withNSString:@"startOffset" withId:JavaLangInteger_valueOfWithInt_(*(&self->super.termLength_ + 1))];
  uint64_t v6 = OrgApacheLuceneAnalysisTokenattributesOffsetAttribute_class_();
  [a3 reflectWithIOSClass:v6 withNSString:@"endOffset" withId:JavaLangInteger_valueOfWithInt_(self->startOffset_)];
  uint64_t v7 = OrgApacheLuceneAnalysisTokenattributesPositionIncrementAttribute_class_();
  [a3 reflectWithIOSClass:v7 withNSString:@"positionIncrement" withId:JavaLangInteger_valueOfWithInt_(HIDWORD(self->type_))];
  uint64_t v8 = OrgApacheLuceneAnalysisTokenattributesPositionLengthAttribute_class_();
  [a3 reflectWithIOSClass:v8 withNSString:@"positionLength" withId:JavaLangInteger_valueOfWithInt_(self->positionIncrement_)];
  [a3 reflectWithIOSClass:OrgApacheLuceneAnalysisTokenattributesTypeAttribute_class_() withNSString:@"type" withId:*(void *)&self->endOffset_];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl;
  [(OrgApacheLuceneAnalysisTokenattributesCharTermAttributeImpl *)&v3 dealloc];
}

@end