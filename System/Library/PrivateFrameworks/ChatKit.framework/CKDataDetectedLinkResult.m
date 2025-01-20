@interface CKDataDetectedLinkResult
- (NSURL)url;
- (_NSRange)range;
- (_TtC7ChatKit24CKDataDetectedLinkResult)init;
@end

@implementation CKDataDetectedLinkResult

- (_NSRange)range
{
  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_range;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_range);
  NSUInteger v4 = *((void *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSURL)url
{
  v2 = (void *)sub_18F7B6050();

  return (NSURL *)v2;
}

- (_TtC7ChatKit24CKDataDetectedLinkResult)init
{
  _NSRange result = (_TtC7ChatKit24CKDataDetectedLinkResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_url;
  uint64_t v3 = sub_18F7B60A0();
  NSUInteger v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end