@interface IKCSSDeclarationList
- (IKCSSDeclarationList)init;
- (IKMutableArray)declarations;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declarationAtIndex:(unint64_t)a3;
- (id)description;
- (id)firstDeclaration;
- (id)lastDeclaration;
- (unint64_t)count;
- (void)addDeclaration:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation IKCSSDeclarationList

- (IKCSSDeclarationList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKCSSDeclarationList;
  v2 = [(IKCSSDeclarationList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[IKArray array];
    declarations = v2->_declarations;
    v2->_declarations = (IKMutableArray *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(IKCSSDeclarationList *)self declarations];
  uint64_t v6 = [v5 mutableCopy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  uint64_t v8 = [(IKCSSDeclarationList *)self range];
  objc_msgSend(v4, "setRange:", v8, v9);
  return v4;
}

- (void)addDeclaration:(id)a3
{
  id v4 = a3;
  id v5 = [(IKCSSDeclarationList *)self declarations];
  [v5 addObject:v4];
}

- (id)declarationAtIndex:(unint64_t)a3
{
  id v4 = [(IKCSSDeclarationList *)self declarations];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)firstDeclaration
{
  v2 = [(IKCSSDeclarationList *)self declarations];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (id)lastDeclaration
{
  v2 = [(IKCSSDeclarationList *)self declarations];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (unint64_t)count
{
  v2 = [(IKCSSDeclarationList *)self declarations];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)description
{
  int64_t v3 = [(IKCSSDeclarationList *)self count] - 1;
  if (v3 < 1)
  {
    v10 = &stru_1F3E09950;
  }
  else
  {
    uint64_t v4 = 0;
    id v5 = &stru_1F3E09950;
    do
    {
      uint64_t v6 = [(IKCSSDeclarationList *)self declarationAtIndex:v4];
      v19.location = [v6 range];
      v7 = NSStringFromRange(v19);
      uint64_t v8 = [(IKCSSDeclarationList *)self declarationAtIndex:v4];
      uint64_t v9 = [v8 description];
      v10 = [(__CFString *)v5 stringByAppendingFormat:@"(%@) %@, ", v7, v9];

      ++v4;
      id v5 = v10;
    }
    while (v3 != v4);
  }
  if ([(IKCSSDeclarationList *)self count])
  {
    v11 = [(IKCSSDeclarationList *)self declarationAtIndex:v3];
    v20.location = [v11 range];
    v12 = NSStringFromRange(v20);
    v13 = [(IKCSSDeclarationList *)self declarationAtIndex:v3];
    v14 = [v13 description];
    uint64_t v15 = [(__CFString *)v10 stringByAppendingFormat:@"(%@) %@, ", v12, v14];

    v10 = (__CFString *)v15;
  }
  v16 = [NSString stringWithFormat:@"[%@]", v10];

  return v16;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (IKMutableArray)declarations
{
  return self->_declarations;
}

- (void).cxx_destruct
{
}

@end