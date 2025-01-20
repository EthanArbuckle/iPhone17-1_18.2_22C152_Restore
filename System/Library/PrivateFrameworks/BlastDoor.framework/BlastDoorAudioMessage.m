@interface BlastDoorAudioMessage
- (BlastDoorAudioMessage)init;
- (NSArray)inlineAudioMessages;
- (NSArray)participantDestinationIdentifiers;
- (NSAttributedString)content;
- (NSString)description;
@end

@implementation BlastDoorAudioMessage

- (NSString)description
{
  return (NSString *)sub_1B17A1EA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSAttributedString)content
{
  return (NSAttributedString *)sub_1B17A1F58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A2020((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessage_audioMessage);
}

- (NSArray)inlineAudioMessages
{
  return (NSArray *)sub_1B17A2154();
}

- (BlastDoorAudioMessage)init
{
  result = (BlastDoorAudioMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end