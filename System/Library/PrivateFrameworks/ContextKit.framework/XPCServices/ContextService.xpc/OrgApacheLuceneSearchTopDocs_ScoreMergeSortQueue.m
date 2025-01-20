@interface OrgApacheLuceneSearchTopDocs_ScoreMergeSortQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchTopDocs_ScoreMergeSortQueue)initWithOrgApacheLuceneSearchTopDocsArray:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopDocs_ScoreMergeSortQueue

- (OrgApacheLuceneSearchTopDocs_ScoreMergeSortQueue)initWithOrgApacheLuceneSearchTopDocsArray:(id)a3
{
  sub_10001FAD8((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  shardHits = self->shardHits_;
  if (!shardHits || !a3) {
    goto LABEL_23;
  }
  int v6 = *((_DWORD *)a3 + 2);
  uint64_t size = shardHits->super.size_;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  v8 = (&shardHits->elementType_)[v6];
  if (!v8) {
    goto LABEL_23;
  }
  int v9 = *((_DWORD *)a3 + 3);
  uint64_t isa_low = LODWORD(v8[1].super.isa);
  if (v9 < 0 || v9 >= (int)isa_low) {
    IOSArray_throwOutOfBoundsWithMsg(isa_low, v9);
  }
  Class isa = v8[v9 + 3].super.isa;
  if (!isa || !a4) {
    goto LABEL_23;
  }
  float v12 = *((float *)isa + 2);
  v13 = self->shardHits_;
  int v14 = *((_DWORD *)a4 + 2);
  uint64_t v15 = v13->super.size_;
  if (v14 < 0 || v14 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v14);
  }
  v16 = (&v13->elementType_)[v14];
  if (!v16) {
    goto LABEL_23;
  }
  int v17 = *((_DWORD *)a4 + 3);
  uint64_t v18 = LODWORD(v16[1].super.isa);
  if (v17 < 0 || v17 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v17);
  }
  Class v19 = v16[v17 + 3].super.isa;
  if (!v19) {
LABEL_23:
  }
    JreThrowNullPointerException();
  float v20 = *((float *)v19 + 2);
  if (v12 < v20) {
    return 0;
  }
  if (v12 > v20) {
    return 1;
  }
  int v22 = *((_DWORD *)a3 + 2);
  int v23 = *((_DWORD *)a4 + 2);
  if (v22 < v23) {
    return 1;
  }
  if (v22 > v23) {
    return 0;
  }
  return *((_DWORD *)a3 + 3) < *((_DWORD *)a4 + 3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopDocs_ScoreMergeSortQueue;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end