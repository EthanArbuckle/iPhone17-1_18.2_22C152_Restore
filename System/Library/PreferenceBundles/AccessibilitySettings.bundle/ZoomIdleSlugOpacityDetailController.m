@interface ZoomIdleSlugOpacityDetailController
- (id)idleSlugOpacity:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleSliderIsChanging:(id)a3;
- (void)setIdleSlugOpacity:(id)a3 specifier:(id)a4;
@end

@implementation ZoomIdleSlugOpacityDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(ZoomIdleSlugOpacityDetailController *)self loadSpecifiersFromPlistName:@"ZoomIdleSlugOpacitySettings" target:self];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ZoomIdleSlugOpacityDetailController;
  uint64_t v5 = [(ZoomIdleSlugOpacityDetailController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 control];
    [v6 setContinuous:1];
    [v6 addTarget:self action:"_handleSliderIsChanging:" forControlEvents:4096];
  }

  return v5;
}

- (id)idleSlugOpacity:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 zoomIdleSlugOpacity];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setIdleSlugOpacity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  [v4 floatValue];
  double v6 = v5;
  v7 = +[AXSettings sharedInstance];
  [v7 setZoomIdleSlugOpacity:v6];

  id v9 = +[ZoomServices sharedInstance];
  [v4 floatValue];
  LODWORD(v6) = v8;

  [v9 notifyZoomIdleSlugOpacityChangedTo:*(float *)&v6];
}

- (void)_handleSliderIsChanging:(id)a3
{
  id v3 = a3;
  id v6 = +[ZoomServices sharedInstance];
  [v3 value];
  float v5 = v4;

  [v6 notifyZoomIdleSlugOpacityChangedTo:v5];
}

@end