@interface CPParagraphFlow
- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 paragraphs:(id)a5;
- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 rects:(id)a5;
- (BOOL)intervalOverlapTop:(double)a3 bottom:(double)a4 paragraphs:(id)a5;
- (BOOL)placed;
- (CGRect)belowBounds;
- (CPParagraph)nextInColumn;
- (CPParagraph)paragraph;
- (CPParagraphFlow)initWithParagraph:(id)a3;
- (double)area;
- (double)dAbove;
- (double)dBelow;
- (double)fBottom;
- (double)fLeft;
- (double)fRight;
- (id)belowTwoSides:(unsigned int)a3;
- (id)description;
- (id)ignoreCallouts:(unsigned int)a3;
- (id)nextParagraphInColumn:(id)a3;
- (id)paragraphsAbove;
- (id)paragraphsBelow;
- (id)paragraphsLeft;
- (id)paragraphsRight;
- (id)simpleRule:(unsigned int)a3;
- (id)twoSides:(unsigned int)a3;
- (int)calloutType;
- (int)inOrder;
- (int)inOrder:(BOOL)a3;
- (int)leftOrder;
- (int)outOrder;
- (int)rightOrder;
- (int64_t)topDescending:(id)a3;
- (void)dealloc;
- (void)removeFromAbove:(id)a3;
- (void)removeFromBelow:(id)a3;
- (void)replaceAbove:(id)a3 withOneOf:(id)a4;
- (void)replaceBelow:(id)a3 withOneOf:(id)a4;
- (void)setCalloutType:(int)a3;
- (void)setFBottom:(double)a3;
- (void)setFLeft:(double)a3;
- (void)setFRight:(double)a3;
- (void)setNextInColumn:(id)a3;
- (void)setParagraph:(id)a3;
- (void)setParagraphsAboveIn:(id)a3;
- (void)setParagraphsBelowIn:(id)a3;
- (void)setParagraphsLeftIn:(id)a3;
- (void)setParagraphsRightIn:(id)a3;
- (void)setPlaced:(BOOL)a3;
@end

@implementation CPParagraphFlow

- (void)setNextInColumn:(id)a3
{
  self->nextInColumn = (CPParagraph *)a3;
}

- (CPParagraph)nextInColumn
{
  return self->nextInColumn;
}

- (void)setCalloutType:(int)a3
{
  self->calloutType = a3;
}

- (int)calloutType
{
  return self->calloutType;
}

- (void)setPlaced:(BOOL)a3
{
  self->placed = a3;
}

- (BOOL)placed
{
  return self->placed;
}

- (void)setFBottom:(double)a3
{
  self->fBottom = a3;
}

- (double)fBottom
{
  return self->fBottom;
}

- (void)setFRight:(double)a3
{
  self->fRight = a3;
}

- (double)fRight
{
  return self->fRight;
}

- (void)setFLeft:(double)a3
{
  self->fLeft = a3;
}

- (double)fLeft
{
  return self->fLeft;
}

- (void)setParagraph:(id)a3
{
}

- (CPParagraph)paragraph
{
  return self->paragraph;
}

- (int)rightOrder
{
  paragraphsRight = self->paragraphsRight;
  if (paragraphsRight) {
    LODWORD(paragraphsRight) = [(NSMutableArray *)paragraphsRight count];
  }
  return (int)paragraphsRight;
}

- (int)leftOrder
{
  paragraphsLeft = self->paragraphsLeft;
  if (paragraphsLeft) {
    LODWORD(paragraphsLeft) = [(NSMutableArray *)paragraphsLeft count];
  }
  return (int)paragraphsLeft;
}

- (int)outOrder
{
  paragraphsBelow = self->paragraphsBelow;
  if (paragraphsBelow) {
    LODWORD(paragraphsBelow) = [(NSMutableArray *)paragraphsBelow count];
  }
  return (int)paragraphsBelow;
}

- (int)inOrder:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(NSMutableArray *)self->paragraphsAbove count];
    if (!v4) {
      return 0;
    }
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      if (!objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsAbove, "objectAtIndex:", v5), "flowProperties"), "calloutType"))++v6; {
      ++v5;
      }
    }
    while (v4 != v5);
    return v6;
  }
  else
  {
    return [(CPParagraphFlow *)self inOrder];
  }
}

