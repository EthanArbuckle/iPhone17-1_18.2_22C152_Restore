@interface OrgApacheLuceneSearchTopFieldDocs
- (OrgApacheLuceneSearchTopFieldDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4 withOrgApacheLuceneSearchSortFieldArray:(id)a5 withFloat:(float)a6;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldDocs

- (OrgApacheLuceneSearchTopFieldDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4 withOrgApacheLuceneSearchSortFieldArray:(id)a5 withFloat:(float)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldDocs;
  [(OrgApacheLuceneSearchTopDocs *)&v3 dealloc];
}

@end