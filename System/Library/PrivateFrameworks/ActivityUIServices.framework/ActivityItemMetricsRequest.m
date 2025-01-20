@interface ActivityItemMetricsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGSize)initialSize;
- (CGSize)maximumSize;
- (NSNumber)watchDisplayVariant;
- (NSString)description;
- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets;
- (_TtC18ActivityUIServices20SizeDimensionRequest)heightRequest;
- (_TtC18ActivityUIServices20SizeDimensionRequest)widthRequest;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)init;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithCoder:(id)a3;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8 watchDisplayVariant:(id)a9;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 watchDisplayVariant:(id)a6;
- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithXPCDictionary:(id)a3;
- (double)clipMargin;
- (double)cornerRadius;
- (double)scaleFactor;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setClipMargin:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEdgeInsets:(id)a3;
- (void)setHeightRequest:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)setWatchDisplayVariant:(id)a3;
- (void)setWidthRequest:(id)a3;
@end

@implementation ActivityItemMetricsRequest

- (_TtC18ActivityUIServices20SizeDimensionRequest)widthRequest
{
  return (_TtC18ActivityUIServices20SizeDimensionRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

- (void)setWidthRequest:(id)a3
{
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)heightRequest
{
  return (_TtC18ActivityUIServices20SizeDimensionRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

- (void)setHeightRequest:(id)a3
{
}

- (double)cornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)clipMargin
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  return *v2;
}

- (void)setClipMargin:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)scaleFactor
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return *v2;
}

- (void)setScaleFactor:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  double *v4 = a3;
}

- (NSNumber)watchDisplayVariant
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setWatchDisplayVariant:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets
{
  return (_TtC18ActivityUIServices18ActivityEdgeInsets *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets));
}

- (void)setEdgeInsets:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_23C989C10(a3);
}

- (CGSize)initialSize
{
  double v2 = sub_23C987D2C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSize
{
  double v3 = *(double *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  double v5 = v3 * *v4;
  double v6 = *v4
     * *(double *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5
{
  return [(ActivityItemMetricsRequest *)self initWithWidth:a3 height:a4 cornerRadius:0 edgeInsets:a5 clipMargin:0.0 scaleFactor:1.0];
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 watchDisplayVariant:(id)a6
{
  return [(ActivityItemMetricsRequest *)self initWithWidth:a3 height:a4 cornerRadius:0 edgeInsets:a6 clipMargin:a5 scaleFactor:0.0 watchDisplayVariant:1.0];
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6
{
  return [(ActivityItemMetricsRequest *)self initWithWidth:a3 height:a4 cornerRadius:a6 edgeInsets:a5 clipMargin:0.0 scaleFactor:1.0];
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7
{
  return [(ActivityItemMetricsRequest *)self initWithWidth:a3 height:a4 cornerRadius:a6 edgeInsets:a5 clipMargin:a7 scaleFactor:1.0];
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8
{
  return [(ActivityItemMetricsRequest *)self initWithWidth:a3 height:a4 cornerRadius:a6 edgeInsets:0 clipMargin:a5 scaleFactor:a7 watchDisplayVariant:a8];
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8 watchDisplayVariant:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  v19 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_23C989CA8(v15, v16, a6, a9, a5, a7, a8);

  return v19;
}

- (BOOL)isValid
{
  return sub_23C9886C8();
}

- (int64_t)hash
{
  double v2 = self;
  int64_t v3 = sub_23C9887BC();

  return v3;
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
    double v5 = self;
  }
  char v6 = sub_23C988998((uint64_t)v8);

  sub_23C952480((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  double v2 = self;
  sub_23C988DA0();

  int64_t v3 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_23C989104(a3);
  swift_unknownObjectRelease();
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_23C989F0C(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_23C98940C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_23C9914E0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_23C9895F8(v4);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_23C98A31C(v3);

  return v4;
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)init
{
  CGSize result = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
}

@end