@interface ErrorPresenter
- (_TtC19AppStoreKitInternal14ErrorPresenter)init;
- (void)airplaneModeInquiryDidObserveChange:(id)a3;
- (void)dealloc;
@end

@implementation ErrorPresenter

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkObservation;
  swift_beginAccess();
  if (*((void *)v4 + 3))
  {
    sub_1E15A750C((uint64_t)v4, (uint64_t)v10);
    uint64_t v5 = v11;
    uint64_t v6 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8 = self;
    v7(v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v9 = self;
  }
  v13.receiver = self;
  v13.super_class = ObjectType;
  [(ErrorPresenter *)&v13 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkInquiry);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_airplaneModeInquiry));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_cellularDataInquiry));
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkObservation, &qword_1EBF223E0);
  sub_1E15F6A98((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_view);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_error);
}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ErrorPresenter.update()();
}

- (_TtC19AppStoreKitInternal14ErrorPresenter)init
{
  result = (_TtC19AppStoreKitInternal14ErrorPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end