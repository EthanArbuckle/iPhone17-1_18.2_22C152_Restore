@interface BRLTJEditableString
- (BRLTJEditableString)init;
- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6;
- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7;
- (BRLTJEditableString)initWithUnderlyingObject:(id)a3;
- (BRLTJEditableStringInternal)underlyingObject;
- (NSString)string;
- (_NSRange)NSFocus;
- (_NSRange)NSSelection;
- (_NSRange)NSSuggestion;
- (int64_t)tokenForLocation:(int64_t)a3;
- (void)append:(id)a3;
@end

@implementation BRLTJEditableString

- (BRLTJEditableString)init
{
  return -[BRLTJEditableString initWithString:selection:focus:token:suggestion:](self, "initWithString:selection:focus:token:suggestion:", &stru_26CCBD108, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6
{
  return -[BRLTJEditableString initWithString:selection:focus:token:suggestion:](self, "initWithString:selection:focus:token:suggestion:", a3, a4.location, a4.length, a5.location, a5.length, a6, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v10 = a4.length;
  NSUInteger v11 = a4.location;
  id v13 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRLTJEditableString;
  v14 = [(BRLTJEditableString *)&v26 init];
  if (v14)
  {
    uint64_t v15 = BRLTJRangeForUnicharRange(v13, v11, v10);
    uint64_t v17 = v16;
    uint64_t v18 = BRLTJRangeForUnicharRange(v13, location, length);
    uint64_t v20 = v19;
    uint64_t v21 = BRLTJRangeForUnicharRange(v13, a7.location, a7.length);
    v23 = -[BRLTJEditableStringInternal initWithString:selection:focus:token:suggestion:]([BRLTJEditableStringInternal alloc], "initWithString:selection:focus:token:suggestion:", v13, v15, v17, v18, v20, a6, v21, v22);
    underlyingObject = v14->_underlyingObject;
    v14->_underlyingObject = v23;
  }
  return v14;
}

- (BRLTJEditableString)initWithUnderlyingObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJEditableString;
  v5 = [(BRLTJEditableString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = (BRLTJEditableStringInternal *)v6;
  }
  return v5;
}

- (NSString)string
{
  return [(BRLTJEditableStringInternal *)self->_underlyingObject string];
}

- (_NSRange)NSSelection
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSSelection];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)NSFocus
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSFocus];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)NSSuggestion
{
  v3 = [(BRLTJEditableStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTJEditableStringInternal *)self->_underlyingObject NSSuggestion];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (void)append:(id)a3
{
  underlyingObject = self->_underlyingObject;
  id v4 = [a3 underlyingObject];
  [(BRLTJEditableStringInternal *)underlyingObject append:v4];
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  return [(BRLTJEditableStringInternal *)self->_underlyingObject tokenForLocation:a3];
}

- (BRLTJEditableStringInternal)underlyingObject
{
  return (BRLTJEditableStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end