- (int)inOrder
{
  paragraphsAbove = self->paragraphsAbove;
  if (paragraphsAbove) {
    LODWORD(paragraphsAbove) = [(NSMutableArray *)paragraphsAbove count];
  }
  return (int)paragraphsAbove;
}

- (double)area
{
  [(CPRotatedRegion *)self->paragraph normalizedBounds];
  CGFloat v6 = v2;
  CGFloat v7 = v3;
  double width = v4;
  CGFloat v9 = v5;
  if (v4 < 0.0 || v5 < 0.0)
  {
    CGRect v12 = CGRectStandardize(*(CGRect *)&v2);
    double height = v12.size.height;
    v12.origin.x = v6;
    v12.origin.y = v7;
    v12.size.double width = width;
    v12.size.double height = v9;
    CGRect v13 = CGRectStandardize(v12);
    double width = v13.size.width;
  }
  else
  {
    double height = v5;
  }
  return height * width;
}

- (double)dAbove
{
  if (![(CPParagraphFlow *)self inOrder]) {
    return 0.0;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsAbove, "objectAtIndex:", 0), "normalizedBounds");
  double v7 = v4;
  if (v5 < 0.0 || v6 < 0.0)
  {
    *(CGRect *)&double v3 = CGRectStandardize(*(CGRect *)&v3);
    double v7 = v8;
  }
  [(CPRotatedRegion *)self->paragraph normalizedBounds];
  if (v11 < 0.0 || v12 < 0.0) {
    *(CGRect *)(&v10 - 1) = CGRectStandardize(*(CGRect *)&v9);
  }
  return v7 - (v10 + v12);
}

- (double)dBelow
{
  if (![(CPParagraphFlow *)self outOrder]) {
    return 0.0;
  }
  [(CPRotatedRegion *)self->paragraph normalizedBounds];
  double v7 = v4;
  if (v5 < 0.0 || v6 < 0.0)
  {
    *(CGRect *)&double v3 = CGRectStandardize(*(CGRect *)&v3);
    double v7 = v8;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0, v3), "normalizedBounds");
  if (v11 < 0.0 || v12 < 0.0) {
    *(CGRect *)(&v10 - 1) = CGRectStandardize(*(CGRect *)&v9);
  }
  return v7 - (v10 + v12);
}

