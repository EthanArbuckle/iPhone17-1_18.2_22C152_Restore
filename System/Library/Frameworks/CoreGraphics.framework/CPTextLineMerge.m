@interface CPTextLineMerge
- (BOOL)fits:(id)a3 into:(id)a4;
- (BOOL)hasOverlappingLines;
- (double)averageHeight:(id)a3;
- (id)findLineFor:(id)a3 in:(id)a4;
- (unsigned)countOverlapsOfLineAtIndex:(unsigned int)a3 in:(id)a4;
- (void)addInterval:(id)a3 to:(id)a4;
- (void)detachDropCaps:(id)a3 to:(id)a4;
- (void)dropCaps:(id)a3 to:(id)a4;
- (void)eliminate:(id)a3;
- (void)makeOverlappingLinesTo:(id)a3;
- (void)mergeByColumn:(id)a3;
- (void)mergeColumn:(id)a3 overlapping:(id)a4;
- (void)mergeLinesIn:(id)a3;
- (void)mergeLinesInInterval:(id)a3 from:(id)a4;
- (void)removeOverlapping:(id)a3;
@end

@implementation CPTextLineMerge

- (void)mergeLinesIn:(id)a3
{
  unsigned int v5 = [a3 count];
  if ((v5 & 0xFFFFFFFE) != 0)
  {
    unsigned int v6 = v5;
    [a3 sortUsingFunction:sortTopDescending context:0];
    self->avail = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a3];
    if ([(CPTextLineMerge *)self hasOverlappingLines])
    {
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
      while ([(NSMutableArray *)self->avail count])
      {
        [(CPTextLineMerge *)self makeOverlappingLinesTo:v7];
        if ((int)[v7 count] < 2)
        {
          [(NSMutableArray *)self->avail removeObjectAtIndex:0];
        }
        else
        {
          [(CPTextLineMerge *)self dropCaps:v7 to:a3];
          if ((int)[v7 count] >= 2)
          {
            [(CPTextLineMerge *)self eliminate:v7];
            if ((int)[v7 count] >= 2) {
              [(CPTextLineMerge *)self mergeByColumn:v7];
            }
          }
          [(CPTextLineMerge *)self removeOverlapping:v7];
        }
        [v7 removeAllObjects];
      }

      self->avail = 0;
    }
    else
    {

      self->avail = 0;
    }
  }
}

- (void)dropCaps:(id)a3 to:(id)a4
{
  -[CPTextLineMerge detachDropCaps:to:](self, "detachDropCaps:to:");
  [(CPTextLineMerge *)self averageHeight:a4];
  double v8 = v7;
  int v9 = [a3 count];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = (v9 - 1);
  if (v9 >= 1)
  {
    double v11 = v8 + v8;
    unint64_t v12 = v9 + 1;
    do
    {
      v13 = (void *)[a3 objectAtIndex:(v12 - 2)];
      if ([v13 length] == 1)
      {
        [v13 bounds];
        if (v16 < 0.0 || v17 < 0.0) {
          *(CGRect *)&double v14 = CGRectStandardize(*(CGRect *)&v14);
        }
        if (v17 > v11
          && -[CPTextLineMerge countOverlapsOfLineAtIndex:in:](self, "countOverlapsOfLineAtIndex:in:", v10, a3, v14, v15, v16))
        {
          [v23 addObject:v13];
          [a3 removeObjectAtIndex:(v12 - 2)];
        }
      }
      --v12;
      uint64_t v10 = (v10 - 1);
    }
    while (v12 > 1);
  }
  int v18 = [v23 count];
  if (v18 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = v18;
    do
    {
      v21 = (void *)[v23 objectAtIndex:v19];
      [(NSMutableArray *)self->avail removeObject:v21];
      id v22 = [(CPTextLineMerge *)self findLineFor:v21 in:a3];
      if (v22)
      {
        [v22 mergeByAnchorXIncreasingYDecreasing:v21];
        [v21 removeAllChars];
      }
      ++v19;
    }
    while (v20 != v19);
  }
}

