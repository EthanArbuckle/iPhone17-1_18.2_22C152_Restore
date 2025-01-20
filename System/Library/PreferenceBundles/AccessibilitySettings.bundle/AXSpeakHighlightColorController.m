@interface AXSpeakHighlightColorController
+ (id)nameForColor:(int64_t)a3;
- (BOOL)sentenceStyle;
- (id)specifiers;
- (void)setSentenceStyle:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXSpeakHighlightColorController

+ (id)nameForColor:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = @"DEFAULT";
      v5 = @"SpeechSettings";
      goto LABEL_12;
    case 1:
      v4 = @"COLOR_BLUE";
      goto LABEL_11;
    case 2:
      v4 = @"COLOR_YELLOW";
      goto LABEL_11;
    case 3:
      v4 = @"COLOR_GREEN";
      goto LABEL_11;
    case 4:
      v4 = @"COLOR_PURPLE";
      goto LABEL_11;
    case 5:
      v4 = @"COLOR_PINK";
LABEL_11:
      v5 = @"CaptioningStyle";
LABEL_12:
      v6 = settingsLocString(v4, v5);
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    uint64_t v23 = v3;
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = [(AXSpeakHighlightColorController *)self specifier];
    v8 = [v7 propertyForKey:@"type"];
    -[AXSpeakHighlightColorController setSentenceStyle:](self, "setSentenceStyle:", [v8 isEqualToString:@"SENTENCE"]);

    v26 = +[NSMutableArray array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = [&off_22BF00 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v27)
    {
      uint64_t v24 = PSCellClassKey;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(&off_22BF00);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v10 intValue];
          v11 = (CGColor *)AXSpeakHighlightColor();
          Components = CGColorGetComponents(v11);
          v13 = objc_msgSend((id)objc_opt_class(), "nameForColor:", (int)objc_msgSend(v10, "intValue"));
          v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v14 setProperty:objc_opt_class() forKey:v24];
          v15 = +[NSNumber numberWithDouble:*Components];
          v32[0] = v15;
          v16 = +[NSNumber numberWithDouble:Components[1]];
          v32[1] = v16;
          v17 = +[NSNumber numberWithDouble:Components[2]];
          v32[2] = v17;
          v18 = +[NSNumber numberWithDouble:Components[3]];
          v32[3] = v18;
          v19 = +[NSArray arrayWithObjects:v32 count:4];
          [v14 setProperty:v19 forKey:@"rgb"];

          [v14 setProperty:v10 forKey:@"type"];
          [v26 addObject:v14];
        }
        id v27 = [&off_22BF00 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v27);
    }
    id v20 = [v26 copy];
    v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v23];
    *(void *)&self->AXUISettingsBaseListController_opaque[v23] = v20;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v23];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  LOBYTE(self) = [(AXSpeakHighlightColorController *)self sentenceStyle];
  v6 = +[AXSettings sharedInstance];
  v7 = v6;
  if (self) {
    id v8 = [v6 quickSpeakSentenceHighlightColor];
  }
  else {
    id v8 = [v6 quickSpeakWordHighlightColor];
  }
  id v9 = v8;

  v10 = [v13 specifier];
  v11 = [v10 propertyForKey:@"type"];
  BOOL v12 = [v11 integerValue] == v9;

  [v13 setChecked:v12];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AXSpeakHighlightColorController;
  id v6 = a4;
  [(AXSpeakHighlightColorController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[AXSpeakHighlightColorController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v12.receiver, v12.super_class);

  id v8 = [v7 propertyForKey:@"type"];
  id v9 = [v8 integerValue];

  LODWORD(v8) = [(AXSpeakHighlightColorController *)self sentenceStyle];
  v10 = +[AXSettings sharedInstance];
  v11 = v10;
  if (v8) {
    [v10 setQuickSpeakSentenceHighlightColor:v9];
  }
  else {
    [v10 setQuickSpeakWordHighlightColor:v9];
  }

  [(AXSpeakHighlightColorController *)self beginUpdates];
  [(AXSpeakHighlightColorController *)self reloadSpecifiers];
  [(AXSpeakHighlightColorController *)self endUpdates];
}

- (BOOL)sentenceStyle
{
  return self->_sentenceStyle;
}

- (void)setSentenceStyle:(BOOL)a3
{
  self->_sentenceStyle = a3;
}

@end