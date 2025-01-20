@interface ATArrayOfPlayedMediaItems
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9Archetype25ATArrayOfPlayedMediaItems)init;
- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithCoder:(id)a3;
- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithPlayedMediaItems:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATArrayOfPlayedMediaItems

+ (BOOL)supportsSecureCoding
{
  return byte_26931CF93;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26931CF93 = a3;
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithPlayedMediaItems:(id)a3
{
  return (_TtC9Archetype25ATArrayOfPlayedMediaItems *)sub_24867C14C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for ATPlayedMediaItem, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

- (id)copyWithZone:(void *)a3
{
  return sub_24867C27C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

- (void)encodeWithCoder:(id)a3
{
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithCoder:(id)a3
{
  return (_TtC9Archetype25ATArrayOfPlayedMediaItems *)sub_24867C6EC(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000248680BB0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

- (NSString)description
{
  return (NSString *)sub_24867C7D0(self, (uint64_t)a2, (void (*)(void))sub_24867C840);
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)init
{
  result = (_TtC9Archetype25ATArrayOfPlayedMediaItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end