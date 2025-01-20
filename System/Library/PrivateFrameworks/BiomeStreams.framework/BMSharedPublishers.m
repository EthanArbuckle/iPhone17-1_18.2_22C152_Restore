@interface BMSharedPublishers
- (BMSharedPublishers)initWithPublishers:(id)a3;
- (NSArray)publishers;
- (id)merge;
@end

@implementation BMSharedPublishers

- (BMSharedPublishers)initWithPublishers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSharedPublishers;
  v5 = [(BMSharedPublishers *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    publishers = v5->_publishers;
    v5->_publishers = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
}

- (id)merge
{
  id v3 = objc_alloc(MEMORY[0x1E4F50218]);
  id v4 = [(BMSharedPublishers *)self publishers];
  v5 = (void *)[v3 initWithPublishers:v4];

  return v5;
}

@end