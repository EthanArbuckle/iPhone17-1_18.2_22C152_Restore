@interface URLProtocolDelegate
- (_TtC19AppStoreKitInternal19URLProtocolDelegate)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
@end

@implementation URLProtocolDelegate

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  uint64_t ObjectType = swift_getObjectType();
  v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  id v18 = URLProtocolDelegate.presentDialog(for:)(v16);
  v19 = (void *)swift_allocObject();
  v19[2] = v16;
  v19[3] = sub_1E1973D64;
  v19[4] = v13;
  v19[5] = ObjectType;
  v22[4] = sub_1E1AE09C0;
  v22[5] = v19;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 1107296256;
  v22[2] = sub_1E191CCD0;
  v22[3] = &block_descriptor_41_0;
  v20 = _Block_copy(v22);
  id v21 = v16;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addFinishBlock_, v20);
  _Block_release(v20);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  uint64_t ObjectType = swift_getObjectType();
  v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  id v18 = URLProtocolDelegate.performAuthentication(for:)(v16);
  v19 = (void *)swift_allocObject();
  v19[2] = v16;
  v19[3] = sub_1E1973F6C;
  v19[4] = v13;
  v19[5] = ObjectType;
  v22[4] = sub_1E1AE09BC;
  v22[5] = v19;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 1107296256;
  v22[2] = sub_1E191CCD0;
  v22[3] = &block_descriptor_31_0;
  v20 = _Block_copy(v22);
  id v21 = v16;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addFinishBlock_, v20);
  _Block_release(v20);

  swift_release();
}

- (_TtC19AppStoreKitInternal19URLProtocolDelegate)init
{
  result = (_TtC19AppStoreKitInternal19URLProtocolDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end