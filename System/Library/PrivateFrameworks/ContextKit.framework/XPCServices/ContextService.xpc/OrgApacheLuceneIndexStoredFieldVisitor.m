@interface OrgApacheLuceneIndexStoredFieldVisitor
- (id)getReusableBytesRef;
- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (void)dealloc;
- (void)setReusableBytesRefWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneIndexStoredFieldVisitor

- (id)getReusableBytesRef
{
  return self->cache_;
}

- (void)setReusableBytesRefWithOrgApacheLuceneUtilBytesRef:(id)a3
{
}

- (void)binaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v7 = +[IOSByteArray arrayWithLength:*((int *)a4 + 5)];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a4 + 1), *((unsigned int *)a4 + 4), v7, 0, *((unsigned int *)a4 + 5));
  [(OrgApacheLuceneIndexStoredFieldVisitor *)self binaryFieldWithOrgApacheLuceneIndexFieldInfo:a3 withByteArray:v7];
}

- (void)stringFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v7 = +[IOSByteArray arrayWithLength:*((int *)a4 + 5)];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a4 + 1), *((unsigned int *)a4 + 4), v7, 0, *((unsigned int *)a4 + 5));
  [(OrgApacheLuceneIndexStoredFieldVisitor *)self stringFieldWithOrgApacheLuceneIndexFieldInfo:a3 withByteArray:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexStoredFieldVisitor;
  [(OrgApacheLuceneIndexStoredFieldVisitor *)&v3 dealloc];
}

@end