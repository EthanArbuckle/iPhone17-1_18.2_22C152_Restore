@interface CNKTranscriptionViewComposerFactory
- (CNKTranscriptionViewComposerFactory)init;
- (id)makeViewComposer;
@end

@implementation CNKTranscriptionViewComposerFactory

- (id)makeViewComposer
{
  v2 = self;
  id v3 = CNKTranscriptionViewComposerFactory.makeViewComposer()();

  return v3;
}

- (CNKTranscriptionViewComposerFactory)init
{
  return (CNKTranscriptionViewComposerFactory *)CNKTranscriptionViewComposerFactory.init()();
}

@end