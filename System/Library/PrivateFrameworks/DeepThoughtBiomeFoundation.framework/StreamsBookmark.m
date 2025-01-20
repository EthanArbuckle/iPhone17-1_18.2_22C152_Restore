@interface StreamsBookmark
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)init;
- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamsBookmark

+ (BOOL)supportsSecureCoding
{
  return byte_269804600;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_269804600 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24C9CBB80(v4);
}

- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)initWithCoder:(id)a3
{
  return (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)StreamsBookmark.init(coder:)(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_24C9CC288();

  v3 = (void *)sub_24C9FFBF0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark)init
{
  result = (_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end