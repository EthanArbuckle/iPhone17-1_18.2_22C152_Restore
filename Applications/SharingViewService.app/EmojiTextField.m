@interface EmojiTextField
- (NSString)textInputContextIdentifier;
- (_TtC18SharingViewService14EmojiTextField)initWithCoder:(id)a3;
- (_TtC18SharingViewService14EmojiTextField)initWithFrame:(CGRect)a3;
@end

@implementation EmojiTextField

- (NSString)textInputContextIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC18SharingViewService14EmojiTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EmojiTextField();
  v7 = -[EmojiTextField initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(EmojiTextField *)v7 setKeyboardType:124];
  return v7;
}

- (_TtC18SharingViewService14EmojiTextField)initWithCoder:(id)a3
{
  result = (_TtC18SharingViewService14EmojiTextField *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end