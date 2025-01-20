@interface BlastDoorBasicAudioMessage
- (BlastDoorBasicAudioMessage)init;
- (NSArray)inlineAudioMessages;
- (NSArray)participantDestinationIdentifiers;
- (NSAttributedString)content;
- (NSString)description;
@end

@implementation BlastDoorBasicAudioMessage

- (NSString)description
{
  return (NSString *)sub_1B17A1EA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicAudioMessage_basicAudioMessage);
}

- (NSAttributedString)content
{
  return (NSAttributedString *)sub_1B17A1F58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicAudioMessage_basicAudioMessage);
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A2020((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicAudioMessage_basicAudioMessage);
}

- (NSArray)inlineAudioMessages
{
  return (NSArray *)sub_1B17A2154();
}

- (BlastDoorBasicAudioMessage)init
{
  result = (BlastDoorBasicAudioMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end