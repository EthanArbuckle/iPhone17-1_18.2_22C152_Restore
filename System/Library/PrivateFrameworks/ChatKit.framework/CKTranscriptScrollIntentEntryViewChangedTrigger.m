@interface CKTranscriptScrollIntentEntryViewChangedTrigger
- (CKTranscriptScrollIntentEntryViewChangedTrigger)init;
- (CKTranscriptScrollIntentEntryViewChangedTrigger)initWithEntryView:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5 isSendLaterPluginChange:(BOOL)a6;
- (id)updateRequestWithUpdateContext:(id)a3;
@end

@implementation CKTranscriptScrollIntentEntryViewChangedTrigger

- (CKTranscriptScrollIntentEntryViewChangedTrigger)initWithEntryView:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5 isSendLaterPluginChange:(BOOL)a6
{
  id v9 = a3;
  v10 = (CKTranscriptScrollIntentEntryViewChangedTrigger *)sub_18F4BB2A8(v9, a4, a5, a6);

  return v10;
}

- (id)updateRequestWithUpdateContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_18F4BA6D4(v4);

  return v6;
}

- (CKTranscriptScrollIntentEntryViewChangedTrigger)init
{
  result = (CKTranscriptScrollIntentEntryViewChangedTrigger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end