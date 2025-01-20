@interface CKRecordID
- (CKRecordID)initWithCPLArchiver:(id)a3;
- (id)cplFullDescription;
- (id)cpl_scopedIdentifierWithScopeIdentifier:(id)a3;
- (id)plistArchiveWithCPLArchiver:(id)a3;
@end

@implementation CKRecordID

- (id)cplFullDescription
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(CKRecordID *)self recordName];
  v5 = [(CKRecordID *)self zoneID];
  v6 = objc_msgSend(v5, "cpl_zoneName");
  id v7 = [v3 initWithFormat:@"%@#%@", v4, v6];

  return v7;
}

- (id)cpl_scopedIdentifierWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CKRecordID *)self recordName];
  id v6 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v4 identifier:v5];

  return v6;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 archiveCursor];
  [v4 setArchiveCursor:v5];
  id v7 = [(CKRecordID *)self recordName];
  v8 = [(CKRecordID *)self zoneID];
  v9 = [v8 zoneName];
  v10 = [v8 ownerName];
  [v8 databaseScope];
  id v11 = v9;
  id v12 = v10;
  if ([v7 isEqualToString:CKCurrentUserDefaultName]
    && ([v11 isEqualToString:CKRecordZoneDefaultName] & 1) != 0)
  {
    unsigned __int8 v13 = [v12 isEqualToString:CKCurrentUserDefaultName];

    if (v13) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  v14 = [(CKRecordID *)self recordName];
  [v4 encodeObject:v14 forKey:@"recordName"];

  id v15 = v12;
  if (([v11 isEqualToString:CPLPrimaryScopeIdentifier] & 1) == 0)
  {

    goto LABEL_10;
  }
  unsigned __int8 v16 = [v15 isEqualToString:CKCurrentUserDefaultName];

  if ((v16 & 1) == 0)
  {
LABEL_10:
    v17 = [(CKRecordID *)self zoneID];
    [v4 encodeObject:v17 forKey:@"zoneID"];
  }
LABEL_11:
  [v4 setArchiveCursor:v6];

  return v5;
}

- (CKRecordID)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordName"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    if (!v6)
    {
      if (qword_1002CEA10 != -1) {
        dispatch_once(&qword_1002CEA10, &stru_100279FD0);
      }
      id v6 = (id)qword_1002CEA08;
    }
    id v7 = [(CKRecordID *)self initWithRecordName:v5 zoneID:v6];
  }
  else
  {
    id v7 = [(CKRecordID *)self initWithRecordName:CKCurrentUserDefaultName];
  }

  return v7;
}

@end