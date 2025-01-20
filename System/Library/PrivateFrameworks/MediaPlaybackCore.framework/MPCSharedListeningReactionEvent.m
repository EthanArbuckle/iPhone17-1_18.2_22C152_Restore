@interface MPCSharedListeningReactionEvent
- (MPCSharedListeningReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 item:(id)a5;
- (MPModelGenericObject)item;
- (NSString)reaction;
- (NSString)reactionIdentifier;
- (id)description;
@end

@implementation MPCSharedListeningReactionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_reaction, 0);

  objc_storeStrong((id *)&self->_reactionIdentifier, 0);
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (NSString)reaction
{
  return self->_reaction;
}

- (NSString)reactionIdentifier
{
  return self->_reactionIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningReactionEvent: %p reaction=\"%@\" reactionID=%@ item=%@>", self, self->_reaction, self->_reactionIdentifier, self->_item];
}

- (MPCSharedListeningReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 item:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCSharedListeningReactionEvent;
  v11 = [(MPCSharedListeningReactionEvent *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    reaction = v11->_reaction;
    v11->_reaction = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    reactionIdentifier = v11->_reactionIdentifier;
    v11->_reactionIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_item, a5);
  }

  return v11;
}

@end