@interface NoKeyboardTextField
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)supportsImagePaste;
- (_TtC11EmojiPoster19NoKeyboardTextField)initWithCoder:(id)a3;
- (_TtC11EmojiPoster19NoKeyboardTextField)initWithFrame:(CGRect)a3;
- (void)buildMenuWithBuilder:(id)a3;
@end

@implementation NoKeyboardTextField

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_20B926BF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  if (sub_20B9267C8() & 1) != 0 || (sub_20B9267C8()) {
    char v7 = 1;
  }
  else {
    char v7 = sub_20B9267C8();
  }

  sub_20B917AEC((uint64_t)v9);
  return v7 & 1;
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  swift_unknownObjectRetain();
  id v4 = v5.receiver;
  [(NoKeyboardTextField *)&v5 buildMenuWithBuilder:a3];
  objc_msgSend(a3, sel_removeMenuForIdentifier_, *MEMORY[0x263F83830], v5.receiver, v5.super_class);
  swift_unknownObjectRelease();
}

- (_TtC11EmojiPoster19NoKeyboardTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  return -[NoKeyboardTextField initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11EmojiPoster19NoKeyboardTextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoKeyboardTextField();
  return [(NoKeyboardTextField *)&v5 initWithCoder:a3];
}

@end