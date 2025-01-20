@interface AXCaptionFontCell
+ (double)heightForFontName:(id)a3;
- (AXCaptionFontCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_updateLabel;
@end

@implementation AXCaptionFontCell

+ (double)heightForFontName:(id)a3
{
  id v3 = a3;
  v4 = +[UIFont fontWithName:v3 size:17.0];
  objc_msgSend(v3, "_legacy_sizeWithFont:", v4);
  double v6 = v5;

  return v6;
}

- (AXCaptionFontCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXCaptionFontCell;
  id v7 = a5;
  v8 = [(AXCaptionFontCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  -[AXCaptionFontCell setSpecifier:](v8, "setSpecifier:", v7, v12.receiver, v12.super_class);

  v9 = [(AXCaptionFontCell *)v8 textLabel];
  [v9 setNumberOfLines:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:v8 selector:"_fontSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(AXCaptionFontCell *)v8 _updateLabel];
  return v8;
}

- (void)_updateLabel
{
  id v3 = [(AXCaptionFontCell *)self specifier];
  v4 = [v3 propertyForKey:PSIDKey];

  double v5 = [(AXCaptionFontCell *)self textLabel];
  double v6 = [(AXCaptionFontCell *)self specifier];
  id v7 = [v6 propertyForKey:PSTitleKey];
  if (v7)
  {
    [v5 setText:v7];
  }
  else
  {
    v8 = [(AXCaptionFontCell *)self specifier];
    v9 = [v8 name];
    [v5 setText:v9];
  }
  if ([v4 isEqualToString:@"Helvetica-Bold"])
  {
    v10 = settingsLocString(@"default.choice", @"CaptioningStyle");
    v11 = [(AXCaptionFontCell *)self specifier];
    objc_super v12 = [v11 name];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);
    [v5 setText:v13];
  }
  v14 = [v5 text];

  if (v14)
  {
    v44 = self;
    v45 = v5;
    v15 = AXCaptionFonts();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v47;
      float v19 = 17.0;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v22 = [v21 objectForKeyedSubscript:@"name"];
          unsigned int v23 = [v22 isEqualToString:v4];

          if (v23)
          {
            v24 = [v21 objectForKeyedSubscript:@"size"];
            [v24 floatValue];
            float v19 = v25;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v17);
    }
    else
    {
      float v19 = 17.0;
    }
    v26 = [(AXCaptionFontCell *)v44 specifier];
    v27 = [v26 propertyForKey:@"isBold"];
    unsigned int v28 = [v27 BOOLValue];

    if (v28) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 0;
    }
    double v30 = v19;
    v31 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
    CFCharacterSetRef v32 = CTFontCopyCharacterSet(v31);
    double v5 = v45;
    v33 = [v45 text];
    CFCharacterSetRef v34 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, v33);

    if (v32 && v34)
    {
      if (CFCharacterSetIsSupersetOfSet(v32, v34))
      {
        v35 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        [v35 _scaledValueForValue:v30];
        float v37 = v36;

        unsigned int v38 = [v4 isEqualToString:MACaptionAppearanceSystemFontIdentifier];
        unsigned int v39 = [v4 isEqual:MACaptionAppearanceMonoSystemFontIdentifier];
        unsigned int v40 = [v4 isEqual:MACaptionAppearanceMediumSystemFontIdentifier];
        double v41 = v37;
        if (v39)
        {
          uint64_t v42 = +[UIFont monospacedSystemFontOfSize:v41 weight:UIFontWeightRegular];
        }
        else if (v38)
        {
          uint64_t v42 = +[UIFont systemFontOfSize:v41];
        }
        else
        {
          if (v40) {
            +[UIFont systemFontOfSize:v41 weight:UIFontWeightMedium];
          }
          else {
          uint64_t v42 = +[UIFont fontWithName:v4 size:v29 traits:v41];
          }
        }
        v43 = (void *)v42;
        [v45 setFont:v42];
      }
    }
    else if (!v32)
    {
      if (!v34)
      {
LABEL_29:
        if (v31) {
          CFRelease(v31);
        }
        [v45 sizeToFit];

        goto LABEL_32;
      }
LABEL_28:
      CFRelease(v34);
      goto LABEL_29;
    }
    CFRelease(v32);
    if (!v34) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_32:
}

@end