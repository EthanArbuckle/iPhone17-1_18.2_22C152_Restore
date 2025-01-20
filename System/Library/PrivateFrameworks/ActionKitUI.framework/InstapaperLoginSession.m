@interface InstapaperLoginSession
- (_TtC11ActionKitUI22InstapaperLoginSession)init;
- (void)engine:(id)a3 connection:(id)a4 didReceiveAuthToken:(id)a5 andTokenSecret:(id)a6;
- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5;
@end

@implementation InstapaperLoginSession

- (void)engine:(id)a3 connection:(id)a4 didReceiveAuthToken:(id)a5 andTokenSecret:(id)a6
{
  id v6 = a6;
  if (a5)
  {
    uint64_t v10 = sub_22BF5A4C8();
    uint64_t v12 = v11;
    if (v6)
    {
LABEL_3:
      uint64_t v13 = sub_22BF5A4C8();
      id v6 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  sub_22BEFC978((uint64_t)v17, v18, v10, v12, v13, (uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v12 = a5;
  sub_22BEFCC6C((uint64_t)v12, v11, a5);
}

- (_TtC11ActionKitUI22InstapaperLoginSession)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BEF9CBC((uint64_t)self + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation, &qword_268491498);
}

@end