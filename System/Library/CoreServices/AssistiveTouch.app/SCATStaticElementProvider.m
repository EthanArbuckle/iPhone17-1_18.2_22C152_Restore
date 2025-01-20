@interface SCATStaticElementProvider
- (BOOL)containsElement:(id)a3;
- (BOOL)providesElements;
- (NSArray)elements;
- (NSString)description;
- (SCATStaticElementProvider)initWithElements:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)setElements:(id)a3;
@end

@implementation SCATStaticElementProvider

- (SCATStaticElementProvider)initWithElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATStaticElementProvider;
  v5 = [(SCATStaticElementProvider *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SCATStaticElementProvider *)v5 setElements:v4];
    v7 = v6;
  }

  return v6;
}

- (NSString)description
{
  v3 = +[NSNumber numberWithUnsignedInteger:[(SCATStaticElementProvider *)self count]];
  id v4 = +[NSString stringWithFormat:@"SCATStaticElementProvider<%p> numElems:%@.", self, v3];

  return (NSString *)v4;
}

- (unint64_t)count
{
  v2 = [(SCATStaticElementProvider *)self elements];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(SCATStaticElementProvider *)self elements];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = [(SCATStaticElementProvider *)self count];
  if (v4)
  {
    id v4 = [(SCATStaticElementProvider *)self objectAtIndex:0];
  }

  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = [(SCATStaticElementProvider *)self count];
  if (v4)
  {
    id v4 = [(SCATStaticElementProvider *)self lastObject];
  }

  return v4;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  v7 = (char *)-[SCATStaticElementProvider indexOfObject:](self, "indexOfObject:", a3, a4, a5);
  unint64_t v8 = [(SCATStaticElementProvider *)self count];
  if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = v7 + 1 == (char *)v8;
    if (v7 + 1 == (char *)v8) {
      v11 = 0;
    }
    else {
      v11 = v7 + 1;
    }
    v10 = [(SCATStaticElementProvider *)self objectAtIndex:v11];
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v9 = 0;
  v10 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v9;
LABEL_9:

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  v7 = (char *)-[SCATStaticElementProvider indexOfObject:](self, "indexOfObject:", a3, a4, a5);
  unint64_t v8 = [(SCATStaticElementProvider *)self count];
  if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = v7 == 0;
    if (v7) {
      v11 = v7;
    }
    else {
      v11 = (char *)v8;
    }
    v10 = [(SCATStaticElementProvider *)self objectAtIndex:v11 - 1];
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v9 = 0;
  v10 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v9;
LABEL_9:

  return v10;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  v5 = [(SCATStaticElementProvider *)self elements];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end