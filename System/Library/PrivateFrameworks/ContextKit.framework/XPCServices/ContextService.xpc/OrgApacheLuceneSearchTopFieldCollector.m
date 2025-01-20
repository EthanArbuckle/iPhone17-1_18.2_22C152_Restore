@interface OrgApacheLuceneSearchTopFieldCollector
+ (id)createWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
+ (id)createWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8;
+ (void)initialize;
- (BOOL)needsScores;
- (OrgApacheLuceneSearchTopFieldCollector)initWithOrgApacheLuceneUtilPriorityQueue:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4;
- (id)topDocs;
- (void)addWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5;
- (void)dealloc;
- (void)populateResultsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4;
- (void)updateBottomWithInt:(int)a3;
- (void)updateBottomWithInt:(int)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector

- (OrgApacheLuceneSearchTopFieldCollector)initWithOrgApacheLuceneUtilPriorityQueue:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (BOOL)needsScores
{
  return self->needsScores_;
}

+ (id)createWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  return OrgApacheLuceneSearchTopFieldCollector_createWithOrgApacheLuceneSearchSort_withInt_withBoolean_withBoolean_withBoolean_(a3, *(uint64_t *)&a4, a5, a6, a7);
}

+ (id)createWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8
{
  return OrgApacheLuceneSearchTopFieldCollector_createWithOrgApacheLuceneSearchSort_withInt_withOrgApacheLuceneSearchFieldDoc_withBoolean_withBoolean_withBoolean_(a3, *(uint64_t *)&a4, a5, a6, a7, a8);
}

- (void)addWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5
{
}

- (void)updateBottomWithInt:(int)a3
{
}

- (void)updateBottomWithInt:(int)a3 withFloat:(float)a4
{
}

- (void)populateResultsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4
{
  int v4 = a4;
  if (!self->fillFields_)
  {
    uint64_t v9 = (a4 - 1);
    if (a4 - 1 < 0) {
      return;
    }
    while (1)
    {
      pq = self->super.pq_;
      if (!pq) {
        break;
      }
      id v11 = [(OrgApacheLuceneUtilPriorityQueue *)pq pop];
      if (!a3 || !v11) {
        break;
      }
      v12 = new_OrgApacheLuceneSearchFieldDoc_initWithInt_withFloat_(*((_DWORD *)v11 + 3), *((float *)v11 + 2));
      IOSObjectArray_SetAndConsume((uint64_t)a3, v9, v12);
      --v4;
      --v9;
      if (v4 <= 0) {
        return;
      }
    }
    goto LABEL_15;
  }
  v7 = self->super.pq_;
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v8 = (v4 - 1);
  if (v4 - 1 >= 0)
  {
    if (a3 && v7)
    {
      do
      {
        IOSObjectArray_Set((uint64_t)a3, v8--, [(OrgApacheLuceneUtilPriorityQueue *)v7 fillFieldsWithOrgApacheLuceneSearchFieldValueHitQueue_Entry:[(OrgApacheLuceneUtilPriorityQueue *)v7 pop]]);
        --v4;
      }
      while (v4);
      return;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
}

- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4
{
  id v4 = a3;
  if (!a3)
  {
    id v4 = (id)qword_1005600B0;
    *(&self->super.totalHits_ + 1) = 2143289344;
  }
  int totalHits = self->super.totalHits_;
  pq = self->super.pq_;
  objc_opt_class();
  if (!pq) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v8 = new_OrgApacheLuceneSearchTopFieldDocs_initWithInt_withOrgApacheLuceneSearchScoreDocArray_withOrgApacheLuceneSearchSortFieldArray_withFloat_(totalHits, v4, [(OrgApacheLuceneUtilPriorityQueue *)pq getFields], *((float *)&self->super.totalHits_ + 1));
  return v8;
}

- (id)topDocs
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector;
  id v2 = [(OrgApacheLuceneSearchTopDocsCollector *)&v4 topDocs];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector;
  [(OrgApacheLuceneSearchTopDocsCollector *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneSearchScoreDoc_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005600B0, v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneSearchTopFieldCollector__initialized);
  }
}

@end