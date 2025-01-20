@interface FocusAppConfigurationDetailView.Coordinator
- (_TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator)init;
- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4;
- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5;
@end

@implementation FocusAppConfigurationDetailView.Coordinator

- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  v6 = *(void (**)(void, CGRect *))((char *)&self->super.isa
                                               + OBJC_IVAR____TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator_updateConfigurationHandler);
  CGRect v9 = a5;
  char v10 = 0;
  id v7 = a3;
  v8 = self;
  v6(0, &v9);
}

- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
  v6 = *(void (**)(id, _OWORD *))((char *)&self->super.isa
                                           + OBJC_IVAR____TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator_updateConfigurationHandler);
  memset(v10, 0, sizeof(v10));
  char v11 = 1;
  id v7 = a3;
  id v8 = a4;
  CGRect v9 = self;
  v6(a4, v10);
}

- (_TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator)init
{
  result = (_TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end