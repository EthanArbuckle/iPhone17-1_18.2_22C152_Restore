@interface CPHitTest
- (BOOL)hitTestGraphicObject:(id)a3 point:(CGPoint)a4;
- (BOOL)hitTestParagraph:(id)a3 point:(CGPoint)a4;
- (CPHitTest)initWithPage:(id)a3;
- (id)column:(CGPoint)a3;
- (id)findBestMatch:(id)a3 atPoint:(CGPoint)a4;
- (id)findObjectIn:(id)a3 at:(CGPoint)a4 count:(int *)a5;
- (id)layoutArea:(CGPoint)a3;
- (id)objectAtPoint:(CGPoint)a3;
- (id)page;
- (id)paragraph:(CGPoint)a3;
- (id)paragraphNear:(CGPoint)a3;
- (id)textLine:(CGPoint)a3;
- (int64_t)compareByReadingOrder:(CGPoint)a3 to:(CGPoint)a4;
- (unsigned)columnsAt:(CGPoint)a3;
- (void)dealloc;
- (void)findClickableObjects:(BOOL)a3;
@end

@implementation CPHitTest

- (int64_t)compareByReadingOrder:(CGPoint)a3 to:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = -[CPHitTest textLine:](self, "textLine:", a3.x, a3.y);
  id v8 = -[CPHitTest textLine:](self, "textLine:", x, y);
  [(CPPage *)self->page pageCropBox];
  v12[0] = v9;
  v12[1] = v10;
  return readingOrder(v7, v8, v12);
}

- (id)objectAtPoint:(CGPoint)a3
{
  int v4 = 0;
  return -[CPHitTest findObjectIn:at:count:](self, "findObjectIn:at:count:", self->objectsOnPage, &v4, a3.x, a3.y);
}

- (id)textLine:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = -[CPHitTest paragraph:](self, "paragraph:");
  if (!v5) {
    return 0;
  }
  v6 = v5;
  [v5 rotationAngle];
  if (v7 != 0.0)
  {
    __double2 v8 = __sincos_stret(v7 * -0.0174532925);
    double v9 = y * v8.__cosval + v8.__sinval * x;
    double x = v8.__cosval * x - v8.__sinval * y + 0.0;
    double y = v9 + 0.0;
  }
  int v10 = [v6 count];
  if (!v10) {
    return 0;
  }
  int v11 = v10;
  uint64_t v12 = 0;
  while (1)
  {
    v13 = (void *)[v6 childAtIndex:v12];
    [v13 bounds];
    v15.double x = x;
    v15.double y = y;
    if (CGRectContainsPoint(v16, v15)) {
      break;
    }
    uint64_t v12 = (v12 + 1);
    if (v11 == v12) {
      return 0;
    }
  }
  return v13;
}

- (id)column:(CGPoint)a3
{
  id v3 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:", a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (unsigned)columnsAt:(CGPoint)a3
{
  unsigned int v4 = 0;
  -[CPHitTest findObjectIn:at:count:](self, "findObjectIn:at:count:", self->objectsOnPage, &v4, a3.x, a3.y);
  return v4;
}

- (id)layoutArea:(CGPoint)a3
{
  id v3 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:", a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (id)[v3 parent];
}

- (id)paragraphNear:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[CPHitTest paragraph:](self, "paragraph:");
  if (v6) {
    return v6;
  }
  id v8 = -[CPHitTest column:](self, "column:", x, y);
  if (!v8) {
    return 0;
  }
  double v9 = v8;
  [v8 rotationAngle];
  if (v10 != 0.0)
  {
    __double2 v11 = __sincos_stret(v10 * -0.0174532925);
    double y = y * v11.__cosval + v11.__sinval * x + 0.0;
  }
  int v12 = [v9 count];
  if (v12)
  {
    int v13 = v12;
    uint64_t v14 = 0;
    do
    {
      id v6 = (id)[v9 childAtIndex:v14];
      [v6 bounds];
      if (v17 < 0.0 || v18 < 0.0) {
        *(CGRect *)(&v16 - 1) = CGRectStandardize(*(CGRect *)&v15);
      }
      if (v16 < y) {
        return v6;
      }
      uint64_t v14 = (v14 + 1);
    }
    while (v13 != v14);
  }

  return (id)[v9 lastChild];
}

