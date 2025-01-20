@interface NSURL
- (void)bumpLastOpenDateWithCompletionHandler:(id)a3;
- (void)fetchItemWithBumpLastOpenDate:(BOOL)a3 configuration:(id)a4 completionHandler:(id)a5;
@end

@implementation NSURL

- (void)bumpLastOpenDateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1004BBC60();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v9;
  sub_1004BBC10();
  v10 = self;
  sub_1004BBBF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_release();
}

- (void)fetchItemWithBumpLastOpenDate:(BOOL)a3 configuration:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1004BBC60();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  v15 = self;
  id v16 = a4;
  v17 = self;
  id v18 = [v15 defaultManager];
  sub_1004BBC10();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_100269A2C;
  *(void *)(v19 + 24) = v14;
  *(void *)(v19 + 32) = v16;
  *(unsigned char *)(v19 + 40) = a3;
  id v20 = v16;
  swift_retain();
  sub_1004BF2A0();

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  swift_release();
}

@end