- (double)averageHeight:(id)a3
{
  int v4 = [a3 count];
  int v5 = v4;
  if (!v4) {
    return 0.0;
  }
  if (v4 < 1)
  {
    double v8 = 0.0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = v4;
    double v8 = 0.0;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6), "bounds");
      if (v11 < 0.0 || v12 < 0.0) {
        *(CGRect *)(&v12 - 3) = CGRectStandardize(*(CGRect *)&v9);
      }
      double v8 = v8 + v12;
      ++v6;
    }
    while (v7 != v6);
  }
  return v8 / (double)v5;
}

- (id)findLineFor:(id)a3 in:(id)a4
{
  [a3 bounds];
  double v6 = v5;
  CGFloat rect_16 = v7;
  double v9 = v8;
  double v11 = v10;
  int v12 = [a4 count];
  if (v12 < 1) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = v12;
  BOOL v15 = v11 < 0.0 || v9 < 0.0;
  double v31 = v6 + v9;
  CGFloat rect = v6;
  while (1)
  {
    double v16 = objc_msgSend(a4, "objectAtIndex:", v13, *(void *)&v31);
    [v16 normalizedBounds];
    CGFloat v21 = v17;
    double y = v18;
    CGFloat v23 = v19;
    CGFloat v24 = v20;
    BOOL v25 = v20 < 0.0 || v19 < 0.0;
    double v26 = v17;
    if (v25) {
      *(void *)&double v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
    }
    if (v15)
    {
      v34.origin.x = rect;
      v34.origin.double y = rect_16;
      v34.size.width = v9;
      v34.size.height = v11;
      CGRect v35 = CGRectStandardize(v34);
      double v27 = v26 - (v35.origin.x + v35.size.width);
      v35.origin.x = rect;
      v35.origin.double y = rect_16;
      v35.size.width = v9;
      v35.size.height = v11;
      CGRect v36 = CGRectStandardize(v35);
    }
    else
    {
      double v27 = v26 - v31;
      v36.size.width = v9;
    }
    if (v27 <= v36.size.width)
    {
      if (v25)
      {
        v37.origin.x = v21;
        v37.origin.double y = y;
        v37.size.width = v23;
        v37.size.height = v24;
        CGRect v38 = CGRectStandardize(v37);
        double y = v38.origin.y;
      }
      double v28 = rect_16;
      double v29 = v11;
      if (v15)
      {
        v39.origin.x = rect;
        v39.origin.double y = rect_16;
        v39.size.width = v9;
        v39.size.height = v11;
        *(CGRect *)(&v28 - 1) = CGRectStandardize(v39);
      }
      if (y < v28 + v29) {
        break;
      }
    }
    if (v14 == ++v13) {
      return 0;
    }
  }
  return v16;
}

- (void)detachDropCaps:(id)a3 to:(id)a4
{
  int v6 = [a3 count];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    do
    {
      double v9 = (void *)[a3 objectAtIndex:v7];
      if ([v9 length] >= 2) {
        [v9 removeSubsequences:v10 whereTrue:sizeChange passing:0];
      }
      ++v7;
    }
    while (v8 != v7);
  }
  if ([v10 count])
  {
    [a3 addObjectsFromArray:v10];
    [a4 addObjectsFromArray:v10];
  }
  [a3 sortUsingFunction:sortTopDescending context:0];
}

