@interface OrgApacheLuceneUtilTimSorter
+ (int)minRunWithInt:(int)a3;
- (OrgApacheLuceneUtilTimSorter)initWithInt:(int)a3;
- (int)lowerSaved3WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)lowerSavedWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)nextRun;
- (int)runBaseWithInt:(int)a3;
- (int)runEndWithInt:(int)a3;
- (int)runLenWithInt:(int)a3;
- (int)upperSaved3WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int)upperSavedWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
- (void)doRotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)ensureInvariants;
- (void)exhaustStack;
- (void)mergeAtWithInt:(int)a3;
- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)mergeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)pushRunLenWithInt:(int)a3;
- (void)resetWithInt:(int)a3 withInt:(int)a4;
- (void)setRunEndWithInt:(int)a3 withInt:(int)a4;
- (void)sortWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilTimSorter

- (OrgApacheLuceneUtilTimSorter)initWithInt:(int)a3
{
  return self;
}

+ (int)minRunWithInt:(int)a3
{
  if (a3 < 64)
  {
    int v3 = 0;
  }
  else
  {
    int v3 = 0;
    unsigned int v4 = a3;
    do
    {
      v3 |= v4 & 1;
      a3 = v4 >> 1;
      BOOL v5 = v4 > 0x7F;
      v4 >>= 1;
    }
    while (v5);
  }
  return v3 + a3;
}

- (int)runLenWithInt:(int)a3
{
  runEnds = self->runEnds_;
  if (!runEnds) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (self->stackSize_ - a3);
  uint64_t size = runEnds->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v6 = runEnds;
  int v7 = *(&runEnds->super.size_ + (int)v4 + 1);
  uint64_t v8 = (v4 - 1);
  if ((int)v8 < 0 || (int)v8 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  return v7 - *(&v6->super.size_ + (int)v8 + 1);
}

- (int)runBaseWithInt:(int)a3
{
  runEnds = self->runEnds_;
  if (!runEnds) {
    JreThrowNullPointerException();
  }
  int stackSize = self->stackSize_;
  uint64_t size = runEnds->super.size_;
  int v6 = stackSize + ~a3;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (stackSize + ~a3));
  }
  return *(&runEnds->super.size_ + v6 + 1);
}

- (int)runEndWithInt:(int)a3
{
  runEnds = self->runEnds_;
  if (!runEnds) {
    JreThrowNullPointerException();
  }
  int stackSize = self->stackSize_;
  uint64_t size = runEnds->super.size_;
  int v6 = stackSize - a3;
  if (stackSize - a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (stackSize - a3));
  }
  return *(&runEnds->super.size_ + v6 + 1);
}

- (void)setRunEndWithInt:(int)a3 withInt:(int)a4
{
  runEnds = self->runEnds_;
  if (!runEnds) {
    JreThrowNullPointerException();
  }
  int stackSize = self->stackSize_;
  uint64_t size = runEnds->super.size_;
  int v7 = stackSize - a3;
  if (stackSize - a3 < 0 || v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (stackSize - a3));
  }
  *(&runEnds->super.size_ + v7 + 1) = a4;
}

- (void)pushRunLenWithInt:(int)a3
{
  runEnds = self->runEnds_;
  int stackSize = self->stackSize_;
  uint64_t size = runEnds->super.size_;
  if (stackSize < 0 || (int v7 = runEnds, stackSize >= (int)size)) {
    IOSArray_throwOutOfBoundsWithMsg(size, stackSize);
  }
  int v8 = *(&runEnds->super.size_ + stackSize + 1);
  int v9 = self->stackSize_;
  uint64_t v10 = v7->super.size_;
  int v11 = v9 + 1;
  if (v9 + 1 < 0 || v11 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, (v9 + 1));
  }
  *(&v7->super.size_ + v11 + 1) = v8 + a3;
  ++self->stackSize_;
}

