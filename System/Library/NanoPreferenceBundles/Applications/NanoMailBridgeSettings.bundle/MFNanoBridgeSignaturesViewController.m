@interface MFNanoBridgeSignaturesViewController
- (id)_signatureWithSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_setSignature:(id)a3 withSpecifier:(id)a4;
@end

@implementation MFNanoBridgeSignaturesViewController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];

    v7 = +[PSSpecifier preferenceSpecifierNamed:&stru_2CC10 target:self set:"_setSignature:withSpecifier:" get:"_signatureWithSpecifier:" detail:0 cell:14 edit:0];
    LODWORD(v8) = 22.0;
    v9 = +[NSNumber numberWithFloat:v8];
    [v7 setProperty:v9 forKey:PSTextViewBottomMarginKey];

    [v5 addObject:v7];
    v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MFNanoBridgeSignaturesViewController;
  v4 = [(MFNanoBridgeSignaturesViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == (char *)&dword_C + 2)
  {
    id v5 = [v4 textView];
    [v5 setTextLoupeVisibility:2];
    v6 = +[UIColor clearColor];
    [v5 setBackgroundColor:v6];

    [v5 setAllowsEditingTextAttributes:1];
    v7 = BPSDetailTextColor();
    [v5 setTextColor:v7];

    double v8 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    v9 = +[UIFont fontWithDescriptor:v8 size:13.0];
    [v5 setFont:v9];
  }

  return v4;
}

- (id)_signatureWithSpecifier:(id)a3
{
  uint64_t v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  v4 = [v3 htmlSignature];

  return v4;
}

- (void)_setSignature:(id)a3 withSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v7 setHtmlSignature:v13];

  double v8 = [(MFNanoBridgeSignaturesViewController *)self specifier];

  v9 = [(MFNanoBridgeSignaturesViewController *)self parentController];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v8 target];
  }
  v12 = v11;

  [v12 reloadSpecifier:v8];
}

@end