- (unsigned)countOverlapsOfLineAtIndex:(unsigned int)a3 in:(id)a4
{
  uint64_t v5 = a3;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", a3), "normalizedBounds");
  CGFloat v10 = v6;
  double y = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  if (v8 < 0.0 || v9 < 0.0)
  {
    CGRect v27 = CGRectStandardize(*(CGRect *)&v6);
    double v14 = v27.origin.y + v27.size.height;
    v27.origin.x = v10;
    v27.origin.double y = y;
    v27.size.width = v12;
    v27.size.height = v13;
    CGRect v28 = CGRectStandardize(v27);
    double y = v28.origin.y;
  }
  else
  {
    double v14 = v7 + v9;
  }
  uint64_t v15 = [a4 count];
  if (v15)
  {
    uint64_t v16 = 0;
    unsigned int v17 = 0;
    while (1)
    {
      if (v5 != v16)
      {
        objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v16), "normalizedBounds");
        CGFloat v22 = v18;
        double v23 = v19;
        CGFloat v24 = v20;
        CGFloat v25 = v21;
        if (v20 < 0.0 || v21 < 0.0)
        {
          CGRect v29 = CGRectStandardize(*(CGRect *)&v18);
          if (y < v29.origin.y + v29.size.height)
          {
            v30.origin.x = v22;
            v30.origin.double y = v23;
            v30.size.width = v24;
            v30.size.height = v25;
            CGRect v31 = CGRectStandardize(v30);
            double v23 = v31.origin.y;
LABEL_14:
            if (v14 > v23) {
              ++v17;
            }
          }
        }
        else if (y < v19 + v21)
        {
          goto LABEL_14;
        }
      }
      if (v15 == ++v16) {
        return v17;
      }
    }
  }
  return 0;
}

- (void)removeOverlapping:(id)a3
{
  int v5 = [a3 count];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    do
      -[NSMutableArray removeObject:](self->avail, "removeObject:", [a3 objectAtIndex:v6++]);
    while (v7 != v6);
  }
}

- (void)makeOverlappingLinesTo:(id)a3
{
  int v5 = (void *)[(NSMutableArray *)self->avail objectAtIndex:0];
  [a3 addObject:v5];
  [v5 normalizedBounds];
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  unsigned int v14 = [(NSMutableArray *)self->avail count];
  if ((v14 & 0xFFFFFFFE) != 0)
  {
    unsigned int v16 = v14;
    if (v11 < 0.0 || v13 < 0.0)
    {
      v29.origin.x = v7;
      v29.origin.double y = v9;
      v29.size.width = v11;
      v29.size.height = v13;
      *(CGRect *)&double v15 = CGRectStandardize(v29);
      double v9 = v17;
    }
    uint64_t v18 = v16;
    uint64_t v19 = 1;
    do
    {
      double v20 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v19, v15);
      [v20 normalizedBounds];
      CGFloat v25 = v21;
      double y = v22;
      CGFloat v27 = v23;
      CGFloat v28 = v24;
      if (v23 < 0.0 || v24 < 0.0)
      {
        CGRect v30 = CGRectStandardize(*(CGRect *)&v21);
        if (v9 - (v30.origin.y + v30.size.height) >= -2.0) {
          return;
        }
        ++v19;
        v31.origin.x = v25;
        v31.origin.double y = y;
        v31.size.width = v27;
        v31.size.height = v28;
        CGRect v32 = CGRectStandardize(v31);
        double y = v32.origin.y;
      }
      else
      {
        if (v9 - (v22 + v24) >= -2.0) {
          return;
        }
        ++v19;
      }
      [a3 addObject:v20];
      if (y < v9) {
        double v9 = y;
      }
    }
    while (v19 != v18);
  }
}

- (BOOL)hasOverlappingLines
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0), "normalizedBounds");
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unsigned int v11 = [(NSMutableArray *)self->avail count];
  if ((v11 & 0xFFFFFFFE) != 0)
  {
    unsigned int v13 = v11;
    if (v8 < 0.0 || v10 < 0.0)
    {
      v28.origin.x = v4;
      v28.origin.double y = v6;
      v28.size.width = v8;
      v28.size.height = v10;
      *(CGRect *)&double v12 = CGRectStandardize(v28);
      double v6 = v14;
    }
    unint64_t v15 = v13;
    uint64_t v16 = 1;
    BOOL v17 = 1;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v16, v12), "normalizedBounds");
      CGFloat v22 = v18;
      double v23 = v19;
      CGFloat v24 = v20;
      CGFloat v25 = v21;
      if (v20 < 0.0 || v21 < 0.0)
      {
        CGRect v29 = CGRectStandardize(*(CGRect *)&v18);
        if (v29.origin.y + v29.size.height > v6) {
          return v17;
        }
        v30.origin.x = v22;
        v30.origin.double y = v23;
        v30.size.width = v24;
        v30.size.height = v25;
        *(CGRect *)&double v12 = CGRectStandardize(v30);
        double v23 = v26;
      }
      else
      {
        double v12 = v19 + v21;
        if (v19 + v21 > v6) {
          return v17;
        }
      }
      if (v23 < v6) {
        double v6 = v23;
      }
      BOOL v17 = ++v16 < v15;
    }
    while (v15 != v16);
  }
  else
  {
    return 0;
  }
  return v17;
}