- (id)paragraph:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [v5 rotationAngle];
  if (v6 != 0.0)
  {
    __double2 v7 = __sincos_stret(v6 * -0.0174532925);
    double v8 = y * v7.__cosval + v7.__sinval * x;
    double x = v7.__cosval * x - v7.__sinval * y + 0.0;
    double y = v8 + 0.0;
  }
  int v9 = [v5 count];
  if (!v9) {
    return 0;
  }
  int v10 = v9;
  uint64_t v11 = 0;
  while (1)
  {
    int v12 = (void *)[v5 childAtIndex:v11];
    [v12 bounds];
    v14.double x = x;
    v14.double y = y;
    if (CGRectContainsPoint(v15, v14)) {
      break;
    }
    uint64_t v11 = (v11 + 1);
    if (v10 == v11) {
      return 0;
    }
  }
  return v12;
}

- (id)page
{
  return self->page;
}

- (void)dealloc
{
  [(NSMutableArray *)self->objectsOnPage removeAllObjects];

  v3.receiver = self;
  v3.super_class = (Class)CPHitTest;
  [(CPHitTest *)&v3 dealloc];
}

- (CPHitTest)initWithPage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPHitTest;
  unsigned int v4 = [(CPHitTest *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->page = (CPPage *)a3;
    [(CPHitTest *)v4 findClickableObjects:0];
  }
  return v5;
}

- (id)findObjectIn:(id)a3 at:(CGPoint)a4 count:(int *)a5
{
  double y = a4.y;
  double x = a4.x;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  *a5 = 0;
  int v11 = [a3 count];
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    int v13 = 0;
    uint64_t v14 = v11;
    while (1)
    {
      CGRect v15 = (void *)[a3 objectAtIndex:v12];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v15 rotationAngle];
      double v17 = v16;
      [v15 renderedBounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      if (v17 == 0.0) {
        goto LABEL_7;
      }
      __double2 v26 = __sincos_stret(v17 * -0.0174532925);
      double v27 = v26.__cosval * x - v26.__sinval * y + 0.0;
      double v28 = y * v26.__cosval + v26.__sinval * x + 0.0;
LABEL_8:
      v38.origin.double x = v19;
      v38.origin.double y = v21;
      v38.size.width = v23;
      v38.size.height = v25;
      if (CGRectContainsPoint(v38, *(CGPoint *)&v27))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 hasFill] & 1) == 0)
        {
          if (!v13) {
            int v13 = v15;
          }
        }
        else
        {
          [v10 addObject:v15];
        }
      }
      if (v14 == ++v12) {
        goto LABEL_17;
      }
    }
    [v15 renderedBounds];
    CGFloat v19 = v29;
    CGFloat v21 = v30;
    CGFloat v23 = v31;
    CGFloat v25 = v32;
LABEL_7:
    double v27 = x;
    double v28 = y;
    goto LABEL_8;
  }
  int v13 = 0;
LABEL_17:
  int v33 = [v10 count];
  *a5 = v33;
  if (v13) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = v33 == 0;
  }
  if (v34) {
    id v35 = 0;
  }
  else {
    id v35 = v13;
  }
  if (v33)
  {
    if (v33 == 1)
    {
      id v35 = (id)[v10 objectAtIndex:0];
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v36 = [v35 zOrder];
          if (v36 < [v13 zOrder]) {
            id v35 = v13;
          }
        }
      }
    }
    else
    {
      id v35 = -[CPHitTest findBestMatch:atPoint:](self, "findBestMatch:atPoint:", v10, x, y);
    }
  }

  return v35;
}