- (int)nextRun
{
  uint64_t v3 = [(OrgApacheLuceneUtilTimSorter *)self runEndWithInt:0];
  if (v3 == self->to_ - 1) {
    return 1;
  }
  uint64_t v5 = v3;
  uint64_t v6 = (v3 + 2);
  int v7 = [(OrgApacheLuceneUtilTimSorter *)self compareWithInt:v3 withInt:(v3 + 1)];
  int to = self->to_;
  if (v7 <= 0)
  {
    while ((int)v6 < to
         && (int)[(OrgApacheLuceneUtilTimSorter *)self compareWithInt:(v6 - 1) withInt:v6] <= 0)
    {
      uint64_t v6 = (v6 + 1);
      int to = self->to_;
    }
  }
  else
  {
    while ((int)v6 < to
         && (int)[(OrgApacheLuceneUtilTimSorter *)self compareWithInt:(v6 - 1) withInt:v6] >= 1)
    {
      uint64_t v6 = (v6 + 1);
      int to = self->to_;
    }
    [(OrgApacheLuceneUtilSorter *)self reverseWithInt:v5 withInt:v6];
  }
  int v9 = JavaLangMath_minWithInt_withInt_(self->to_, self->minRun_ + (int)v5);
  uint64_t v10 = JavaLangMath_maxWithInt_withInt_(v6, v9);
  [(OrgApacheLuceneUtilSorter *)self binarySortWithInt:v5 withInt:v10 withInt:v6];
  return v10 - v5;
}

- (void)ensureInvariants
{
  while (self->stackSize_ >= 2)
  {
    signed int v3 = [(OrgApacheLuceneUtilTimSorter *)self runLenWithInt:0];
    signed int v4 = [(OrgApacheLuceneUtilTimSorter *)self runLenWithInt:1];
    if (self->stackSize_ > 2
      && (signed int v5 = [(OrgApacheLuceneUtilTimSorter *)self runLenWithInt:2], v5 <= v4 + v3))
    {
      BOOL v6 = v5 < v3;
    }
    else
    {
      if (v4 > v3) {
        return;
      }
      BOOL v6 = 0;
    }
    [(OrgApacheLuceneUtilTimSorter *)self mergeAtWithInt:v6];
  }
}

- (void)exhaustStack
{
  if (self->stackSize_ >= 2)
  {
    do
      [(OrgApacheLuceneUtilTimSorter *)self mergeAtWithInt:0];
    while (self->stackSize_ > 1);
  }
}

- (void)resetWithInt:(int)a3 withInt:(int)a4
{
  self->stackSize_ = 0;
  JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->runEnds_, 0);
  runEnds = self->runEnds_;
  if (!runEnds) {
    JreThrowNullPointerException();
  }
  uint64_t size = runEnds->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  *(&runEnds->super.size_ + 1) = a3;
  self->to_ = a4;
  unsigned int v9 = a4 - a3;
  if (a4 - a3 >= 65)
  {
    int v10 = 0;
    do
    {
      v10 |= v9 & 1;
      unsigned int v11 = v9 >> 1;
      BOOL v12 = v9 > 0x7F;
      v9 >>= 1;
    }
    while (v12);
    unsigned int v9 = v10 + v11;
  }
  self->minRun_ = v9;
}

- (void)mergeAtWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(OrgApacheLuceneUtilTimSorter *)self mergeWithInt:[(OrgApacheLuceneUtilTimSorter *)self runBaseWithInt:(a3 + 1)] withInt:[(OrgApacheLuceneUtilTimSorter *)self runBaseWithInt:v3] withInt:[(OrgApacheLuceneUtilTimSorter *)self runEndWithInt:v3]];
  if (v3 <= 0x7FFFFFFE)
  {
    do
    {
      unsigned int v5 = v3 + 1;
      [(OrgApacheLuceneUtilTimSorter *)self setRunEndWithInt:(v3 + 1) withInt:[(OrgApacheLuceneUtilTimSorter *)self runEndWithInt:v3]];
      uint64_t v3 = (v3 - 1);
    }
    while (v5 > 1);
  }
  --self->stackSize_;
}

- (void)mergeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = (a4 - 1);
  if ((int)-[OrgApacheLuceneUtilTimSorter compareWithInt:withInt:](self, "compareWithInt:withInt:", v9) >= 1)
  {
    uint64_t v10 = [(OrgApacheLuceneUtilSorter *)self upper2WithInt:v7 withInt:v6 withInt:v6];
    uint64_t v11 = [(OrgApacheLuceneUtilSorter *)self lower2WithInt:v6 withInt:v5 withInt:v9];
    int maxTempSlots = self->maxTempSlots_;
    if ((int)v11 - (int)v6 > (int)v6 - (int)v10 || (int)v11 - (int)v6 > maxTempSlots)
    {
      if ((int)v6 - (int)v10 <= maxTempSlots)
      {
        [(OrgApacheLuceneUtilTimSorter *)self mergeLoWithInt:v10 withInt:v6 withInt:v11];
      }
      else
      {
        [(OrgApacheLuceneUtilSorter *)self mergeInPlaceWithInt:v10 withInt:v6 withInt:v11];
      }
    }
    else
    {
      [(OrgApacheLuceneUtilTimSorter *)self mergeHiWithInt:v10 withInt:v6 withInt:v11];
    }
  }
}

