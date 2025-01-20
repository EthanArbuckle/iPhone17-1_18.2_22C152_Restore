@interface ExtensionsDetailSettingsPane
+ (UIColor)primaryLabelColor;
+ (UIColor)secondaryLabelColor;
- (MERemoteExtension)extension;
- (PSListController)parentListController;
- (double)_groupTextIndentSize;
- (id)_descriptionText;
- (id)_extensionEnabledStatus:(id)a3;
- (id)_hostAppDisplayName:(id)a3;
- (id)_messageContentAccessPermissionDetailsForExtension:(id)a3;
- (id)_messageContentPermissionsForExtension:(id)a3;
- (id)_messageModificationPermissionsForExtension:(id)a3;
- (id)_messageRenderingPermissionsForExtension:(id)a3;
- (id)_permissionsDetailParagraphStyle;
- (id)_permissionsSectionGroupTitleAtributedStringWithString:(id)a3;
- (id)_permissionsText;
- (id)_permissionsTextForRemoteExtension:(id)a3;
- (id)specifiers;
- (void)_loadExtensionIfNeeded;
- (void)_setExtensionEnabledStatus:(id)a3 forSpecifier:(id)a4;
- (void)setExtension:(id)a3;
- (void)setParentListController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ExtensionsDetailSettingsPane

+ (UIColor)primaryLabelColor
{
  return +[UIColor labelColor];
}

+ (UIColor)secondaryLabelColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)specifiers
{
  [(ExtensionsDetailSettingsPane *)self _loadExtensionIfNeeded];
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (self->_extension)
    {
      v35 = v5;
      v31 = +[PSSpecifier groupSpecifierWithID:@"EXTENSION_INFO_GROUP"];
      objc_msgSend(v5, "addObject:");
      v33 = [(ExtensionsDetailSettingsPane *)self extension];
      v6 = [v33 displayName];
      v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setExtensionEnabledStatus:forSpecifier:" get:"_extensionEnabledStatus:" detail:0 cell:6 edit:0];

      v34 = v7;
      [v7 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      v8 = [v33 menuIcon];
      [v7 setProperty:v8 forKey:PSIconImageKey];

      [v7 setUserInfo:self->_extension];
      [v5 addObject:v7];
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"EXTENSIONS_DETAILS_APP" value:&stru_39200 table:@"Preferences"];
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"_hostAppDisplayName:" detail:0 cell:4 edit:0];
      [v5 addObject:v11];

      id v12 = objc_alloc((Class)NSAttributedString);
      v13 = [(ExtensionsDetailSettingsPane *)self _descriptionText];
      id v32 = [v12 initWithString:v13];

      v14 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
      uint64_t v15 = PSIDKey;
      [v14 setProperty:@"DESCRIPTION" forKey:PSIDKey];
      v38[0] = @"title";
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"EXTENSIONS_DETAILS_DESCRIPTION" value:&stru_39200 table:@"Preferences"];
      v38[1] = @"subtitle";
      v39[0] = v17;
      v39[1] = v32;
      v18 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
      [v14 setUserInfo:v18];

      uint64_t v19 = objc_opt_class();
      uint64_t v20 = PSCellClassKey;
      [v14 setProperty:v19 forKey:PSCellClassKey];
      [v35 addObject:v14];
      v21 = +[PSSpecifier groupSpecifierWithID:@"ExtensionPermissions"];
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"EXTENSIONS_DETAILS_PERMISSIONS_SECTION_HEADER" value:&stru_39200 table:@"Preferences"];

      v24 = [(MERemoteExtension *)self->_extension displayName];
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);
      [v21 setName:v25];

      [v35 addObject:v21];
      v26 = [(ExtensionsDetailSettingsPane *)self _permissionsText];
      v27 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
      [v27 setProperty:@"DESCRIPTION" forKey:v15];
      v36[0] = @"subtitle";
      v36[1] = @"subtitleNumberOfLines";
      v37[0] = v26;
      v37[1] = &off_3B4E0;
      v28 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
      [v27 setUserInfo:v28];

      [v27 setProperty:objc_opt_class() forKey:v20];
      [v35 addObject:v27];

      id v5 = v35;
    }
    v29 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_loadExtensionIfNeeded
{
  id v7 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v3 = [v7 objectForKeyedSubscript:@"EXTENSION_IDENIFIER"];
  v4 = +[MEAppExtensionsController sharedInstance];
  id v5 = [v4 extensionForIdentifier:v3];
  extension = self->_extension;
  self->_extension = v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ExtensionsDetailSettingsPane;
  [(ExtensionsDetailSettingsPane *)&v5 viewDidAppear:a3];
  v4 = [(ExtensionsDetailSettingsPane *)self parentController];
  [(ExtensionsDetailSettingsPane *)self setParentListController:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ExtensionsDetailSettingsPane;
  [(ExtensionsDetailSettingsPane *)&v4 viewDidDisappear:a3];
  [(ExtensionsDetailSettingsPane *)self setParentListController:0];
}

- (id)_extensionEnabledStatus:(id)a3
{
  uint64_t v3 = +[NSNumber numberWithBool:[(MERemoteExtension *)self->_extension isEnabled]];

  return v3;
}

- (void)_setExtensionEnabledStatus:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  -[MERemoteExtension setEnabled:](self->_extension, "setEnabled:", [v6 BOOLValue]);
  objc_super v5 = [(ExtensionsDetailSettingsPane *)self parentListController];
  [v5 reloadSpecifiers];
}