- (void)eliminate:(id)a3
{
  uint64_t v5 = 0;
  int v6 = [a3 count] - 1;
  while ((v6 & ~(v6 >> 31)) != v5)
  {
    int v7 = v5;
    uint64_t v8 = [a3 objectAtIndex:v5++];
    if (!-[CPTextLineMerge fits:into:](self, "fits:into:", v8, [a3 objectAtIndex:v5]))
    {
      if (v6 > v7)
      {
        uint64_t v9 = v6;
        do
          [a3 removeObjectAtIndex:v9--];
        while (v9 > v7);
      }
      return;
    }
  }
}

- (void)mergeByColumn:(id)a3
{
  id v36 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  int v5 = [a3 count];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    do
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:v6];
      [v8 normalizedBounds];
      double x = v9;
      CGFloat v12 = v11;
      double width = v13;
      double v16 = v15;
      int v17 = [v8 length];
      if (v17)
      {
        int v18 = v17;
        uint64_t v19 = [v8 charAtIndex:0];
        uint64_t v20 = [v8 charAtIndex:(v18 - 1)];
        double v21 = *(void **)(*(void *)(v19 + 160) + 64);
        CGFloat v22 = *(void **)(*(void *)(v20 + 160) + 64);
        double v23 = 0.0;
        double v24 = 0.0;
        if (v21)
        {
          [v21 spaceWidth];
          double v24 = v25 * 0.25;
        }
        if (v22)
        {
          [v22 spaceWidth];
          double v23 = v26 * 0.25;
        }
        CGFloat v27 = [CPInterval alloc];
        if (width < 0.0 || v16 < 0.0)
        {
          v38.origin.double x = x;
          v38.origin.double y = v12;
          v38.size.double width = width;
          v38.size.height = v16;
          double v28 = COERCE_DOUBLE(CGRectStandardize(v38)) - v24;
          v39.origin.double x = x;
          v39.origin.double y = v12;
          v39.size.double width = width;
          v39.size.height = v16;
          CGRect v40 = CGRectStandardize(v39);
          double x = v40.origin.x;
          double width = v40.size.width;
        }
        else
        {
          double v28 = x - v24;
        }
        id v29 = [(CPInterval *)v27 initLeft:v28 right:v23 + x + width];
        [(CPTextLineMerge *)self addInterval:v29 to:v36];
      }
      ++v6;
    }
    while (v7 != v6);
  }
  int v30 = [v36 count];
  CGRect v31 = (void *)[a3 mutableCopy];
  if (v30 >= 1)
  {
    uint64_t v32 = 0;
    uint64_t v33 = v30;
    do
    {
      uint64_t v34 = [v36 objectAtIndex:v32];
      int v35 = [v31 count];
      [(CPTextLineMerge *)self mergeLinesInInterval:v34 from:v31];
      if ([v31 count] != v35) {
        [(CPTextLineMerge *)self mergeByColumn:v31];
      }
      ++v32;
    }
    while (v33 != v32);
  }
}

- (void)mergeLinesInInterval:(id)a3 from:(id)a4
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v7 = [a4 count];
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
    do
    {
      uint64_t v10 = [a4 objectAtIndex:v8];
      if ([a3 contains:v10]) {
        [v11 addObject:v10];
      }
      ++v8;
    }
    while (v9 != v8);
  }
  if ((int)[v11 count] > 1) {
    [(CPTextLineMerge *)self mergeColumn:v11 overlapping:a4];
  }
}

