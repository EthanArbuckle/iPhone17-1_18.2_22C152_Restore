@interface ComposeMailView.Coordinator
- (_TtCV37com_apple_CloudSharingUI_CloudSharing15ComposeMailView11Coordinator)init;
- (void)mailComposeController:(MFMailComposeViewController *)a3 shouldSendMail:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
@end

@implementation ComposeMailView.Coordinator

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_1000223BC(a4, (uint64_t)a5);
}

- (void)mailComposeController:(MFMailComposeViewController *)a3 shouldSendMail:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
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
  v17[4] = &unk_10010B780;
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

- (_TtCV37com_apple_CloudSharingUI_CloudSharing15ComposeMailView11Coordinator)init
{
  result = (_TtCV37com_apple_CloudSharingUI_CloudSharing15ComposeMailView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001326C((uint64_t)self + OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing15ComposeMailView11Coordinator__presentation, (uint64_t *)&unk_10010D410);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing15ComposeMailView11Coordinator_callback);

  sub_100013344(v3);
}

@end