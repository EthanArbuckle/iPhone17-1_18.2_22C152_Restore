@interface JavaTextParsePosition
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaTextParsePosition)initWithInt:(int)a3;
- (id)description;
- (int)getErrorIndex;
- (int)getIndex;
- (unint64_t)hash;
- (void)setErrorIndexWithInt:(int)a3;
- (void)setIndexWithInt:(int)a3;
@end

@implementation JavaTextParsePosition

- (JavaTextParsePosition)initWithInt:(int)a3
{
  self->currentPosition_ = a3;
  self->errorIndex_ = -1;
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
  return self->currentPosition_ == *((_DWORD *)a3 + 2) && self->errorIndex_ == *((_DWORD *)a3 + 3);
}

- (int)getErrorIndex
{
  return self->errorIndex_;
}

- (int)getIndex
{
  return self->currentPosition_;
}

- (unint64_t)hash
{
  return self->errorIndex_ + self->currentPosition_;
}

- (void)setErrorIndexWithInt:(int)a3
{
  self->errorIndex_ = a3;
}

- (void)setIndexWithInt:(int)a3
{
  self->currentPosition_ = a3;
}

- (id)description
{
  id v2 = objc_msgSend(-[JavaTextParsePosition getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040F818;
}

@end