- (void)mergeColumn:(id)a3 overlapping:(id)a4
{
  unsigned int v7 = [a3 count];
  if (v7)
  {
    uint64_t v8 = [a3 objectAtIndex:0];
    if (v7 != 1)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = v7;
      for (uint64_t i = 1; i != v10; ++i)
      {
        CGFloat v12 = (void *)[a3 objectAtIndex:i];
        [v9 normalizedBounds];
        CGFloat v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        [v12 normalizedBounds];
        double v25 = v22;
        double v26 = v24;
        if (v23 < 0.0 || v24 < 0.0)
        {
          *(CGRect *)&double v21 = CGRectStandardize(*(CGRect *)&v21);
          double v25 = v27;
          double v26 = v28;
        }
        if (v18 < 0.0 || v20 < 0.0)
        {
          v35.origin.double x = v14;
          v35.origin.double y = v16;
          v35.size.double width = v18;
          v35.size.height = v20;
          *(CGRect *)&double v21 = CGRectStandardize(v35);
          double v16 = v29;
        }
        double v30 = 0.0;
        double v31 = 0.0;
        if (objc_msgSend(v12, "length", v21)) {
          double v31 = *(double *)([v12 charAtIndex:0] + 168);
        }
        if ([v9 length]) {
          double v30 = *(double *)([v9 charAtIndex:0] + 168);
        }
        double v32 = vabdd_f64(v31, v30);
        double v33 = vabdd_f64(360.0 - v31, v30);
        if (v32 >= v33) {
          double v32 = v33;
        }
        double v34 = vabdd_f64(v31, 360.0 - v30);
        if (v32 >= v34) {
          double v32 = v34;
        }
        if (v25 + v26 - v16 > 2.0 && v32 < 1.0 && [(CPTextLineMerge *)self fits:v9 into:v12])
        {
          [v9 mergeByAnchorXIncreasingYDecreasing:v12];
          [v12 removeAllChars];
          [a4 removeObject:v12];
        }
        else
        {
          uint64_t v9 = v12;
        }
      }
    }
  }
}

- (void)addInterval:(id)a3 to:(id)a4
{
  [a3 left];
  double v7 = v6;
  [a3 right];
  double v9 = v8;
  int v10 = [a4 count];
  int v11 = v10;
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10;
    do
    {
      CGFloat v14 = (void *)[a4 objectAtIndex:v12];
      if ([a3 intersects:v14])
      {
        [v14 left];
        double v16 = v15;
        [v14 right];
        if (v16 < v7) {
          double v7 = v16;
        }
        if (v17 > v9) {
          double v9 = v17;
        }
      }
      ++v12;
    }
    while (v13 != v12);
  }
  id v19 = [[CPInterval alloc] initLeft:v7 right:v9];
  if (v11 >= 1)
  {
    unint64_t v18 = v11 + 1;
    do
    {
      if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", (v18 - 2)), "intersects:", v19))objc_msgSend(a4, "removeObjectAtIndex:", (v18 - 2)); {
      --v18;
      }
    }
    while (v18 > 1);
  }
  [a4 addObject:v19];
}

- (BOOL)fits:(id)a3 into:(id)a4
{
  double v6 = 0.0;
  double v7 = 0.0;
  if (objc_msgSend(a3, "length", 0x3FE0000000000000, 0x3FF0000000000000)) {
    double v7 = *(double *)([a3 charAtIndex:0] + 104);
  }
  if ([a4 length]) {
    double v6 = *(double *)([a4 charAtIndex:0] + 104);
  }
  uint64_t v10 = 0;
  if (vabdd_f64(v7, v6) <= 2.0)
  {
    *(void *)&long long v9 = 0x3FF0000000000000;
    LOBYTE(v10) = 1;
  }
  return [a3 map:fits whereNeighborsWith:a4 passing:&v9];
}

@end