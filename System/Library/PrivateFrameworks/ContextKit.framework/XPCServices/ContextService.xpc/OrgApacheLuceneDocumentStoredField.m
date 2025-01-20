@interface OrgApacheLuceneDocumentStoredField
+ (void)initialize;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withByteArray:(id)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withDouble:(double)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withFloat:(float)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withLong:(int64_t)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneDocumentStoredField

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withByteArray:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withFloat:(float)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withLong:(int64_t)a4
{
  return self;
}

- (OrgApacheLuceneDocumentStoredField)initWithNSString:(id)a3 withDouble:(double)a4
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_OrgApacheLuceneDocumentFieldType_init();
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneDocumentStoredField_TYPE_, v2);
    [(id)OrgApacheLuceneDocumentStoredField_TYPE_ setStoredWithBoolean:1];
    [(id)OrgApacheLuceneDocumentStoredField_TYPE_ freeze];
    atomic_store(1u, OrgApacheLuceneDocumentStoredField__initialized);
  }
}

@end