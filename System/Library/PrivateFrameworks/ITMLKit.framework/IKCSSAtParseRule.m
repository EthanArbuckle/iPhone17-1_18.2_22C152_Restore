@interface IKCSSAtParseRule
- (IKCSSAtParseRule)init;
- (NSString)name;
- (_NSRange)range;
- (id)description;
- (void)setName:(id)a3;
@end

@implementation IKCSSAtParseRule

- (IKCSSAtParseRule)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSAtParseRule;
  v2 = [(IKCSSParseRule *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:5];
  }
  return v3;
}

- (_NSRange)range
{
  v3 = [(IKCSSParseRule *)self prelude];
  v4 = [v3 firstObject];
  NSUInteger v5 = [v4 range];
  NSUInteger v7 = v6;

  v8 = [(IKCSSParseObject *)self cssValue];
  v9 = [v8 lastObject];
  uint64_t location = [v9 range];
  NSUInteger length = v11;

  if ([(IKCSSParseRule *)self _endRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v23.uint64_t location = [(IKCSSParseRule *)self _endRange];
    v23.NSUInteger length = v13;
    v21.uint64_t location = location;
    v21.NSUInteger length = length;
    NSRange v14 = NSUnionRange(v21, v23);
    uint64_t location = v14.location;
    NSUInteger length = v14.length;
  }
  v15.uint64_t location = v5;
  v15.NSUInteger length = v7;
  v16.uint64_t location = location;
  v16.NSUInteger length = length;
  NSRange v19 = NSUnionRange(v15, v16);
  NSUInteger v18 = v19.length;
  NSUInteger v17 = v19.location;
  result.NSUInteger length = v18;
  result.uint64_t location = v17;
  return result;
}

- (id)description
{
  v3 = NSString;
  v13.uint64_t location = [(IKCSSAtParseRule *)self range];
  v4 = NSStringFromRange(v13);
  NSUInteger v5 = [(IKCSSAtParseRule *)self name];
  NSUInteger v6 = [(IKCSSParseRule *)self prelude];
  NSUInteger v7 = [v6 toNSArray];
  v8 = +[IKCSSParseObject stringifyList:v7];
  v9 = [(IKCSSParseRule *)self block];
  v10 = [v3 stringWithFormat:@"\"IKCSSAtParseRule(%@)\": {\"name\":{%@}, \"prelude\":%@, \"block\":{%@}}", v4, v5, v8, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end