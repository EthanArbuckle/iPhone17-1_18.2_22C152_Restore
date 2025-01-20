@interface ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ
- (BOOL)betterThanWithComAppleContextkitCategoriesConstellation_QIDCount:(id)a3 withComAppleContextkitCategoriesConstellation_QIDCount:(id)a4;
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4;
- (IOSObjectArray)popAllCountsFromArray;
- (void)addItemWithNSString:(id)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ

- (IOSObjectArray)popAllCountsFromArray
{
  uint64_t v2 = (int)[a1 size];
  if (qword_1005602B0 != -1) {
    dispatch_once(&qword_1005602B0, &stru_1003F1F50);
  }
  v3 = +[IOSObjectArray arrayWithLength:v2 type:qword_1005602A8];
  int size = v3->super.size_;
  int v5 = size - 1;
  if (size >= 1)
  {
    do
      IOSObjectArray_Set((uint64_t)v3, v5--, [a1 pop]);
    while (v5 != -1);
  }
  return v3;
}

- (ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  JreStrongAssign((id *)&self->this$0_, a3);
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  return sub_1000C7850((uint64_t)a3, (uint64_t)a4) ^ 1;
}

- (BOOL)betterThanWithComAppleContextkitCategoriesConstellation_QIDCount:(id)a3 withComAppleContextkitCategoriesConstellation_QIDCount:(id)a4
{
  return sub_1000C7850((uint64_t)a3, (uint64_t)a4);
}

- (void)addItemWithNSString:(id)a3 withInt:(int)a4
{
  qidToCategoryIdTreasureMap = self->this$0_->this$0_->qidToCategoryIdTreasureMap_;
  if (!qidToCategoryIdTreasureMap) {
    JreThrowNullPointerException();
  }
  id v8 = -[ComAppleContextkitCategoriesQIDCategoryProvider categoryIdsForQIDWithNSString:](qidToCategoryIdTreasureMap, "categoryIdsForQIDWithNSString:");
  if (v8 && ([v8 isEmpty] & 1) == 0)
  {
    uint64_t v9 = [ComAppleContextkitCategoriesConstellation_QIDCount alloc];
    JreStrongAssign((id *)&v9->qid_, a3);
    v9->count_ = a4;
    uint64_t v10 = v9;
    [(OrgApacheLuceneUtilPriorityQueue *)self insertWithOverflowWithId:v10];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request_QIDCountPQ;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end