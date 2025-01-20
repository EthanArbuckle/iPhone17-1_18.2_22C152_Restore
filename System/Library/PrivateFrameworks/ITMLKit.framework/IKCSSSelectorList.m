@interface IKCSSSelectorList
- (IKCSSSelectorList)init;
- (IKMutableArray)selectors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstSelector;
- (id)lastSelector;
- (id)selectorAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addSelector:(id)a3;
@end

@implementation IKCSSSelectorList

- (IKCSSSelectorList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKCSSSelectorList;
  v2 = [(IKCSSSelectorList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[IKArray array];
    selectors = v2->_selectors;
    v2->_selectors = (IKMutableArray *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4[1];
  objc_super v6 = [(IKCSSSelectorList *)self selectors];
  [v5 addObjectsFromArray:v6];

  return v4;
}

- (void)addSelector:(id)a3
{
  id v4 = a3;
  id v5 = [(IKCSSSelectorList *)self selectors];
  [v5 addObject:v4];
}

- (id)selectorAtIndex:(unint64_t)a3
{
  id v4 = [(IKCSSSelectorList *)self selectors];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)firstSelector
{
  v2 = [(IKCSSSelectorList *)self selectors];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (id)lastSelector
{
  v2 = [(IKCSSSelectorList *)self selectors];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (unint64_t)count
{
  v2 = [(IKCSSSelectorList *)self selectors];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)description
{
  int64_t v3 = [(IKCSSSelectorList *)self count] - 1;
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
      objc_super v6 = [(IKCSSSelectorList *)self selectorAtIndex:v4];
      v19.location = [v6 range];
      v7 = NSStringFromRange(v19);
      v8 = [(IKCSSSelectorList *)self selectorAtIndex:v4];
      v9 = [v8 description];
      v10 = [(__CFString *)v5 stringByAppendingFormat:@"(%@) %@, ", v7, v9];

      ++v4;
      id v5 = v10;
    }
    while (v3 != v4);
  }
  if ([(IKCSSSelectorList *)self count])
  {
    v11 = [(IKCSSSelectorList *)self selectorAtIndex:v3];
    v20.location = [v11 range];
    v12 = NSStringFromRange(v20);
    v13 = [(IKCSSSelectorList *)self selectorAtIndex:v3];
    v14 = [v13 description];
    uint64_t v15 = [(__CFString *)v10 stringByAppendingFormat:@"(%@) %@, ", v12, v14];

    v10 = (__CFString *)v15;
  }
  v16 = [NSString stringWithFormat:@"[%@]", v10];

  return v16;
}

- (IKMutableArray)selectors
{
  return self->_selectors;
}

- (void).cxx_destruct
{
}

@end