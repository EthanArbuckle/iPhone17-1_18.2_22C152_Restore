@interface SharingEntryProfileInformationInputSignal.AuthorizationObserver
- (_TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver)init;
- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4;
- (void)sharingRecipientAuthorizationStore:(id)a3 didRemoveSharingAuthorizations:(id)a4;
- (void)sharingRecipientAuthorizationWasRevokedForStore:(id)a3;
@end

@implementation SharingEntryProfileInformationInputSignal.AuthorizationObserver

- (void)sharingRecipientAuthorizationWasRevokedForStore:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24177B750();
}

- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4
{
  id v6 = a3;
  id v5 = self;
  sub_24177B750();
}

- (void)sharingRecipientAuthorizationStore:(id)a3 didRemoveSharingAuthorizations:(id)a4
{
  id v6 = a3;
  id v5 = self;
  sub_24177B804();
}

- (_TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver)init
{
  result = (_TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver_uuid;
  uint64_t v3 = sub_2417D2E00();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_weakDestroy();
}

@end