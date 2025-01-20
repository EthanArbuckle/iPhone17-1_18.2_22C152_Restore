@interface RemoteViewAccessRequester
- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 error:(id *)a5;
- (BOOL)reportUnknownError:(id)a3 error:(id *)a4;
- (_TtC20IntelligencePlatform25RemoteViewAccessRequester)init;
- (id)requestAssertionForViewName:(id)a3 error:(id *)a4;
@end

@implementation RemoteViewAccessRequester

- (BOOL)reportUnknownError:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1B2E82378();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  RemoteViewAccessRequester.reportUnknownError(_:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1B2E80378();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (BOOL)reportSQLiteError:(id)a3 sqliteErrorCode:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = sub_1B2E82378();
  Swift::String v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  RemoteViewAccessRequester.reportSQLiteError(_:sqliteErrorCode:)(v12, a4);
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1B2E80378();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (id)requestAssertionForViewName:(id)a3 error:(id *)a4
{
  sub_1B2E82378();
  v5 = self;
  id v6 = RemoteViewAccessRequester.requestAssertion(forViewName:)();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC20IntelligencePlatform25RemoteViewAccessRequester)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20IntelligencePlatform25RemoteViewAccessRequester_remoteAccessRequester));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20IntelligencePlatform25RemoteViewAccessRequester_useCase);
}

@end