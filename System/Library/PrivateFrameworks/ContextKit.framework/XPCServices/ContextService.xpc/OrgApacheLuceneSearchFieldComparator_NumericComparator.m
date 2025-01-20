@interface OrgApacheLuceneSearchFieldComparator_NumericComparator
- (OrgApacheLuceneSearchFieldComparator_NumericComparator)initWithNSString:(id)a3 withNSNumber:(id)a4;
- (id)getDocsWithValueWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4;
- (id)getNumericDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4;
- (void)dealloc;
- (void)doSetNextReaderWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_NumericComparator

- (OrgApacheLuceneSearchFieldComparator_NumericComparator)initWithNSString:(id)a3 withNSNumber:(id)a4
{
  return self;
}

- (void)doSetNextReaderWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  JreStrongAssign((id *)&self->currentReaderValues_, [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)self getNumericDocValuesWithOrgApacheLuceneIndexLeafReaderContext:a3 withNSString:self->field_]);
  if (!self->missingValue_
    || (JreStrongAssign((id *)&self->docsWithField_, [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)self getDocsWithValueWithOrgApacheLuceneIndexLeafReaderContext:a3 withNSString:self->field_]), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    JreStrongAssign((id *)&self->docsWithField_, 0);
  }
}

- (id)getNumericDocValuesWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 reader];
  return OrgApacheLuceneIndexDocValues_getNumericWithOrgApacheLuceneIndexLeafReader_withNSString_(v5, (uint64_t)a4);
}

- (id)getDocsWithValueWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withNSString:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 reader];
  return OrgApacheLuceneIndexDocValues_getDocsWithFieldWithOrgApacheLuceneIndexLeafReader_withNSString_(v5, (uint64_t)a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_NumericComparator;
  [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)&v3 dealloc];
}

@end