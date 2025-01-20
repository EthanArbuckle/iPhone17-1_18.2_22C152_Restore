@interface MPCSharedListeningQueueEventContentPlayedNow
- (MPCSharedListeningQueueEventContentPlayedNow)initWithItems:(id)a3 container:(id)a4 startItem:(id)a5;
- (MPModelGenericObject)container;
- (MPModelGenericObject)startItem;
- (NSArray)items;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentPlayedNow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItem, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (MPModelGenericObject)startItem
{
  return self->_startItem;
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
  container = self->_container;
  if (container) {
    [NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentPlayedNow: %p container=%@ startItem=%@ items=%@>", self, container, self->_startItem, items];
  }
  else {
  v4 = [NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentPlayedNow: %p startItem=%@ items=%@>", self, self->_startItem, items, v6];
  }

  return v4;
}

- (MPCSharedListeningQueueEventContentPlayedNow)initWithItems:(id)a3 container:(id)a4 startItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCSharedListeningQueueEventContentPlayedNow;
  v11 = [(MPCSharedListeningQueueEventContentPlayedNow *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    uint64_t v13 = [v8 copy];
    items = v12->_items;
    v12->_items = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_startItem, a5);
  }

  return v12;
}

@end