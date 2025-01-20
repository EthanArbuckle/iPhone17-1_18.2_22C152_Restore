@interface IMRichCardLayout
- (BOOL)isEqual:(id)a3;
- (IMRichCardLayout)init;
- (IMRichCardLayout)initWithDictionary:(id)a3;
- (IMRichCardLayout)initWithOrientation:(int64_t)a3 imageAlignment:(int64_t)a4 width:(int64_t)a5 titleStyle:(id)a6 descriptionStyle:(id)a7 cardStyleUrl:(id)a8;
- (IMRichCardStyle)descriptionStyle;
- (IMRichCardStyle)titleStyle;
- (NSString)cardStyleUrl;
- (id)dictionaryRepresentation;
- (int64_t)imageAlignment;
- (int64_t)orientation;
- (int64_t)width;
@end

@implementation IMRichCardLayout

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_orientation);
}

- (int64_t)imageAlignment
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_imageAlignment);
}

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_width);
}

- (IMRichCardStyle)titleStyle
{
  return (IMRichCardStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCardLayout_titleStyle));
}

- (IMRichCardStyle)descriptionStyle
{
  return (IMRichCardStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCardLayout_descriptionStyle));
}

- (NSString)cardStyleUrl
{
  if (*(void *)&self->orientation[OBJC_IVAR___IMRichCardLayout_cardStyleUrl])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (IMRichCardLayout)initWithOrientation:(int64_t)a3 imageAlignment:(int64_t)a4 width:(int64_t)a5 titleStyle:(id)a6 descriptionStyle:(id)a7 cardStyleUrl:(id)a8
{
  if (a8)
  {
    uint64_t v14 = sub_1A09F3E18();
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_orientation) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_imageAlignment) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_width) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_titleStyle) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardLayout_descriptionStyle) = (Class)a7;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardLayout_cardStyleUrl);
  uint64_t *v16 = v14;
  v16[1] = v15;
  v20.receiver = self;
  v20.super_class = (Class)IMRichCardLayout;
  id v17 = a6;
  id v18 = a7;
  return [(IMRichCardLayout *)&v20 init];
}

- (IMRichCardLayout)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMRichCardLayout *)IMRichCardLayout.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A0963AD8();

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
  char v6 = IMRichCardLayout.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCardLayout)init
{
  result = (IMRichCardLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end