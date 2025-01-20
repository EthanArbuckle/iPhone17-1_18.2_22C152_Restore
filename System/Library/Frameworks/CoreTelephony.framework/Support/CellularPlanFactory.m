@interface CellularPlanFactory
- (id)createCKContainer;
- (id)createCKDatabase;
- (id)createCKModifyRecordsOperation;
@end

@implementation CellularPlanFactory

- (id)createCKContainer
{
  if (qword_100079588 != -1) {
    dispatch_once(&qword_100079588, &stru_10006D098);
  }
  if (byte_100079590)
  {
    v3 = +[CKContainer containerWithIdentifier:@"com.apple.iCloud.CommCenter"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)createCKDatabase
{
  if (qword_100079588 != -1) {
    dispatch_once(&qword_100079588, &stru_10006D098);
  }
  if (byte_100079590)
  {
    v3 = +[CKContainer containerWithIdentifier:@"com.apple.iCloud.CommCenter"];
    v4 = [v3 privateCloudDatabase];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createCKModifyRecordsOperation
{
  if (qword_100079588 != -1) {
    dispatch_once(&qword_100079588, &stru_10006D098);
  }
  if (byte_100079590)
  {
    id v3 = objc_alloc_init((Class)CKModifyRecordsOperation);
    [v3 setSavePolicy:2];
    [v3 setQualityOfService:25];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end