@interface OrgApacheLuceneSearchTopDocs_ShardRef
- (OrgApacheLuceneSearchTopDocs_ShardRef)initWithInt:(int)a3;
- (id)description;
@end

@implementation OrgApacheLuceneSearchTopDocs_ShardRef

- (OrgApacheLuceneSearchTopDocs_ShardRef)initWithInt:(int)a3
{
  self->shardIndex_ = a3;
  return self;
}

- (id)description
{
  return (id)JreStrcat("$I$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"ShardRef(shardIndex=");
}

@end