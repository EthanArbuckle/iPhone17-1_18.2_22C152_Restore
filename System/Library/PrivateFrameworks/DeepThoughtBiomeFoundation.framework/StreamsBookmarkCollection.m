@interface StreamsBookmarkCollection
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)init;
- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamsBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  return byte_269804601;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_269804601 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  type metadata accessor for StreamsBookmark();
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_24C9FFE40();
  id v8 = (id)sub_24C9FFBF0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)initWithCoder:(id)a3
{
  return (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *)StreamsBookmarkCollection.init(coder:)(a3);
}

- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)init
{
  result = (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end