- (id)_hostAppDisplayName:(id)a3
{
  uint64_t v3 = [(MERemoteExtension *)self->_extension displayName];

  return v3;
}

- (id)_descriptionText
{
  uint64_t v3 = [(MERemoteExtension *)self->_extension descriptionText];
  if (![v3 length])
  {
    objc_super v4 = [(MERemoteExtension *)self->_extension displayName];
    uint64_t v5 = +[NSString stringWithFormat:@"This is %@. You should tell us what your extension does here", v4];

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (id)_permissionsText
{
  return [(ExtensionsDetailSettingsPane *)self _permissionsTextForRemoteExtension:self->_extension];
}

- (id)_permissionsTextForRemoteExtension:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableAttributedString);
  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
  id v7 = [(ExtensionsDetailSettingsPane *)self _messageContentPermissionsForExtension:v4];
  if (v7)
  {
    [v5 appendAttributedString:v6];
    [v5 appendAttributedString:v7];
    [v5 appendAttributedString:v6];
  }
  v8 = [(ExtensionsDetailSettingsPane *)self _messageModificationPermissionsForExtension:v4];
  if (v8)
  {
    [v5 appendAttributedString:v6];
    [v5 appendAttributedString:v8];
    [v5 appendAttributedString:v6];
  }
  v9 = [(ExtensionsDetailSettingsPane *)self _messageRenderingPermissionsForExtension:v4];
  if (v9)
  {
    [v5 appendAttributedString:v6];
    [v5 appendAttributedString:v9];
    [v5 appendAttributedString:v6];
  }

  return v5;
}

- (id)_permissionsSectionGroupTitleAtributedStringWithString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSParagraphStyle defaultParagraphStyle];
  id v5 = [v4 mutableCopy];

  [v5 setLineBreakMode:0];
  id v6 = +[NSString stringWithFormat:@"• %@", v3];
  id v7 = objc_alloc((Class)NSAttributedString);
  v13[0] = NSForegroundColorAttributeName;
  v8 = +[ExtensionsDetailSettingsPane primaryLabelColor];
  v14[0] = v8;
  v13[1] = NSFontAttributeName;
  +[UIFont systemFontSize];
  v9 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v13[2] = NSParagraphStyleAttributeName;
  v14[1] = v9;
  v14[2] = v5;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v11 = [v7 initWithString:v6 attributes:v10];

  return v11;
}

- (id)_permissionsDetailParagraphStyle
{
  id v3 = +[NSParagraphStyle defaultParagraphStyle];
  id v4 = [v3 mutableCopy];

  [v4 setLineBreakMode:0];
  [(ExtensionsDetailSettingsPane *)self _groupTextIndentSize];
  double v6 = v5;
  objc_msgSend(v4, "setFirstLineHeadIndent:");
  [v4 setHeadIndent:v6];

  return v4;
}

