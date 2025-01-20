@interface TranscriptionViewComposer
- (_TtC15ConversationKit25TranscriptionViewComposer)init;
- (id)compose;
- (id)composeBackgroundWithView:(id)a3;
@end

@implementation TranscriptionViewComposer

- (id)compose
{
  v2 = self;
  TranscriptionViewComposer.compose()(v3);
  v5 = v4;

  return v5;
}

- (id)composeBackgroundWithView:(id)a3
{
  v4 = (UIView *)a3;
  v5 = self;
  TranscriptionViewComposer.composeBackground(with:)(v6, v4);
  v8 = v7;

  return v8;
}

- (_TtC15ConversationKit25TranscriptionViewComposer)init
{
  return (_TtC15ConversationKit25TranscriptionViewComposer *)TranscriptionViewComposer.init()();
}

@end