@interface SCATSimpleElementManager
- (BOOL)containsElement:(id)a3;
- (NSArray)allElements;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)numberOfItemsInCurrentScanCycle;
@end

@implementation SCATSimpleElementManager

- (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)numberOfItemsInCurrentScanCycle
{
  v2 = [(SCATSimpleElementManager *)self allElements];
  v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);

  return v3;
}

- (id)firstElementWithOptions:(int *)a3
{
  v3 = [(SCATSimpleElementManager *)self allElements];
  v4 = [v3 firstObject];

  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  v3 = [(SCATSimpleElementManager *)self allElements];
  v4 = [v3 lastObject];

  return v4;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  v8 = [(SCATSimpleElementManager *)self allElements];
  v9 = (char *)[v8 indexOfObject:v7];

  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [(SCATSimpleElementManager *)self allElements];
    if (v9)
    {
      v11 = [v10 objectAtIndex:v9 - 1];
      BOOL v12 = 0;
    }
    else
    {
      v11 = [v10 lastObject];
      BOOL v12 = 1;
    }

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = 0;
  BOOL v12 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v12;
LABEL_9:

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  v8 = [(SCATSimpleElementManager *)self allElements];
  v9 = (char *)[v8 indexOfObject:v7];

  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = [(SCATSimpleElementManager *)self allElements];
    v13 = (char *)[v12 count] - 1;

    v14 = [(SCATSimpleElementManager *)self allElements];
    v15 = v14;
    BOOL v11 = v9 == v13;
    if (v11) {
      v16 = 0;
    }
    else {
      v16 = v9 + 1;
    }
    v10 = [v14 objectAtIndex:v16];

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v10 = 0;
  BOOL v11 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v11;
LABEL_9:

  return v10;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  v5 = [(SCATSimpleElementManager *)self allElements];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)allElements
{
  return 0;
}

@end