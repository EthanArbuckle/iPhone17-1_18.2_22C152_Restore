@interface RenderConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC10StickerKit19RenderConfiguration)init;
- (_TtC10StickerKit19RenderConfiguration)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation RenderConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit19RenderConfiguration)initWithBSXPCCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = (void *)sub_2453FFB08();
  unsigned __int8 v8 = objc_msgSend(a3, sel_decodeBoolForKey_, v7);

  *((unsigned char *)&v6->super.isa + OBJC_IVAR____TtC10StickerKit19RenderConfiguration_animatedBackground) = v8;
  v11.receiver = v6;
  v11.super_class = ObjectType;
  v9 = [(RenderConfiguration *)&v11 init];
  swift_unknownObjectRelease();
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t v5 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC10StickerKit19RenderConfiguration_animatedBackground);
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = (id)sub_2453FFB08();
  objc_msgSend(a3, sel_encodeBool_forKey_, v5, v7);
  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_245279B9C((uint64_t)v8);

  sub_245203CD8((uint64_t)v8, &qword_268ECEFA0);
  return v6 & 1;
}

- (_TtC10StickerKit19RenderConfiguration)init
{
  result = (_TtC10StickerKit19RenderConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end