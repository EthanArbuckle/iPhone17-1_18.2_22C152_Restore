@interface ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ
- (BOOL)betterThanWithComAppleContextkitCategoriesConstellation_CategoryCount:(id)a3 withComAppleContextkitCategoriesConstellation_CategoryCount:(id)a4;
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4;
- (id)toArray;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ

- (ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  JreStrongAssign((id *)&self->this$0_, a3);
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  return !sub_1000C7A24((uint64_t)self, a3, a4);
}

- (BOOL)betterThanWithComAppleContextkitCategoriesConstellation_CategoryCount:(id)a3 withComAppleContextkitCategoriesConstellation_CategoryCount:(id)a4
{
  return sub_1000C7A24((uint64_t)self, a3, a4);
}

- (id)toArray
{
  uint64_t v3 = [(OrgApacheLuceneUtilPriorityQueue *)self size];
  if (qword_1005602C0 != -1) {
    dispatch_once(&qword_1005602C0, &stru_1003F1F70);
  }
  uint64_t v4 = +[IOSObjectArray arrayWithLength:v3 type:qword_1005602B8];
  int size = v4->super.size_;
  id v6 = [(OrgApacheLuceneUtilPriorityQueue *)self pop];
  if (v6)
  {
    id v7 = v6;
    int v8 = size - 1;
    do
    {
      IOSObjectArray_Set((uint64_t)v4, v8, v7);
      id v7 = [(OrgApacheLuceneUtilPriorityQueue *)self pop];
      --v8;
    }
    while (v7);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request_CategoryCountPQ;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end