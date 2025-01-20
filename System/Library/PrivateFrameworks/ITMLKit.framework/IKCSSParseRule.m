@interface IKCSSParseRule
- (IKArray)prelude;
- (IKCSSParseBlock)block;
- (IKCSSParseRule)init;
- (_NSRange)_endRange;
- (_NSRange)range;
- (id)description;
- (void)_setEndRange:(_NSRange)a3;
- (void)setBlock:(id)a3;
- (void)setPrelude:(id)a3;
@end

@implementation IKCSSParseRule

- (IKCSSParseRule)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseRule;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IKCSSParseObject *)v2 setType:3];
    v3->__endRange = (_NSRange)xmmword_1E2B90A30;
  }
  return v3;
}

- (_NSRange)range
{
  v3 = [(IKCSSParseRule *)self prelude];
  v4 = [v3 firstObject];
  NSUInteger v5 = [v4 range];
  NSUInteger v7 = v6;

  v8 = [(IKCSSParseRule *)self block];
  uint64_t location = [v8 range];
  NSUInteger length = v10;

  if ([(IKCSSParseRule *)self _endRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22.uint64_t location = [(IKCSSParseRule *)self _endRange];
    v22.NSUInteger length = v12;
    v20.uint64_t location = location;
    v20.NSUInteger length = length;
    NSRange v13 = NSUnionRange(v20, v22);
    uint64_t location = v13.location;
    NSUInteger length = v13.length;
  }
  v14.uint64_t location = v5;
  v14.NSUInteger length = v7;
  v15.uint64_t location = location;
  v15.NSUInteger length = length;
  NSRange v18 = NSUnionRange(v14, v15);
  NSUInteger v17 = v18.length;
  NSUInteger v16 = v18.location;
  result.NSUInteger length = v17;
  result.uint64_t location = v16;
  return result;
}

- (id)description
{
  v3 = NSString;
  v12.uint64_t location = [(IKCSSParseRule *)self range];
  v4 = NSStringFromRange(v12);
  NSUInteger v5 = [(IKCSSParseRule *)self prelude];
  NSUInteger v6 = [v5 toNSArray];
  NSUInteger v7 = +[IKCSSParseObject stringifyList:v6];
  v8 = [(IKCSSParseRule *)self block];
  v9 = [v3 stringWithFormat:@"\"IKCSSParseRule(%@)\": {\"prelude\":%@, \"block\":{%@}}", v4, v7, v8];

  return v9;
}

- (IKArray)prelude
{
  return self->_prelude;
}

- (void)setPrelude:(id)a3
{
}

- (IKCSSParseBlock)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (_NSRange)_endRange
{
  p_endRange = &self->__endRange;
  NSUInteger location = self->__endRange.location;
  NSUInteger length = p_endRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)_setEndRange:(_NSRange)a3
{
  self->__endRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block, 0);
  objc_storeStrong((id *)&self->_prelude, 0);
}

@end