- (void)sortWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[OrgApacheLuceneUtilSorter checkRangeWithInt:withInt:](self, "checkRangeWithInt:withInt:");
  if ((int)v4 - (int)v5 >= 2)
  {
    [(OrgApacheLuceneUtilTimSorter *)self resetWithInt:v5 withInt:v4];
    do
    {
      [(OrgApacheLuceneUtilTimSorter *)self ensureInvariants];
      [(OrgApacheLuceneUtilTimSorter *)self pushRunLenWithInt:[(OrgApacheLuceneUtilTimSorter *)self nextRun]];
    }
    while ([(OrgApacheLuceneUtilTimSorter *)self runEndWithInt:0] < (int)v4);
    [(OrgApacheLuceneUtilTimSorter *)self exhaustStack];
  }
}

- (void)doRotateWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  int v9 = a4 - a3;
  int v10 = a5 - a4;
  if (a4 - a3 == a5 - a4)
  {
    if (a5 > a4)
    {
      do
      {
        int v11 = v6 + 1;
        [(OrgApacheLuceneUtilTimSorter *)self swapWithInt:v7 withInt:v6];
        uint64_t v7 = (v7 + 1);
        uint64_t v6 = (v6 + 1);
      }
      while (v5 != v11);
    }
  }
  else
  {
    int maxTempSlots = self->maxTempSlots_;
    if (v10 >= v9 || v10 > maxTempSlots)
    {
      if (v9 <= maxTempSlots)
      {
        -[OrgApacheLuceneUtilTimSorter saveWithInt:withInt:](self, "saveWithInt:withInt:");
        if ((int)v5 > (int)v6)
        {
          uint64_t v16 = v7;
          do
          {
            [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:v6 withInt:v16];
            uint64_t v6 = (v6 + 1);
            uint64_t v16 = (v16 + 1);
          }
          while (v5 != v6);
        }
        int v17 = v10 + v7;
        if (v17 < (int)v5)
        {
          uint64_t v18 = 0;
          do
          {
            [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v18 withInt:(v17 + v18)];
            uint64_t v18 = (v18 + 1);
          }
          while (v9 != v18);
        }
      }
      else
      {
        -[OrgApacheLuceneUtilSorter reverseWithInt:withInt:](self, "reverseWithInt:withInt:");
        [(OrgApacheLuceneUtilSorter *)self reverseWithInt:v6 withInt:v5];
        [(OrgApacheLuceneUtilSorter *)self reverseWithInt:v7 withInt:v5];
      }
    }
    else
    {
      [(OrgApacheLuceneUtilTimSorter *)self saveWithInt:*(void *)&a4 withInt:(a5 - a4)];
      uint64_t v13 = (v6 - 1);
      if ((int)v13 >= (int)v7)
      {
        uint64_t v14 = (v5 - 1);
        do
        {
          [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:v13 withInt:v14];
          uint64_t v13 = (v13 - 1);
          uint64_t v14 = (v14 - 1);
        }
        while ((int)v13 >= (int)v7);
      }
      if (v10 >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v15 withInt:(v7 + v15)];
          uint64_t v15 = (v15 + 1);
        }
        while (v10 != v15);
      }
    }
  }
}

- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  int v9 = a4 - a3;
  -[OrgApacheLuceneUtilTimSorter saveWithInt:withInt:](self, "saveWithInt:withInt:");
  [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:v6 withInt:v7];
  uint64_t v10 = 0;
  uint64_t v11 = (v6 + 1);