- (CGRect)belowBounds
{
  unsigned int v3 = [(NSMutableArray *)self->paragraphsBelow count];
  if (v3)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0), "normalizedBounds");
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
    if (v3 != 1)
    {
      uint64_t v12 = v3;
      for (uint64_t i = 1; i != v12; ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", i), "normalizedBounds");
        v25.origin.CGFloat x = v14;
        v25.origin.CGFloat y = v15;
        v25.size.CGFloat width = v16;
        v25.size.CGFloat height = v17;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        CGRect v23 = CGRectUnion(v22, v25);
        CGFloat x = v23.origin.x;
        CGFloat y = v23.origin.y;
        CGFloat width = v23.size.width;
        CGFloat height = v23.size.height;
      }
    }
  }
  else
  {
    CGFloat height = 0.0;
    CGFloat y = INFINITY;
    CGFloat width = 0.0;
    CGFloat x = INFINITY;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)replaceAbove:(id)a3 withOneOf:(id)a4
{
  [(NSMutableArray *)self->paragraphsAbove removeObject:a3];
  [(CPRotatedRegion *)self->paragraph normalizedBounds];
  CGFloat v7 = v6;
  CGFloat v37 = v8;
  double v38 = v9;
  double v11 = v10;
  uint64_t v12 = [a4 count];
  if (v12)
  {
    uint64_t v13 = 0;
    double v14 = v38;
    BOOL v15 = v38 < 0.0 || v11 < 0.0;
    do
    {
      CGFloat v16 = objc_msgSend(a4, "objectAtIndex:", v13, v14);
      [v16 normalizedBounds];
      double v21 = v17;
      CGFloat v22 = v18;
      double v23 = v19;
      CGFloat v24 = v20;
      BOOL v25 = v20 < 0.0 || v19 < 0.0;
      double v26 = v17;
      if (v25) {
        *(void *)&double v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
      }
      double v27 = v7;
      double v28 = v11;
      if (v15)
      {
        v39.origin.double x = v7;
        v39.origin.CGFloat y = v37;
        v39.size.CGFloat height = v38;
        v39.size.double width = v11;
        *(CGRect *)&double v27 = CGRectStandardize(v39);
      }
      double v14 = v27 + v28;
      if (v26 < v14)
      {
        double x = v21;
        double width = v23;
        if (v25)
        {
          v40.origin.double x = v21;
          v40.origin.CGFloat y = v22;
          v40.size.double width = v23;
          v40.size.CGFloat height = v24;
          CGRect v41 = CGRectStandardize(v40);
          double x = v41.origin.x;
          double width = v41.size.width;
        }
        double v14 = v7;
        if (v15)
        {
          v42.origin.double x = v7;
          v42.origin.CGFloat y = v37;
          v42.size.CGFloat height = v38;
          v42.size.double width = v11;
          *(void *)&double v14 = (unint64_t)CGRectStandardize(v42);
        }
        if (x + width > v14)
        {
          double v31 = v21;
          if (v25)
          {
            CGFloat v32 = v22;
            double v33 = v23;
            CGFloat v34 = v24;
            unint64_t v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
            v43.origin.double x = v21;
            v43.origin.CGFloat y = v22;
            v43.size.double width = v23;
            v43.size.CGFloat height = v24;
            *(CGRect *)&double v31 = CGRectStandardize(v43);
            double v23 = v36;
            double v21 = *(double *)&v35;
          }
          if (![(CPParagraphFlow *)self intervalOverlapLeft:self->paragraphsAbove right:v21 paragraphs:v31 + v23])[(NSMutableArray *)self->paragraphsAbove addObject:v16]; {
        }
          }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (void)replaceBelow:(id)a3 withOneOf:(id)a4
{
  [(NSMutableArray *)self->paragraphsBelow removeObject:a3];
  [(CPRotatedRegion *)self->paragraph normalizedBounds];
  CGFloat v7 = v6;
  CGFloat v37 = v8;
  double v38 = v9;
  double v11 = v10;
  uint64_t v12 = [a4 count];
  if (v12)
  {
    uint64_t v13 = 0;
    double v14 = v38;
    BOOL v15 = v38 < 0.0 || v11 < 0.0;
    do
    {
      CGFloat v16 = objc_msgSend(a4, "objectAtIndex:", v13, v14);
      [v16 normalizedBounds];
      double v21 = v17;
      CGFloat v22 = v18;
      double v23 = v19;
      CGFloat v24 = v20;
      BOOL v25 = v20 < 0.0 || v19 < 0.0;
      double v26 = v17;
      if (v25) {
        *(void *)&double v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
      }
      double v27 = v7;
      double v28 = v11;
      if (v15)
      {
        v39.origin.double x = v7;
        v39.origin.CGFloat y = v37;
        v39.size.CGFloat height = v38;
        v39.size.double width = v11;
        *(CGRect *)&double v27 = CGRectStandardize(v39);
      }
      double v14 = v27 + v28;
      if (v26 < v14)
      {
        double x = v21;
        double width = v23;
        if (v25)
        {
          v40.origin.double x = v21;
          v40.origin.CGFloat y = v22;
          v40.size.double width = v23;
          v40.size.CGFloat height = v24;
          CGRect v41 = CGRectStandardize(v40);
          double x = v41.origin.x;
          double width = v41.size.width;
        }
        double v14 = v7;
        if (v15)
        {
          v42.origin.double x = v7;
          v42.origin.CGFloat y = v37;
          v42.size.CGFloat height = v38;
          v42.size.double width = v11;
          *(void *)&double v14 = (unint64_t)CGRectStandardize(v42);
        }
        if (x + width > v14)
        {
          double v31 = v21;
          if (v25)
          {
            CGFloat v32 = v22;
            double v33 = v23;
            CGFloat v34 = v24;
            unint64_t v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
            v43.origin.double x = v21;
            v43.origin.CGFloat y = v22;
            v43.size.double width = v23;
            v43.size.CGFloat height = v24;
            *(CGRect *)&double v31 = CGRectStandardize(v43);
            double v23 = v36;
            double v21 = *(double *)&v35;
          }
          if (![(CPParagraphFlow *)self intervalOverlapLeft:self->paragraphsBelow right:v21 paragraphs:v31 + v23])[(NSMutableArray *)self->paragraphsBelow addObject:v16]; {
        }
          }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (void)removeFromAbove:(id)a3
{
}

- (void)removeFromBelow:(id)a3
{
}

- (id)nextParagraphInColumn:(id)a3
{
  paragraphsBelow = self->paragraphsBelow;
  if (!paragraphsBelow) {
    return 0;
  }
  nextInColumn = self->nextInColumn;
  if (nextInColumn) {
    return nextInColumn;
  }
  uint64_t v7 = [(NSMutableArray *)paragraphsBelow count];
  nextInColumn = [(CPParagraphFlow *)self simpleRule:v7];
  if (nextInColumn) {
    return nextInColumn;
  }
  nextInColumn = [(CPParagraphFlow *)self ignoreCallouts:v7];
  if (nextInColumn) {
    return nextInColumn;
  }
  nextInColumn = [(CPParagraphFlow *)self twoSides:v7];
  if (nextInColumn) {
    return nextInColumn;
  }
  if (!v7) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = v7;
  while (objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v8), "flowProperties"), "inOrder") == 1)
  {
    nextInColumn = 0;
    if (v7 == ++v8) {
      return nextInColumn;
    }
  }
  [(NSMutableArray *)self->paragraphsBelow sortUsingSelector:sel_compareTopDescending_];
  if (v7 < 2) {
    goto LABEL_25;
  }
  nextInColumn = (CPParagraph *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:0];
  if (objc_msgSend(-[CPParagraph flowProperties](nextInColumn, "flowProperties"), "inOrder") != 1) {
    goto LABEL_25;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 1), "normalizedBounds");
  double v14 = v10;
  CGFloat v15 = v11;
  double v16 = v12;
  CGFloat v17 = v13;
  BOOL v18 = v13 < 0.0 || v12 < 0.0;
  if (v18) {
    *(CGRect *)&double v10 = CGRectStandardize(*(CGRect *)&v10);
  }
  double v19 = v11 + v13;
  [(CPRotatedRegion *)nextInColumn normalizedBounds];
  if (v22 < 0.0 || v23 < 0.0) {
    *(CGRect *)(&v21 - 1) = CGRectStandardize(*(CGRect *)&v20);
  }
  if (v19 >= v21) {
    goto LABEL_25;
  }
  double v24 = v14;
  if (v18)
  {
    CGFloat v25 = v15;
    double v26 = v16;
    CGFloat v27 = v17;
    unint64_t v28 = (unint64_t)CGRectStandardize(*(CGRect *)&v24);
    v48.origin.double x = v14;
    v48.origin.CGFloat y = v15;
    v48.size.double width = v16;
    v48.size.CGFloat height = v17;
    *(CGRect *)&double v24 = CGRectStandardize(v48);
    double v16 = v29;
    double v14 = *(double *)&v28;
  }
  if (fmin(self->fRight, v24 + v16) - fmax(self->fLeft, v14) >= (self->fRight - self->fLeft) * 0.2)
  {
LABEL_25:
    uint64_t v30 = 0;
    if (v7 <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v7;
    }
    while ((int)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v30), "flowProperties"), "inOrder") < 2)
    {
      if (v31 == ++v30)
      {
        [a3 normalizedBounds];
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        nextInColumn = (CPParagraph *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:0];
        [(CPRotatedRegion *)nextInColumn normalizedBounds];
        if (v7 >= 2)
        {
          v52.origin.double x = v33;
          v52.origin.CGFloat y = v35;
          v52.size.double width = v37;
          v52.size.CGFloat height = v39;
          CGRect v49 = CGRectUnion(*(CGRect *)&v40, v52);
          double width = v49.size.width;
          uint64_t v45 = 1;
          do
          {
            v46 = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v45, v49.origin.x, v49.origin.y);
            [(CPRotatedRegion *)v46 normalizedBounds];
            v53.origin.double x = v33;
            v53.origin.CGFloat y = v35;
            v53.size.double width = v37;
            v53.size.CGFloat height = v39;
            CGRect v49 = CGRectUnion(v50, v53);
            if (v51.size.width < width)
            {
              double width = v51.size.width;
              nextInColumn = v46;
            }
            ++v45;
          }
          while (v9 != v45);
        }
        return nextInColumn;
      }
    }
    return 0;
  }
  return nextInColumn;
}

