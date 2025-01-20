@interface OrgApacheLuceneUtilIntroSorter
+ (int)ceilLog2WithInt:(int)a3;
- (OrgApacheLuceneUtilIntroSorter)init;
- (void)quicksortWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)sortWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilIntroSorter

+ (int)ceilLog2WithInt:(int)a3
{
  return 32 - JavaLangInteger_numberOfLeadingZerosWithInt_(a3 - 1);
}

- (OrgApacheLuceneUtilIntroSorter)init
{
  return self;
}

- (void)sortWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[OrgApacheLuceneUtilSorter checkRangeWithInt:withInt:](self, "checkRangeWithInt:withInt:");
  uint64_t v7 = 32 - JavaLangInteger_numberOfLeadingZerosWithInt_(~v5 + (int)v4);
  [(OrgApacheLuceneUtilIntroSorter *)self quicksortWithInt:v5 withInt:v4 withInt:v7];
}

- (void)quicksortWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  if (a4 - a3 > 19)
  {
    uint64_t v8 = (a5 - 1);
    if (a5 - 1 < 0)
    {
      -[OrgApacheLuceneUtilSorter heapSortWithInt:withInt:](self, "heapSortWithInt:withInt:");
    }
    else
    {
      uint64_t v9 = (a4 + a3) >> 1;
      if ((int)[(OrgApacheLuceneUtilIntroSorter *)self compareWithInt:*(void *)&a3 withInt:v9] >= 1)[(OrgApacheLuceneUtilIntroSorter *)self swapWithInt:v6 withInt:v9]; {
      if ((int)[(OrgApacheLuceneUtilIntroSorter *)self compareWithInt:v9 withInt:(v5 - 1)] >= 1)
      }
      {
        [(OrgApacheLuceneUtilIntroSorter *)self swapWithInt:v9 withInt:(v5 - 1)];
        if ((int)[(OrgApacheLuceneUtilIntroSorter *)self compareWithInt:v6 withInt:v9] >= 1) {
          [(OrgApacheLuceneUtilIntroSorter *)self swapWithInt:v6 withInt:v9];
        }
      }
      uint64_t v10 = (v6 + 1);
      uint64_t v11 = (v5 - 2);
      [(OrgApacheLuceneUtilIntroSorter *)self setPivotWithInt:v9];
      do
      {
LABEL_12:
        unsigned int v12 = [(OrgApacheLuceneUtilIntroSorter *)self comparePivotWithInt:v11];
        uint64_t v11 = (v11 - 1);
      }
      while ((v12 & 0x80000000) != 0);
      while ((int)v10 < (int)v11 + 1)
      {
        if (([(OrgApacheLuceneUtilIntroSorter *)self comparePivotWithInt:v10] & 0x80000000) != 0)
        {
          [(OrgApacheLuceneUtilIntroSorter *)self swapWithInt:v10 withInt:(v11 + 1)];
          goto LABEL_12;
        }
        uint64_t v10 = (v10 + 1);
      }
      uint64_t v13 = (v10 + 1);
      [(OrgApacheLuceneUtilIntroSorter *)self quicksortWithInt:v6 withInt:v13 withInt:v8];
      [(OrgApacheLuceneUtilIntroSorter *)self quicksortWithInt:v13 withInt:v5 withInt:v8];
    }
  }
  else
  {
    -[OrgApacheLuceneUtilSorter insertionSortWithInt:withInt:](self, "insertionSortWithInt:withInt:");
  }
}

@end