@interface MPCSharedListeningPlaybackEvent
- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3;
- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3 item:(id)a4;
- (MPModelGenericObject)item;
- (id)description;
- (int64_t)kind;
@end

@implementation MPCSharedListeningPlaybackEvent

- (void).cxx_destruct
{
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  v3 = NSString;
  unint64_t kind = self->_kind;
  if (kind >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown/kind=%ld", self->_kind);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2643C2150[kind];
  }
  v6 = [v3 stringWithFormat:@"<MPCSharedListeningPlaybackEvent: %p kind=%@>", self, v5];

  return v6;
}

- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3 item:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCSharedListeningPlaybackEvent;
  v8 = [(MPCSharedListeningPlaybackEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_unint64_t kind = a3;
    objc_storeStrong((id *)&v8->_item, a4);
  }

  return v9;
}

- (MPCSharedListeningPlaybackEvent)initWithKind:(int64_t)a3
{
  return [(MPCSharedListeningPlaybackEvent *)self initWithKind:a3 item:0];
}

@end