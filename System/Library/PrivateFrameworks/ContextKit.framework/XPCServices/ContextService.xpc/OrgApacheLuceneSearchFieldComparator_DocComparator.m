@interface OrgApacheLuceneSearchFieldComparator_DocComparator
- (OrgApacheLuceneSearchFieldComparator_DocComparator)initWithInt:(int)a3;
- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_DocComparator

- (OrgApacheLuceneSearchFieldComparator_DocComparator)initWithInt:(int)a3
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  docIDs = self->docIDs_;
  if (!docIDs) {
    JreThrowNullPointerException();
  }
  uint64_t size = docIDs->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = docIDs;
  int v7 = *(&docIDs->super.size_ + a3 + 1);
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  return v7 - *(&v6->super.size_ + a4 + 1);
}

- (int)compareBottomWithInt:(int)a3
{
  return self->bottom_ - (self->docBase_ + a3);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  docIDs = self->docIDs_;
  if (!docIDs) {
    JreThrowNullPointerException();
  }
  int docBase = self->docBase_;
  uint64_t size = docIDs->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *(&docIDs->super.size_ + a3 + 1) = docBase + a4;
}

- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  *((_DWORD *)self + 4) = *((_DWORD *)a3 + 8);
  return self;
}

- (void)setBottomWithInt:(int)a3
{
  docIDs = self->docIDs_;
  if (!docIDs) {
    JreThrowNullPointerException();
  }
  uint64_t size = docIDs->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  self->bottom_ = *(&docIDs->super.size_ + a3 + 1);
}

- (void)setTopValueWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->topValue_ = [a3 intValue];
}

- (id)valueWithInt:(int)a3
{
  docIDs = self->docIDs_;
  if (!docIDs) {
    JreThrowNullPointerException();
  }
  uint64_t size = docIDs->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  int v5 = *(&docIDs->super.size_ + a3 + 1);
  return JavaLangInteger_valueOfWithInt_(v5);
}

- (int)compareTopWithInt:(int)a3
{
  return JavaLangInteger_compareWithInt_withInt_(self->topValue_, self->docBase_ + a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_DocComparator;
  [(OrgApacheLuceneSearchFieldComparator_DocComparator *)&v3 dealloc];
}

@end