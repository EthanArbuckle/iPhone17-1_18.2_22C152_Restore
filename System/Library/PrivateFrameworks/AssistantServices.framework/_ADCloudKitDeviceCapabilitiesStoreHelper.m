@interface _ADCloudKitDeviceCapabilitiesStoreHelper
- (id)deletionCriterionForCKRecordIDs:(id)a3;
- (id)recordBuilder;
- (id)recordZoneName;
- (id)sqliteRecordsForCKRecords:(id)a3;
- (id)tableDescription;
- (void)createIndicesForTableInDatabase:(id)a3;
@end

@implementation _ADCloudKitDeviceCapabilitiesStoreHelper

- (void).cxx_destruct
{
}

- (id)deletionCriterionForCKRecordIDs:(id)a3
{
  return 0;
}

- (id)sqliteRecordsForCKRecords:(id)a3
{
  return 0;
}

- (id)recordBuilder
{
  recordBuilder = self->_recordBuilder;
  if (!recordBuilder)
  {
    v4 = objc_alloc_init(ADCloudKitCapabilitiesRecordBuilder);
    v5 = self->_recordBuilder;
    self->_recordBuilder = (SiriCoreSQLiteRecordBuilder *)v4;

    recordBuilder = self->_recordBuilder;
  }
  return recordBuilder;
}

- (id)recordZoneName
{
  v2 = @"com.apple.assistant.device_capabilities";
  return @"com.apple.assistant.device_capabilities";
}

- (void)createIndicesForTableInDatabase:(id)a3
{
  id v3 = a3;
  sub_1001A43B4(@"device_capabilities", @"name", v3);
  sub_1001A43B4(@"device_capabilities", @"device_id", v3);
}

- (id)tableDescription
{
  id v2 = objc_alloc((Class)SiriCoreSQLiteTableDescription);
  id v3 = +[SiriCoreSQLiteColumnDescription uniqueTextColumnWithName:@"name"];
  id v4 = objc_msgSend(objc_alloc((Class)SiriCoreSQLiteColumnDescription), "initWithName:type:constraints:", @"capability_info", @"BLOB", 0, v3);
  v9[1] = v4;
  v5 = +[SiriCoreSQLiteColumnDescription uniqueTextColumnWithName:@"device_id"];
  v9[2] = v5;
  v6 = +[NSArray arrayWithObjects:v9 count:3];
  id v7 = [v2 initWithName:@"device_capabilities" columns:v6 constraints:0];

  return v7;
}

@end