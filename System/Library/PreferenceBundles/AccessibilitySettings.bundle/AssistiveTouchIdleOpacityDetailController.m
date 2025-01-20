@interface AssistiveTouchIdleOpacityDetailController
- (id)idleOpacity:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleSliderIsChanging:(id)a3;
- (void)setIdleOpacity:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AssistiveTouchIdleOpacityDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AssistiveTouchIdleOpacityDetailController *)self loadSpecifiersFromPlistName:@"AssistiveTouchIdleOpacitySettings" target:self];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v13 contentView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [v13 control];
    objc_msgSend(v12, "setFrame:", (v9 - v9 * 0.8) * 0.5, v7, v9 * 0.8, v11);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AssistiveTouchIdleOpacityDetailController;
  uint64_t v5 = [(AssistiveTouchIdleOpacityDetailController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [v5 control];
    [v6 setContinuous:1];
    [v6 addTarget:self action:"_handleSliderIsChanging:" forControlEvents:4096];
  }

  return v5;
}

- (id)idleOpacity:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchIdleOpacity];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setIdleOpacity:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  double v5 = v4;
  id v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchIdleOpacity:v5];
}

- (void)_handleSliderIsChanging:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchIdleOpacity:v4];
}

@end