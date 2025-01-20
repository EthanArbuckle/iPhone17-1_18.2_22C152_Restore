@interface CRDetailViewComponentBluetooth
- (CRDetailViewComponentBluetooth)init;
- (id)specifiers;
@end

@implementation CRDetailViewComponentBluetooth

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(CRUDetailViewComponent *)self componentSpecifierForComponent:@"Bluetooth"];
    [v5 addObjectsFromArray:v6];

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
    id v8 = v5;

    v9 = objc_opt_new();
    [v9 sendAsyncAnalyticsForEventIfNeeded:@"detailViewSeen" moduleName:@"Bluetooth"];

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (CRDetailViewComponentBluetooth)init
{
  v19.receiver = self;
  v19.super_class = (Class)CRDetailViewComponentBluetooth;
  v2 = [(CRUDetailViewComponent *)&v19 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = NSURL;
    v5 = [(CRUDetailViewComponent *)v2 locale];
    v6 = [v5 localizedStringWithKey:@"BLUETOOTH_KB_URL" defaultString:@"BLUETOOTH_KB_URL"];
    v7 = [v4 URLWithString:v6];
    [(CRUDetailViewComponent *)v3 setKbArticleURL:v7];

    id v8 = [(CRUDetailViewComponent *)v3 locale];
    v9 = [v8 localizedStringWithKey:@"BLUETOOTH_SETTINGS_TITLE" defaultString:@"BLUETOOTH_SETTINGS_TITLE"];
    [(CRUDetailViewComponent *)v3 setTitleText:v9];

    v10 = [(CRUDetailViewComponent *)v3 locale];
    v11 = [v10 localizedStringWithKey:@"BLUETOOTH_DESC" defaultString:@"BLUETOOTH_DESC"];
    [(CRUDetailViewComponent *)v3 setInformativeText:v11];

    if ([(CRUDetailViewComponent *)v3 deviceClass] == 3)
    {
      v12 = [(CRUDetailViewComponent *)v3 locale];
      v13 = [v12 localizedStringWithKey:@"BLUETOOTH_DESC_IPAD" defaultString:@"BLUETOOTH_DESC_IPAD"];
      [(CRUDetailViewComponent *)v3 setInformativeText:v13];

      v14 = NSURL;
      v15 = [(CRUDetailViewComponent *)v3 locale];
      v16 = [v15 localizedStringWithKey:@"BLUETOOTH_KB_URL_IPAD" defaultString:@"BLUETOOTH_KB_URL_IPAD"];
      v17 = [v14 URLWithString:v16];
      [(CRUDetailViewComponent *)v3 setKbArticleURL:v17];
    }
  }
  return v3;
}

@end