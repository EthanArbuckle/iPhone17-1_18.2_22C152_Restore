@interface OrgApacheLuceneUtilInPlaceMergeSorter
- (OrgApacheLuceneUtilInPlaceMergeSorter)init;
- (void)mergeSortWithInt:(int)a3 withInt:(int)a4;
- (void)sortWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilInPlaceMergeSorter

- (OrgApacheLuceneUtilInPlaceMergeSorter)init
{
  return self;
}

- (void)sortWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[OrgApacheLuceneUtilSorter checkRangeWithInt:withInt:](self, "checkRangeWithInt:withInt:");
  [(OrgApacheLuceneUtilInPlaceMergeSorter *)self mergeSortWithInt:v5 withInt:v4];
}

- (void)mergeSortWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (a4 - a3 > 19)
  {
    uint64_t v7 = (a4 + a3) >> 1;
    [(OrgApacheLuceneUtilInPlaceMergeSorter *)self mergeSortWithInt:*(void *)&a3 withInt:v7];
    [(OrgApacheLuceneUtilInPlaceMergeSorter *)self mergeSortWithInt:v7 withInt:v4];
    [(OrgApacheLuceneUtilSorter *)self mergeInPlaceWithInt:v5 withInt:v7 withInt:v4];
  }
  else
  {
    -[OrgApacheLuceneUtilSorter insertionSortWithInt:withInt:](self, "insertionSortWithInt:withInt:");
  }
}

@end