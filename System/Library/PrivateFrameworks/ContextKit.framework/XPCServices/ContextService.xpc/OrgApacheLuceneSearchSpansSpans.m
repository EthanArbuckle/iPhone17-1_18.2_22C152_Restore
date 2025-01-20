@interface OrgApacheLuceneSearchSpansSpans
- (OrgApacheLuceneSearchSpansSpans)init;
- (id)asTwoPhaseIterator;
- (id)description;
@end

@implementation OrgApacheLuceneSearchSpansSpans

- (id)asTwoPhaseIterator
{
  return 0;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  id v4 = [(OrgApacheLuceneSearchSpansSpans *)self getClass];
  if ([v4 isAnonymousClass]) {
    id v5 = [v4 getName];
  }
  else {
    id v5 = [v4 getSimpleName];
  }
  [(JavaLangStringBuilder *)v3 appendWithNSString:v5];
  id v6 = -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", @"(doc=");
  if (!v6
    || (objc_msgSend(v6, "appendWithInt:", -[OrgApacheLuceneSearchSpansSpans docID](self, "docID")),
        (id v7 = [(JavaLangStringBuilder *)v3 appendWithNSString:@",start="]) == 0)
    || (objc_msgSend(v7, "appendWithInt:", -[OrgApacheLuceneSearchSpansSpans startPosition](self, "startPosition")),
        (id v8 = [(JavaLangStringBuilder *)v3 appendWithNSString:@",end="]) == 0))
  {
    JreThrowNullPointerException();
  }
  objc_msgSend(v8, "appendWithInt:", -[OrgApacheLuceneSearchSpansSpans endPosition](self, "endPosition"));
  [(JavaLangStringBuilder *)v3 appendWithNSString:@""]);
  return [(JavaLangStringBuilder *)v3 description];
}

- (OrgApacheLuceneSearchSpansSpans)init
{
  return self;
}

@end