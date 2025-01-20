@interface IMKeyTransparencyController
+ (id)sharedController;
- (BOOL)selfOptedIn;
- (IMKeyTransparencyController)init;
- (KTVerifier)verifier;
- (id)idsIDInfoResultForHandleID:(id)a3;
- (id)ktVerifierResultForHandleID:(id)a3;
- (unint64_t)contactKeyVerificationStatusForHandleID:(id)a3 inChat:(id)a4;
- (void)keyTransparencyOptInStateChanged:(BOOL)a3;
- (void)refreshStatusForKTPeerURI:(id)a3;
- (void)setIDSIDInfoResult:(id)a3 forHandleID:(id)a4;
- (void)setKTVerifierResult:(id)a3 forHandleID:(id)a4;
- (void)setKTVerifierResultsFromIDSInfoResultsDictionary:(id)a3;
- (void)setupComplete:(BOOL)a3 info:(id)a4;
@end

@implementation IMKeyTransparencyController

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  uint64_t v5 = sub_1A4CBB0AC();
  v6 = self;
  sub_1A4B0B130(v5);

  swift_bridgeObjectRelease();
}

- (void)keyTransparencyOptInStateChanged:(BOOL)a3
{
  v4 = self;
  sub_1A4B0E400(a3);
}

- (IMKeyTransparencyController)init
{
  return (IMKeyTransparencyController *)sub_1A4B0313C();
}

+ (id)sharedController
{
  if (qword_1E965B598 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E965B648;

  return v2;
}

- (KTVerifier)verifier
{
  return (KTVerifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___IMKeyTransparencyController_verifier));
}

- (BOOL)selfOptedIn
{
  v2 = self;
  char v3 = sub_1A4CA9D44();

  return v3 & 1;
}

- (void)refreshStatusForKTPeerURI:(id)a3
{
  v4 = (void *)sub_1A4CBB0CC();
  unint64_t v6 = v5;
  v7 = self;
  sub_1A4CAB7A0(v4, v6);

  swift_bridgeObjectRelease();
}

- (id)ktVerifierResultForHandleID:(id)a3
{
  return sub_1A4CAA310(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1A4CA9EE4);
}

- (void)setKTVerifierResult:(id)a3 forHandleID:(id)a4
{
}

- (id)idsIDInfoResultForHandleID:(id)a3
{
  return sub_1A4CAA310(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1A4CAA248);
}

- (void)setIDSIDInfoResult:(id)a3 forHandleID:(id)a4
{
}

- (unint64_t)contactKeyVerificationStatusForHandleID:(id)a3 inChat:(id)a4
{
  uint64_t v6 = sub_1A4CBB0CC();
  unint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  unint64_t v11 = sub_1A4CAAA24(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)setKTVerifierResultsFromIDSInfoResultsDictionary:(id)a3
{
  uint64_t v4 = sub_1A4CBB0AC();
  unint64_t v5 = self;
  sub_1A4CAAD80(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMKeyTransparencyController_verifier);
}

@end