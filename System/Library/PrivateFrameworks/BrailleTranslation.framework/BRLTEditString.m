@interface BRLTEditString
- (BRLTEditString)init;
- (BRLTEditString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7 textFormattingRanges:(id)a8;
- (BRLTEditString)initWithUnderlyingObject:(id)a3;
- (BRLTEditStringInternal)underlyingObject;
- (NSString)string;
- (_NSRange)focus;
- (_NSRange)selection;
- (_NSRange)suggestion;
- (id)appending:(id)a3;
- (int64_t)tokenForLocation:(int64_t)a3;
@end

@implementation BRLTEditString

- (BRLTEditString)init
{
  return -[BRLTEditString initWithString:selection:focus:token:suggestion:textFormattingRanges:](self, "initWithString:selection:focus:token:suggestion:textFormattingRanges:", &stru_26CCBD108, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

- (BRLTEditString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = a4.length;
  NSUInteger v12 = a4.location;
  id v15 = a8;
  id v16 = a3;
  uint64_t v17 = BRLTJRangeForUnicharRange(v16, v12, v11);
  uint64_t v19 = v18;
  uint64_t v20 = BRLTJRangeForUnicharRange(v16, location, length);
  v22 = -[BRLTEditStringInternal initWithString:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:]([BRLTEditStringInternal alloc], "initWithString:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:", v16, v17, v19, v20, v21, a6, a7.location, a7.length, v15);

  v23 = [(BRLTEditString *)self initWithUnderlyingObject:v22];
  return v23;
}

- (BRLTEditString)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTEditString;
  v6 = [(BRLTEditString *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (NSString)string
{
  return [(BRLTEditStringInternal *)self->_underlyingObject string];
}

- (_NSRange)selection
{
  v3 = [(BRLTEditStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTEditStringInternal *)self->_underlyingObject NSSelection];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)focus
{
  v3 = [(BRLTEditStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTEditStringInternal *)self->_underlyingObject NSFocus];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)suggestion
{
  v3 = [(BRLTEditStringInternal *)self->_underlyingObject string];
  uint64_t v4 = [(BRLTEditStringInternal *)self->_underlyingObject NSSuggestion];
  unint64_t v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)appending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [BRLTEditString alloc];
  underlyingObject = self->_underlyingObject;
  NSUInteger v7 = [v4 underlyingObject];

  NSUInteger v8 = [(BRLTEditStringInternal *)underlyingObject appending:v7];
  NSUInteger v9 = [(BRLTEditString *)v5 initWithUnderlyingObject:v8];

  return v9;
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  underlyingObject = self->_underlyingObject;
  uint64_t v5 = [(BRLTEditStringInternal *)underlyingObject string];
  int64_t v6 = [(BRLTEditStringInternal *)underlyingObject tokenForLocation:BRLTJIndexForUnicharIndex(v5, a3)];

  return v6;
}

- (BRLTEditStringInternal)underlyingObject
{
  return (BRLTEditStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end