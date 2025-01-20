@interface MPCSharedListeningQueueEventContentReordered
- (MPCSharedListeningQueueEventContentReordered)initWithItem:(id)a3;
- (MPModelGenericObject)item;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentReordered

- (void).cxx_destruct
{
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentReordered: %p item=%@>", self, self->_item];
}

- (MPCSharedListeningQueueEventContentReordered)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningQueueEventContentReordered;
  v6 = [(MPCSharedListeningQueueEventContentReordered *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

@end