@interface OrgApacheLuceneUtilSorter
+ (int)heapChildWithInt:(int)a3 withInt:(int)a4;
+ (int)heapParentWithInt:(int)a3 withInt:(int)a4;
- (int)lower2WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)lowerWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)upper2WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)upperWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)binarySortWithInt:(int)a3 withInt:(int)a4;
- (void)binarySortWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)checkRangeWithInt:(int)a3 withInt:(int)a4;
- (void)doRotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)heapSortWithInt:(int)a3 withInt:(int)a4;
- (void)heapifyWithInt:(int)a3 withInt:(int)a4;
- (void)insertionSortWithInt:(int)a3 withInt:(int)a4;
- (void)mergeInPlaceWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)reverseWithInt:(int)a3 withInt:(int)a4;
- (void)rotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)siftDownWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilSorter

- (void)checkRangeWithInt:(int)a3 withInt:(int)a4
{
  if (a4 < a3)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"'to' must be >= 'from', got from=");
    v9 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (void)mergeInPlaceWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3 != a4)
  {
    uint64_t v6 = *(void *)&a4;
    if (a4 != a5
      && (int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:(a4 - 1) withInt:*(void *)&a4] >= 1)
    {
      if (a5 - a3 == 2)
      {
        [(OrgApacheLuceneUtilSorter *)self swapWithInt:(v6 - 1) withInt:v6];
      }
      else
      {
        LODWORD(v9) = a3 - 1;
        unsigned int v10 = v6 - a3 + 1;
        do
        {
          uint64_t v9 = (v9 + 1);
          --v10;
        }
        while ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:v6] < 1);
        LODWORD(v11) = a5 + 1;
        do
        {
          int v12 = [(OrgApacheLuceneUtilSorter *)self compareWithInt:(v6 - 1) withInt:(v11 - 2)];
          uint64_t v11 = (v11 - 1);
        }
        while (v12 < 1);
        unsigned int v13 = v11 - v6;
        if ((int)v6 - (int)v9 <= (int)v11 - (int)v6)
        {
          unsigned int v16 = v13 >> 1;
          uint64_t v15 = v6 + (v13 >> 1);
          uint64_t v14 = [(OrgApacheLuceneUtilSorter *)self upperWithInt:v9 withInt:v6 withInt:v15];
        }
        else
        {
          uint64_t v14 = v9 + (v10 >> 1);
          uint64_t v15 = [(OrgApacheLuceneUtilSorter *)self lowerWithInt:v6 withInt:v11 withInt:v14];
          unsigned int v16 = v15 - v6;
        }
        if (v14 != v6 && v15 != v6) {
          [(OrgApacheLuceneUtilSorter *)self doRotateWithInt:v14 withInt:v6 withInt:v15];
        }
        [(OrgApacheLuceneUtilSorter *)self mergeInPlaceWithInt:v9 withInt:v14 withInt:v16 + v14];
        [(OrgApacheLuceneUtilSorter *)self mergeInPlaceWithInt:v16 + v14 withInt:v15 withInt:v11];
      }
    }
  }
}

- (int)lowerWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a3;
  unsigned int v6 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    uint64_t v7 = *(void *)&a5;
    do
    {
      if ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v5 + (v6 >> 1) withInt:v7] >= 0)
      {
        v6 >>= 1;
      }
      else
      {
        v5 += (v6 >> 1) + 1;
        v6 += ~(v6 >> 1);
      }
    }
    while ((int)v6 > 0);
  }
  return v5;
}

- (int)upperWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a3;
  unsigned int v6 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    uint64_t v7 = *(void *)&a5;
    do
    {
      if ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v7 withInt:v5 + (v6 >> 1)] < 0)
      {
        v6 >>= 1;
      }
      else
      {
        v5 += (v6 >> 1) + 1;
        v6 += ~(v6 >> 1);
      }
    }
    while ((int)v6 > 0);
  }
  return v5;
}

