@interface AXCaptionColorCell
- (AXCaptionColorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation AXCaptionColorCell

- (AXCaptionColorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AXCaptionColorCell;
  v9 = [(AXCaptionColorCell *)&v33 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"rgb"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
    }
    else
    {
      v12 = [v8 propertyForKey:@"rgb"];
      v13 = [v12 objectAtIndexedSubscript:0];
      [v13 floatValue];
      double v15 = v14;
      v16 = [v12 objectAtIndexedSubscript:1];
      [v16 floatValue];
      double v18 = v17;
      v19 = [v12 objectAtIndexedSubscript:2];
      [v19 floatValue];
      double v21 = v20;
      v22 = [v12 objectAtIndexedSubscript:3];
      [v22 floatValue];
      id v11 = +[UIColor colorWithRed:v15 green:v18 blue:v21 alpha:v23];
    }
    v24 = [(AXCaptionColorCell *)v9 defaultContentConfiguration];
    v25 = +[UIImage systemImageNamed:@"circle.fill"];
    [v24 setImage:v25];

    v26 = [v8 propertyForKey:@"isDefault"];
    unsigned int v27 = [v26 BOOLValue];

    if (v27)
    {
      v28 = settingsLocString(@"default.choice", @"CaptioningStyle");
      v29 = [v8 name];
      v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29);
      [v24 setText:v30];
    }
    else
    {
      v28 = [v8 name];
      [v24 setText:v28];
    }

    v31 = [v24 imageProperties];
    [v31 setTintColor:v11];

    [(AXCaptionColorCell *)v9 setContentConfiguration:v24];
  }

  return v9;
}

@end