@interface ScannerViewController
- (_TtC14HDSViewService21ScannerViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ScannerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100057EA0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScannerViewController();
  id v4 = v5.receiver;
  [(ScannerViewController *)&v5 viewWillAppear:v3];
  sub_10008C518();
  sub_1000701F8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScannerViewController();
  id v4 = v9.receiver;
  [(ScannerViewController *)&v9 viewDidDisappear:v3];
  if (qword_1000ED818 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000133A0(v5, (uint64_t)qword_1000EF7E8);
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SVSHomePodIDViewController: stop was called", v8, 2u);
    swift_slowDealloc();
  }
}

- (_TtC14HDSViewService21ScannerViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC14HDSViewService21ScannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = &self->viewfinderViewController[OBJC_IVAR____TtC14HDSViewService21ScannerViewController_log];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(void **)&self->viewfinderViewController[OBJC_IVAR____TtC14HDSViewService21ScannerViewController_scannerEngineViewController];
}

@end