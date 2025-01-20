@interface CSAddParticipantsServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController)initWithCoder:(id)a3;
- (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setAddressingViewModel:(id)a3;
- (void)setCollaborationOptionsGroups:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setShare:(id)a3;
- (void)userDidSelectContact:(id)a3 contactProperty:(id)a4;
@end

@implementation CSAddParticipantsServiceViewController

+ (id)_remoteViewControllerInterface
{
  id v2 = [self interfaceWithProtocol:&OBJC_PROTOCOL___CSAddParticipantsViewControllerHost];

  return v2;
}

+ (id)_exportedInterface
{
  id v2 = (void *)sub_100054B58();

  return v2;
}

- (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1000646E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController *)sub_1000517DC(v5, v7, a4);
}

- (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController)initWithCoder:(id)a3
{
  return (_TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController *)sub_1000519B0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel));
  sub_10000EB0C((uint64_t)self+ OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_fileURL);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)userDidSelectContact:(id)a3 contactProperty:(id)a4
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    id v10 = v4;
    sub_100064220();
  }
}

- (void)setShare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100051DFC(v4);
}

- (void)setCollaborationOptionsGroups:(id)a3
{
  sub_10000EF58(0, &qword_10007F488);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_collaborationOptionsGroups) = (Class)sub_1000647F0();

  swift_bridgeObjectRelease();
}

- (void)setAddressingViewModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100051FA0(v4);
}

- (void)setFileURL:(id)a3
{
  uint64_t v4 = sub_1000641E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000641B0();
  id v8 = self;
  sub_100052EF8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setContainerSetupInfo:(id)a3
{
  uint64_t v5 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo) = (Class)a3;
  id v9 = a3;
  id v10 = self;

  uint64_t v11 = sub_1000641E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  v13 = v10;
  sub_10001A01C((uint64_t)v7, a3, (uint64_t)sub_100053C18, v12);
  swift_release();
  sub_10000EB0C((uint64_t)v7);
}

@end