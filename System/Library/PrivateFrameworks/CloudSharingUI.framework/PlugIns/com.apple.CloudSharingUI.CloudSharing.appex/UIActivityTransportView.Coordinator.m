@interface UIActivityTransportView.Coordinator
- (_TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerOperation:(id)a3;
@end

@implementation UIActivityTransportView.Coordinator

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return sub_1000BDE94(self, (uint64_t)a2, a3, a4, (void (*)(void *__return_ptr))sub_1000BDBB4);
}

- (id)activityViewControllerOperation:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1000BDFF8(a3);

  return v7;
}

- (_TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator)init
{
  result = (_TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error);
  uint64_t v4 = *(void *)&self->sharingModel[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  id v5 = *(void **)&self->BRActivityTypeCopyShareLink[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  uint64_t v6 = *(void *)&self->BRActivityTypeCopyShareLink[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                                                   + 8];
  uint64_t v7 = *(void *)&self->error[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  unsigned __int8 v8 = self->error[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                 + 8];

  sub_1000C438C(v3, v4, v5, v6, v7, v8);
}

@end