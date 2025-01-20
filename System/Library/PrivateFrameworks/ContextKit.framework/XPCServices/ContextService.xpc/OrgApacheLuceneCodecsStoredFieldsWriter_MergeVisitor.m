@interface OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor
- (OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor)initWithOrgApacheLuceneCodecsStoredFieldsWriter:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withInt:(int)a5;
- (float)boost;
- (id)binaryValue;
- (id)fieldType;
- (id)name;
- (id)needsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)numericValue;
- (id)readerValue;
- (id)stringValue;
- (id)tokenStreamWithOrgApacheLuceneAnalysisAnalyzer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4;
- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4;
- (void)dealloc;
- (void)doubleFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withDouble:(double)a4;
- (void)floatFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withFloat:(float)a4;
- (void)intFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4;
- (void)longFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withLong:(int64_t)a4;
- (void)resetWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4;
- (void)write;
@end

@implementation OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor

- (OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor)initWithOrgApacheLuceneCodecsStoredFieldsWriter:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  v6 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_(a4);
  JreStrongAssignAndConsume((id *)&self->binaryValue_, v6);
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  JreStrongAssign((id *)&self->stringValue_, +[NSString stringWithBytes:a4 charset:OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_]);
  }
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (void)intFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  v6 = JavaLangInteger_valueOfWithInt_(a4);
  JreStrongAssign((id *)&self->numericValue_, v6);
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (void)longFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withLong:(int64_t)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  v6 = JavaLangLong_valueOfWithLong_(a4);
  JreStrongAssign((id *)&self->numericValue_, v6);
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (void)floatFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withFloat:(float)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  v6 = JavaLangFloat_valueOfWithFloat_(a4);
  JreStrongAssign((id *)&self->numericValue_, v6);
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (void)doubleFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withDouble:(double)a4
{
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self resetWithOrgApacheLuceneIndexFieldInfo:a3];
  v6 = JavaLangDouble_valueOfWithDouble_(a4);
  JreStrongAssign((id *)&self->numericValue_, v6);
  [(OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor *)self write];
}

- (id)needsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum_values_[0];
}

- (id)name
{
  currentField = self->currentField_;
  if (!currentField) {
    JreThrowNullPointerException();
  }
  return currentField->name_;
}

- (id)fieldType
{
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgApacheLuceneDocumentStoredField__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return (id)OrgApacheLuceneDocumentStoredField_TYPE_;
  }
}

- (id)binaryValue
{
  return self->binaryValue_;
}

- (id)stringValue
{
  return self->stringValue_;
}

- (id)numericValue
{
  return self->numericValue_;
}

- (id)readerValue
{
  return 0;
}

- (float)boost
{
  return 1.0;
}

- (id)tokenStreamWithOrgApacheLuceneAnalysisAnalyzer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4
{
  return 0;
}

- (void)resetWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  remapper = self->remapper_;
  if (remapper)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    id v5 = [(OrgApacheLuceneIndexFieldInfos *)remapper fieldInfoWithNSString:*((void *)a3 + 1)];
    p_currentField = &self->currentField_;
  }
  else
  {
    p_currentField = &self->currentField_;
    id v5 = a3;
  }
  JreStrongAssign((id *)p_currentField, v5);
  JreStrongAssign((id *)&self->binaryValue_, 0);
  JreStrongAssign((id *)&self->stringValue_, 0);
  JreStrongAssign((id *)&self->numericValue_, 0);
}

- (void)write
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor;
  [(OrgApacheLuceneIndexStoredFieldVisitor *)&v3 dealloc];
}

@end