- (id)belowTwoSides:(unsigned int)a3
{
  return 0;
}

- (id)twoSides:(unsigned int)a3
{
  if (a3 != 2) {
    return 0;
  }
  double v4 = (CPParagraph *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:0];
  double v5 = (CPParagraph *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:1];
  [(CPRotatedRegion *)v4 bottom];
  double v7 = v6;
  [(CPRotatedRegion *)v5 top];
  if (v7 <= v8)
  {
    [(CPRotatedRegion *)v5 bottom];
    double v12 = v11;
    [(CPRotatedRegion *)v4 top];
    uint64_t v9 = v5;
    if (v12 <= v13) {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = v4;
    double v4 = v5;
  }
  id v14 = [(CPParagraph *)v9 flowProperties];
  id v15 = [(CPParagraph *)v4 flowProperties];
  if ([v14 inOrder] != 1
    || [v15 inOrder] != 1
    || [v14 outOrder] != 1
    || [v15 outOrder] != 1)
  {
    return 0;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "paragraphsBelow"), "objectAtIndex:", 0);
  uint64_t v17 = objc_msgSend((id)objc_msgSend(v15, "paragraphsBelow"), "objectAtIndex:", 0);
  id result = 0;
  if (v16 == v17)
  {
    self->nextInColumn = v9;
    [v14 setNextInColumn:v4];
    objc_msgSend(v15, "setNextInColumn:", objc_msgSend((id)objc_msgSend(v15, "paragraphsBelow"), "objectAtIndex:", 0));
    return v9;
  }
  return result;
}

