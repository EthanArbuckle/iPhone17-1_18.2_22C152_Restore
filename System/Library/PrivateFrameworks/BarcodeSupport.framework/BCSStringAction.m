@interface BCSStringAction
- (BCSStringAction)initWithData:(id)a3 codePayload:(id)a4;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)defaultActionTargetApplicationBundleIdentifier;
- (id)localizedDefaultActionDescription;
- (id)shortDescription;
- (void)performActionWithOptions:(id)a3 completion:(id)a4;
- (void)performDefaultAction;
@end

@implementation BCSStringAction

- (BCSStringAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSStringAction;
  v8 = [(BCSAction *)&v11 initWithData:v6 codePayload:v7];
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)localizedDefaultActionDescription
{
  return _BCSLocalizedString(@"Search Web in Safari", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = _BCSLocalizedString(@"Search “%@”", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v5 = [(BCSAction *)self extraPreviewText];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)actionIconSystemImageName
{
  return @"safari.fill";
}

- (id)actionPickerItems
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = [(BCSAction *)self extraPreviewText];
  v4 = [BCSURLActionPickerItem alloc];
  v5 = _BCSLocalizedString(@"Search Web", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  id v6 = objc_msgSend(NSURL, "_bcs_searchURLWithQuery:", v3);
  id v7 = [(BCSURLActionPickerItem *)v4 initWithLabel:v5 action:self url:v6 applicationRecord:0];

  v8 = [[BCSCopyActionPickerItem alloc] initWithAction:self textToCopy:v3];
  v11[0] = v7;
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  return @"com.apple.mobilesafari";
}

- (void)performDefaultAction
{
  v3 = NSURL;
  v4 = [(BCSAction *)self extraPreviewText];
  v5 = objc_msgSend(v3, "_bcs_searchURLWithQuery:", v4);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSStringAction: performing search", v8, 2u);
  }
  id v6 = [getUIApplicationClass() sharedApplication];
  [v6 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];

  id v7 = +[BCSAWDLogger sharedLogger];
  [v7 logBarcodeActivatedEventForAction:self];
}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = [(BCSStringAction *)self actionPickerItems];
  v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 performActionWithFBOptions:v9];
  }
  v6[2](v6, 0);
}

@end