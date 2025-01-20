@interface PairingRecordDetailController
- (PairingRecordDetailController)init;
- (id)dateLastUsed;
- (id)datePaired;
- (id)deviceType;
- (id)serialNumber;
- (id)specifierWithName:(id)a3 getter:(SEL)a4;
- (id)specifiers;
@end

@implementation PairingRecordDetailController

- (PairingRecordDetailController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PairingRecordDetailController;
  return [(PairingRecordDetailController *)&v3 init];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_HEADER" value:&stru_8420 table:0];
    v8 = +[PSSpecifier groupSpecifierWithName:v7];
    [v5 addObject:v8];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_MODEL_NAME_TITLE" value:&stru_8420 table:0];
    v11 = [(PairingRecordDetailController *)self specifierWithName:v10 getter:"deviceType"];
    [v5 addObject:v11];

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_SERIAL_NUMBER_TITLE" value:&stru_8420 table:0];
    v14 = [(PairingRecordDetailController *)self specifierWithName:v13 getter:"serialNumber"];

    [v14 setProperty:&__kCFBooleanTrue forKey:PSUseHighLegibilityAlternateKey];
    [v5 addObject:v14];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_DATE_PAIRED_TITLE" value:&stru_8420 table:0];
    v17 = [(PairingRecordDetailController *)self specifierWithName:v16 getter:"datePaired"];
    [v5 addObject:v17];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_DATE_LAST_USED_TITLE" value:&stru_8420 table:0];
    v20 = [(PairingRecordDetailController *)self specifierWithName:v19 getter:"dateLastUsed"];
    [v5 addObject:v20];

    v21 = +[PSSpecifier groupSpecifierWithID:@"unpair-device-group"];
    [v5 addObject:v21];

    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"PAIRED_DEVICE_DETAIL_UNPAIR_BUTTON" value:&stru_8420 table:0];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"unpairDevice" get:0 detail:0 cell:13 edit:0];
    [v5 addObject:v24];

    v25 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)specifierWithName:(id)a3 getter:(SEL)a4
{
  return +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:a4 detail:0 cell:4 edit:0];
}

- (id)deviceType
{
  return @"MacBook Pro";
}

- (id)serialNumber
{
  return @"9LQHPX0GDG";
}

- (id)datePaired
{
  v2 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  uint64_t v3 = +[NSDateFormatter localizedStringFromDate:v2 dateStyle:1 timeStyle:0];

  return v3;
}

- (id)dateLastUsed
{
  v2 = +[NSDate now];
  uint64_t v3 = +[NSDateFormatter localizedStringFromDate:v2 dateStyle:1 timeStyle:0];

  return v3;
}

@end