- (int)lower2WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = (a4 - 1);
  if ((int)v9 <= a3)
  {
    uint64_t v10 = *(void *)&a4;
LABEL_6:
    uint64_t v11 = self;
    uint64_t v12 = v7;
    uint64_t v13 = v10;
  }
  else
  {
    while (1)
    {
      uint64_t v10 = v9;
      if (([(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:v5] & 0x80000000) != 0) {
        break;
      }
      uint64_t v9 = (v10 + 2 * (v10 - v6));
      uint64_t v6 = v10;
      if ((int)v9 <= (int)v7) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = v10;
    uint64_t v13 = v6;
  }
  return [(OrgApacheLuceneUtilSorter *)v11 lowerWithInt:v12 withInt:v13 withInt:v5];
}

- (int)upper2WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = (a3 + 1);
  if ((int)v9 >= a4)
  {
    uint64_t v10 = *(void *)&a3;
LABEL_6:
    uint64_t v11 = self;
    uint64_t v12 = v10;
    uint64_t v13 = v6;
  }
  else
  {
    while (1)
    {
      uint64_t v10 = v9;
      if ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:v5] >= 1) {
        break;
      }
      uint64_t v9 = (v10 + 2 * (v10 - v7));
      uint64_t v7 = v10;
      if ((int)v9 >= (int)v6) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = v7;
    uint64_t v13 = v10;
  }
  return [(OrgApacheLuceneUtilSorter *)v11 upperWithInt:v12 withInt:v13 withInt:v5];
}

- (void)reverseWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = (a4 - 1);
  if ((int)v4 > a3)
  {
    uint64_t v5 = *(void *)&a3;
    do
    {
      [(OrgApacheLuceneUtilSorter *)self swapWithInt:v5 withInt:v4];
      uint64_t v5 = (v5 + 1);
      uint64_t v4 = (v4 - 1);
    }
    while ((int)v5 < (int)v4);
  }
}

- (void)rotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3 != a4 && a4 != a5) {
    -[OrgApacheLuceneUtilSorter doRotateWithInt:withInt:withInt:](self, "doRotateWithInt:withInt:withInt:");
  }
}

- (void)doRotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (a4 - a3 == a5 - a4)
  {
    if (a5 > a4)
    {
      do
      {
        int v9 = v6 + 1;
        [(OrgApacheLuceneUtilSorter *)self swapWithInt:v7 withInt:v6];
        uint64_t v7 = (v7 + 1);
        uint64_t v6 = (v6 + 1);
      }
      while (a5 != v9);
    }
  }
  else
  {
    uint64_t v10 = (a4 - 1);
    if ((int)v10 > a3)
    {
      uint64_t v11 = *(void *)&a3;
      do
      {
        [(OrgApacheLuceneUtilSorter *)self swapWithInt:v11 withInt:v10];
        uint64_t v11 = (v11 + 1);
        uint64_t v10 = (v10 - 1);
      }
      while ((int)v11 < (int)v10);
    }
    uint64_t v12 = (a5 - 1);
    if ((int)v12 > (int)v6)
    {
      uint64_t v13 = v12;
      do
      {
        [(OrgApacheLuceneUtilSorter *)self swapWithInt:v6 withInt:v13];
        uint64_t v6 = (v6 + 1);
        uint64_t v13 = (v13 - 1);
      }
      while ((int)v6 < (int)v13);
    }
    for (; (int)v7 < (int)v12; uint64_t v12 = (v12 - 1))
    {
      [(OrgApacheLuceneUtilSorter *)self swapWithInt:v7 withInt:v12];
      uint64_t v7 = (v7 + 1);
    }
  }
}

- (void)insertionSortWithInt:(int)a3 withInt:(int)a4
{
  int v4 = a3 + 1;
  if (a3 + 1 < a4)
  {
    uint64_t v8 = *(void *)&a3;
    do
    {
      uint64_t v9 = v8;
      if (v4 > a3)
      {
        do
        {
          if ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:(v9 + 1)] < 1)break; {
          [(OrgApacheLuceneUtilSorter *)self swapWithInt:v9 withInt:(v9 + 1)];
          }
          BOOL v10 = (int)v9 <= a3;
          uint64_t v9 = (v9 - 1);
        }
        while (!v10);
      }
      ++v4;
      uint64_t v8 = (v8 + 1);
    }
    while (v4 != a4);
  }
}

- (void)binarySortWithInt:(int)a3 withInt:(int)a4
{
}

