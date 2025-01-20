@interface CPLPlaceholderRecord
- (CPLPlaceholderRecord)initWithCKRecord:(id)a3 scopedIdentifier:(id)a4;
- (id)allRelatedCKRecordsInZoneID:(id)a3 identifier:(id)a4;
@end

@implementation CPLPlaceholderRecord

- (CPLPlaceholderRecord)initWithCKRecord:(id)a3 scopedIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recordType];
  id v9 = CPLRecordChangeClassForCKRecordType(v8);

  if (v9)
  {
    v10 = [v9 ckPropertyForRelatedIdentifier];
    if (v10)
    {
      v11 = [v6 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [v11 recordID];
        uint64_t v13 = [v12 recordName];

        v11 = (void *)v13;
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_7:
        if (v11) {
          id v15 = [v9 relatedRecordClass];
        }
        else {
          id v15 = 0;
        }
        goto LABEL_12;
      }
    }
    id v15 = 0;
    v11 = 0;
LABEL_12:
    self = [(CPLPlaceholderRecord *)self initWithRecordClass:v9 scopedIdentifier:v7 relatedRecordClass:v15 relatedIdentifier:v11];

    v14 = self;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)allRelatedCKRecordsInZoneID:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLPlaceholderRecord *)self recordClass];
  id v9 = CKRecordTypeForCPLRecordChangeClass((uint64_t)v8);
  if (v9)
  {
    id v10 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v6];
    id v11 = [objc_alloc((Class)CKRecord) initWithRecordType:v9 recordID:v10];
    v12 = [(CPLPlaceholderRecord *)self relatedIdentifier];
    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v13 = CKRecordTypeForCPLRecordChangeClass((uint64_t)[(CPLPlaceholderRecord *)self relatedRecordClass]);
    if (!v13) {
      goto LABEL_6;
    }
    v14 = (void *)v13;
    id v15 = [objc_alloc((Class)CKRecordID) initWithRecordName:v12 zoneID:v6];
    id v16 = [objc_alloc((Class)CKRecord) initWithRecordType:v14 recordID:v15];
    [v8 setRelatedValueOnRecord:v11 fromRelatedRecord:v16];

    if (v16)
    {
      v20[0] = v11;
      v20[1] = v16;
      v17 = +[NSArray arrayWithObjects:v20 count:2];
    }
    else
    {
LABEL_6:
      id v19 = v11;
      v17 = +[NSArray arrayWithObjects:&v19 count:1];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end