@interface OrgApacheLuceneSearchFieldValueHitQueue
+ (id)createWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneSearchFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4;
- (id)fillFieldsWithOrgApacheLuceneSearchFieldValueHitQueue_Entry:(id)a3;
- (id)getComparators;
- (id)getComparatorsWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)getFields;
- (id)getReverseMul;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFieldValueHitQueue

- (OrgApacheLuceneSearchFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4
{
  sub_10002AC68((id *)&self->super.super.isa, (int *)a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

+ (id)createWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneSearchFieldValueHitQueue_createWithOrgApacheLuceneSearchSortFieldArray_withInt_((int *)a3, *(uint64_t *)&a4);
}

- (id)getComparators
{
  return self->comparators_;
}

- (id)getReverseMul
{
  return self->reverseMul_;
}

- (id)getComparatorsWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  comparators = self->comparators_;
  if (!comparators) {
    goto LABEL_10;
  }
  uint64_t v6 = +[IOSObjectArray arrayWithLength:comparators->super.size_ type:OrgApacheLuceneSearchLeafFieldComparator_class_()];
  if (v6->super.size_ >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      v8 = self->comparators_;
      uint64_t size = v8->super.size_;
      if (v7 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      v10 = (&v8->elementType_)[v7];
      if (!v10) {
        break;
      }
      IOSObjectArray_Set((uint64_t)v6, v7++, [(IOSClass *)v10 getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:a3]);
      if (v7 >= v6->super.size_) {
        return v6;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  return v6;
}

- (id)fillFieldsWithOrgApacheLuceneSearchFieldValueHitQueue_Entry:(id)a3
{
  comparators = self->comparators_;
  if (!comparators) {
    goto LABEL_14;
  }
  uint64_t size = comparators->super.size_;
  uint64_t v7 = +[IOSObjectArray arrayWithLength:size type:NSObject_class_()];
  if ((int)size >= 1)
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = self->comparators_;
      uint64_t v10 = v9->super.size_;
      if (v8 >= v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v8);
      }
      v11 = (&v9->elementType_)[v8];
      if (!v11 || !a3) {
        break;
      }
      IOSObjectArray_Set((uint64_t)v7, v8++, [(IOSClass *)v11 valueWithInt:*((unsigned int *)a3 + 5)]);
      if (size == v8) {
        goto LABEL_11;
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_14;
  }
LABEL_11:
  v12 = new_OrgApacheLuceneSearchFieldDoc_initWithInt_withFloat_withNSObjectArray_(*((_DWORD *)a3 + 3), v7, *((float *)a3 + 2));
  return v12;
}

- (id)getFields
{
  return self->fields_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldValueHitQueue;
  [(OrgApacheLuceneUtilPriorityQueue *)&v3 dealloc];
}

@end