- (void)binarySortWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 < a4)
  {
    uint64_t v27 = v12;
    uint64_t v28 = v11;
    uint64_t v29 = v10;
    uint64_t v30 = v9;
    uint64_t v31 = v8;
    uint64_t v32 = v7;
    uint64_t v33 = v6;
    uint64_t v34 = v5;
    uint64_t v35 = v13;
    uint64_t v36 = v14;
    uint64_t v15 = *(void *)&a5;
    uint64_t v17 = *(void *)&a3;
    do
    {
      int v19 = v15 - 1;
      uint64_t v20 = v17;
      if ((int)v15 - 1 >= (int)v17)
      {
        LODWORD(v20) = v17;
        do
        {
          unsigned int v21 = (v19 + v20) >> 1;
          int v22 = -[OrgApacheLuceneUtilSorter compareWithInt:withInt:](self, "compareWithInt:withInt:", v15, v21, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
          if (v22 >= 0) {
            uint64_t v20 = v21 + 1;
          }
          else {
            uint64_t v20 = v20;
          }
          if (v22 < 0) {
            int v19 = v21 - 1;
          }
        }
        while ((int)v20 <= v19);
      }
      int v23 = v15 - v20;
      if (v15 == v20) {
        goto LABEL_17;
      }
      if (v23 == 1)
      {
        uint64_t v24 = (v20 + 1);
      }
      else
      {
        if (v23 != 2)
        {
          int v25 = v15;
          if ((int)v15 > (int)v20)
          {
            do
            {
              int v26 = v25 - 1;
              -[OrgApacheLuceneUtilSorter swapWithInt:withInt:](self, "swapWithInt:withInt:", (v25 - 1), v27, v28, v29, v30, v31, v32, v33, v34);
              int v25 = v26;
            }
            while (v26 > (int)v20);
          }
          goto LABEL_17;
        }
        uint64_t v24 = (v20 + 1);
        [(OrgApacheLuceneUtilSorter *)self swapWithInt:v24 withInt:(v20 + 2)];
      }
      -[OrgApacheLuceneUtilSorter swapWithInt:withInt:](self, "swapWithInt:withInt:", v20, v24, v27, v28, v29, v30, v31, v32, v33, v34);
LABEL_17:
      uint64_t v15 = (v15 + 1);
    }
    while (v15 != a4);
  }
}

- (void)heapSortWithInt:(int)a3 withInt:(int)a4
{
  if (a4 - a3 >= 2)
  {
    LODWORD(v4) = a4;
    uint64_t v5 = *(void *)&a3;
    -[OrgApacheLuceneUtilSorter heapifyWithInt:withInt:](self, "heapifyWithInt:withInt:");
    while (1)
    {
      uint64_t v4 = (v4 - 1);
      if ((int)v4 <= (int)v5) {
        break;
      }
      [(OrgApacheLuceneUtilSorter *)self swapWithInt:v5 withInt:v4];
      [(OrgApacheLuceneUtilSorter *)self siftDownWithInt:v5 withInt:v5 withInt:v4];
    }
  }
}

- (void)heapifyWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = a3 + ((a4 - a3 - 2) >> 1);
  if (!__OFSUB__(v4, a3))
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v6 = *(void *)&a3;
    do
    {
      [(OrgApacheLuceneUtilSorter *)self siftDownWithInt:v4 withInt:v6 withInt:v5];
      uint64_t v4 = (v4 - 1);
    }
    while ((int)v4 >= (int)v6);
  }
}

- (void)siftDownWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a4 + 1;
  uint64_t v6 = (a4 + 1 + 2 * (a3 - a4));
  if ((int)v6 < a5)
  {
    uint64_t v9 = *(void *)&a3;
    do
    {
      uint64_t v11 = (v6 + 1);
      if (([(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:v6] & 0x80000000) != 0)
      {
        if ((int)v11 < a5)
        {
          if ((int)[(OrgApacheLuceneUtilSorter *)self compareWithInt:v6 withInt:(v6 + 1)] >= 0)uint64_t v11 = v6; {
          else
          }
            uint64_t v11 = (v6 + 1);
        }
        else
        {
          uint64_t v11 = v6;
        }
      }
      else if ((int)v11 >= a5 {
             || ([(OrgApacheLuceneUtilSorter *)self compareWithInt:v9 withInt:(v6 + 1)] & 0x80000000) == 0)
      }
      {
        return;
      }
      [(OrgApacheLuceneUtilSorter *)self swapWithInt:v9 withInt:v11];
      uint64_t v6 = (v5 + 2 * (v11 - a4));
      uint64_t v9 = v11;
    }
    while ((int)v6 < a5);
  }
}

+ (int)heapParentWithInt:(int)a3 withInt:(int)a4
{
  return a3 + ((~a3 + a4) >> 1);
}

+ (int)heapChildWithInt:(int)a3 withInt:(int)a4
{
  return a3 + 2 * (a4 - a3) + 1;
}

@end