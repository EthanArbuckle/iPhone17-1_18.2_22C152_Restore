@interface LayoutDirectionTraitConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC10StickerKit33LayoutDirectionTraitConfiguration)init;
- (_TtC10StickerKit33LayoutDirectionTraitConfiguration)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation LayoutDirectionTraitConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit33LayoutDirectionTraitConfiguration)initWithBSXPCCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10StickerKit33LayoutDirectionTraitConfiguration_layoutDirection);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit33LayoutDirectionTraitConfiguration_layoutDirection) = (Class)-1;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = (void *)sub_2453FFB08();
  id v9 = objc_msgSend(a3, sel_decodeInt64ForKey_, v8);

  swift_beginAccess();
  void *v6 = v9;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = [(LayoutDirectionTraitConfiguration *)&v12 init];
  swift_unknownObjectRelease();
  return v10;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10StickerKit33LayoutDirectionTraitConfiguration_layoutDirection);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = (void *)sub_2453FFB08();
  objc_msgSend(a3, sel_encodeInt64_forKey_, v6, v8);
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
    v5 = self;
  }
  BOOL v6 = LayoutDirectionTraitConfiguration.isEqual(_:)((uint64_t)v8);

  sub_245281718((uint64_t)v8);
  return v6;
}

- (_TtC10StickerKit33LayoutDirectionTraitConfiguration)init
{
  result = (_TtC10StickerKit33LayoutDirectionTraitConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end