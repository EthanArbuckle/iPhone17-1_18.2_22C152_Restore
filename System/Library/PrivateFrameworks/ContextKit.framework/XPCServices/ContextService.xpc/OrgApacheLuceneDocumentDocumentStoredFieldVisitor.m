@interface OrgApacheLuceneDocumentDocumentStoredFieldVisitor
- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)init;
- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)initWithJavaUtilSet:(id)a3;
- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)initWithNSStringArray:(id)a3;
- (id)getDocument;
- (id)needsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4;
- (void)dealloc;
- (void)doubleFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withDouble:(double)a4;
- (void)floatFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withFloat:(float)a4;
- (void)intFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4;
- (void)longFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withLong:(int64_t)a4;
- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4;
- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneDocumentDocumentStoredFieldVisitor

- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)initWithJavaUtilSet:(id)a3
{
  return self;
}

- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)initWithNSStringArray:(id)a3
{
  return self;
}

- (OrgApacheLuceneDocumentDocumentStoredFieldVisitor)init
{
  return self;
}

- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4
{
  doc = self->doc_;
  if (!doc || !a3) {
    JreThrowNullPointerException();
  }
  v5 = new_OrgApacheLuceneDocumentStoredField_initWithNSString_withByteArray_(*((void **)a3 + 1), (int *)a4);
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v5];
}

- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if ((atomic_load_explicit(OrgApacheLuceneDocumentTextField__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v7 = new_OrgApacheLuceneDocumentFieldType_initWithOrgApacheLuceneDocumentFieldType_((void *)OrgApacheLuceneDocumentTextField_TYPE_STORED_);
  if (!a3
    || (v8 = v7,
        -[OrgApacheLuceneDocumentFieldType setStoreTermVectorsWithBoolean:](v7, "setStoreTermVectorsWithBoolean:", [a3 hasVectors]), -[OrgApacheLuceneDocumentFieldType setOmitNormsWithBoolean:](v8, "setOmitNormsWithBoolean:", objc_msgSend(a3, "omitsNorms")), -[OrgApacheLuceneDocumentFieldType setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:](v8, "setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:", objc_msgSend(a3, "getIndexOptions")), (doc = self->doc_) == 0)|| !a4)
  {
    JreThrowNullPointerException();
  }
  v10 = (void *)*((void *)a3 + 1);
  uint64_t v11 = *((void *)a4 + 1);
  uint64_t v12 = *((unsigned int *)a4 + 4);
  uint64_t v13 = *((unsigned int *)a4 + 5);
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  v14 = new_OrgApacheLuceneDocumentField_initWithNSString_withNSString_withOrgApacheLuceneDocumentFieldType_(v10, +[NSString stringWithBytes:v11 offset:v12 length:v13 charset:OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_], v8);
  }
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v14];
}

- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withByteArray:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v6 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(a4, 0, *((_DWORD *)a4 + 2));
  [(OrgApacheLuceneDocumentDocumentStoredFieldVisitor *)self stringFieldWithOrgApacheLuceneIndexFieldInfo:a3 withOrgApacheLuceneUtilBytesRef:v6];
}

- (void)intFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4
{
  doc = self->doc_;
  if (!doc || !a3) {
    JreThrowNullPointerException();
  }
  v5 = new_OrgApacheLuceneDocumentStoredField_initWithNSString_withInt_(*((void **)a3 + 1), a4);
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v5];
}

- (void)longFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withLong:(int64_t)a4
{
  doc = self->doc_;
  if (!doc || !a3) {
    JreThrowNullPointerException();
  }
  v5 = new_OrgApacheLuceneDocumentStoredField_initWithNSString_withLong_(*((void **)a3 + 1), a4);
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v5];
}

- (void)floatFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withFloat:(float)a4
{
  doc = self->doc_;
  if (!doc || !a3) {
    JreThrowNullPointerException();
  }
  v5 = new_OrgApacheLuceneDocumentStoredField_initWithNSString_withFloat_(*((void **)a3 + 1), a4);
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v5];
}

- (void)doubleFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withDouble:(double)a4
{
  doc = self->doc_;
  if (!doc || !a3) {
    JreThrowNullPointerException();
  }
  v5 = new_OrgApacheLuceneDocumentStoredField_initWithNSString_withDouble_(*((void **)a3 + 1), a4);
  [(OrgApacheLuceneDocumentDocument *)doc addWithOrgApacheLuceneIndexIndexableField:v5];
}

- (id)needsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fieldsToAdd = self->fieldsToAdd_;
  if (fieldsToAdd)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    if (![(JavaUtilSet *)fieldsToAdd containsWithId:*((void *)a3 + 1)])
    {
      v4 = &qword_100563688;
      if (atomic_load_explicit(OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum__initialized, memory_order_acquire)) {
        return (id)*v4;
      }
LABEL_7:
      objc_opt_class();
      return (id)*v4;
    }
  }
  v4 = &OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum_values_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    goto LABEL_7;
  }
  return (id)*v4;
}

- (id)getDocument
{
  return self->doc_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneDocumentDocumentStoredFieldVisitor;
  [(OrgApacheLuceneIndexStoredFieldVisitor *)&v3 dealloc];
}

@end