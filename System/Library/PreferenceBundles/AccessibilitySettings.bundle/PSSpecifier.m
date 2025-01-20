@interface PSSpecifier
+ (id)voCommandItem:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)voCommandSubmenuWithTitle:(id)a3 childViewControllerClass:(Class)a4 command:(id)a5 commandManager:(id)a6 resolver:(id)a7;
+ (id)voGenericSubmenuWithTitle:(id)a3 childViewControllerClass:(Class)a4 commandManager:(id)a5 resolver:(id)a6;
+ (id)voGestureItem:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)voKeyboardShortcutBindingItem:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)voKeyboardShortcutItem:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)voQuickNavShortcutItem:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)voSubmenuForCommandCategory:(id)a3 commandManager:(id)a4 resolver:(id)a5;
- (AXAsset)ax_asset;
- (AXUIBluetoothDevice)voBrailleDevice;
- (BOOL)ax_assetDeleteButtonHidden;
- (BOOL)ax_assetDownloadButtonHidden;
- (BOOL)isCaptionProfile;
- (BOOL)isEditableCaptionProfile;
- (NSError)ax_assetError;
- (VOCommandContext)voCommandContext;
- (VOSCommandManager)voCommandManager;
- (VOSCommandResolver)voCommandResolver;
- (VOSOutputEvent)vosOutputEvent;
- (id)ax_assetDeleteButtonTapHandler;
- (id)ax_assetDownloadButtonTapHandler;
- (int64_t)ax_assetDownloadBytesExpected;
- (int64_t)ax_assetDownloadBytesReceived;
- (int64_t)ax_assetState;
- (int64_t)ax_assetUnarchivedFileSize;
- (unint64_t)voBindingAvailability;
- (void)_axApplyGraphicIconNamed:(id)a3;
- (void)ax_applyCustomAccessibilityGraphicIconNamed:(id)a3;
- (void)ax_applyPredefinedGraphicIconNamed:(id)a3;
- (void)setAx_asset:(id)a3;
- (void)setAx_assetDeleteButtonHidden:(BOOL)a3;
- (void)setAx_assetDeleteButtonTapHandler:(id)a3;
- (void)setAx_assetDownloadButtonHidden:(BOOL)a3;
- (void)setAx_assetDownloadButtonTapHandler:(id)a3;
- (void)setAx_assetDownloadBytesExpected:(int64_t)a3;
- (void)setAx_assetDownloadBytesReceived:(int64_t)a3;
- (void)setAx_assetError:(id)a3;
- (void)setAx_assetState:(int64_t)a3;
- (void)setAx_assetUnarchivedFileSize:(int64_t)a3;
- (void)setVoBrailleDevice:(id)a3;
- (void)setVoCommandContext:(id)a3;
- (void)setVosOutputEvent:(id)a3;
@end

@implementation PSSpecifier

- (int64_t)ax_assetState
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_AssetState"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setAx_assetState:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_AssetState"];
}

- (AXAsset)ax_asset
{
  return (AXAsset *)[(PSSpecifier *)self propertyForKey:@"ax_Asset"];
}

- (void)setAx_asset:(id)a3
{
}

- (NSError)ax_assetError
{
  return (NSError *)[(PSSpecifier *)self propertyForKey:@"ax_assetError"];
}

- (void)setAx_assetError:(id)a3
{
}

- (int64_t)ax_assetDownloadBytesReceived
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_assetDownloadBytesReceived"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (void)setAx_assetDownloadBytesReceived:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDownloadBytesReceived"];
}

- (int64_t)ax_assetDownloadBytesExpected
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_assetDownloadBytesExpected"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (void)setAx_assetDownloadBytesExpected:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDownloadBytesExpected"];
}

- (int64_t)ax_assetUnarchivedFileSize
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_assetUnarchivedFileSize"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (void)setAx_assetUnarchivedFileSize:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetUnarchivedFileSize"];
}

- (id)ax_assetDownloadButtonTapHandler
{
  return [(PSSpecifier *)self propertyForKey:@"ax_assetDownloadButtonTapHandler"];
}

- (void)setAx_assetDownloadButtonTapHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDownloadButtonTapHandler"];
}

- (BOOL)ax_assetDownloadButtonHidden
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_assetDownloadButtonHidden"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAx_assetDownloadButtonHidden:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDownloadButtonHidden"];
}

- (id)ax_assetDeleteButtonTapHandler
{
  return [(PSSpecifier *)self propertyForKey:@"ax_assetDeleteButtonTapHandler"];
}

- (void)setAx_assetDeleteButtonTapHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDeleteButtonTapHandler"];
}

- (BOOL)ax_assetDeleteButtonHidden
{
  v2 = [(PSSpecifier *)self propertyForKey:@"ax_assetDeleteButtonHidden"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAx_assetDeleteButtonHidden:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"ax_assetDeleteButtonHidden"];
}

