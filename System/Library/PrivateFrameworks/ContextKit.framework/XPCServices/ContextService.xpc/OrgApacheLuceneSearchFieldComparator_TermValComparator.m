@interface OrgApacheLuceneSearchFieldComparator_TermValComparator
- (BOOL)isNullWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (OrgApacheLuceneSearchFieldComparator_TermValComparator)initWithInt:(int)a3 withNSString:(id)a4 withBoolean:(BOOL)a5;
- (id)getBinaryDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4;
- (id)getComparableBytesWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)getDocsWithFieldWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4;
- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
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

@implementation OrgApacheLuceneSearchFieldComparator_TermValComparator

- (OrgApacheLuceneSearchFieldComparator_TermValComparator)initWithInt:(int)a3 withNSString:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = values;
  v8 = (&values->elementType_)[a3];
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  v9 = (&v7->elementType_)[a4];
  return [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self compareValuesWithId:v8 withId:v9];
}

- (int)compareBottomWithInt:(int)a3
{
  docTerms = self->docTerms_;
  if (!docTerms
    || (uint64_t v5 = *(void *)&a3, (v6 = -[OrgApacheLuceneIndexBinaryDocValues getWithInt:](docTerms, "getWithInt:")) == 0))
  {
    JreThrowNullPointerException();
  }
  v7 = v6;
  if (!v6[5]
    && [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self isNullWithInt:v5 withOrgApacheLuceneUtilBytesRef:v6])
  {
    v7 = 0;
  }
  bottom = self->bottom_;
  return [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self compareValuesWithId:bottom withId:v7];
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  docTerms = self->docTerms_;
  if (!docTerms) {
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v8 = [(OrgApacheLuceneIndexBinaryDocValues *)docTerms getWithInt:*(void *)&a4];
  if (!v8) {
    goto LABEL_23;
  }
  v9 = v8;
  if (!v8[5]
    && [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self isNullWithInt:v6 withOrgApacheLuceneUtilBytesRef:v8])
  {
    values = self->values_;
    if (values)
    {
      uint64_t v11 = (int)v7;
      id v12 = 0;
      goto LABEL_20;
    }
LABEL_23:
    JreThrowNullPointerException();
  }
  tempBRs = self->tempBRs_;
  if (!tempBRs) {
    goto LABEL_23;
  }
  uint64_t size = tempBRs->super.size_;
  if ((v7 & 0x80000000) != 0 || (v15 = self->tempBRs_, (int)size <= (int)v7)) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  if (!(&tempBRs->elementType_)[(int)v7])
  {
    v16 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
    IOSObjectArray_SetAndConsume((uint64_t)tempBRs, (int)v7, v16);
    v15 = self->tempBRs_;
  }
  uint64_t v17 = v15->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v17 <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v17, v7);
  }
  v18 = (&v15->elementType_)[(int)v7];
  if (!v18) {
    goto LABEL_23;
  }
  [(IOSClass *)v18 copyBytesWithOrgApacheLuceneUtilBytesRef:v9];
  v19 = self->values_;
  if (!v19) {
    goto LABEL_23;
  }
  v20 = self->tempBRs_;
  uint64_t v21 = v20->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v21 <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v21, v7);
  }
  v22 = (&v20->elementType_)[(int)v7];
  if (!v22) {
    goto LABEL_23;
  }
  id v12 = [(IOSClass *)v22 get];
  values = v19;
  uint64_t v11 = (int)v7;
LABEL_20:
  IOSObjectArray_Set((uint64_t)values, v11, v12);
}

- (id)getBinaryDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 reader];
  return OrgApacheLuceneIndexDocValues_getBinaryWithOrgApacheLuceneIndexLeafReader_withNSString_(v5, (uint64_t)a4);
}

- (id)getDocsWithFieldWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 reader];
  return OrgApacheLuceneIndexDocValues_getDocsWithFieldWithOrgApacheLuceneIndexLeafReader_withNSString_(v5, (uint64_t)a4);
}

- (BOOL)isNullWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  docsWithField = self->docsWithField_;
  if (docsWithField) {
    LOBYTE(docsWithField) = -[OrgApacheLuceneUtilBits getWithInt:](docsWithField, "getWithInt:", *(void *)&a3, a4) ^ 1;
  }
  return (char)docsWithField;
}

- (id)getLeafComparatorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    JreStrongAssign((id *)&self->docsWithField_, 0);
  }
  return self;
}

- (void)setBottomWithInt:(int)a3
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  uint64_t v6 = (&values->elementType_)[a3];
  JreStrongAssign((id *)&self->bottom_, v6);
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

- (int)compareTopWithInt:(int)a3
{
  docTerms = self->docTerms_;
  if (!docTerms
    || (uint64_t v5 = *(void *)&a3, (v6 = -[OrgApacheLuceneIndexBinaryDocValues getWithInt:](docTerms, "getWithInt:")) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v6;
  if (!v6[5]
    && [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self isNullWithInt:v5 withOrgApacheLuceneUtilBytesRef:v6])
  {
    uint64_t v7 = 0;
  }
  topValue = self->topValue_;
  return [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self compareValuesWithId:topValue withId:v7];
}

- (id)getComparableBytesWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  id v4 = a4;
  if (!*((_DWORD *)a4 + 5)
    && [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)self isNullWithInt:*(void *)&a3 withOrgApacheLuceneUtilBytesRef:a4])
  {
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_TermValComparator;
  [(OrgApacheLuceneSearchFieldComparator_TermValComparator *)&v3 dealloc];
}

@end