- (id)ignoreCallouts:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    double v7 = 0;
    while (1)
    {
      double v8 = (void *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:v5];
      uint64_t v9 = (void *)[v8 flowProperties];
      if ([v9 calloutType])
      {
        int v10 = [v9 outOrder];
        if (v10 < 2) {
          ++v6;
        }
        if (v10 > 1) {
          return 0;
        }
      }
      else
      {
        double v7 = v8;
      }
      if (a3 == ++v5) {
        goto LABEL_12;
      }
    }
  }
  double v7 = 0;
  int v6 = 0;
LABEL_12:
  if (v6 != a3 - 1) {
    return 0;
  }
  double v11 = (void *)[v7 flowProperties];
  if ([v11 inOrder:1] != 1)
  {
    [(CPRotatedRegion *)self->paragraph normalizedBounds];
    double v16 = v13;
    double v17 = v15;
    if (v14 < 0.0 || v15 < 0.0)
    {
      *(CGRect *)&double v12 = CGRectStandardize(*(CGRect *)&v12);
      double v16 = v18;
      double v17 = v19;
    }
    uint64_t v20 = objc_msgSend(v11, "paragraphsAbove", v12);
    uint64_t v21 = [v20 count];
    if (v21)
    {
      uint64_t v22 = 0;
      double v23 = v16 + v17;
      while (1)
      {
        double v24 = (CPParagraph *)[v20 objectAtIndex:v22];
        if (v24 != self->paragraph)
        {
          CGFloat v25 = v24;
          [(CPRotatedRegion *)v24 normalizedBounds];
          if (v28 < 0.0 || v29 < 0.0) {
            *(CGRect *)&double v26 = CGRectStandardize(*(CGRect *)&v26);
          }
          if (v27 < v23
            || objc_msgSend(-[CPParagraph flowProperties](v25, "flowProperties", v26), "outOrder") == 1)
          {
            break;
          }
        }
        if (v21 == ++v22) {
          return v7;
        }
      }
    }
    return 0;
  }
  return v7;
}

- (id)simpleRule:(unsigned int)a3
{
  if (a3 != 1) {
    return 0;
  }
  unsigned int v3 = (void *)[(NSMutableArray *)self->paragraphsBelow objectAtIndex:0];
  if (objc_msgSend((id)objc_msgSend(v3, "flowProperties"), "inOrder:", 1) == 1) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)setParagraphsRightIn:(id)a3
{
  unsigned int v5 = [a3 count];
  if (v5)
  {
    int v6 = [a3 indexOfObject:self->paragraph];
    id v24 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    if (v6 + 1 < v5)
    {
      uint64_t v7 = v6 + 1;
      while (1)
      {
        double v8 = (void *)[a3 objectAtIndex:v7];
        [v8 normalizedBounds];
        double y = v10;
        if (v11 < 0.0 || v12 < 0.0)
        {
          CGRect v26 = CGRectStandardize(*(CGRect *)&v9);
          double y = v26.origin.y;
        }
        if (y > self->fTop) {
          goto LABEL_22;
        }
        [v8 normalizedBounds];
        if (v16 < 0.0 || v17 < 0.0) {
          *(CGRect *)(&v15 - 1) = CGRectStandardize(*(CGRect *)&v14);
        }
        double v18 = v15 + v17;
        if (v15 + v17 < self->fBottom) {
          goto LABEL_22;
        }
        [v8 normalizedBounds];
        if (v21 < 0.0 || v22 < 0.0) {
          *(CGRect *)&double v19 = CGRectStandardize(*(CGRect *)&v19);
        }
        if (v19 < self->fRight) {
          goto LABEL_22;
        }
        if (!self->paragraphsRight) {
          break;
        }
        if (!-[CPParagraphFlow intervalOverlapTop:bottom:paragraphs:](self, "intervalOverlapTop:bottom:paragraphs:", v24, v18, y, v21, v22))
        {
          paragraphsRight = self->paragraphsRight;
LABEL_20:
          [(NSMutableArray *)paragraphsRight addObject:v8];
        }
        [v24 addObject:v8];
LABEL_22:
        if (++v7 >= v5) {
          goto LABEL_23;
        }
      }
      paragraphsRight = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      self->paragraphsRight = paragraphsRight;
      goto LABEL_20;
    }
LABEL_23:
  }
}

