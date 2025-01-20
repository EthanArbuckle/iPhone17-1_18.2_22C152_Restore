@interface ActivityEdgeInsets
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)init;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithBSXPCCoder:(id)a3;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6;
- (double)bottom;
- (double)leading;
- (double)top;
- (double)trailing;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBottom:(double)a3;
- (void)setLeading:(double)a3;
- (void)setTop:(double)a3;
- (void)setTrailing:(double)a3;
@end

@implementation ActivityEdgeInsets

- (double)top
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  return *v2;
}

- (void)setTop:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)leading
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  return *v2;
}

- (void)setLeading:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)bottom
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  return *v2;
}

- (void)setBottom:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)trailing
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrailing:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  double *v4 = a3;
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return [(ActivityEdgeInsets *)&v3 init];
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  v10 = [(ActivityEdgeInsets *)self init];
  v11 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  double *v11 = a3;
  v12 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  double *v12 = a4;
  v13 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  double *v13 = a5;
  v14 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  double *v14 = a6;
  return v10;
}

- (int64_t)hash
{
  return sub_23C979350();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_23C9794A0((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_23C97973C();

  objc_super v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  objc_super v3 = self;
  sub_23C9798FC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_23C9914E0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_23C979AE8(a3);
  swift_unknownObjectRelease();
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC18ActivityUIServices18ActivityEdgeInsets *)sub_23C979EF4(a3);
  swift_unknownObjectRelease();
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C979AE8(v4);
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices18ActivityEdgeInsets *)sub_23C979EF4(v3);

  return v4;
}

@end