- (BOOL)isCaptionProfile
{
  v2 = [(PSSpecifier *)self propertyForKey:@"IsCaptionProfile"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEditableCaptionProfile
{
  unsigned __int8 v3 = [(PSSpecifier *)self propertyForKey:@"IsCaptionProfile"];
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  v5 = [(PSSpecifier *)self propertyForKey:@"CaptionProfileID"];
  BOOL v6 = MACaptionAppearancePrefIsProfileEditable() != 0;

  return v6;
}

- (void)_axApplyGraphicIconNamed:(id)a3
{
  uint64_t v4 = PSLazyIconLoading;
  id v5 = a3;
  [(PSSpecifier *)self setObject:&__kCFBooleanTrue forKeyedSubscript:v4];
  [(PSSpecifier *)self setObject:v5 forKeyedSubscript:PSIconUTTypeIdentifierKey];
}

- (void)ax_applyCustomAccessibilityGraphicIconNamed:(id)a3
{
  AXCFormattedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier _axApplyGraphicIconNamed:](self, "_axApplyGraphicIconNamed:", v5, a3);
}

- (void)ax_applyPredefinedGraphicIconNamed:(id)a3
{
  AXCFormattedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier _axApplyGraphicIconNamed:](self, "_axApplyGraphicIconNamed:", v5, a3);
}

- (VOSOutputEvent)vosOutputEvent
{
  return (VOSOutputEvent *)[(PSSpecifier *)self propertyForKey:@"vosOutputEvent"];
}

- (void)setVosOutputEvent:(id)a3
{
}

- (VOCommandContext)voCommandContext
{
  return (VOCommandContext *)[(PSSpecifier *)self propertyForKey:@"VOCommandContext"];
}

- (void)setVoCommandContext:(id)a3
{
}

- (VOSCommandManager)voCommandManager
{
  v2 = [(PSSpecifier *)self voCommandContext];
  unsigned __int8 v3 = [v2 commandManager];

  return (VOSCommandManager *)v3;
}

+ (id)voGenericSubmenuWithTitle:(id)a3 childViewControllerClass:(Class)a4 commandManager:(id)a5 resolver:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = +[PSSpecifier preferenceSpecifierNamed:a3 target:a1 set:0 get:0 detail:a4 cell:2 edit:0];
  v13 = +[VOCommandContext genericContextWithCommandManager:v11 resolver:v10];

  [v12 setVoCommandContext:v13];

  return v12;
}

+ (id)voCommandSubmenuWithTitle:(id)a3 childViewControllerClass:(Class)a4 command:(id)a5 commandManager:(id)a6 resolver:(id)a7
{
  id v11 = a3;
  v12 = +[VOCommandContext commandContextWithCommand:a5 commandManager:a6 resolver:a7];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v11 target:v12 set:0 get:"gestureDescription:" detail:a4 cell:2 edit:0];

  [v13 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
  [v13 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v13 setVoCommandContext:v12];

  return v13;
}

+ (id)voSubmenuForCommandCategory:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 localizedCategoryName];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:a1 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  v13 = +[VOCommandContext commandCategoryContextWithCategory:v10 commandManager:v9 resolver:v8];

  [v12 setVoCommandContext:v13];

  return v12;
}

+ (id)voCommandItem:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 localizedName];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:a1 set:0 get:0 detail:0 cell:4 edit:0];

  v13 = +[VOCommandContext commandContextWithCommand:v10 commandManager:v9 resolver:v8];

  [v12 setVoCommandContext:v13];

  return v12;
}

+ (id)voGestureItem:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 localizedName];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:a1 set:0 get:0 detail:0 cell:4 edit:0];

  v13 = +[VOCommandContext gestureContextWithGesture:v10 commandManager:v9 resolver:v8];

  [v12 setVoCommandContext:v13];

  return v12;
}

+ (id)voKeyboardShortcutItem:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v6 = a3;
  v7 = [v6 keyChord];
  id v8 = [v7 accessibilitySpeakableDisplayValue];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:a1 set:0 get:0 detail:0 cell:4 edit:0];

  [v9 setVoCommandContext:v6];

  return v9;
}

+ (id)voKeyboardShortcutBindingItem:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v6 = a3;
  v7 = [v6 command];
  id v8 = [v7 localizedName];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:a1 set:0 get:0 detail:0 cell:4 edit:0];

  [v9 setVoCommandContext:v6];

  return v9;
}

+ (id)voQuickNavShortcutItem:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 accessibilitySpeakableDisplayValue];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:a1 set:0 get:0 detail:0 cell:4 edit:0];

  v13 = +[VOCommandContext quickNavShortcutContextWithKeyChord:v10 commandManager:v9 resolver:v8];

  [v12 setVoCommandContext:v13];

  return v12;
}

- (VOSCommandResolver)voCommandResolver
{
  v2 = [(PSSpecifier *)self voCommandContext];
  unsigned __int8 v3 = [v2 resolver];

  if (!v3)
  {
    unsigned __int8 v3 = +[VOSCommandResolver resolverForCurrentHost];
  }

  return (VOSCommandResolver *)v3;
}

- (unint64_t)voBindingAvailability
{
  v2 = [(PSSpecifier *)self voCommandContext];
  unsigned __int8 v3 = [v2 bindingAvailability];

  if (v3) {
    id v4 = [v3 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (AXUIBluetoothDevice)voBrailleDevice
{
  return (AXUIBluetoothDevice *)[(PSSpecifier *)self propertyForKey:@"voBrailleDevice"];
}

- (void)setVoBrailleDevice:(id)a3
{
}

@end