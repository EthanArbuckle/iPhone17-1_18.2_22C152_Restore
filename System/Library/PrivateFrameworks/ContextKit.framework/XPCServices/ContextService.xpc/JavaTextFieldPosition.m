@interface JavaTextFieldPosition
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaTextFieldPosition)initWithInt:(int)a3;
- (JavaTextFieldPosition)initWithJavaTextFormat_Field:(id)a3;
- (JavaTextFieldPosition)initWithJavaTextFormat_Field:(id)a3 withInt:(int)a4;
- (id)description;
- (id)getFieldAttribute;
- (int)getBeginIndex;
- (int)getEndIndex;
- (int)getField;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBeginIndexWithInt:(int)a3;
- (void)setEndIndexWithInt:(int)a3;
@end

@implementation JavaTextFieldPosition

- (JavaTextFieldPosition)initWithInt:(int)a3
{
  self->field_ = a3;
  return self;
}

- (JavaTextFieldPosition)initWithJavaTextFormat_Field:(id)a3
{
  self->field_ = -1;
  return self;
}

- (JavaTextFieldPosition)initWithJavaTextFormat_Field:(id)a3 withInt:(int)a4
{
  self->field_ = a4;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return self->field_ == *((_DWORD *)a3 + 2)
      && self->attribute_ == (JavaTextFormat_Field *)*((void *)a3 + 3)
      && self->beginIndex_ == *((_DWORD *)a3 + 3)
      && self->endIndex_ == *((_DWORD *)a3 + 4);
}

- (int)getBeginIndex
{
  return self->beginIndex_;
}

- (int)getEndIndex
{
  return self->endIndex_;
}

- (int)getField
{
  return self->field_;
}

- (id)getFieldAttribute
{
  return self->attribute_;
}

- (unint64_t)hash
{
  attribute = self->attribute_;
  if (attribute) {
    LODWORD(attribute) = [(JavaTextAttributedCharacterIterator_Attribute *)attribute hash];
  }
  return (int)attribute + 10 * self->field_ + 100 * self->beginIndex_ + self->endIndex_;
}

- (void)setBeginIndexWithInt:(int)a3
{
  self->beginIndex_ = a3;
}

- (void)setEndIndexWithInt:(int)a3
{
  self->endIndex_ = a3;
}

- (id)description
{
  id v2 = objc_msgSend(-[JavaTextFieldPosition getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$$@$I$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextFieldPosition;
  [(JavaTextFieldPosition *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043D420;
}

@end