@interface OrgApacheLuceneUtilPackedPackedInts_Reader
- (OrgApacheLuceneUtilPackedPackedInts_Reader)init;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_Reader

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_([(OrgApacheLuceneUtilPackedPackedInts_Reader *)self size] - a3, a6);
  int v11 = v10;
  if (v10 + (int)v8 > (int)v8)
  {
    int v12 = v10;
    do
    {
      id v13 = [(OrgApacheLuceneUtilPackedPackedInts_Reader *)self getWithInt:v8];
      uint64_t v14 = *((unsigned int *)a4 + 2);
      if (a5 < 0 || a5 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, a5);
      }
      *((void *)a4 + a5 + 2) = v13;
      uint64_t v8 = (v8 + 1);
      ++a5;
      --v12;
    }
    while (v12);
  }
  return v11;
}

- (OrgApacheLuceneUtilPackedPackedInts_Reader)init
{
  return self;
}

@end