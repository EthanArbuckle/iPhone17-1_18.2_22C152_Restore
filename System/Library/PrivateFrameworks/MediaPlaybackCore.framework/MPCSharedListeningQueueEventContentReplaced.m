@interface MPCSharedListeningQueueEventContentReplaced
- (MPCSharedListeningQueueEventContentReplaced)initWithStartItem:(id)a3;
- (MPModelGenericObject)startItem;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentReplaced

- (void).cxx_destruct
{
}

- (MPModelGenericObject)startItem
{
  return self->_startItem;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentReplaced: %p startItem=%@>", self, self->_startItem];
}

- (MPCSharedListeningQueueEventContentReplaced)initWithStartItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningQueueEventContentReplaced;
  v6 = [(MPCSharedListeningQueueEventContentReplaced *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_startItem, a3);
  }

  return v7;
}

@end