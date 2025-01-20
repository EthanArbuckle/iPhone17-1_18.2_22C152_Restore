@interface MPCSharedListeningQueueEventContentAdded
- (MPCSharedListeningQueueEventContentAdded)initWithItems:(id)a3 container:(id)a4;
- (MPModelGenericObject)container;
- (NSArray)items;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentAdded

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (NSArray)items
{
  return self->_items;
}

- (MPModelGenericObject)container
{
  return self->_container;
}

- (id)description
{
  items = self->_items;
  if (self->_container) {
    [NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentAdded: %p container=%@ items=%@>", self, self->_container, items];
  }
  else {
  v3 = [NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentAdded: %p items=%@>", self, items, v5];
  }

  return v3;
}

- (MPCSharedListeningQueueEventContentAdded)initWithItems:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPCSharedListeningQueueEventContentAdded;
  v8 = [(MPCSharedListeningQueueEventContentAdded *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_container, a4);
    uint64_t v10 = [v6 copy];
    items = v9->_items;
    v9->_items = (NSArray *)v10;
  }
  return v9;
}

@end