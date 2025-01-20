@interface UIActivityTransportViewController
- (_TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)mailComposeController:(MFMailComposeViewController *)a3 shouldSendMail:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)messageComposeViewController:(MFMessageComposeViewController *)a3 shouldSendMessage:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation UIActivityTransportViewController

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (void *)swift_allocObject();
  v10[2] = self;
  v10[3] = sub_1000C3EFC;
  v10[4] = v9;
  aBlock[4] = sub_1000C3F4C;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000BCEA4;
  aBlock[3] = &unk_100103660;
  v11 = _Block_copy(aBlock);
  v12 = self;
  id v13 = a3;
  swift_retain();
  swift_release();
  v14.receiver = v12;
  v14.super_class = ObjectType;
  [(UIActivityTransportViewController *)&v14 _prepareActivity:v13 completion:v11];
  _Block_release(v11);

  swift_release();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(UIActivityTransportViewController *)&v2 viewDidLoad];
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  result = (_TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_transportPrepCompletion[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion
                                                + 8];
  swift_release();
  swift_release();
  sub_100013344(v3);
  swift_release();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_userDidTapTransport);

  sub_100013344(v4);
}

- (void)mailComposeController:(MFMailComposeViewController *)a3 shouldSendMail:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1000C7600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10010EEE0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10010EEE8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1000C386C((uint64_t)v13, (uint64_t)&unk_10010EEF0, (uint64_t)v18);
  swift_release();
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = a5;
  sub_1000C2658((uint64_t)v8, (void *)a4, (uint64_t)a5);
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)a3 shouldSendMessage:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1000C7600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10010EE98;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10010B788;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1000C386C((uint64_t)v13, (uint64_t)&unk_10010B790, (uint64_t)v18);
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000C2EF8((uint64_t)v6, (void *)a4);
}

@end