- (double)_groupTextIndentSize
{
  v2 = +[NSParagraphStyle defaultParagraphStyle];
  id v3 = [v2 mutableCopy];

  [v3 setLineBreakMode:0];
  id v4 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  double v5 = +[ExtensionsDetailSettingsPane primaryLabelColor];
  v13[0] = v5;
  v12[1] = NSFontAttributeName;
  +[UIFont systemFontSize];
  double v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v12[2] = NSParagraphStyleAttributeName;
  v13[1] = v6;
  v13[2] = v3;
  id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v8 = [v4 initWithString:@"• " attributes:v7];

  [v8 size];
  double v10 = v9;

  return v10;
}

- (id)_messageContentPermissionsForExtension:(id)a3
{
  id v4 = a3;
  if ([v4 hasMessageContentAccess])
  {
    id v5 = objc_alloc_init((Class)NSMutableAttributedString);
    double v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_HEADER" value:&stru_39200 table:@"Preferences"];

    id v8 = [(ExtensionsDetailSettingsPane *)self _permissionsSectionGroupTitleAtributedStringWithString:v7];
    [v5 appendAttributedString:v8];

    id v9 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
    [v5 appendAttributedString:v9];

    double v10 = [(ExtensionsDetailSettingsPane *)self _messageContentAccessPermissionDetailsForExtension:v4];
    [v5 appendAttributedString:v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_messageContentAccessPermissionDetailsForExtension:(id)a3
{
  id v30 = a3;
  id v4 = [v30 capabilities];
  if ([v4 containsObject:MEMailExtensionCapabilityMessageActions])
  {
    unsigned int v5 = 1;
  }
  else
  {
    double v6 = [v30 capabilities];
    unsigned int v5 = [v6 containsObject:MEMailExtensionCapabilityMessageSecurity];
  }
  id v7 = [v30 capabilities];
  if ([v7 containsObject:MEMailExtensionCapabilityComposeSession])
  {
    unsigned int v8 = 1;
  }
  else
  {
    id v9 = [v30 capabilities];
    unsigned int v8 = [v9 containsObject:MEMailExtensionCapabilityMessageSecurity];
  }
  unsigned int v10 = [v30 bodyAccess];
  id v28 = objc_alloc_init((Class)NSMutableAttributedString);
  v29 = [(ExtensionsDetailSettingsPane *)self _permissionsDetailParagraphStyle];
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v10) {
    [v11 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_WITH_BODY" value:&stru_39200 table:@"Preferences"];
  }
  else {
  v27 = [v11 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_STANDARD" value:&stru_39200 table:@"Preferences"];
  }

  id v12 = objc_alloc((Class)NSAttributedString);
  v13 = [v27 stringByAppendingString:@" "];
  v33[0] = NSForegroundColorAttributeName;
  v14 = +[ExtensionsDetailSettingsPane secondaryLabelColor];
  v34[0] = v14;
  v33[1] = NSFontAttributeName;
  +[UIFont systemFontSize];
  uint64_t v15 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  v33[2] = NSParagraphStyleAttributeName;
  v34[1] = v15;
  v34[2] = v29;
  v16 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  id v17 = [v12 initWithString:v13 attributes:v16];
  [v28 appendAttributedString:v17];

  CFStringRef v18 = @"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_LOCATION_INCOMING";
  if (v8) {
    CFStringRef v18 = @"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_LOCATION_ALL_MESSAGES";
  }
  if (v5) {
    CFStringRef v19 = v18;
  }
  else {
    CFStringRef v19 = @"EXTENSIONS_PERMISSIONS_CONTENT_ACCESS_LOCATION_OUTGOING";
  }
  uint64_t v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:v19 value:&stru_39200 table:@"Preferences"];

  id v22 = [objc_alloc((Class)NSMutableAttributedString) initWithMarkdownString:v21 options:0 baseURL:0 error:0];
  v31[0] = NSForegroundColorAttributeName;
  v23 = +[ExtensionsDetailSettingsPane secondaryLabelColor];
  v32[0] = v23;
  v31[1] = NSFontAttributeName;
  +[UIFont systemFontSize];
  v24 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  v31[2] = NSParagraphStyleAttributeName;
  v32[1] = v24;
  v32[2] = v29;
  v25 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  objc_msgSend(v22, "addAttributes:range:", v25, 0, objc_msgSend(v22, "length"));

  [v28 appendAttributedString:v22];

  return v28;
}

- (id)_messageModificationPermissionsForExtension:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 capabilities];
  unsigned int v6 = [v5 containsObject:MEMailExtensionCapabilityMessageActions];

  id v7 = [v4 capabilities];
  unsigned int v8 = [v7 containsObject:MEMailExtensionCapabilityMessageSecurity];

  if (((v6 | v8) & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_9;
  }
  id v9 = objc_alloc_init((Class)NSMutableAttributedString);
  unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_MODIFICATION_HEADER" value:&stru_39200 table:@"Preferences"];

  id v12 = [(ExtensionsDetailSettingsPane *)self _permissionsSectionGroupTitleAtributedStringWithString:v11];
  [v9 appendAttributedString:v12];

  id v13 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
  [v9 appendAttributedString:v13];

  id v30 = [(ExtensionsDetailSettingsPane *)self _permissionsDetailParagraphStyle];
  if (v6)
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_MODIFICATION_ACTIONS" value:&stru_39200 table:@"Preferences"];

    id v16 = objc_alloc((Class)NSAttributedString);
    v33[0] = NSForegroundColorAttributeName;
    id v17 = +[ExtensionsDetailSettingsPane secondaryLabelColor];
    v34[0] = v17;
    v33[1] = NSFontAttributeName;
    +[UIFont systemFontSize];
    CFStringRef v18 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    v33[2] = NSParagraphStyleAttributeName;
    v34[1] = v18;
    v34[2] = v30;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v20 = [v16 initWithString:v15 attributes:v19];
    [v9 appendAttributedString:v20];

    if (v8)
    {
      id v21 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
      [v9 appendAttributedString:v21];

LABEL_7:
      id v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_MODIFICATION_ENCODING" value:&stru_39200 table:@"Preferences"];

      id v24 = objc_alloc((Class)NSAttributedString);
      v31[0] = NSForegroundColorAttributeName;
      v25 = +[ExtensionsDetailSettingsPane secondaryLabelColor];
      v32[0] = v25;
      v31[1] = NSFontAttributeName;
      +[UIFont systemFontSize];
      v26 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
      v31[2] = NSParagraphStyleAttributeName;
      v32[1] = v26;
      v32[2] = v30;
      v27 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
      id v28 = [v24 initWithString:v23 attributes:v27];
      [v9 appendAttributedString:v28];
    }
  }
  else if (v8)
  {
    goto LABEL_7;
  }

LABEL_9:

  return v9;
}

- (id)_messageRenderingPermissionsForExtension:(id)a3
{
  id v4 = [a3 capabilities];
  unsigned __int8 v5 = [v4 containsObject:MEMailExtensionCapabilityContentBlocking];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableAttributedString);
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v8 = [v7 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_RENDERING_HEADER" value:&stru_39200 table:@"Preferences"];

    id v9 = [(ExtensionsDetailSettingsPane *)self _permissionsSectionGroupTitleAtributedStringWithString:v8];
    [v6 appendAttributedString:v9];

    id v10 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
    [v6 appendAttributedString:v10];

    id v11 = [(ExtensionsDetailSettingsPane *)self _permissionsDetailParagraphStyle];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"EXTENSIONS_PERMISSIONS_RENDERING_DETAILS" value:&stru_39200 table:@"Preferences"];

    id v14 = objc_alloc((Class)NSAttributedString);
    v20[0] = NSForegroundColorAttributeName;
    uint64_t v15 = +[ExtensionsDetailSettingsPane secondaryLabelColor];
    v21[0] = v15;
    v20[1] = NSFontAttributeName;
    +[UIFont systemFontSize];
    id v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    v20[2] = NSParagraphStyleAttributeName;
    v21[1] = v16;
    v21[2] = v11;
    id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    id v18 = [v14 initWithString:v13 attributes:v17];
    [v6 appendAttributedString:v18];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (MERemoteExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentListController);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end