- (void)setParagraphsLeftIn:(id)a3
{
  if ([a3 count])
  {
    int v5 = [a3 indexOfObject:self->paragraph];
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    if (v5 >= 1)
    {
      uint64_t v6 = v5 + 1;
      while (1)
      {
        uint64_t v7 = (void *)[a3 objectAtIndex:(v6 - 2)];
        [v7 normalizedBounds];
        double y = v9;
        if (v10 < 0.0 || v11 < 0.0)
        {
          CGRect v25 = CGRectStandardize(*(CGRect *)&v8);
          double y = v25.origin.y;
        }
        if (y > self->fTop) {
          goto LABEL_22;
        }
        [v7 normalizedBounds];
        if (v15 < 0.0 || v16 < 0.0) {
          *(CGRect *)(&v14 - 1) = CGRectStandardize(*(CGRect *)&v13);
        }
        double v17 = v14 + v16;
        if (v14 + v16 < self->fBottom) {
          goto LABEL_22;
        }
        [v7 normalizedBounds];
        if (v20 < 0.0 || v21 < 0.0) {
          *(CGRect *)&double v18 = CGRectStandardize(*(CGRect *)&v18);
        }
        if (v18 + v20 > self->fLeft) {
          goto LABEL_22;
        }
        if (!self->paragraphsLeft) {
          break;
        }
        if (![(CPParagraphFlow *)self intervalOverlapTop:v23 bottom:v17 paragraphs:y])
        {
          paragraphsLeft = self->paragraphsLeft;
LABEL_20:
          [(NSMutableArray *)paragraphsLeft addObject:v7];
        }
        [v23 addObject:v7];
LABEL_22:
        if ((unint64_t)--v6 <= 1) {
          goto LABEL_23;
        }
      }
      paragraphsLeft = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      self->paragraphsLeft = paragraphsLeft;
      goto LABEL_20;
    }
LABEL_23:
  }
}

- (void)setParagraphsBelowIn:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    [(CPRotatedRegion *)self->paragraph top];
    double v7 = v6;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v9 = [(CPObject *)self->paragraph lastChild];
    [v9 baseline];
    double v11 = v10;
    int v12 = [v9 leftSpacerIndex];
    int v13 = [v9 rightSpacerIndex];
    uint64_t v14 = 0;
    while (1)
    {
      double v15 = (CPParagraph *)objc_msgSend(a3, "objectAtIndex:", v14, v33, v34);
      if (v15 != self->paragraph)
      {
        double v16 = v15;
        long long v33 = 0u;
        long long v34 = 0u;
        double v17 = boundsForOverlap(v15, v12, v13);
        double v21 = v17;
        CGFloat v22 = v18;
        double v23 = v19;
        CGFloat v24 = v20;
        *(double *)&long long v33 = v17;
        *((double *)&v33 + 1) = v18;
        *(double *)&long long v34 = v19;
        *((double *)&v34 + 1) = v20;
        if (v19 < 0.0 || v20 < 0.0)
        {
          double v26 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v17));
          if (v26 <= self->fRight)
          {
            v35.origin.double x = v21;
            v35.origin.double y = v22;
            v35.size.double width = v23;
            v35.size.CGFloat height = v24;
            CGRect v36 = CGRectStandardize(v35);
            double v25 = v36.origin.y + v36.size.height;
            v36.origin.double x = v21;
            v36.origin.double y = v22;
            v36.size.double width = v23;
            v36.size.CGFloat height = v24;
            *(CGRect *)&double v17 = CGRectStandardize(v36);
            double v23 = v27;
            double v21 = v26;
LABEL_10:
            if (v17 + v23 < self->fLeft || v25 >= v7 || v25 - v11 > 2.0) {
              goto LABEL_24;
            }
            if (self->paragraphsBelow)
            {
              if (!-[CPParagraphFlow intervalOverlapLeft:right:rects:](self, "intervalOverlapLeft:right:rects:", v8, v21, v33, v34))
              {
                paragraphsBelow = self->paragraphsBelow;
                goto LABEL_22;
              }
            }
            else
            {
              id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
              paragraphsBelow = (NSMutableArray *)objc_msgSend(v31, "initWithCapacity:", 1, v33, v34);
              self->paragraphsBelow = paragraphsBelow;
LABEL_22:
              [(NSMutableArray *)paragraphsBelow addObject:v16];
            }
            double v32 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:&v33 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            [v8 addObject:v32];
          }
        }
        else if (v17 <= self->fRight)
        {
          double v25 = v18 + v20;
          goto LABEL_10;
        }
      }
