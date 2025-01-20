@interface OrgApacheLuceneUtilPackedPackedInts_Mutable
- (OrgApacheLuceneUtilPackedPackedInts_Mutable)init;
- (id)getFormat;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)clear;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_Mutable

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self size] - a3);
  int v11 = v10;
  if (v10 + (int)v8 > (int)v8)
  {
    int v12 = v10;
    do
    {
      uint64_t v13 = *((unsigned int *)a4 + 2);
      if (a5 < 0 || a5 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a5);
      }
      [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self setWithInt:v8 withLong:*((void *)a4 + a5 + 2)];
      uint64_t v8 = (v8 + 1);
      ++a5;
      --v12;
    }
    while (v12);
  }
  return v11;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  if (a3 < a4)
  {
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v19 = v9;
    uint64_t v20 = v10;
    uint64_t v13 = *(void *)&a3;
    do
    {
      -[OrgApacheLuceneUtilPackedPackedInts_Mutable setWithInt:withLong:](self, "setWithInt:withLong:", v13, a5, v15, v16, v17, v18, v19, v20);
      uint64_t v13 = (v13 + 1);
    }
    while (a4 != v13);
  }
}

- (void)clear
{
  id v3 = [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self size];
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self fillWithInt:0 withInt:v3 withLong:0];
}

- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  v4 = new_OrgApacheLuceneUtilPackedPackedWriter_initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withOrgApacheLuceneStoreDataOutput_withInt_withInt_withInt_([(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self getFormat], a3, (uint64_t)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self size], (int)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self getBitsPerValue], 1024);
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4;
  [(OrgApacheLuceneUtilPackedPackedInts_Writer *)v4 writeHeader];
  if ((int)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self size] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      [(OrgApacheLuceneUtilPackedPackedWriter *)v5 addWithLong:[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self getWithInt:v6]];
      uint64_t v6 = (v6 + 1);
    }
    while ((int)v6 < (int)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)self size]);
  }
  [(OrgApacheLuceneUtilPackedPackedWriter *)v5 finish];
}

- (id)getFormat
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0];
}

- (OrgApacheLuceneUtilPackedPackedInts_Mutable)init
{
  return self;
}

@end