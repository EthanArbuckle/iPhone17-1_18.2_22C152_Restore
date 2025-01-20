@interface GCSettingsLightController
- (GCController)device;
- (GCSettingsLightController)init;
- (id)getBrightness;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForColorKey:(id)a3;
- (void)loadDevice;
- (void)loadLightData;
- (void)setBrightness:(id)a3 specifier:(id)a4;
- (void)setColor:(id)a3;
- (void)setDevice:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GCSettingsLightController

- (GCSettingsLightController)init
{
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsLightController;
  v2 = [(GCSettingsLightController *)&v12 init];
  if (v2)
  {
    v13[0] = @"Red";
    v3 = +[UIColor redColor];
    v14[0] = v3;
    v13[1] = @"Green";
    v4 = +[UIColor greenColor];
    v14[1] = v4;
    v13[2] = @"Blue";
    v5 = +[UIColor blueColor];
    v14[2] = v5;
    v13[3] = @"Yellow";
    v6 = +[UIColor yellowColor];
    v14[3] = v6;
    v13[4] = @"Purple";
    v7 = +[UIColor purpleColor];
    v14[4] = v7;
    v13[5] = @"Orange";
    v8 = +[UIColor orangeColor];
    v14[5] = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
    colors = v2->_colors;
    v2->_colors = (NSDictionary *)v9;
  }
  return v2;
}

- (void)loadDevice
{
  v3 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"Controller"];
  device = self->_device;
  self->_device = v3;

  v5 = self->_device;
  if (v5)
  {
    self->_uniqueIdentifier = [(GCController *)v5 identifier];
  }
  else
  {
    v6 = [(GCSettingsLightController *)self navigationController];
    v7 = [v6 viewControllers];
    v8 = (char *)[v7 indexOfObject:self];

    if (!v8 || v8 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    uint64_t v9 = [(GCSettingsLightController *)self navigationController];
    v10 = [v9 viewControllers];
    uint64_t v13 = [v10 objectAtIndex:v8 - 1];

    v11 = [(GCSettingsLightController *)self navigationController];
    id v12 = [v11 popToViewController:v13 animated:1];
  }

  _objc_release_x1();
}

- (void)setBrightness:(id)a3 specifier:(id)a4
{
  [(NSMutableDictionary *)self->_lightDictionary setObject:a3 forKeyedSubscript:@"brightness"];

  [(GCSettingsLightController *)self saveLight];
}

- (id)getBrightness
{
  return [(NSMutableDictionary *)self->_lightDictionary objectForKeyedSubscript:@"brightness"];
}

- (id)valueForColorKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_lightDictionary objectForKeyedSubscript:@"color"];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }
  else {
    v5 = @"Red";
  }

  return v5;
}

- (void)setColor:(id)a3
{
  [(NSMutableDictionary *)self->_lightDictionary setObject:a3 forKeyedSubscript:@"color"];
  [(GCSettingsLightController *)self saveLight];
  [(GCSettingsLightController *)self reloadSpecifiers];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"updateColor" object:0];
}

- (void)loadLightData
{
  [(GCSettingsLightController *)self loadDevice];

  [(GCSettingsLightController *)self initDefaults];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    location = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    [(GCSettingsLightController *)self loadLightData];
    v20 = +[PSSpecifier groupSpecifierWithName:@"Color"];
    objc_msgSend(v3, "addObject:");
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_colors;
    id v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v7 = PSIDKey;
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v10);
          id v12 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v12 setProperty:v11 forKey:v7];
          [v3 addObject:v12];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSDictionary *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    uint64_t v13 = +[PSSpecifier groupSpecifierWithName:@"Brightness"];

    [v3 addObject:v13];
    v14 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setBrightness:specifier:" get:"getBrightness" detail:0 cell:5 edit:0];
    [v14 setObject:@"Brightness" forKeyedSubscript:v7];
    [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    v15 = +[NSNumber numberWithFloat:0.0];
    [v14 setProperty:v15 forKey:PSControlMinimumKey];

    LODWORD(v16) = 1.0;
    v17 = +[NSNumber numberWithFloat:v16];
    [v14 setProperty:v17 forKey:PSControlMaximumKey];

    [v14 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
    [v3 addObject:v14];
    objc_storeStrong(location, v3);

    id v4 = *location;
  }
  id v18 = v4;

  return v18;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)GCSettingsLightController;
  id v6 = a4;
  long long v24 = [(GCSettingsLightController *)&v26 tableView:a3 cellForRowAtIndexPath:v6];
  long long v25 = [(GCSettingsLightController *)self specifierAtIndexPath:v6];

  uint64_t v7 = [v25 propertyForKey:PSIDKey];
  id v8 = [(NSDictionary *)self->_colors objectForKeyedSubscript:v7];
  id v9 = v7;
  id v10 = objc_alloc_init((Class)NSMutableAttributedString);
  id v11 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 15.0, 15.0);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_B2FC;
  v27[3] = &unk_1119D0;
  id v28 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 imageWithActions:v27];
  id v14 = [objc_alloc((Class)NSTextAttachment) initWithData:0 ofType:0];
  [v14 setImage:v13];
  v15 = +[NSAttributedString attributedStringWithAttachment:v14];
  [v10 appendAttributedString:v15];
  id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@"\t"];
  [v10 appendAttributedString:v16];

  id v17 = [objc_alloc((Class)NSAttributedString) initWithString:v9];
  [v10 appendAttributedString:v17];

  id v18 = +[NSParagraphStyle defaultParagraphStyle];
  id v19 = [v18 mutableCopy];

  NSAttributedStringKey v29 = NSParagraphStyleAttributeName;
  id v30 = v19;
  v20 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  objc_msgSend(v10, "addAttributes:range:", v20, 0, objc_msgSend(v10, "length"));

  v21 = [v24 titleLabel];
  [v21 setAttributedText:v10];

  long long v22 = [(GCSettingsLightController *)self valueForColorKey:v9];
  objc_msgSend(v24, "setChecked:", objc_msgSend(v9, "isEqualToString:", v22));

  return v24;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(GCSettingsLightController *)self specifierAtIndexPath:v6];
  id v8 = [v9 propertyForKey:PSIDKey];
  [(GCSettingsLightController *)self setColor:v8];
  [(GCSettingsLightController *)self reloadSpecifiers];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (GCController)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lightDictionary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end