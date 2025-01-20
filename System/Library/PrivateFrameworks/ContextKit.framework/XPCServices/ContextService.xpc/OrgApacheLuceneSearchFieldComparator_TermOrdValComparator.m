@interface OrgApacheLuceneSearchFieldComparator_TermOrdValComparator
- (OrgApacheLuceneSearchFieldComparator_TermOrdValComparator)initWithInt:(int)a3 withNSString:(id)a4;
- (OrgApacheLuceneSearchFieldComparator_TermOrdValComparator)initWithInt:(int)a3 withNSString:(id)a4 withBoolean:(BOOL)a5;
- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)getSortedDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareValuesWithId:(id)a3 withId:(id)a4;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_TermOrdValComparator

- (OrgApacheLuceneSearchFieldComparator_TermOrdValComparator)initWithInt:(int)a3 withNSString:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchFieldComparator_TermOrdValComparator)initWithInt:(int)a3 withNSString:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  readerGen = self->readerGen_;
  if (!readerGen) {
    goto LABEL_27;
  }
  uint64_t v6 = a3;
  uint64_t size = readerGen->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  if (*(&readerGen->super.size_ + a3 + 1) == *(&readerGen->super.size_ + a4 + 1))
  {
    ords = self->ords_;
    if (ords)
    {
      uint64_t v9 = ords->super.size_;
      if (a3 < 0 || (int)v9 <= a3) {
        IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a3);
      }
      if (a4 < 0 || (int)v9 <= a4) {
        IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a4);
      }
      return *(&ords->super.size_ + a3 + 1) - *(&ords->super.size_ + a4 + 1);
    }
LABEL_27:
    JreThrowNullPointerException();
  }
  values = self->values_;
  if (!values) {
    goto LABEL_27;
  }
  uint64_t v12 = values->super.size_;
  if (a3 < 0 || (int)v12 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v12, *(uint64_t *)&a3);
  }
  v13 = (&values->elementType_)[a3];
  if (a4 < 0 || (int)v12 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v12, *(uint64_t *)&a4);
  }
  v14 = (&values->elementType_)[a4];
  if (v13)
  {
    if (v14)
    {
      v15 = (&values->elementType_)[v6];
      return -[IOSClass compareToWithId:](v15, "compareToWithId:");
    }
    else
    {
      return -self->missingSortCmp_;
    }
  }
  else if (v14)
  {
    return self->missingSortCmp_;
  }
  else
  {
    return 0;
  }
}

