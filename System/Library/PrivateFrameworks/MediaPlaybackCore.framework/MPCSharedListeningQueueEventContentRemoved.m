@interface MPCSharedListeningQueueEventContentRemoved
- (MPCSharedListeningQueueEventContentRemoved)initWithItem:(id)a3;
- (MPModelGenericObject)item;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentRemoved

- (void).cxx_destruct
{
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentRemoved: %p item=%@>", self, self->_item];
}

- (MPCSharedListeningQueueEventContentRemoved)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningQueueEventContentRemoved;
  v6 = [(MPCSharedListeningQueueEventContentRemoved *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

@end