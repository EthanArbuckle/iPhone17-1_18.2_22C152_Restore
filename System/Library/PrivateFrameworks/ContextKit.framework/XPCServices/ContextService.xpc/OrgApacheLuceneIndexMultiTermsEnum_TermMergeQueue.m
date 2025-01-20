@interface OrgApacheLuceneIndexMultiTermsEnum_TermMergeQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneIndexMultiTermsEnum_TermMergeQueue)initWithInt:(int)a3;
- (id)getWithInt:(int)a3;
- (int)fillTopWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSliceArray:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiTermsEnum_TermMergeQueue

- (OrgApacheLuceneIndexMultiTermsEnum_TermMergeQueue)initWithInt:(int)a3
{
  sub_10005B8B4((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (uint64_t v4 = (void *)*((void *)a3 + 2)) == 0 || !a4) {
    JreThrowNullPointerException();
  }
  return [v4 compareToWithId:*((void *)a4 + 2)] >> 31;
}

- (int)fillTopWithOrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSliceArray:(id)a3
{
  unsigned int v23 = [(OrgApacheLuceneUtilPriorityQueue *)self size];
  if (v23)
  {
    if (a3)
    {
      IOSObjectArray_Set((uint64_t)a3, 0, [(OrgApacheLuceneUtilPriorityQueue *)self top]);
      stack = self->stack_;
      if (stack)
      {
        uint64_t size = stack->super.size_;
        if ((int)size <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(size, 0);
        }
        LODWORD(v7) = 1;
        *(&stack->super.size_ + 1) = 1;
        int v8 = 1;
        while (1)
        {
          v9 = self->stack_;
          uint64_t v10 = v9->super.size_;
          uint64_t v7 = (v7 - 1);
          if ((int)v7 < 0 || (int)v7 >= (int)v10) {
            IOSArray_throwOutOfBoundsWithMsg(v10, v7);
          }
          int v11 = *(&v9->super.size_ + (int)v7 + 1);
          uint64_t v12 = (2 * v11);
          int v13 = JavaLangMath_minWithInt_withInt_(v23, (2 * v11) | 1u);
          if ((int)v12 <= v13) {
            break;
          }
LABEL_9:
          if (!v7) {
            return v8;
          }
        }
        int v14 = v13;
        while (1)
        {
          uint64_t v15 = sub_10005BB48(self, v12);
          if (!v15) {
            break;
          }
          v16 = (void *)v15;
          v17 = *(void **)(v15 + 16);
          if (!v17) {
            break;
          }
          uint64_t v18 = *((unsigned int *)a3 + 2);
          if ((int)v18 <= 0) {
            IOSArray_throwOutOfBoundsWithMsg(v18, 0);
          }
          uint64_t v19 = *((void *)a3 + 3);
          if (!v19) {
            break;
          }
          if ([v17 isEqual:*(void *)(v19 + 16)])
          {
            IOSObjectArray_Set((uint64_t)a3, v8, v16);
            v20 = self->stack_;
            uint64_t v21 = v20->super.size_;
            if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v21) {
              IOSArray_throwOutOfBoundsWithMsg(v21, v7);
            }
            ++v8;
            *(&v20->super.size_ + (int)v7 + 1) = v12;
            uint64_t v7 = (v7 + 1);
          }
          uint64_t v12 = (v12 + 1);
          if ((int)v12 > v14) {
            goto LABEL_9;
          }
        }
      }
    }
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)getWithInt:(int)a3
{
  return (id)sub_10005BB48(self, *(uint64_t *)&a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiTermsEnum_TermMergeQueue;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end