@interface OrgApacheLuceneIndexTermState
- (BOOL)isRealTerm;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation OrgApacheLuceneIndexTermState

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneIndexTermState;
  id v2 = [(OrgApacheLuceneIndexTermState *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (BOOL)isRealTerm
{
  return 1;
}

- (id)description
{
  return @"TermState";
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneIndexTermState *)self clone];
  return v3;
}

@end