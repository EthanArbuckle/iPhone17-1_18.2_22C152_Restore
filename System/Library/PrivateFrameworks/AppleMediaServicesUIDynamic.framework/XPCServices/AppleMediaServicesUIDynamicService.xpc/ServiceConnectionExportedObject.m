@interface ServiceConnectionExportedObject
- (void)bootstrapWithAccount:(id)a3 bagData:(id)a4 clientInfo:(id)a5 mediaClientData:(id)a6 metricsContextData:(id)a7 url:(id)a8 completion:(id)a9;
- (void)performWithRequestData:(id)a3 completion:(id)a4;
- (void)setUpWithCompletion:(id)a3;
- (void)tearDownWithCompletion:(id)a3;
- (void)updateWithAccount:(id)a3 completion:(id)a4;
@end

@implementation ServiceConnectionExportedObject

- (void)bootstrapWithAccount:(id)a3 bagData:(id)a4 clientInfo:(id)a5 mediaClientData:(id)a6 metricsContextData:(id)a7 url:(id)a8 completion:(id)a9
{
  id v35 = a3;
  v33 = self;
  uint64_t v15 = sub_1000450E0();
  uint64_t v37 = *(void *)(v15 - 8);
  uint64_t v38 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a9);
  id v36 = a3;
  id v19 = a4;
  id v34 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  swift_retain();
  uint64_t v23 = sub_100045110();
  unint64_t v25 = v24;

  uint64_t v26 = sub_100045110();
  v28 = v27;

  uint64_t v29 = sub_100045110();
  unint64_t v31 = v30;

  sub_1000450A0();
  _Block_copy(v18);
  id v32 = v34;
  sub_10003DC44(v35, v23, v25, (uint64_t)v34, v26, v28, v29, v31, (uint64_t)v17, (uint64_t)v33, v18);
  _Block_release(v18);
  sub_10002758C(v29, v31);
  sub_10002758C(v26, (unint64_t)v28);
  sub_10002758C(v23, v25);

  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v38);
}

- (void)performWithRequestData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = sub_100045110();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10003FB64(v8, v10, (uint64_t)self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  sub_10002758C(v8, v10);

  swift_release();
}

- (void)setUpWithCompletion:(id)a3
{
}

- (void)tearDownWithCompletion:(id)a3
{
}

- (void)updateWithAccount:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain();
  sub_100040F08(a3, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_release();
}

@end