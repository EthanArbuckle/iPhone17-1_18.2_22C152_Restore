@interface CKTranscriptScrollIntentEntryViewActiveTrigger
- (CKTranscriptScrollIntentEntryViewActiveTrigger)init;
- (CKTranscriptScrollIntentEntryViewActiveTrigger)initWithChatController:(id)a3;
- (id)updateRequestWithUpdateContext:(id)a3;
@end

@implementation CKTranscriptScrollIntentEntryViewActiveTrigger

- (CKTranscriptScrollIntentEntryViewActiveTrigger)initWithChatController:(id)a3
{
  id v3 = a3;
  v4 = (CKTranscriptScrollIntentEntryViewActiveTrigger *)sub_18F55E11C(v3);

  return v4;
}

- (id)updateRequestWithUpdateContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_18F55D980(v4);

  return v6;
}

- (CKTranscriptScrollIntentEntryViewActiveTrigger)init
{
  result = (CKTranscriptScrollIntentEntryViewActiveTrigger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end