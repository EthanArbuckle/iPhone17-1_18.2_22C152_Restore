@interface BLCellularDataPromptDialogRequest
+ (BOOL)_hasWAPICapability;
+ (id)_bodyStringWithKind:(id)a3 andSize:(unint64_t)a4 remaining:(BOOL)a5;
+ (id)_buttonActions;
+ (id)_dialogForDownloadWithKind:(id)a3 andSize:(unint64_t)a4 forRoaming:(BOOL)a5 remaining:(BOOL)a6;
+ (id)dialogForDownload:(id)a3 roaming:(BOOL)a4;
@end

@implementation BLCellularDataPromptDialogRequest

+ (id)dialogForDownload:(id)a3 roaming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 kind];
  id v8 = [v6 bytes];
  id v9 = [v6 isRemaining];

  v10 = [a1 _dialogForDownloadWithKind:v7 andSize:v8 forRoaming:v4 remaining:v9];

  return v10;
}

+ (id)_dialogForDownloadWithKind:(id)a3 andSize:(unint64_t)a4 forRoaming:(BOOL)a5 remaining:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)AMSDialogRequest);
  v12 = BLBundle();
  v13 = v12;
  if (v7) {
    CFStringRef v14 = @"Download Using Data Roaming?";
  }
  else {
    CFStringRef v14 = @"Download Over Cellular?";
  }
  v15 = [v12 localizedStringForKey:v14 value:&stru_1001ABB60 table:@"Localizable"];
  [v11 setTitle:v15];

  v16 = [a1 _bodyStringWithKind:v10 andSize:a4 remaining:v6];

  [v11 setMessage:v16];
  v17 = [a1 _buttonActions];
  [v11 setButtonActions:v17];

  v18 = [v11 buttonActions];
  v19 = [v18 lastObject];
  [v11 setDefaultAction:v19];

  return v11;
}

+ (id)_buttonActions
{
  id v3 = objc_alloc_init((Class)AMSDialogAction);
  BOOL v4 = BLBundle();
  v5 = [v4 localizedStringForKey:@"Download Over Cellular" value:&stru_1001ABB60 table:@"Localizable"];
  [v3 setTitle:v5];

  [v3 setIdentifier:@"BLCellularDataPromptActionDownloadNow"];
  id v6 = objc_alloc_init((Class)AMSDialogAction);
  LODWORD(a1) = [a1 _hasWAPICapability];
  BOOL v7 = BLBundle();
  id v8 = v7;
  if (a1) {
    CFStringRef v9 = @"Wait for WLAN";
  }
  else {
    CFStringRef v9 = @"Wait for Wi-Fi";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_1001ABB60 table:@"Localizable"];
  [v6 setTitle:v10];

  [v6 setIdentifier:@"BLCellularDataPromptActionDownloadLater"];
  [v6 setStyle:2];
  v13[0] = v6;
  v13[1] = v3;
  id v11 = +[NSArray arrayWithObjects:v13 count:2];

  return v11;
}

+ (id)_bodyStringWithKind:(id)a3 andSize:(unint64_t)a4 remaining:(BOOL)a5
{
  if (a4)
  {
    BOOL v5 = a5;
    unsigned int v7 = [a3 isEqualToString:@"book"];
    id v8 = BLBundle();
    CFStringRef v9 = v8;
    CFStringRef v10 = @"This book has %@ remaining to download. Downloading over a cellular network may incur additional fees.";
    if (v7) {
      CFStringRef v10 = @"This audiobook has %@ remaining to download. Downloading over a cellular network may incur additional fees.";
    }
    CFStringRef v11 = @"This audiobook is %@. Downloading over a cellular network may incur additional fees.";
    if (!v7) {
      CFStringRef v11 = @"This book is %@. Downloading over a cellular network may incur additional fees.";
    }
    if (v5) {
      CFStringRef v12 = v10;
    }
    else {
      CFStringRef v12 = v11;
    }
    v13 = [v8 localizedStringForKey:v12 value:&stru_1001ABB60 table:@"Localizable"];

    CFStringRef v14 = +[BLEvaluatorDownload formatSize:a4];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);
  }
  else
  {
    v13 = BLBundle();
    v15 = [v13 localizedStringForKey:@"Downloading over a cellular network may incur additional fees." value:&stru_1001ABB60 table:@"Localizable"];
  }

  return v15;
}

+ (BOOL)_hasWAPICapability
{
  return MGGetBoolAnswer();
}

@end