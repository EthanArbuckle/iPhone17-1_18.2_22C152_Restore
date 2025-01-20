@interface FSFontSettingsController
- (FSFontSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)updateUI:(id)a3;
@end

@implementation FSFontSettingsController

- (FSFontSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FSFontSettingsController;
  v4 = [(InstalledFontsListController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"updateUI:" name:@"FontSettingsManagerUpdated" object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FSFontSettingsController;
  [(InstalledFontsListController *)&v4 dealloc];
}

- (void)updateUI:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"FontSettingsFontListChanged" object:0];
}

@end