@interface CLBOpenApplicationVerifierResult
- (CLBOpenApplicationVerifierResult)init;
- (CLBOpenApplicationVerifierResultError)error;
- (NSURL)pptTestURL;
@end

@implementation CLBOpenApplicationVerifierResult

- (CLBOpenApplicationVerifierResultError)error
{
  v2 = self;
  id v3 = sub_10008AAB8();

  return (CLBOpenApplicationVerifierResultError *)v3;
}

- (NSURL)pptTestURL
{
  uint64_t v3 = sub_100029F90(&qword_10017E8E0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___CLBOpenApplicationVerifierResult_implementation;
  uint64_t v7 = type metadata accessor for OpenApplicationVerifierResult();
  sub_10008CA18((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }

  return (NSURL *)v11;
}

- (CLBOpenApplicationVerifierResult)init
{
  result = (CLBOpenApplicationVerifierResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end