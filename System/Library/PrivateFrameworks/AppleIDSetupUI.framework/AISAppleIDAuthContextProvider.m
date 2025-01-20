@interface AISAppleIDAuthContextProvider
- (_TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider)init;
- (id)remoteUIStyle;
- (void)contextDidDismissLoginAlertController:(id)a3;
- (void)contextDidEndPresentingSecondaryUI:(id)a3;
- (void)contextDidPresentLoginAlertController:(id)a3;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)contextWillDismissLoginAlertController:(id)a3;
- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation AISAppleIDAuthContextProvider

- (_TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider)init
{
  result = (_TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider_presentingViewController));
  v3 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider_delegate;
  sub_2482C3D88((uint64_t)v3);
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_248327890();
}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_248327A14();
}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_248327B98();
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_248327D1C();
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_248327EA0();
}

- (id)remoteUIStyle
{
  v2 = (void *)sub_248328024();
  return v2;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24832815C();
}

- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269313750);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24835D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269314B78;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269314B80;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_248345748((uint64_t)v9, (uint64_t)&unk_269315240, (uint64_t)v14);
  swift_release();
}

@end