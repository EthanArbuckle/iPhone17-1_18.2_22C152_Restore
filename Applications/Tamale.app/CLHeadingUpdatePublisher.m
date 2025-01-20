@interface CLHeadingUpdatePublisher
- (_TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher)init;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation CLHeadingUpdatePublisher

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10005634C(v7);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100055A7C(v4);
}

- (_TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher)init
{
  return (_TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher *)sub_100055C28();
}

- (void).cxx_destruct
{
  sub_10000FBD8((uint64_t)self+ OBJC_IVAR____TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher____lazy_storage___liveHeadingUpdates, &qword_10051A888);
  sub_10000FBD8((uint64_t)self+ OBJC_IVAR____TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher_headingContinuation, &qword_10051A898);
  v3 = (char *)self
     + OBJC_IVAR____TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher_authorizationStateUpdates;
  uint64_t v4 = sub_10000F214(&qword_10051A8A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC6TamaleP33_C9ADE6EF0154732DC4BAAB5D2D72EB8C24CLHeadingUpdatePublisher_authorizationStateContinuation;
  uint64_t v6 = sub_10000F214(&qword_10051A878);
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end