LABEL_24:
      if (v5 == ++v14)
      {

        return;
      }
    }
  }
}

- (id)paragraphsRight
{
  return self->paragraphsRight;
}

- (id)paragraphsLeft
{
  return self->paragraphsLeft;
}

- (id)paragraphsBelow
{
  return self->paragraphsBelow;
}

- (id)paragraphsAbove
{
  return self->paragraphsAbove;
}

- (void)setParagraphsAboveIn:(id)a3
{
  unsigned int v5 = [a3 count];
  if (v5)
  {
    int v6 = [a3 indexOfObject:self->paragraph];
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v8 = [(CPObject *)self->paragraph firstChild];
    int v9 = [v8 leftSpacerIndex];
    int v10 = [v8 rightSpacerIndex];
    if (v6 + 1 < v5)
    {
      int v11 = v10;
      for (uint64_t i = v6 + 1; i < v5; ++i)
      {
        int v13 = objc_msgSend(a3, "objectAtIndex:", i, v27, v28);
        long long v27 = 0u;
        long long v28 = 0u;
        double v14 = boundsForOverlap(v13, v9, v11);
        double v18 = v14;
        CGFloat v19 = v15;
        double v20 = v16;
        CGFloat v21 = v17;
        *(double *)&long long v27 = v14;
        *((double *)&v27 + 1) = v15;
        *(double *)&long long v28 = v16;
        *((double *)&v28 + 1) = v17;
        if (v16 < 0.0 || v17 < 0.0)
        {
          double v22 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v14));
          if (v22 > self->fRight) {
            continue;
          }
          v29.origin.double x = v18;
          v29.origin.double y = v19;
          v29.size.double width = v20;
          v29.size.CGFloat height = v21;
          *(CGRect *)&double v14 = CGRectStandardize(v29);
          double v20 = v23;
          double v18 = v22;
        }
        else if (v14 > self->fRight)
        {
          continue;
        }
        if (v14 + v20 >= self->fLeft)
        {
          if (self->paragraphsAbove)
          {
            if (!-[CPParagraphFlow intervalOverlapLeft:right:rects:](self, "intervalOverlapLeft:right:rects:", v7, v18, v27, v28))
            {
              paragraphsAbove = self->paragraphsAbove;
              goto LABEL_15;
            }
          }
          else
          {
            id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
            paragraphsAbove = (NSMutableArray *)objc_msgSend(v25, "initWithCapacity:", 1, v27, v28);
            self->paragraphsAbove = paragraphsAbove;
LABEL_15:
            [(NSMutableArray *)paragraphsAbove addObject:v13];
          }
          double v26 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:&v27 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v7 addObject:v26];
        }
      }
    }
  }
}