- (int)compareBottomWithInt:(int)a3
{
  termsIndex = self->termsIndex_;
  if (!termsIndex) {
    JreThrowNullPointerException();
  }
  int missingOrd = [(OrgApacheLuceneIndexSortedDocValues *)termsIndex getOrdWithInt:*(void *)&a3];
  if (missingOrd == -1) {
    int missingOrd = self->missingOrd_;
  }
  int bottomOrd = self->bottomOrd_;
  BOOL v7 = __OFSUB__(bottomOrd, missingOrd);
  int v8 = bottomOrd - missingOrd;
  if (v8 < 0 != v7) {
    int v9 = -1;
  }
  else {
    int v9 = 1;
  }
  if (self->bottomSameReader_) {
    return v8;
  }
  else {
    return v9;
  }
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  termsIndex = self->termsIndex_;
  if (!termsIndex) {
    goto LABEL_25;
  }
  uint64_t v6 = *(void *)&a3;
  id v7 = [(OrgApacheLuceneIndexSortedDocValues *)termsIndex getOrdWithInt:*(void *)&a4];
  if (v7 == -1)
  {
    values = self->values_;
    if (!values) {
      goto LABEL_25;
    }
    LODWORD(v9) = self->missingOrd_;
    uint64_t v21 = (int)v6;
    id v19 = 0;
  }
  else
  {
    tempBRs = self->tempBRs_;
    if (!tempBRs) {
      goto LABEL_25;
    }
    id v9 = v7;
    uint64_t size = tempBRs->super.size_;
    if ((v6 & 0x80000000) != 0 || (v11 = self->tempBRs_, (int)size <= (int)v6)) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    if (!(&tempBRs->elementType_)[(int)v6])
    {
      uint64_t v12 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
      IOSObjectArray_SetAndConsume((uint64_t)tempBRs, (int)v6, v12);
      v11 = self->tempBRs_;
    }
    uint64_t v13 = v11->super.size_;
    if ((v6 & 0x80000000) != 0 || (int)v13 <= (int)v6) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v6);
    }
    v14 = (&v11->elementType_)[(int)v6];
    if (!v14) {
      goto LABEL_25;
    }
    [(IOSClass *)v14 copyBytesWithOrgApacheLuceneUtilBytesRef:[(OrgApacheLuceneIndexSortedDocValues *)self->termsIndex_ lookupOrdWithInt:v9]];
    v15 = self->values_;
    if (!v15) {
      goto LABEL_25;
    }
    v16 = self->tempBRs_;
    uint64_t v17 = v16->super.size_;
    if ((v6 & 0x80000000) != 0 || (int)v17 <= (int)v6) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v6);
    }
    v18 = (&v16->elementType_)[(int)v6];
    if (!v18) {
LABEL_25:
    }
      JreThrowNullPointerException();
    id v19 = [(IOSClass *)v18 get];
    values = v15;
    uint64_t v21 = (int)v6;
  }
  IOSObjectArray_Set((uint64_t)values, v21, v19);
  ords = self->ords_;
  if (!ords) {
    goto LABEL_25;
  }
  uint64_t v23 = ords->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v23 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v23, v6);
  }
  *(&ords->super.size_ + (int)v6 + 1) = (int)v9;
  readerGen = self->readerGen_;
  if (!readerGen) {
    goto LABEL_25;
  }
  int currentReaderGen = self->currentReaderGen_;
  uint64_t v26 = readerGen->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v26 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v26, v6);
  }
  *(&readerGen->super.size_ + (int)v6 + 1) = currentReaderGen;
}

- (id)getSortedDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 reader];
  return OrgApacheLuceneIndexDocValues_getSortedWithOrgApacheLuceneIndexLeafReader_withNSString_(v5, (uint64_t)a4);
}

- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  p_termsIndex = (id *)&self->termsIndex_;
  JreStrongAssign((id *)&self->termsIndex_, [(OrgApacheLuceneSearchFieldComparator_TermOrdValComparator *)self getSortedDocValuesWithOrgApacheLuceneIndexLeafReaderContext:a3 withNSString:self->field_]);
  ++self->currentReaderGen_;
  if (self->topValue_)
  {
    if (!*p_termsIndex) {
      JreThrowNullPointerException();
    }
    int v5 = objc_msgSend(*p_termsIndex, "lookupTermWithOrgApacheLuceneUtilBytesRef:");
    if (v5 < 0)
    {
      self->topSameReader_ = 0;
      self->topOrd_ = -2 - v5;
    }
    else
    {
      self->topSameReader_ = 1;
      self->topOrd_ = v5;
    }
  }
  else
  {
    self->topOrd_ = self->missingOrd_;
    self->topSameReader_ = 1;
  }
  if (self->bottomSlot_ != -1) {
    -[OrgApacheLuceneSearchFieldComparator_TermOrdValComparator setBottomWithInt:](self, "setBottomWithInt:");
  }
  return self;
}

