@interface WKTextExtractionLink
- (NSURL)url;
- (WKTextExtractionLink)init;
- (WKTextExtractionLink)initWithURL:(id)a3 range:(_NSRange)a4;
- (_NSRange)range;
@end

@implementation WKTextExtractionLink

- (NSURL)url
{
  return (NSURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                          + OBJC_IVAR___WKTextExtractionLink_url));
}

- (_NSRange)range
{
  v2 = (char *)self + OBJC_IVAR___WKTextExtractionLink_range;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_range);
  NSUInteger v4 = *((void *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (WKTextExtractionLink)initWithURL:(id)a3 range:(_NSRange)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_url) = (Class)a3;
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_range) = a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WKTextExtractionLink();
  id v5 = a3;
  return [(WKTextExtractionLink *)&v7 init];
}

- (WKTextExtractionLink)init
{
  _NSRange result = (WKTextExtractionLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end