@interface OrgApacheLuceneIndexLeafReader
+ (void)addCoreClosedListenerAsReaderClosedListenerWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a4;
+ (void)removeCoreClosedListenerAsReaderClosedListenerWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a4;
- (OrgApacheLuceneIndexLeafReader)init;
- (id)getContext;
- (id)postingsWithOrgApacheLuceneIndexTerm:(id)a3;
- (id)postingsWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4;
- (id)termDocsEnumWithOrgApacheLuceneIndexTerm:(id)a3;
- (id)termPositionsEnumWithOrgApacheLuceneIndexTerm:(id)a3;
- (id)termsWithNSString:(id)a3;
- (int)docFreqWithOrgApacheLuceneIndexTerm:(id)a3;
- (int)getDocCountWithNSString:(id)a3;
- (int64_t)getSumDocFreqWithNSString:(id)a3;
- (int64_t)getSumTotalTermFreqWithNSString:(id)a3;
- (int64_t)totalTermFreqWithOrgApacheLuceneIndexTerm:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexLeafReader

- (OrgApacheLuceneIndexLeafReader)init
{
  return self;
}

- (id)getContext
{
  return self->readerContext_;
}

+ (void)addCoreClosedListenerAsReaderClosedListenerWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a4
{
}

+ (void)removeCoreClosedListenerAsReaderClosedListenerWithOrgApacheLuceneIndexIndexReader:(id)a3 withOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a4
{
}

- (int)docFreqWithOrgApacheLuceneIndexTerm:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  id v5 = [a3 field];
  id v6 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [v6 termsWithNSString:v5];
  if (!v7) {
    return 0;
  }
  id v8 = [v7 iterator];
  if (!v8) {
LABEL_10:
  }
    JreThrowNullPointerException();
  v9 = v8;
  if (!objc_msgSend(v8, "seekExactWithOrgApacheLuceneUtilBytesRef:", objc_msgSend(a3, "bytes"))) {
    return 0;
  }
  return [v9 docFreq];
}

- (int64_t)totalTermFreqWithOrgApacheLuceneIndexTerm:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  id v5 = [a3 field];
  id v6 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [v6 termsWithNSString:v5];
  if (!v7) {
    return 0;
  }
  id v8 = [v7 iterator];
  if (!v8) {
LABEL_10:
  }
    JreThrowNullPointerException();
  v9 = v8;
  if (!objc_msgSend(v8, "seekExactWithOrgApacheLuceneUtilBytesRef:", objc_msgSend(a3, "bytes"))) {
    return 0;
  }
  return (int64_t)[v9 totalTermFreq];
}

- (int64_t)getSumDocFreqWithNSString:(id)a3
{
  id v4 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v4) {
    JreThrowNullPointerException();
  }
  int64_t result = (int64_t)[v4 termsWithNSString:a3];
  if (result)
  {
    return (int64_t)[(id)result getSumDocFreq];
  }
  return result;
}

- (int)getDocCountWithNSString:(id)a3
{
  id v4 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 termsWithNSString:a3];
  if (v5)
  {
    LODWORD(v5) = [v5 getDocCount];
  }
  return (int)v5;
}

- (int64_t)getSumTotalTermFreqWithNSString:(id)a3
{
  id v4 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v4) {
    JreThrowNullPointerException();
  }
  int64_t result = (int64_t)[v4 termsWithNSString:a3];
  if (result)
  {
    return (int64_t)[(id)result getSumTotalTermFreq];
  }
  return result;
}

- (id)termsWithNSString:(id)a3
{
  id v4 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 termsWithNSString:a3];
}

- (id)postingsWithOrgApacheLuceneIndexTerm:(id)a3 withInt:(int)a4
{
  return sub_1000DC210(self, a3, *(uint64_t *)&a4);
}

- (id)postingsWithOrgApacheLuceneIndexTerm:(id)a3
{
  return sub_1000DC210(self, a3, 8);
}

- (id)termDocsEnumWithOrgApacheLuceneIndexTerm:(id)a3
{
  id v5 = [a3 field];
  id v6 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = [v6 termsWithNSString:v5];
  if (!v7) {
    return 0;
  }
  id v8 = [v7 iterator];
  if (!v8) {
LABEL_9:
  }
    JreThrowNullPointerException();
  v9 = v8;
  if (!objc_msgSend(v8, "seekExactWithOrgApacheLuceneUtilBytesRef:", objc_msgSend(a3, "bytes"))) {
    return 0;
  }
  id v10 = [(OrgApacheLuceneIndexLeafReader *)self getLiveDocs];
  return [v9 docsWithOrgApacheLuceneUtilBits:v10 withOrgApacheLuceneIndexDocsEnum:0];
}

- (id)termPositionsEnumWithOrgApacheLuceneIndexTerm:(id)a3
{
  id v5 = [a3 field];
  id v6 = [(OrgApacheLuceneIndexLeafReader *)self fields];
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = [v6 termsWithNSString:v5];
  if (!v7) {
    return 0;
  }
  id v8 = [v7 iterator];
  if (!v8) {
LABEL_9:
  }
    JreThrowNullPointerException();
  v9 = v8;
  if (!objc_msgSend(v8, "seekExactWithOrgApacheLuceneUtilBytesRef:", objc_msgSend(a3, "bytes"))) {
    return 0;
  }
  id v10 = [(OrgApacheLuceneIndexLeafReader *)self getLiveDocs];
  return [v9 docsAndPositionsWithOrgApacheLuceneUtilBits:v10 withOrgApacheLuceneIndexDocsAndPositionsEnum:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReader;
  [(OrgApacheLuceneIndexIndexReader *)&v3 dealloc];
}

@end