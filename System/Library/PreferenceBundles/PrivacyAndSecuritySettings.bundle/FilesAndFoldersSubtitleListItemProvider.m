@interface FilesAndFoldersSubtitleListItemProvider
- (_TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation FilesAndFoldersSubtitleListItemProvider

- (void)dealloc
{
  v2 = self;
  sub_16218();
}

- (void).cxx_destruct
{
  sub_78F0((uint64_t)self + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_invalidator);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider)init
{
  result = (_TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

@end