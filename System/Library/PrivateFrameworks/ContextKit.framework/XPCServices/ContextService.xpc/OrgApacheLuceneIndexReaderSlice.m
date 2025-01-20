@interface OrgApacheLuceneIndexReaderSlice
+ (void)initialize;
- (OrgApacheLuceneIndexReaderSlice)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (id)description;
@end

@implementation OrgApacheLuceneIndexReaderSlice

- (OrgApacheLuceneIndexReaderSlice)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  self->start_ = a3;
  self->length_ = a4;
  self->readerIndex_ = a5;
  return self;
}

- (id)description
{
  return (id)JreStrcat("$I$I$I", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"slice start=");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneIndexReaderSlice_class_()];
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneIndexReaderSlice_EMPTY_ARRAY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexReaderSlice__initialized);
  }
}

@end