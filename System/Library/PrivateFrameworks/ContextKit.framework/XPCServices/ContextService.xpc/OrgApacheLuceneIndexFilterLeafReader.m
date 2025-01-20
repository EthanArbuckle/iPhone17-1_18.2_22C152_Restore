@interface OrgApacheLuceneIndexFilterLeafReader
+ (id)unwrapWithOrgApacheLuceneIndexLeafReader:(id)a3;
- (OrgApacheLuceneIndexFilterLeafReader)initWithOrgApacheLuceneIndexLeafReader:(id)a3;
- (id)description;
- (id)fields;
- (id)getBinaryDocValuesWithNSString:(id)a3;
- (id)getDelegate;
- (id)getDocsWithFieldWithNSString:(id)a3;
- (id)getFieldInfos;
- (id)getLiveDocs;
- (id)getNormValuesWithNSString:(id)a3;
- (id)getNumericDocValuesWithNSString:(id)a3;
- (id)getSortedDocValuesWithNSString:(id)a3;
- (id)getSortedNumericDocValuesWithNSString:(id)a3;
- (id)getSortedSetDocValuesWithNSString:(id)a3;
- (id)getTermVectorsWithInt:(int)a3;
- (int)maxDoc;
- (int)numDocs;
- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
- (void)checkIntegrity;
- (void)dealloc;
- (void)doClose;
- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4;
- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
@end

@implementation OrgApacheLuceneIndexFilterLeafReader

+ (id)unwrapWithOrgApacheLuceneIndexLeafReader:(id)a3
{
  return (id)OrgApacheLuceneIndexFilterLeafReader_unwrapWithOrgApacheLuceneIndexLeafReader_((uint64_t)a3);
}

- (OrgApacheLuceneIndexFilterLeafReader)initWithOrgApacheLuceneIndexLeafReader:(id)a3
{
  return self;
}

- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  in = self->in_;
  id v6 = [(OrgApacheLuceneIndexIndexReader *)self getCoreCacheKey];
  v7 = self->in_;
  if (!v7) {
    JreThrowNullPointerException();
  }
  v8 = sub_10009DA94((OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper *)a3, v6, [(OrgApacheLuceneIndexIndexReader *)v7 getCoreCacheKey]);
  [(OrgApacheLuceneIndexLeafReader *)in addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:v8];
}

- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  in = self->in_;
  id v6 = [(OrgApacheLuceneIndexIndexReader *)self getCoreCacheKey];
  v7 = self->in_;
  if (!v7) {
    JreThrowNullPointerException();
  }
  v8 = sub_10009DA94((OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper *)a3, v6, [(OrgApacheLuceneIndexIndexReader *)v7 getCoreCacheKey]);
  [(OrgApacheLuceneIndexLeafReader *)in removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:v8];
}

- (id)getLiveDocs
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getLiveDocs];
}

- (id)getFieldInfos
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getFieldInfos];
}

- (id)getTermVectorsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getTermVectorsWithInt:v3];
}

- (int)numDocs
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in numDocs];
}

- (int)maxDoc
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in maxDoc];
}

- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexLeafReader *)in documentWithInt:v5 withOrgApacheLuceneIndexStoredFieldVisitor:a4];
}

- (void)doClose
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexIndexReader *)in close];
}

- (id)fields
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in fields];
}

- (id)description
{
  uint64_t v3 = objc_autorelease(new_JavaLangStringBuilder_initWithNSString_(@"FilterLeafReader("));
  [(JavaLangStringBuilder *)v3 appendWithId:self->in_];
  [(JavaLangStringBuilder *)v3 appendWithChar:41];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)getNumericDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getNumericDocValuesWithNSString:a3];
}

- (id)getBinaryDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getBinaryDocValuesWithNSString:a3];
}

- (id)getSortedDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getSortedDocValuesWithNSString:a3];
}

- (id)getSortedNumericDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getSortedNumericDocValuesWithNSString:a3];
}

- (id)getSortedSetDocValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getSortedSetDocValuesWithNSString:a3];
}

- (id)getNormValuesWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getNormValuesWithNSString:a3];
}

- (id)getDocsWithFieldWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexLeafReader *)in getDocsWithFieldWithNSString:a3];
}

- (void)checkIntegrity
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexLeafReader *)in checkIntegrity];
}

- (id)getDelegate
{
  return self->in_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFilterLeafReader;
  [(OrgApacheLuceneIndexLeafReader *)&v3 dealloc];
}

@end