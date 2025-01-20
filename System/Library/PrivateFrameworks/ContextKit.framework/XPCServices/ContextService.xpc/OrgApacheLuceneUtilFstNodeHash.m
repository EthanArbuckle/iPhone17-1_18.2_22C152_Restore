@interface OrgApacheLuceneUtilFstNodeHash
- (BOOL)nodesEqualWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withLong:(int64_t)a4;
- (OrgApacheLuceneUtilFstNodeHash)initWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4;
- (int64_t)addWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4;
- (int64_t)hash__WithLong:(int64_t)a3;
- (int64_t)hash__WithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3;
- (uint64_t)rehash;
- (void)addNewWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFstNodeHash

- (OrgApacheLuceneUtilFstNodeHash)initWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a4
{
  return self;
}

- (BOOL)nodesEqualWithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3 withLong:(int64_t)a4
{
  return sub_100113158((uint64_t)self, (uint64_t)a3, a4);
}

- (int64_t)hash__WithOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a3
{
  return sub_1001133C4((uint64_t)a3);
}

- (int64_t)hash__WithLong:(int64_t)a3
{
  return sub_100113590((uint64_t)self, a3);
}

- (int64_t)addWithOrgApacheLuceneUtilFstBuilder:(id)a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:(id)a4
{
  uint64_t v7 = sub_1001133C4((uint64_t)a4);
  table = self->table_;
  if (!table) {
    goto LABEL_6;
  }
  int64_t v9 = self->mask_ & v7;
  int v10 = 1;
  while (1)
  {
    id v11 = [(OrgApacheLuceneUtilPackedAbstractPagedMutable *)table getWithLong:v9];
    if (!v11) {
      break;
    }
    id v12 = v11;
    if (sub_100113158((uint64_t)self, (uint64_t)a4, (uint64_t)v11)) {
      return (int64_t)v12;
    }
    int64_t v9 = self->mask_ & (v9 + v10);
    table = self->table_;
    ++v10;
    if (!table) {
      goto LABEL_6;
    }
  }
  fst = self->fst_;
  if (!fst) {
LABEL_6:
  }
    JreThrowNullPointerException();
  id v12 = [(OrgApacheLuceneUtilFstFST *)fst addNodeWithOrgApacheLuceneUtilFstBuilder:a3 withOrgApacheLuceneUtilFstBuilder_UnCompiledNode:a4];
  v14 = self->table_;
  ++self->count_;
  [(OrgApacheLuceneUtilPackedAbstractPagedMutable *)v14 setWithLong:v9 withLong:v12];
  int64_t count = self->count_;
  if (count > 2 * [(OrgApacheLuceneUtilPackedAbstractPagedMutable *)self->table_ size] / 3) {
    -[OrgApacheLuceneUtilFstNodeHash rehash]_0((uint64_t)self);
  }
  return (int64_t)v12;
}

- (uint64_t)rehash
{
  v2 = (id *)(a1 + 8);
  v1 = *(void **)(a1 + 8);
  if (!v1) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = 2 * (void)[*(id *)(a1 + 8) size];
  int v12 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(*(void *)(a1 + 16), v5, v6, v7, v8, v9, v10, v11);
  v13 = new_OrgApacheLuceneUtilPackedPagedGrowableWriter_initWithLong_withInt_withInt_withFloat_(v4, 0x40000000, v12, 0.0);
  JreStrongAssignAndConsume(v2, v13);
  *(void *)(a1 + 24) = (char *)[*(id *)(a1 + 8) size] - 1;
  uint64_t result = (uint64_t)[v1 size];
  if (result >= 1)
  {
    for (uint64_t i = 0; i < result; ++i)
    {
      id v16 = [v1 getWithLong:i];
      if (v16) {
        sub_100113870(a1, (uint64_t)v16);
      }
      uint64_t result = (uint64_t)[v1 size];
    }
  }
  return result;
}

- (void)addNewWithLong:(int64_t)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstNodeHash;
  [(OrgApacheLuceneUtilFstNodeHash *)&v3 dealloc];
}

@end