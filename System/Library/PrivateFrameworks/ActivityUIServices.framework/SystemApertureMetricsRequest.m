@interface SystemApertureMetricsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)obstructionSize;
- (NSString)description;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactLeadingMetricsRequest;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactTrailingMetricsRequest;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)expandedMetricsRequest;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)minimalMetricsRequest;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)init;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8;
- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithXPCDictionary:(id)a3;
- (double)obstructionTopMargin;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setCompactLeadingMetricsRequest:(id)a3;
- (void)setCompactTrailingMetricsRequest:(id)a3;
- (void)setExpandedMetricsRequest:(id)a3;
- (void)setMinimalMetricsRequest:(id)a3;
- (void)setObstructionSize:(CGSize)a3;
- (void)setObstructionTopMargin:(double)a3;
@end

@implementation SystemApertureMetricsRequest

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)expandedMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
}

- (void)setExpandedMetricsRequest:(id)a3
{
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactLeadingMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
}

- (void)setCompactLeadingMetricsRequest:(id)a3
{
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactTrailingMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
}

- (void)setCompactTrailingMetricsRequest:(id)a3
{
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)minimalMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

- (void)setMinimalMetricsRequest:(id)a3
{
}

- (CGSize)obstructionSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setObstructionSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  CGFloat *v5 = width;
  v5[1] = height;
}

- (double)obstructionTopMargin
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  return *v2;
}

- (void)setObstructionTopMargin:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  *double v4 = a3;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8
{
  *(CGSize *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize) = a3;
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin) = a4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest) = (Class)a5;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest) = (Class)a6;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest) = (Class)a7;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest) = (Class)a8;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  return [(SystemApertureMetricsRequest *)&v17 init];
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7
{
  return -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](self, sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a4, a5, a6, a7, a3.width, a3.height, 0.0);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_23C95F0C8();

  return v3;
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
  BOOL v6 = sub_23C95F33C((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_23C95F650();

  int64_t v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_23C95F94C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  double v4 = (void *)sub_23C9914E0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v3 = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)sub_23C9601DC();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  sub_23C95FBB0();
  swift_unknownObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C95FD30(v4);
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)sub_23C9604CC(v3);

  return v4;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)init
{
  CGSize result = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

@end