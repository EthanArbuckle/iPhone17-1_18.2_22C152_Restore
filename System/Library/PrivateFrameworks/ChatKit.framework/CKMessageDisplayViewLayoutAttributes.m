@interface CKMessageDisplayViewLayoutAttributes
- (BOOL)wantsFrameClamping;
- (CGSize)size;
- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)init;
- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)initWithSize:(CGSize)a3 wantsFrameClamping:(BOOL)a4;
- (void)setSize:(CGSize)a3;
- (void)setWantsFrameClamping:(BOOL)a3;
@end

@implementation CKMessageDisplayViewLayoutAttributes

- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)initWithSize:(CGSize)a3 wantsFrameClamping:(BOOL)a4
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CKMessageDisplayViewLayoutAttributes();
  return [(CKMessageDisplayViewLayoutAttributes *)&v5 init];
}

- (CGSize)size
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_super v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_size);
  swift_beginAccess();
  *objc_super v5 = width;
  v5[1] = height;
}

- (BOOL)wantsFrameClamping
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsFrameClamping:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit36CKMessageDisplayViewLayoutAttributes_wantsFrameClamping;
  swift_beginAccess();
  *double v4 = a3;
}

- (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes)init
{
  CGSize result = (_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end