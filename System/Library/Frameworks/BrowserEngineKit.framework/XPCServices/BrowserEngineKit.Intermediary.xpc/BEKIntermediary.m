@interface BEKIntermediary
- (void)createPlaceholderWithFilename:(NSString *)a3 completionHandler:(id)a4;
- (void)replacePlaceholderWithPlaceholderFileWrapper:(NSSecurityScopedURLWrapper *)a3 downloadedFileWrapper:(NSSecurityScopedURLWrapper *)a4 completionHandler:(id)a5;
@end

@implementation BEKIntermediary

- (void)createPlaceholderWithFilename:(NSString *)a3 completionHandler:(id)a4
{
  sub_10000226C(&qword_10000C7C8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_1000065C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10000C838;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10000C840;
  v13[5] = v12;
  v14 = a3;
  swift_retain();
  sub_1000038C0((uint64_t)v8, (uint64_t)&unk_10000C848, (uint64_t)v13);
  swift_release();
}

- (void)replacePlaceholderWithPlaceholderFileWrapper:(NSSecurityScopedURLWrapper *)a3 downloadedFileWrapper:(NSSecurityScopedURLWrapper *)a4 completionHandler:(id)a5
{
  sub_10000226C(&qword_10000C7C8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_1000065C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10000C7D8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10000C7E8;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  swift_retain();
  sub_1000038C0((uint64_t)v10, (uint64_t)&unk_10000C7F8, (uint64_t)v15);
  swift_release();
}

@end