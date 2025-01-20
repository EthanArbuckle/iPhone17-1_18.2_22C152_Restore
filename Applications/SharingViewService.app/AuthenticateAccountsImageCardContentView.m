@interface AuthenticateAccountsImageCardContentView
- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCardStyle:(int64_t)a3;
- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCoder:(id)a3;
- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithFrame:(CGRect)a3;
@end

@implementation AuthenticateAccountsImageCardContentView

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService40AuthenticateAccountsImageCardContentView_imageConfiguration;
  v6 = self;
  id v7 = a3;
  id v8 = [v6 systemFontOfSize:100.0];
  id v9 = [self configurationWithFont:v8];

  *(void *)&self->PRXCardContentView_opaque[v5] = v9;
  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCardStyle:(int64_t)a3
{
  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100091348();
  v3 = *(void **)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC18SharingViewService40AuthenticateAccountsImageCardContentView_imageConfiguration];
}

@end