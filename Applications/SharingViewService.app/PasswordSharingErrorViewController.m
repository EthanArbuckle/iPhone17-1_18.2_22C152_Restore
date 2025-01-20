@interface PasswordSharingErrorViewController
- (_TtC18SharingViewService34PasswordSharingErrorViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PasswordSharingErrorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100092550();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100092CF4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PasswordSharingErrorViewController();
  id v4 = v9.receiver;
  [(PasswordSharingErrorViewController *)&v9 viewDidDisappear:v3];
  if (qword_1001C7030 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100012C4C(v5, (uint64_t)qword_1001CA4D8);
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error ViewDidDisappear", v8, 2u);
    swift_slowDealloc();
  }
}

- (_TtC18SharingViewService34PasswordSharingErrorViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_type] = 1;
  uint64_t v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model];
  v6 = (objc_class *)type metadata accessor for PasswordSharingErrorViewController();
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((void *)v5 + 12) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(PasswordSharingErrorViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end