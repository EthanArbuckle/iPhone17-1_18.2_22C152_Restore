@interface AXCaptionSizeCell
- (void)layoutSubviews;
@end

@implementation AXCaptionSizeCell

- (void)layoutSubviews
{
  v3 = [(AXCaptionSizeCell *)self specifier];
  v4 = [v3 propertyForKey:@"isDefault"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [(AXCaptionSizeCell *)self textLabel];
    v7 = settingsLocString(@"default.choice", @"CaptioningStyle");
    v8 = [(AXCaptionSizeCell *)self specifier];
    v9 = [v8 name];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
    [v6 setText:v10];
  }
  v35.receiver = self;
  v35.super_class = (Class)AXCaptionSizeCell;
  [(AXCaptionSizeCell *)&v35 layoutSubviews];
  v11 = [(AXCaptionSizeCell *)self textLabel];
  v12 = [v11 font];
  v13 = [v12 fontName];
  unsigned int v14 = [v13 isEqual:MACaptionAppearanceSystemFontIdentifier];

  v15 = [v11 font];
  v16 = [v15 fontName];
  LODWORD(v12) = [v16 isEqual:MACaptionAppearanceMonoSystemFontIdentifier];

  v17 = [v11 font];
  v18 = [v17 fontName];
  unsigned int v19 = [v18 isEqual:MACaptionAppearanceMediumSystemFontIdentifier];

  v20 = [(AXCaptionSizeCell *)self specifier];
  v21 = [v20 propertyForKey:@"fontSize"];
  [v21 floatValue];
  float v23 = v22;

  if (v12)
  {
    uint64_t v24 = +[UIFont monospacedSystemFontOfSize:v23 weight:UIFontWeightRegular];
  }
  else if (v19)
  {
    uint64_t v24 = +[UIFont systemFontOfSize:v23 weight:UIFontWeightMedium];
  }
  else
  {
    if (!v14)
    {
      v25 = [v11 font];
      v33 = [v25 fontName];
      v34 = +[UIFont fontWithName:v33 size:v23];
      [v11 setFont:v34];

      goto LABEL_10;
    }
    uint64_t v24 = +[UIFont systemFontOfSize:v23];
  }
  v25 = (void *)v24;
  [v11 setFont:v24];
LABEL_10:

  [v11 sizeToFit];
  [v11 frame];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  double v31 = v30;
  [(AXCaptionSizeCell *)self frame];
  v36.origin.y = (v32 - v31) * 0.5;
  v36.origin.x = v27;
  v36.size.width = v29;
  v36.size.height = v31;
  CGRect v37 = CGRectIntegral(v36);
  objc_msgSend(v11, "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
}

@end