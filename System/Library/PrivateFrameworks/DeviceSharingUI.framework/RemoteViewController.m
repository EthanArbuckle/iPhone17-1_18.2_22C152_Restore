@interface RemoteViewController
- (_TtC15DeviceSharingUI20RemoteViewController)initWithCoder:(id)a3;
- (_TtC15DeviceSharingUI20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIRemoteSheet)_remoteSheet;
- (void)clientIsReady;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation RemoteViewController

- (_TtC15DeviceSharingUI20RemoteViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15DeviceSharingUI20RemoteViewController_hostingController) = 0;
  id v4 = a3;

  result = (_TtC15DeviceSharingUI20RemoteViewController *)sub_24CD170B0();
  __break(1u);
  return result;
}

- (_UIRemoteSheet)_remoteSheet
{
  return (_UIRemoteSheet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR____TtC15DeviceSharingUI20RemoteViewController_hostingController));
}

- (void)clientIsReady
{
  uint64_t v2 = qword_26982B8A0;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CD16BE0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982C1C0);
  id v4 = sub_24CD16BC0();
  os_log_type_t v5 = sub_24CD16FD0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24CD0B000, v4, v5, "clientIsReady()", v6, 2u);
    MEMORY[0x253312880](v6, -1, -1);
  }

  [(RemoteViewController *)v7 _endDelayingPresentation];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v8 = self;
  objc_msgSend(a3, sel_preferredContentSize);
  -[RemoteViewController setPreferredContentSize:](v8, sel_setPreferredContentSize_);
  os_log_type_t v5 = (_TtC15DeviceSharingUI20RemoteViewController *)[(RemoteViewController *)v8 _hostedWindowScene];
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, sel_preferredContentSize);
    -[RemoteViewController _setPreferredContentSize:](v6, sel__setPreferredContentSize_);
    swift_unknownObjectRelease();

    v7 = v6;
  }
  else
  {
    swift_unknownObjectRelease();
    v7 = v8;
  }
}

- (_TtC15DeviceSharingUI20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15DeviceSharingUI20RemoteViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15DeviceSharingUI20RemoteViewController_hostingController));
}

@end