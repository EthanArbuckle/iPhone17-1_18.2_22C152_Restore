@interface BlastDoorTextMessageMessageTypeWrapper
- (BlastDoorAudioMessage)audioMessage;
- (BlastDoorBalloonPlugin)balloonPlugin;
- (BlastDoorEmojiTapBack)emojiTapback;
- (BlastDoorMessage)textMessage;
- (BlastDoorSticker)sticker;
- (BlastDoorStickerTapBack)stickerTapback;
- (BlastDoorTapBack)tapback;
- (BlastDoorTextMessageMessageTypeWrapper)init;
- (BlastDoorTypingIndicator)typingIndicator;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorTextMessageMessageTypeWrapper

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage.MessageType, &OBJC_IVAR___BlastDoorTextMessageMessageTypeWrapper_textMessage_MessageType, type metadata accessor for TextMessage.MessageType);
}

- (unint64_t)type
{
  v2 = self;
  unint64_t v3 = sub_1B17B1538();

  return v3;
}

- (BlastDoorTypingIndicator)typingIndicator
{
  v2 = self;
  id v3 = sub_1B17B184C();

  return (BlastDoorTypingIndicator *)v3;
}

- (BlastDoorMessage)textMessage
{
  v2 = self;
  id v3 = sub_1B17B19DC();

  return (BlastDoorMessage *)v3;
}

- (BlastDoorTapBack)tapback
{
  v2 = self;
  id v3 = sub_1B17B1B80();

  return (BlastDoorTapBack *)v3;
}

- (BlastDoorBalloonPlugin)balloonPlugin
{
  v2 = self;
  id v3 = sub_1B17B1D28();

  return (BlastDoorBalloonPlugin *)v3;
}

- (BlastDoorSticker)sticker
{
  v2 = self;
  id v3 = sub_1B17B1F68();

  return (BlastDoorSticker *)v3;
}

- (BlastDoorAudioMessage)audioMessage
{
  v2 = self;
  id v3 = sub_1B17B2120();

  return (BlastDoorAudioMessage *)v3;
}

- (BlastDoorEmojiTapBack)emojiTapback
{
  v2 = self;
  id v3 = sub_1B17B22A0();

  return (BlastDoorEmojiTapBack *)v3;
}

- (BlastDoorStickerTapBack)stickerTapback
{
  v2 = self;
  id v3 = sub_1B17B2458();

  return (BlastDoorStickerTapBack *)v3;
}

- (BlastDoorTextMessageMessageTypeWrapper)init
{
  result = (BlastDoorTextMessageMessageTypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end