@interface objc_MessageServerResponse
- (BOOL)shouldAllowDeveloperControl;
- (NSURL)url;
- (_TtC9storekitd26objc_MessageServerResponse)init;
- (_TtC9storekitd26objc_MessageServerResponse)initWithUrl:(id)a3 shouldAllowDevloperControl:(BOOL)a4 messageType:(id)a5;
- (int64_t)messageType;
@end

@implementation objc_MessageServerResponse

- (NSURL)url
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100114E2C((uint64_t)v5);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v8;
}

- (BOOL)shouldAllowDeveloperControl
{
  return sub_100114EC8() & 1;
}

- (int64_t)messageType
{
  return sub_100114EFC();
}

- (_TtC9storekitd26objc_MessageServerResponse)initWithUrl:(id)a3 shouldAllowDevloperControl:(BOOL)a4 messageType:(id)a5
{
  uint64_t v8 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = 1;
  }
  sub_10001B5DC((uint64_t)v10, v12, 1, v11);
  id v13 = a5;
  return (_TtC9storekitd26objc_MessageServerResponse *)sub_100114F0C((uint64_t)v10, a4, a5);
}

- (_TtC9storekitd26objc_MessageServerResponse)init
{
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC9storekitd26objc_MessageServerResponse_url;
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end