- (BOOL)intervalOverlapTop:(double)a3 bottom:(double)a4 paragraphs:(id)a5
{
  unint64_t v8 = [a5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "normalizedBounds");
      CGFloat v15 = v11;
      double y = v12;
      CGFloat v17 = v13;
      CGFloat v18 = v14;
      if (v13 < 0.0 || v14 < 0.0)
      {
        CGRect v22 = CGRectStandardize(*(CGRect *)&v11);
        double v19 = v22.origin.y + v22.size.height;
        v22.origin.double x = v15;
        v22.origin.double y = y;
        v22.size.double width = v17;
        v22.size.CGFloat height = v18;
        CGRect v23 = CGRectStandardize(v22);
        double y = v23.origin.y;
      }
      else
      {
        double v19 = v12 + v14;
      }
      if (v19 > a4 && y < a3) {
        break;
      }
      BOOL v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 paragraphs:(id)a5
{
  unint64_t v8 = [a5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "normalizedBounds");
      double x = v11;
      CGFloat v16 = v12;
      double width = v13;
      CGFloat v18 = v14;
      if (v13 < 0.0 || v14 < 0.0)
      {
        *(void *)&double v19 = (unint64_t)CGRectStandardize(*(CGRect *)&v11);
        v22.origin.double x = x;
        v22.origin.double y = v16;
        v22.size.double width = width;
        v22.size.CGFloat height = v18;
        CGRect v23 = CGRectStandardize(v22);
        double x = v23.origin.x;
        double width = v23.size.width;
      }
      else
      {
        double v19 = v11;
      }
      if (x + width > a3 && v19 < a4) {
        break;
      }
      BOOL v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 rects:(id)a5
{
  CGRect rect = CGRectNull;
  unint64_t v8 = [a5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "getValue:", &rect);
      double x = rect.origin.x;
      CGFloat height = rect.size.height;
      double width = rect.size.width;
      if (rect.size.width < 0.0 || rect.size.height < 0.0)
      {
        unint64_t v15 = (unint64_t)CGRectStandardize(rect);
        v20.origin.double y = rect.origin.y;
        v20.origin.double x = x;
        v20.size.double width = width;
        v20.size.CGFloat height = height;
        *(CGRect *)&CGFloat v14 = CGRectStandardize(v20);
        double width = v16;
        double x = *(double *)&v15;
      }
      else
      {
        CGFloat v14 = rect.origin.x;
      }
      if (v14 + width > a3 && x < a4) {
        break;
      }
      BOOL v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (int64_t)topDescending:(id)a3
{
  [(CPRotatedRegion *)[(CPParagraphFlow *)self paragraph] top];
  double v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "paragraph"), "top");
  if (v5 <= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%d,%d),(%d,%d),[%d],%@", -[CPParagraphFlow inOrder](self, "inOrder"), -[CPParagraphFlow outOrder](self, "outOrder"), -[CPParagraphFlow leftOrder](self, "leftOrder"), -[CPParagraphFlow rightOrder](self, "rightOrder"), self->calloutType, -[CPParagraph description](self->paragraph, "description")];
}

- (void)dealloc
{
  [(CPParagraph *)self->paragraph setFlowProperties:0];

  v3.receiver = self;
  v3.super_class = (Class)CPParagraphFlow;
  [(CPParagraphFlow *)&v3 dealloc];
}

- (CPParagraphFlow)initWithParagraph:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CPParagraphFlow;
  double v4 = [(CPParagraphFlow *)&v15 init];
  if (v4)
  {
    v4->paragraph = (CPParagraph *)a3;
    [a3 setFlowProperties:v4];
    [(CPRotatedRegion *)v4->paragraph normalizedBounds];
    CGFloat v9 = v5;
    CGFloat y = v6;
    CGFloat v11 = v7;
    CGFloat v12 = v8;
    if (v7 < 0.0 || v8 < 0.0)
    {
      CGRect v16 = CGRectStandardize(*(CGRect *)&v5);
      v4->fLeft = v16.origin.x;
      v4->fRight = v16.origin.x + v16.size.width;
      v16.origin.double x = v9;
      v16.origin.CGFloat y = y;
      v16.size.double width = v11;
      v16.size.CGFloat height = v12;
      CGRect v17 = CGRectStandardize(v16);
      CGFloat y = v17.origin.y;
      double v13 = v17.origin.y + v17.size.height;
    }
    else
    {
      v4->fLeft = v5;
      v4->fRight = v5 + v7;
      double v13 = v6 + v8;
    }
    v4->fTop = v13;
    v4->fBottom = y;
    v4->adjacentToCallout = 0;
    v4->calloutType = 0;
    v4->nextInColumn = 0;
    *(_OWORD *)&v4->paragraphsAbove = 0u;
    *(_OWORD *)&v4->paragraphsLeft = 0u;
  }
  return v4;
}

@end