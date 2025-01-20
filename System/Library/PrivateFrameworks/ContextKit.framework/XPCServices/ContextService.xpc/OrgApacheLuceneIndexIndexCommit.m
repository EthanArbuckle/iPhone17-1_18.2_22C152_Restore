@interface OrgApacheLuceneIndexIndexCommit
- (BOOL)isEqual:(id)a3;
- (id)getReader;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneIndexIndexCommit

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [a3 getDirectory];
  if (v5 != [(OrgApacheLuceneIndexIndexCommit *)self getDirectory]) {
    return 0;
  }
  id v7 = [a3 getGeneration];
  return v7 == [(OrgApacheLuceneIndexIndexCommit *)self getGeneration];
}

- (unint64_t)hash
{
  id v3 = [(OrgApacheLuceneIndexIndexCommit *)self getDirectory];
  if (!v3) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [v3 hash];
  return (int)([JavaLangLong_valueOfWithLong_((int64_t)[(OrgApacheLuceneIndexIndexCommit *)self getGeneration]) hash]+ v4);
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    [(OrgApacheLuceneIndexIndexCommit *)self getDirectory];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [(OrgApacheLuceneIndexIndexCommit *)self getDirectory];
  if (v5 != [a3 getDirectory])
  {
    v9 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"cannot compare IndexCommits from different Directory instances");
    objc_exception_throw(v9);
  }
  id v6 = [(OrgApacheLuceneIndexIndexCommit *)self getGeneration];
  id v7 = [a3 getGeneration];
  return JavaLangLong_compareWithLong_withLong_((uint64_t)v6, (uint64_t)v7);
}

- (id)getReader
{
  return 0;
}

@end