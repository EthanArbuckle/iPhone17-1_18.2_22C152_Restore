@interface IMRichCardStyle
- (BOOL)bold;
- (BOOL)isEqual:(id)a3;
- (BOOL)italics;
- (BOOL)underline;
- (IMRichCardStyle)init;
- (IMRichCardStyle)initWithBold:(BOOL)a3 italics:(BOOL)a4 underline:(BOOL)a5;
- (IMRichCardStyle)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation IMRichCardStyle

- (BOOL)bold
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_bold);
}

- (BOOL)italics
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_italics);
}

- (BOOL)underline
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_underline);
}

- (IMRichCardStyle)initWithBold:(BOOL)a3 italics:(BOOL)a4 underline:(BOOL)a5
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_bold) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_italics) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMRichCardStyle_underline) = a5;
  v6.receiver = self;
  v6.super_class = (Class)IMRichCardStyle;
  return [(IMRichCardStyle *)&v6 init];
}

- (IMRichCardStyle)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMRichCardStyle *)IMRichCardStyle.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08DA8AC();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = IMRichCardStyle.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCardStyle)init
{
  result = (IMRichCardStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end