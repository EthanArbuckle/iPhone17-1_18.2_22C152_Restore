@interface OrgApacheLuceneSearchFieldValueHitQueue_Entry
- (OrgApacheLuceneSearchFieldValueHitQueue_Entry)initWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5;
- (id)description;
@end

@implementation OrgApacheLuceneSearchFieldValueHitQueue_Entry

- (OrgApacheLuceneSearchFieldValueHitQueue_Entry)initWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5
{
  *(&self->super.shardIndex_ + 1) = a3;
  return self;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)OrgApacheLuceneSearchFieldValueHitQueue_Entry;
  [(OrgApacheLuceneSearchScoreDoc *)&v10 description];
  return (id)JreStrcat("$IC$", v2, v3, v4, v5, v6, v7, v8, @"slot:");
}

@end