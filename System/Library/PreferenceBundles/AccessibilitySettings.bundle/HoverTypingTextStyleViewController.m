@interface HoverTypingTextStyleViewController
+ (id)visualTitleForEnumValue:(id)a3;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation HoverTypingTextStyleViewController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v22[0] = UIFontTextStyleBody;
    v22[1] = UIFontTextStyleSubheadline;
    v22[2] = UIFontTextStyleHeadline;
    v22[3] = UIFontTextStyleTitle3;
    v22[4] = UIFontTextStyleTitle2;
    v22[5] = UIFontTextStyleTitle1;
    v22[6] = UIFontTextStyleLargeTitle;
    +[NSArray arrayWithObjects:v22 count:7];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = PSIDKey;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v11 = +[HoverTypingTextStyleViewController visualTitleForEnumValue:v10];
          v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v12 setProperty:v10 forKey:v8];
          [v12 setCellType:3];
          [v4 addObject:v12];
        }
        id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    v13 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
    *(void *)&self->AXUISettingsBaseListController_opaque[v15] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[AXSettings sharedInstance];
  uint64_t v7 = [v6 hoverTextTypingTextStyle];

  if (!v7) {
    uint64_t v7 = UIFontTextStyleBody;
  }
  id v11 = v5;
  uint64_t v8 = [v11 specifier];
  v9 = [v8 propertyForKey:PSIDKey];
  id v10 = [v9 isEqual:v7];

  [v11 setChecked:v10];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HoverTypingTextStyleViewController;
  id v6 = a4;
  [(HoverTypingTextStyleViewController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[HoverTypingTextStyleViewController specifierAtIndex:](self, "specifierAtIndex:", -[HoverTypingTextStyleViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v10.receiver, v10.super_class));
  uint64_t v8 = [v7 propertyForKey:PSIDKey];
  v9 = +[AXSettings sharedInstance];
  [v9 setHoverTextTypingTextStyle:v8];

  [(HoverTypingTextStyleViewController *)self updateTableCheckedSelection:v6];
}

+ (id)visualTitleForEnumValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isEqualToString:UIFontTextStyleBody] & 1) == 0)
  {
    if ([v4 isEqualToString:UIFontTextStyleSubheadline])
    {
      CFStringRef v5 = @"Subheadline";
    }
    else if ([v4 isEqualToString:UIFontTextStyleHeadline])
    {
      CFStringRef v5 = @"Headline";
    }
    else if ([v4 isEqualToString:UIFontTextStyleTitle3])
    {
      CFStringRef v5 = @"Title3";
    }
    else if ([v4 isEqualToString:UIFontTextStyleTitle2])
    {
      CFStringRef v5 = @"Title2";
    }
    else if ([v4 isEqualToString:UIFontTextStyleTitle1])
    {
      CFStringRef v5 = @"Title1";
    }
    else if ([v4 isEqualToString:UIFontTextStyleLargeTitle])
    {
      CFStringRef v5 = @"Large Title";
    }
    else
    {
      CFStringRef v5 = 0;
    }
  }
  else
  {
    CFStringRef v5 = @"Body";
  }

  return (id)v5;
}

@end