- (void)setBottomWithInt:(int)a3
{
  self->bottomSlot_ = a3;
  values = self->values_;
  if (!values) {
    goto LABEL_25;
  }
  p_bottomValue = &self->bottomValue_;
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  JreStrongAssign((id *)p_bottomValue, (&values->elementType_)[a3]);
  readerGen = self->readerGen_;
  if (!readerGen) {
    goto LABEL_25;
  }
  int bottomSlot = self->bottomSlot_;
  uint64_t v9 = readerGen->super.size_;
  if (bottomSlot < 0 || bottomSlot >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, bottomSlot);
  }
  if (self->currentReaderGen_ == *(&readerGen->super.size_ + bottomSlot + 1))
  {
    ords = self->ords_;
    if (ords)
    {
      int v11 = self->bottomSlot_;
      uint64_t v12 = ords->super.size_;
      if (v11 < 0 || v11 >= (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v11);
      }
      self->bottomOrd_ = *(&ords->super.size_ + v11 + 1);
      self->bottomSameReader_ = 1;
      return;
    }
LABEL_25:
    JreThrowNullPointerException();
  }
  if (*p_bottomValue)
  {
    termsIndex = self->termsIndex_;
    if (!termsIndex) {
      goto LABEL_25;
    }
    int v14 = -[OrgApacheLuceneIndexSortedDocValues lookupTermWithOrgApacheLuceneUtilBytesRef:](termsIndex, "lookupTermWithOrgApacheLuceneUtilBytesRef:");
    if (v14 < 0)
    {
      self->bottomOrd_ = -2 - v14;
      self->bottomSameReader_ = 0;
      return;
    }
    self->bottomOrd_ = v14;
    self->bottomSameReader_ = 1;
    v15 = self->readerGen_;
    int v16 = self->bottomSlot_;
    uint64_t v17 = v15->super.size_;
    if (v16 < 0 || v16 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v16);
    }
    *(&v15->super.size_ + v16 + 1) = self->currentReaderGen_;
    v18 = self->ords_;
    if (!v18) {
      goto LABEL_25;
    }
    int v19 = self->bottomSlot_;
    uint64_t v20 = v18->super.size_;
    if (v19 < 0 || v19 >= (int)v20) {
      IOSArray_throwOutOfBoundsWithMsg(v20, v19);
    }
    *(&v18->super.size_ + v19 + 1) = self->bottomOrd_;
  }
  else
  {
    self->bottomOrd_ = self->missingOrd_;
    self->bottomSameReader_ = 1;
    uint64_t v21 = self->readerGen_;
    int v22 = self->bottomSlot_;
    uint64_t v23 = v21->super.size_;
    if (v22 < 0 || v22 >= (int)v23) {
      IOSArray_throwOutOfBoundsWithMsg(v23, v22);
    }
    *(&v21->super.size_ + v22 + 1) = self->currentReaderGen_;
  }
}

- (void)setTopValueWithId:(id)a3
{
}

- (id)valueWithInt:(int)a3
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return (&values->elementType_)[a3];
}

- (int)compareTopWithInt:(int)a3
{
  termsIndex = self->termsIndex_;
  if (!termsIndex) {
    JreThrowNullPointerException();
  }
  int missingOrd = [(OrgApacheLuceneIndexSortedDocValues *)termsIndex getOrdWithInt:*(void *)&a3];
  if (missingOrd == -1) {
    int missingOrd = self->missingOrd_;
  }
  int topOrd = self->topOrd_;
  BOOL v7 = __OFSUB__(topOrd, missingOrd);
  int v8 = topOrd - missingOrd;
  if (v8 < 0 != v7) {
    int v9 = -1;
  }
  else {
    int v9 = 1;
  }
  if (self->topSameReader_) {
    return v8;
  }
  else {
    return v9;
  }
}

- (int)compareValuesWithId:(id)a3 withId:(id)a4
{
  if (a3)
  {
    if (a4) {
      return [a3 compareToWithId:a4];
    }
    else {
      return -self->missingSortCmp_;
    }
  }
  else if (a4)
  {
    return self->missingSortCmp_;
  }
  else
  {
    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_TermOrdValComparator;
  [(OrgApacheLuceneSearchFieldComparator_TermOrdValComparator *)&v3 dealloc];
}

@end