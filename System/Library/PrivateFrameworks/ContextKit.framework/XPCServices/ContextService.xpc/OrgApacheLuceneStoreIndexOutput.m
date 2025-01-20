@interface OrgApacheLuceneStoreIndexOutput
- (NSString)description;
- (OrgApacheLuceneStoreIndexOutput)initWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneStoreIndexOutput

- (OrgApacheLuceneStoreIndexOutput)initWithNSString:(id)a3
{
  return self;
}

- (NSString)description
{
  return self->resourceDescription_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreIndexOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end