LABEL_2:
  int v12 = 0;
  uint64_t v7 = (v7 + 1);
  while ((int)v10 < v9 && (int)v11 < (int)v5)
  {
    if ((int)[(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v10 withInt:v11] <= 0)
    {
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v10 withInt:v7];
      int v12 = 0;
      uint64_t v10 = (v10 + 1);
    }
    else
    {
      [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:v11 withInt:v7];
      ++v12;
      uint64_t v11 = (v11 + 1);
    }
    uint64_t v7 = (v7 + 1);
    if (v12 >= 7)
    {
      uint64_t v13 = [(OrgApacheLuceneUtilTimSorter *)self lowerSaved3WithInt:v11 withInt:v5 withInt:v10];
      int v14 = v11 - v13;
      if ((int)v11 < (int)v13)
      {
        uint64_t v15 = v13;
        int v16 = 0;
        do
        {
          [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:(v11 + v16) withInt:(v7 + v16)];
          ++v16;
        }
        while (v14 + v16);
        uint64_t v7 = (v7 + v16);
        uint64_t v11 = v15;
      }
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v10 withInt:v7];
      uint64_t v10 = (v10 + 1);
      goto LABEL_2;
    }
  }
  if ((int)v10 < v9)
  {
    int v17 = 0;
    do
    {
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:(v10 + v17) withInt:(v7 + v17)];
      ++v17;
    }
    while ((int)v10 + v17 < v9);
  }
}

- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v7 = *(void *)&a3;
  LODWORD(v9) = a5 - a4;
  [(OrgApacheLuceneUtilTimSorter *)self saveWithInt:*(void *)&a4 withInt:(a5 - a4)];
  [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:(a4 - 1) withInt:(a5 - 1)];
  uint64_t v10 = (a4 - 2);
  uint64_t v11 = (a5 - 2);
LABEL_2:
  int v12 = 0;
  uint64_t v9 = (v9 - 1);
  while ((int)v10 >= (int)v7 && (v9 & 0x80000000) == 0)
  {
    if (([(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v9 withInt:v10] & 0x80000000) != 0)
    {
      [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:v10 withInt:v11];
      ++v12;
      uint64_t v10 = (v10 - 1);
    }
    else
    {
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v9 withInt:v11];
      int v12 = 0;
      uint64_t v9 = (v9 - 1);
    }
    uint64_t v11 = (v11 - 1);
    if (v12 >= 7)
    {
      int v13 = [(OrgApacheLuceneUtilTimSorter *)self upperSaved3WithInt:v7 withInt:(v10 + 1) withInt:v9];
      if ((int)v10 >= v13)
      {
        int v14 = v13;
        int v15 = 0;
        do
        {
          [(OrgApacheLuceneUtilTimSorter *)self copy__WithInt:(v10 + v15) withInt:(v11 + v15)];
          --v15;
        }
        while ((int)v10 + v15 >= v14);
        uint64_t v11 = (v11 + v15);
        uint64_t v10 = (v10 + v15);
      }
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:v9 withInt:v11];
      uint64_t v11 = (v11 - 1);
      goto LABEL_2;
    }
  }
  if ((v9 & 0x80000000) == 0)
  {
    int v16 = 0;
    do
    {
      [(OrgApacheLuceneUtilTimSorter *)self restoreWithInt:(v9 + v16) withInt:(v11 + v16)];
      --v16;
    }
    while (v9 + v16 != -1);
  }
}

- (int)lowerSavedWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a3;
  unsigned int v6 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    uint64_t v7 = *(void *)&a5;
    do
    {
      if ((int)[(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v7 withInt:v5 + (v6 >> 1)] <= 0)
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

- (int)upperSavedWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a3;
  unsigned int v6 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    uint64_t v7 = *(void *)&a5;
    do
    {
      if ((int)[(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v7 withInt:v5 + (v6 >> 1)] < 0)
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

- (int)lowerSaved3WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
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
      if ((int)[(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v5 withInt:v9] <= 0)break; {
      uint64_t v9 = (v10 + 2 * (v10 - v7));
      }
      uint64_t v7 = v10;
      if ((int)v9 >= (int)v6) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = v7;
    uint64_t v13 = v10;
  }
  return [(OrgApacheLuceneUtilTimSorter *)v11 lowerSavedWithInt:v12 withInt:v13 withInt:v5];
}

- (int)upperSaved3WithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
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
      if (([(OrgApacheLuceneUtilTimSorter *)self compareSavedWithInt:v5 withInt:v9] & 0x80000000) == 0)break; {
      uint64_t v9 = (v10 + 2 * (v10 - v6));
      }
      uint64_t v6 = v10;
      if ((int)v9 <= (int)v7) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = self;
    uint64_t v12 = v10;
    uint64_t v13 = v6;
  }
  return [(OrgApacheLuceneUtilTimSorter *)v11 upperSavedWithInt:v12 withInt:v13 withInt:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilTimSorter;
  [(OrgApacheLuceneUtilTimSorter *)&v3 dealloc];
}

@end