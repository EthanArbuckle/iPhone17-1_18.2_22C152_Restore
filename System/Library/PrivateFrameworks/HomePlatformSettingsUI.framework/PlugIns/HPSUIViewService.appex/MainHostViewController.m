@interface MainHostViewController
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (MainHostViewController)initWithCoder:(id)a3;
- (MainHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 completionHandler:(id)a4;
- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5;
- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 completionHandler:(id)a4;
- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation MainHostViewController

- (void)loadView
{
  v2 = self;
  MainHostViewController.loadView()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  MainHostViewController.viewDidDisappear(_:)(a3);
}

- (MainHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100084D10();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MainHostViewController *)MainHostViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (MainHostViewController)initWithCoder:(id)a3
{
  return (MainHostViewController *)MainHostViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->_EXExtensionViewController_opaque[OBJC_IVAR___MainHostViewController_statusInfoViewCtrl];
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  MainHostViewController.shouldAccept(_:)((NSXPCConnection)v4);

  return 1;
}

- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000A66F0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000A66F8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10003D580((uint64_t)v11, (uint64_t)&unk_1000A6700, (uint64_t)v16);
  swift_release();
}

- (void)receiveWithBetaEnrollmentHomeID:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A66D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A66D8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003D580((uint64_t)v9, (uint64_t)&unk_1000A66E0, (uint64_t)v14);
  swift_release();
}

- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 identifiers:(NSSet *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000A66B0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000A66B8;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10003D580((uint64_t)v11, (uint64_t)&unk_1000A66C0, (uint64_t)v16);
  swift_release();
}

- (void)receiveWithCarrySettingsHomeID:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A66A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A7090;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003D580((uint64_t)v9, (uint64_t)&unk_1000A70A0, (uint64_t)v14);
  swift_release();
}

@end