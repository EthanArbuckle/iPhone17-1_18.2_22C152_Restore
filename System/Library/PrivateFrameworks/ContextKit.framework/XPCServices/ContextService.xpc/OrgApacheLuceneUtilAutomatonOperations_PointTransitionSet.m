@interface OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet
- (OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet)init;
- (id)description;
- (id)findWithInt:(int)a3;
- (id)nextWithInt:(int)a3;
- (void)addWithOrgApacheLuceneUtilAutomatonTransition:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)sort;
@end

@implementation OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet

- (id)nextWithInt:(int)a3
{
  return sub_1000D726C((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)findWithInt:(int)a3
{
  return sub_1000D7410((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)reset
{
  if (self->useHash_)
  {
    map = self->map_;
    if (!map) {
      JreThrowNullPointerException();
    }
    [(JavaUtilHashMap *)map clear];
    self->useHash_ = 0;
  }
  self->count_ = 0;
}

- (void)sort
{
  uint64_t count = self->count_;
  if ((int)count >= 2) {
    OrgApacheLuceneUtilArrayUtil_timSortWithJavaLangComparableArray_withInt_withInt_(self->points_, 0, count);
  }
}

- (void)addWithOrgApacheLuceneUtilAutomatonTransition:(id)a3
{
  if (!a3
    || (v10 = sub_1000D7410((uint64_t)self, *((unsigned int *)a3 + 4), (uint64_t)a3, v3, v4, v5, v6, v7)) == 0
    || (v11 = (void *)v10[3]) == 0
    || ([v11 addWithOrgApacheLuceneUtilAutomatonTransition:a3],
        (v18 = sub_1000D7410((uint64_t)self, (*((_DWORD *)a3 + 5) + 1), v12, v13, v14, v15, v16, v17)) == 0)
    || (v19 = (void *)v18[2]) == 0)
  {
    JreThrowNullPointerException();
  }
  [v19 addWithOrgApacheLuceneUtilAutomatonTransition:a3];
}

- (id)description
{
  uint64_t v3 = new_JavaLangStringBuilder_init();
  if (self->count_ >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      if (v4) {
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
      }
      points = self->points_;
      if (!points) {
        goto LABEL_26;
      }
      uint64_t size = points->super.size_;
      if (v4 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      uint64_t v7 = (&points->elementType_)[v4];
      if (!v7) {
        goto LABEL_26;
      }
      id v8 = [(JavaLangStringBuilder *)v3 appendWithInt:LODWORD(v7[1].super.isa)];
      if (!v8) {
        goto LABEL_26;
      }
      id v9 = [v8 appendWithChar:58];
      if (!v9) {
        goto LABEL_26;
      }
      v10 = v9;
      v11 = self->points_;
      uint64_t v12 = v11->super.size_;
      if (v4 >= v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v4);
      }
      uint64_t v13 = (&v11->elementType_)[v4];
      if (!v13) {
        goto LABEL_26;
      }
      Class isa = v13[3].super.isa;
      if (!isa) {
        goto LABEL_26;
      }
      id v15 = [v10 appendWithInt:(*((_DWORD *)isa + 4) / 3)];
      if (!v15) {
        goto LABEL_26;
      }
      id v16 = [v15 appendWithChar:44];
      if (!v16) {
        goto LABEL_26;
      }
      uint64_t v17 = v16;
      v18 = self->points_;
      uint64_t v19 = v18->super.size_;
      if (v4 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v4);
      }
      v20 = (&v18->elementType_)[v4];
      if (!v20 || (Class v21 = v20[2].super.isa) == 0) {
LABEL_26:
      }
        JreThrowNullPointerException();
      [v17 appendWithInt:(*((_DWORD *)v21 + 4) / 3)];
      ++v4;
    }
    while (v4 < self->count_);
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet)init
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet;
  [(OrgApacheLuceneUtilAutomatonOperations_PointTransitionSet *)&v3 dealloc];
}

@end