@interface IKCSSParseBlock
- (IKCSSParseBlock)init;
- (_NSRange)range;
- (id)description;
@end

@implementation IKCSSParseBlock

- (IKCSSParseBlock)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseBlock;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:2];
  }
  return v3;
}

- (_NSRange)range
{
  v3 = [(IKCSSParseObject *)self cssValue];
  v4 = [v3 firstObject];
  NSUInteger v5 = [v4 range];
  NSUInteger v7 = v6;

  v8 = [(IKCSSParseObject *)self cssValue];
  v9 = [v8 lastObject];
  NSUInteger v10 = [v9 range];
  NSUInteger v12 = v11;

  v13.NSUInteger location = v5;
  v13.NSUInteger length = v7;
  v14.NSUInteger location = v10;
  v14.NSUInteger length = v12;
  NSRange v17 = NSUnionRange(v13, v14);
  NSUInteger length = v17.length;
  NSUInteger location = v17.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  v3 = NSString;
  v11.NSUInteger location = [(IKCSSParseBlock *)self range];
  v4 = NSStringFromRange(v11);
  NSUInteger v5 = [(IKCSSParseObject *)self cssValue];
  NSUInteger v6 = [v5 toNSArray];
  NSUInteger v7 = +[IKCSSParseObject stringifyList:v6];
  v8 = [v3 stringWithFormat:@"\"IKCSSParseBlock(%@)\": {\"value\":%@}", v4, v7];

  return v8;
}

@end