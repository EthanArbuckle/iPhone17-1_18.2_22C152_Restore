@interface ActivitySceneMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)description;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)init;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5;
- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithXPCDictionary:(id)a3;
- (double)cornerRadius;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEdgeInsets:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ActivitySceneMetrics

- (CGSize)size
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
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
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  CGFloat *v5 = width;
  v5[1] = height;
}

- (double)cornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  *double v4 = a3;
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  return (_TtC18ActivityUIServices18ActivityEdgeInsets *)*v2;
}

- (void)setEdgeInsets:(id)a3
{
  double v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v5 = *v4;
  *double v4 = a3;
  id v6 = a3;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  double v3 = (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_23C9813EC();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_23C980778((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5
{
  v7 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets) = 0;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius) = a4;
  swift_beginAccess();
  v8 = *v7;
  *v7 = a5;
  id v9 = a5;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  v10 = [(ActivitySceneMetrics *)&v12 init];

  return v10;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets) = 0;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius) = a4;
  swift_beginAccess();
  id v6 = *v5;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v5 = 0;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return [(ActivitySceneMetrics *)&v8 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_23C980C3C((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C980EA8(v4);
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_23C981560(v3);

  return v4;
}

- (NSString)description
{
  v2 = self;
  sub_23C981190();

  id v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)init
{
  CGSize result = (_TtC18ActivityUIServices20ActivitySceneMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end