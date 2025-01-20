@interface WKTextExtractionRequest
- (CGRect)rectInWebView;
- (WKTextExtractionRequest)init;
- (WKTextExtractionRequest)initWithRectInWebView:(CGRect)a3 :(id)a4;
- (void)fulfill:(id)a3;
@end

@implementation WKTextExtractionRequest

- (CGRect)rectInWebView
{
  double v2 = sub_246423D2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WKTextExtractionRequest_rectInWebView);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (WKTextExtractionRequest)initWithRectInWebView:(CGRect)a3 :(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  uint64_t *v11 = 0;
  v11[1] = 0;
  v12 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_rectInWebView);
  CGFloat *v12 = x;
  v12[1] = y;
  v12[2] = width;
  v12[3] = height;
  uint64_t v13 = *v11;
  uint64_t *v11 = (uint64_t)sub_24640787C;
  v11[1] = v10;
  swift_retain();
  sub_246407474(v13);
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionRequest();
  v14 = [(WKTextExtractionRequest *)&v16 init];
  swift_release();
  return v14;
}

- (void)fulfill:(id)a3
{
  double v3 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  double v4 = *(void (**)(id))((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  if (v4)
  {
    id v7 = a3;
    v9 = self;
    sub_246407464((uint64_t)v4);
    v4(a3);
    uint64_t v8 = *v3;
    *double v3 = 0;
    v3[1] = 0;
    sub_246407474(v8);
    sub_246407474((uint64_t)v4);
  }
}

- (WKTextExtractionRequest)init
{
  CGRect result = (WKTextExtractionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end