- (id)findBestMatch:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = (void *)[a3 objectAtIndex:0];
  int v9 = [a3 count];
  if (v9 < 1) {
    return v8;
  }
  uint64_t v10 = 0;
  uint64_t v11 = v9;
  while (1)
  {
    uint64_t v12 = (void *)[a3 objectAtIndex:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[CPHitTest hitTestGraphicObject:point:](self, "hitTestGraphicObject:point:", v12, x, y))
      {
        break;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[CPHitTest hitTestParagraph:point:](self, "hitTestParagraph:point:", v12, x, y))
    {
      break;
    }
    if (v11 == ++v10) {
      return v8;
    }
  }
  return v12;
}

- (BOOL)hitTestParagraph:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [a3 rotationAngle];
  if (v7 != 0.0)
  {
    __double2 v8 = __sincos_stret(v7 * -0.0174532925);
    double v9 = y * v8.__cosval + v8.__sinval * x;
    double x = v8.__cosval * x - v8.__sinval * y + 0.0;
    double y = v9 + 0.0;
  }
  int v10 = [a3 count];
  if (v10 < 1)
  {
    return 0;
  }
  else
  {
    int v11 = v10;
    uint64_t v12 = 0;
    BOOL v13 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v12), "bounds");
      v15.double x = x;
      v15.double y = y;
      if (CGRectContainsPoint(v16, v15)) {
        break;
      }
      uint64_t v12 = (v12 + 1);
      BOOL v13 = (int)v12 < v11;
    }
    while (v11 != v12);
  }
  return v13;
}

- (BOOL)hitTestGraphicObject:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  int v8 = [a3 count];
  if (v8 < 1)
  {
    return 0;
  }
  else
  {
    int v9 = v8;
    uint64_t v10 = 0;
    BOOL v11 = 1;
    do
    {
      uint64_t v12 = (void *)[a3 childAtIndex:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (-[CPHitTest hitTestGraphicObject:point:](self, "hitTestGraphicObject:point:", v12, x, y)) {
          return v11;
        }
      }
      else
      {
        [v12 renderedBounds];
        v14.double x = x;
        v14.double y = y;
        if (CGRectContainsPoint(v15, v14)) {
          return v11;
        }
      }
      uint64_t v10 = (v10 + 1);
      BOOL v11 = (int)v10 < v9;
    }
    while (v9 != v10);
  }
  return v11;
}

- (void)findClickableObjects:(BOOL)a3
{
  BOOL v3 = a3;
  objectsOnPage = self->objectsOnPage;
  if (objectsOnPage) {

  }
  self->objectsOnPage = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(CPPage *)self->page bodyZone];
  int v7 = [v6 count];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = (void *)[v6 childAtIndex:v9];
      if (![v10 count]) {
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v10 children];
        CGRect v15 = self->objectsOnPage;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v3)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[NSMutableArray addObject:](self->objectsOnPage, "addObject:", [v10 childAtIndex:0]);
          }
        }
        goto LABEL_14;
      }
      CGRect v16 = (void *)[v10 firstChild];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v3) {
          [(NSMutableArray *)self->objectsOnPage addObject:v16];
        }
        if ([v16 count])
        {
          uint64_t v11 = [v16 firstChild];
LABEL_9:
          uint64_t v12 = (void *)v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v13 = self->objectsOnPage;
            uint64_t v14 = [v12 children];
            CGRect v15 = v13;
LABEL_13:
            [(NSMutableArray *)v15 addObjectsFromArray:v14];
          }
        }
      }
LABEL_14:
      uint64_t v9 = (v9 + 1);
      if (v8 == v9) {
        goto LABEL_25;
      }
    }
    if (![v10 count]) {
      goto LABEL_14;
    }
    uint64_t v11 = [v10 childAtIndex:0];
    goto LABEL_9;
  }
LABEL_25:
  [(CPPage *)self->page pageCropBox];
  v21[0] = v17;
  v21[1] = v18;
  -[NSMutableArray sortUsingFunction:context:](self->objectsOnPage, "sortUsingFunction:context:", readingOrder, v21, v19, v20);
}

@end