@interface FocusSystemConfigurationDetailView.Coordinator
- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4;
- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5;
@end

@implementation FocusSystemConfigurationDetailView.Coordinator

- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_220D532F8(v7);
}

- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  id v6 = *(void (**)(void, uint64_t, CGRect *))((char *)&self->super.isa
                                                        + OBJC_IVAR____TtCV15FocusSettingsUI34FocusSystemConfigurationDetailView11Coordinator_updateConfigurationHandler);
  CGRect v9 = a5;
  char v10 = 0;
  id v7 = a3;
  v8 = self;
  v6(0, 2, &v9);
}

- (void).cxx_destruct
{
}

@end