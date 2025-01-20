@interface CameraControlEventInteractor.Coordinator
- (_TtCV6TamaleP33_6B80812B8B2A2C498C81CCDFF3BE716F28CameraControlEventInteractor11Coordinator)init;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
@end

@implementation CameraControlEventInteractor.Coordinator

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  v8 = self;
  if ([v7 _state] == (id)2)
  {
    v9 = *(void (**)(uint64_t))((char *)&v8->super.isa
                                        + OBJC_IVAR____TtCV6TamaleP33_6B80812B8B2A2C498C81CCDFF3BE716F28CameraControlEventInteractor11Coordinator_action);
    uint64_t v10 = swift_retain();
    v9(v10);

    swift_release();
  }
  else
  {
  }
}

- (_TtCV6TamaleP33_6B80812B8B2A2C498C81CCDFF3BE716F28CameraControlEventInteractor11Coordinator)init
{
  result = (_TtCV6TamaleP33_6B80812B8B2A2C498C81CCDFF3BE716F28CameraControlEventInteractor11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV6TamaleP33_6B80812B8B2A2C498C81CCDFF3BE716F28CameraControlEventInteractor11Coordinator____lazy_storage___view);
}

@end