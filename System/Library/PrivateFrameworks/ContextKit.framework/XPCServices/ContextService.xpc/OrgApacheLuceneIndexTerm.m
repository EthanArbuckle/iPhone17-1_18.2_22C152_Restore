@interface OrgApacheLuceneIndexTerm
+ (id)toStringWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3;
- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)bytes;
- (id)field;
- (id)text;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneIndexTerm

- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexTerm)initWithNSString:(id)a3
{
  return self;
}

- (id)field
{
  return self->field_;
}

- (id)text
{
  return OrgApacheLuceneIndexTerm_toStringWithOrgApacheLuceneUtilBytesRef_((uint64_t)self->bytes_);
}

+ (id)toStringWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneIndexTerm_toStringWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
}

- (id)bytes
{
  return self->bytes_;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_4;
  }
  id v5 = [(OrgApacheLuceneIndexTerm *)self getClass];
  if (v5 != [a3 getClass]) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  field = self->field_;
  uint64_t v8 = *((void *)a3 + 1);
  if (field)
  {
    unsigned int v6 = [(NSString *)field isEqual:v8];
    if (!v6) {
      return v6;
    }
  }
  else if (v8)
  {
    goto LABEL_4;
  }
  bytes = self->bytes_;
  uint64_t v10 = *((void *)a3 + 2);
  if (bytes)
  {
    unsigned int v6 = [(OrgApacheLuceneUtilBytesRef *)bytes isEqual:v10];
    if (!v6) {
      return v6;
    }
    goto LABEL_14;
  }
  if (!v10)
  {
LABEL_14:
    LOBYTE(v6) = 1;
    return v6;
  }
LABEL_4:
  LOBYTE(v6) = 0;
  return v6;
}

- (unint64_t)hash
{
  field = self->field_;
  if (field) {
    unsigned int v4 = 31 * [(NSString *)field hash] + 961;
  }
  else {
    unsigned int v4 = 961;
  }
  bytes = self->bytes_;
  if (bytes) {
    LODWORD(bytes) = [(OrgApacheLuceneUtilBytesRef *)bytes hash];
  }
  return (int)(bytes + v4);
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  field = self->field_;
  if (!field) {
    goto LABEL_11;
  }
  if ([(NSString *)field isEqual:*((void *)a3 + 1)])
  {
    bytes = self->bytes_;
    if (bytes)
    {
      uint64_t v7 = *((void *)a3 + 2);
      goto LABEL_8;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  bytes = (OrgApacheLuceneUtilBytesRef *)self->field_;
  uint64_t v7 = *((void *)a3 + 1);
LABEL_8:
  return [(OrgApacheLuceneUtilBytesRef *)bytes compareToWithId:v7];
}

- (void)setWithNSString:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  JreStrongAssign((id *)&self->field_, a3);
  JreStrongAssign((id *)&self->bytes_, a4);
}

- (NSString)description
{
  field = self->field_;
  OrgApacheLuceneIndexTerm_toStringWithOrgApacheLuceneUtilBytesRef_((uint64_t)self->bytes_);
  return (NSString *)JreStrcat("$C$", v3, v4, v5, v6, v7, v8, v9, field);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexTerm;
  [(OrgApacheLuceneIndexTerm *)&v3 dealloc];
}

@end