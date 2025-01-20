@interface SpeechControllerIdleOpacityController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)specifiers;
- (id)speechControllerIdleOpacity:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleSliderIsChanging:(id)a3;
- (void)setSpeechControllerIdleOpacity:(id)a3 specifier:(id)a4;
@end

@implementation SpeechControllerIdleOpacityController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(SpeechControllerIdleOpacityController *)self loadSpecifiersFromPlistName:@"SpeechControllerIdleOpacitySettings" target:self];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SpeechControllerIdleOpacityController;
  uint64_t v5 = [(SpeechControllerIdleOpacityController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 control];
    [v6 setContinuous:1];
    [v6 addTarget:self action:"_handleSliderIsChanging:" forControlEvents:4096];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 30.0;
}

- (id)speechControllerIdleOpacity:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 speechControllerIdleOpacity];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setSpeechControllerIdleOpacity:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  double v5 = v4;
  id v6 = +[AXSettings sharedInstance];
  [v6 setSpeechControllerIdleOpacity:v5];
}

- (void)_handleSliderIsChanging:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setSpeechControllerIdleOpacity:v4];
}

@end