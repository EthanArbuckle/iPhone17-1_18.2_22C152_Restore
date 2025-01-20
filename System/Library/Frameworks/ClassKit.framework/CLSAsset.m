@interface CLSAsset
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)hashableColumnNames;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (BOOL)shouldInsertInDatabase:(id)a3;
- (BOOL)willBeProcessedByEndpointServer:(id)a3;
- (CLSAsset)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithCKRecord:(id)a3;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSAsset

- (BOOL)willBeProcessedByEndpointServer:(id)a3
{
  v4 = [a3 database];
  v5 = [(CLSAsset *)self ownerPersonID];
  uint64_t v6 = sub_100002F74(v4);
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6 || ([v5 isEqualToString:v6] & 1) == 0)
    {
      CLSInitLog();
      v8 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        v11 = v5;
        __int16 v12 = 2112;
        v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Refused to change asset.ownerPersonID from '%@' to '%@'", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    [(CLSAsset *)self setOwnerPersonID:v6];
  }

  return 1;
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CLSAsset *)self parentObjectID];
  v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)entityName
{
  return @"CLSAsset";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v4[2] = @"url";
  v4[3] = @"thumbnailURL";
  v4[4] = @"title";
  v4[5] = @"durationInSeconds";
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (unint64_t)changeHash
{
  v14.receiver = self;
  v14.super_class = (Class)CLSAsset;
  unint64_t v3 = [(CLSAsset *)&v14 changeHash];
  id v4 = [(CLSAsset *)self URL];
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "_cls_stableHash");

  uint64_t v6 = [(CLSAsset *)self thumbnailURL];
  unint64_t v7 = v5 ^ (unint64_t)objc_msgSend(v6, "_cls_stableHash");

  v8 = [(CLSAsset *)self title];
  unint64_t v9 = v7 ^ (unint64_t)objc_msgSend(v8, "_cls_stableHash") ^ v3;

  uint64_t v10 = v9 ^ (2 * (void)[(CLSAsset *)self displayOrder]);
  [(CLSAsset *)self durationInSeconds];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unint64_t v12 = v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (CLSAsset)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSAsset *)self _init];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    unint64_t v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"original");
    objc_msgSend(v6, "setOriginal:", objc_msgSend(v8, "BOOLValue"));

    unint64_t v9 = sub_100003BF0(v4, @"schoolworkSyncStatus");
    objc_msgSend(v6, "setSchoolworkSyncStatus:", objc_msgSend(v9, "integerValue"));

    uint64_t v10 = sub_100003BF0(v4, @"uploaded");
    objc_msgSend(v6, "setUploaded:", objc_msgSend(v10, "BOOLValue"));

    v11 = sub_100003BF0(v4, @"ownerPersonID");
    [v6 setOwnerPersonID:v11];

    unint64_t v12 = sub_100003BF0(v4, @"ubiquitousContainerName");
    [v6 setUbiquitousContainerName:v12];

    v13 = sub_100003BF0(v4, @"relativePathWithinContainer");
    [v6 setRelativePathWithinContainer:v13];

    objc_super v14 = sub_100003BF0(v4, @"brItemID");
    [v6 setBrItemID:v14];

    v15 = sub_100003BF0(v4, @"brZoneName");
    [v6 setBrZoneName:v15];

    v16 = sub_100003BF0(v4, @"brOwnerName");
    [v6 setBrOwnerName:v16];

    v17 = sub_100003BF0(v4, @"brShareName");
    [v6 setBrShareName:v17];

    v18 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", objc_msgSend(v18, "integerValue"));

    v19 = [v6 ubiquitousContainerName];

    if (v19)
    {
      if (![v6 type]) {
        [v6 setType:1];
      }
      if (![v6 parentEntityType]) {
        [v6 setParentEntityType:2];
      }
    }
    v20 = sub_100003BF0(v4, @"devModeURL");
    if (v20)
    {
      id v21 = [objc_alloc((Class)NSURL) initWithString:v20];
      [v6 setDevModeURL:v21];
    }
    v22 = sub_100003BF0(v4, @"url");

    if (v22)
    {
      id v23 = [objc_alloc((Class)NSURL) initWithString:v22];
      [v6 setURL:v23];
    }
    v24 = sub_1001630C8(v4, @"urlExpirationDate");
    [v6 setUrlExpirationDate:v24];

    [v6 setAppIdentifier:0];
    v25 = sub_100003BF0(v4, @"parentEntityType");
    objc_msgSend(v6, "setParentEntityType:", objc_msgSend(v25, "integerValue"));

    v26 = sub_100003BF0(v4, @"title");
    [v6 setTitle:v26];

    v27 = sub_100003BF0(v4, @"fileSizeInBytes");
    objc_msgSend(v6, "setFileSizeInBytes:", objc_msgSend(v27, "integerValue"));

    v28 = sub_100003BF0(v4, @"displayOrder");
    objc_msgSend(v6, "setDisplayOrder:", objc_msgSend(v28, "integerValue"));

    v29 = sub_100003BF0(v4, @"durationInSeconds");
    [v29 doubleValue];
    objc_msgSend(v6, "setDurationInSeconds:");

    v30 = sub_100003BF0(v4, @"fileUTTypeIdentifier");
    if (v30)
    {
      v31 = +[UTType typeWithIdentifier:v30];
      [v6 setFileUTType:v31];
    }
    v32 = sub_100003BF0(v4, @"originalFilename");
    [v6 setOriginalFilename:v32];

    v33 = sub_100003BF0(v4, @"fractionUploaded");
    [v33 doubleValue];
    objc_msgSend(v6, "setFractionUploaded:");

    v34 = sub_100003BF0(v4, @"downloaded");
    objc_msgSend(v6, "setDownloaded:", objc_msgSend(v34, "integerValue") != 0);

    v35 = sub_100003BF0(v4, @"fractionDownloaded");
    [v35 doubleValue];
    objc_msgSend(v6, "setFractionDownloaded:");

    v36 = sub_100003BF0(v4, @"staged");
    objc_msgSend(v6, "setStaged:", objc_msgSend(v36, "integerValue") != 0);

    v37 = sub_100003BF0(v4, @"thumbnailURL");

    if (v37)
    {
      id v38 = [objc_alloc((Class)NSURL) initWithString:v37];
      [v6 setThumbnailURL:v38];
    }
    [v6 setModified:0];
  }
  return (CLSAsset *)v6;
}

- (void)bindTo:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)CLSAsset;
  id v4 = a3;
  [(CLSAsset *)&v37 bindTo:v4];
  id v5 = [(CLSAsset *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  uint64_t v6 = [(CLSAsset *)self brItemID];
  sub_10008C524((uint64_t)v4, v6, @"brItemID");

  unint64_t v7 = [(CLSAsset *)self brZoneName];
  sub_10008C524((uint64_t)v4, v7, @"brZoneName");

  v8 = [(CLSAsset *)self brOwnerName];
  sub_10008C524((uint64_t)v4, v8, @"brOwnerName");

  unint64_t v9 = [(CLSAsset *)self brShareName];
  sub_10008C524((uint64_t)v4, v9, @"brShareName");

  uint64_t v10 = [(CLSAsset *)self ownerPersonID];
  sub_10008C524((uint64_t)v4, v10, @"ownerPersonID");

  v11 = +[NSNumber numberWithBool:[(CLSAsset *)self isUploaded]];
  sub_10008C524((uint64_t)v4, v11, @"uploaded");

  unint64_t v12 = +[NSNumber numberWithBool:[(CLSAsset *)self isOriginal]];
  sub_10008C524((uint64_t)v4, v12, @"original");

  v13 = [(CLSAsset *)self URL];
  objc_super v14 = [v13 absoluteString];
  sub_10008C524((uint64_t)v4, v14, @"url");

  v15 = [(CLSAsset *)self ubiquitousContainerName];
  sub_10008C524((uint64_t)v4, v15, @"ubiquitousContainerName");

  v16 = [(CLSAsset *)self relativePathWithinContainer];
  sub_10008C524((uint64_t)v4, v16, @"relativePathWithinContainer");

  v17 = [(CLSAsset *)self devModeURL];
  v18 = [v17 absoluteString];
  sub_10008C524((uint64_t)v4, v18, @"devModeURL");

  v19 = +[NSNumber numberWithInteger:[(CLSAsset *)self schoolworkSyncStatus]];
  sub_10008C524((uint64_t)v4, v19, @"schoolworkSyncStatus");

  v20 = [(CLSAsset *)self urlExpirationDate];
  sub_10008C524((uint64_t)v4, v20, @"urlExpirationDate");

  CFStringRef v38 = @"appIdentifier";
  id v21 = +[NSArray arrayWithObjects:&v38 count:1];
  sub_10008C5D0((uint64_t)v4, v21);

  v22 = +[NSNumber numberWithInteger:[(CLSAsset *)self type]];
  sub_10008C524((uint64_t)v4, v22, @"type");

  id v23 = +[NSNumber numberWithInteger:[(CLSAsset *)self parentEntityType]];
  sub_10008C524((uint64_t)v4, v23, @"parentEntityType");

  v24 = [(CLSAsset *)self title];
  sub_10008C524((uint64_t)v4, v24, @"title");

  v25 = +[NSNumber numberWithInteger:[(CLSAsset *)self fileSizeInBytes]];
  sub_10008C524((uint64_t)v4, v25, @"fileSizeInBytes");

  v26 = +[NSNumber numberWithInteger:[(CLSAsset *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v26, @"displayOrder");

  [(CLSAsset *)self durationInSeconds];
  v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v27, @"durationInSeconds");

  v28 = [(CLSAsset *)self fileUTType];
  v29 = [v28 identifier];
  sub_10008C524((uint64_t)v4, v29, @"fileUTTypeIdentifier");

  v30 = [(CLSAsset *)self originalFilename];
  sub_10008C524((uint64_t)v4, v30, @"originalFilename");

  [(CLSAsset *)self fractionUploaded];
  v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v31, @"fractionUploaded");

  v32 = +[NSNumber numberWithBool:[(CLSAsset *)self isDownloaded]];
  sub_10008C524((uint64_t)v4, v32, @"downloaded");

  [(CLSAsset *)self fractionDownloaded];
  v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v33, @"fractionDownloaded");

  v34 = +[NSNumber numberWithBool:[(CLSAsset *)self isStaged]];
  sub_10008C524((uint64_t)v4, v34, @"staged");

  v35 = [(CLSAsset *)self thumbnailURL];
  v36 = [v35 absoluteString];
  sub_10008C524((uint64_t)v4, v36, @"thumbnailURL");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 2) {
    goto LABEL_8;
  }
  if (a3 == 1) {
    goto LABEL_47;
  }
  if (a3) {
    goto LABEL_14;
  }
  if (sub_100007540(v7, @"create table CLSAsset(objectID         text not null, parentObjectID   text not null, dateCreated      real not null, dateLastModified real not null, appIdentifier    text not null, url              text, brItemID         text, brZoneName       text, brOwnerName      text, ownerPersonID    text, uploaded         integer, original         integer, ubiquitousContainerName     text, relativePathWithinContainer text, brShareName      text, foreign key (parentObjectID) references CLSHandoutAttachment(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSAsset_objectID on CLSAsset (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSAsset_parentObjectID on CLSAsset (parentObjectID)", 0, 0, 0))
      {
LABEL_47:
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"alter table CLSAsset add column devModeURL text", 0, 0, 0))
        {
LABEL_8:
          *(void *)buf = 0;
          id v23 = buf;
          uint64_t v24 = 0x3032000000;
          v25 = sub_10000B7E4;
          v26 = sub_10000B60C;
          v27 = @"alter table CLSAsset add column schoolworkSyncStatus integer";
          uint64_t v18 = 0;
          v19 = &v18;
          uint64_t v20 = 0x2020000000;
          char v21 = 0;
          char v21 = sub_100007540(v8, @"alter table CLSAsset add column schoolworkSyncStatus integer", 0, 0, 0);
          if (*((unsigned char *)v19 + 24))
          {
            uint64_t v9 = objc_opt_class();
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_100153014;
            v14[3] = &unk_1001F6168;
            id v15 = v8;
            v16 = buf;
            v17 = &v18;
            [v15 selectAll:v9 block:v14];
            LODWORD(v9) = *((unsigned __int8 *)v19 + 24);

            BOOL v10 = v9 != 0;
            if (v9) {
              a3 = 3;
            }
            else {
              a3 = 2;
            }
          }
          else
          {
            BOOL v10 = 0;
            a3 = 2;
          }
          _Block_object_dispose(&v18, 8);
          _Block_object_dispose(buf, 8);

          if (!v10) {
            goto LABEL_43;
          }
LABEL_14:
          if (a3 != 4)
          {
            if (a3 != 3)
            {
LABEL_25:
              *a4 = a3;
              LOBYTE(a3) = 1;
              goto LABEL_44;
            }
            if ((sub_100007540(v8, @"create table CLSAssetCopy (\n objectID                     text not null,\n parentObjectID               text,\n dateCreated                  real not null,\n dateLastModified             real not null,\n url                          text,\n thumbnailURL                 text,\n brItemID                     text,\n brZoneName                   text,\n brOwnerName                  text,\n ownerPersonID                text,\n uploaded                     integer,\n fractionUploaded             real,\n original                     integer,\n ubiquitousContainerName      text,\n relativePathWithinContainer  text,\n brShareName                  text,\n schoolworkSyncStatus         integer,\n type                         integer,\n parentEntityType             integer,\n title                        text,\n fileSizeInBytes              integer,\n displayOrder                 integer,\n fileUTTypeIdentifier         text,\n originalFilename             text,\n downloaded                   integer,\n fractionDownloaded           real,\n staged                       integer,\n devModeURL                   text,\n urlExpirationDate            real\n)", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to create CLSAssetCopy";
                goto LABEL_42;
              }
LABEL_43:
              LOBYTE(a3) = 0;
              goto LABEL_44;
            }
            if ((sub_100007540(v8, @"insert into CLSAssetCopy (objectID, parentObjectID, dateCreated, dateLastModified, url, brItemID, brZoneName, brOwnerName, ownerPersonID, uploaded, original, ubiquitousContainerName, relativePathWithinContainer, brShareName, devModeURL, schoolworkSyncStatus) select objectID, parentObjectID, dateCreated, dateLastModified, url, brItemID, brZoneName, brOwnerName, ownerPersonID, uploaded, original, ubiquitousContainerName, relativePathWithinContainer, brShareName, devModeURL, schoolworkSyncStatus from CLSAsset", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to insert rows in CLSAssetCopy from CLSAsset";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            if ((sub_100007540(v8, @"drop table CLSAsset", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to drop CLSAsset";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            if ((sub_100007540(v8, @"create unique index CLSAsset_objectID on CLSAssetCopy (objectID)", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to create unique index: CLSAssetCopy_objectID";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            if ((sub_100007540(v8, @"create index CLSAsset_parentObjectID on CLSAssetCopy (parentObjectID)", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to create unique index: CLSAssetCopy_parentObjectID";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            if ((sub_100007540(v8, @"create index CLSAsset_staged on CLSAssetCopy (staged)", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to create unique index: CLSAssetCopy_staged";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
            if ((sub_100007540(v8, @"alter table CLSAssetCopy rename to CLSAsset", 0, 0, 0) & 1) == 0)
            {
              CLSInitLog();
              v11 = CLSLogDatabase;
              if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                unint64_t v12 = "Failed to rename CLSAssetCopy as CLSAsset";
                goto LABEL_42;
              }
              goto LABEL_43;
            }
          }
          if (sub_100007540(v8, @"alter table CLSAsset add column durationInSeconds real", 0, 0, 0))
          {
            a3 = 5;
            goto LABEL_25;
          }
          CLSInitLog();
          v11 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            unint64_t v12 = "Failed to add durationInSeconds to CLSAsset";
LABEL_42:
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
            goto LABEL_43;
          }
          goto LABEL_43;
        }
      }
    }
  }
LABEL_44:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSAsset *)self objectID];
  uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    uint64_t v9 = (id *)objc_opt_new();
    uint64_t v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  v11 = sub_1001534A4(v4, v5);
  [v7 addObjectsFromArray:v11];

  unint64_t v12 = [v7 allObjects];
  sub_100075F40((uint64_t)v6, v12);

  [v4 insertOrUpdateObject:v6];
  if ([(CLSAsset *)self type] == (id)3)
  {
    v13 = [(CLSAsset *)self objectID];
    BOOL v14 = sub_100153674((BOOL)v4, v13);

    if (v14)
    {
      id v15 = (id *)sub_100082660([PDCKUploadAssetsOperation alloc], v4);
      v17 = v15;
      if (v15) {
        objc_setProperty_nonatomic_copy(v15, v16, &stru_1001F6188, 48);
      }
      id v18 = objc_alloc((Class)CKRecordID);
      v19 = [(CLSAsset *)self objectID];
      if (v17) {
        id v20 = v17[3];
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;
      id v22 = [v18 initWithRecordName:v19 zoneID:v21];

      id v24 = v22;
      id v23 = +[NSArray arrayWithObjects:&v24 count:1];
      sub_100082850(v17, &__NSArray0__struct, v23);
    }
    sub_100126128((uint64_t)PDFileSyncManager, self);
  }
}

+ (id)recordType
{
  return @"CLSAsset";
}

- (id)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSAsset *)self _init];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:@"itemID"];
    [v6 setBrItemID:v7];

    id v8 = [v4 objectForKeyedSubscript:@"ownerName"];
    [v6 setBrOwnerName:v8];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"zoneName"];
    [v6 setBrZoneName:v9];

    BOOL v10 = [v4 objectForKeyedSubscript:@"relativePathWithinContainer"];
    [v6 setRelativePathWithinContainer:v10];

    v11 = [v4 objectForKeyedSubscript:@"ubiquitousContainerName"];
    [v6 setUbiquitousContainerName:v11];

    unint64_t v12 = [v4 objectForKeyedSubscript:@"shareName"];
    [v6 setBrShareName:v12];

    v13 = [v4 objectForKeyedSubscript:@"uploaded"];
    objc_msgSend(v6, "setUploaded:", objc_msgSend(v13, "BOOLValue"));

    BOOL v14 = [v4 objectForKeyedSubscript:@"displayOrder"];
    objc_msgSend(v6, "setDisplayOrder:", objc_msgSend(v14, "integerValue"));
    id v15 = [v4 objectForKeyedSubscript:@"mediaDurationInSeconds"];
    [v15 doubleValue];
    objc_msgSend(v6, "setDurationInSeconds:");
    v16 = [v4 objectForKeyedSubscript:@"fileSizeInBytes"];

    objc_msgSend(v6, "setFileSizeInBytes:", objc_msgSend(v16, "integerValue"));
    v17 = [v4 objectForKeyedSubscript:@"parentEntityType"];

    objc_msgSend(v6, "setParentEntityType:", objc_msgSend(v17, "integerValue"));
    id v18 = [v4 objectForKeyedSubscript:@"type"];

    objc_msgSend(v6, "setType:", objc_msgSend(v18, "integerValue"));
    v19 = [v4 objectForKeyedSubscript:@"fileUTTypeIdentifier"];
    if (v19)
    {
      id v20 = +[UTType typeWithIdentifier:v19];
      [v6 setFileUTType:v20];
    }
    id v21 = [v4 objectForKeyedSubscript:@"originalFilename"];
    [v6 setOriginalFilename:v21];

    id v22 = [v4 objectForKeyedSubscript:@"title"];
    [v6 setTitle:v22];

    [v6 setOriginal:1];
    [v6 setStaged:1];
  }
  return v6;
}

- (void)populate:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLSAsset;
  [(CLSAsset *)&v23 populate:v4];
  id v5 = [(CLSAsset *)self brItemID];
  [v4 setObject:v5 forKeyedSubscript:@"itemID"];

  uint64_t v6 = [(CLSAsset *)self brOwnerName];
  [v4 setObject:v6 forKeyedSubscript:@"ownerName"];

  id v7 = [(CLSAsset *)self brZoneName];
  [v4 setObject:v7 forKeyedSubscript:@"zoneName"];

  id v8 = [(CLSAsset *)self relativePathWithinContainer];
  [v4 setObject:v8 forKeyedSubscript:@"relativePathWithinContainer"];

  uint64_t v9 = [(CLSAsset *)self ubiquitousContainerName];
  [v4 setObject:v9 forKeyedSubscript:@"ubiquitousContainerName"];

  BOOL v10 = [(CLSAsset *)self brShareName];
  [v4 setObject:v10 forKeyedSubscript:@"shareName"];

  v11 = +[NSNumber numberWithBool:[(CLSAsset *)self isUploaded]];
  [v4 setObject:v11 forKeyedSubscript:@"uploaded"];

  unint64_t v12 = +[NSNumber numberWithBool:[(CLSAsset *)self isOriginal]];
  [v4 setObject:v12 forKeyedSubscript:@"original"];

  v13 = +[NSNumber numberWithInteger:[(CLSAsset *)self displayOrder]];
  [v4 setObject:v13 forKeyedSubscript:@"displayOrder"];

  [(CLSAsset *)self durationInSeconds];
  BOOL v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v14 forKeyedSubscript:@"mediaDurationInSeconds"];

  id v15 = +[NSNumber numberWithInteger:[(CLSAsset *)self fileSizeInBytes]];
  [v4 setObject:v15 forKeyedSubscript:@"fileSizeInBytes"];

  v16 = +[NSNumber numberWithInteger:[(CLSAsset *)self parentEntityType]];
  [v4 setObject:v16 forKeyedSubscript:@"parentEntityType"];

  v17 = +[NSNumber numberWithInteger:[(CLSAsset *)self type]];
  [v4 setObject:v17 forKeyedSubscript:@"type"];

  id v18 = [(CLSAsset *)self fileUTType];

  if (v18)
  {
    v19 = [(CLSAsset *)self fileUTType];
    id v20 = [v19 identifier];
    [v4 setObject:v20 forKeyedSubscript:@"fileUTTypeIdentifier"];
  }
  id v21 = [(CLSAsset *)self originalFilename];
  [v4 setObject:v21 forKeyedSubscript:@"originalFilename"];

  id v22 = [(CLSAsset *)self title];
  [v4 setObject:v22 forKeyedSubscript:@"title"];

  [(CLSAsset *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncOrder
{
  return 3;
}

- (int64_t)syncableItemType
{
  return 2 * ([(CLSAsset *)self parentEntityType] == (id)4);
}

- (NSString)parentReferenceName
{
  return (NSString *)@"owner";
}

- (BOOL)shouldInsertInDatabase:(id)a3
{
  id v4 = sub_100002F74(a3);
  [(CLSAsset *)self setOwnerPersonID:v4];

  return 1;
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  if (!self) {
    goto LABEL_31;
  }
  id v5 = [(CLSAsset *)self type];
  if (!v5) {
    goto LABEL_31;
  }
  if (v5 == (id)3)
  {
    if ([(CLSAsset *)self isUploaded])
    {
      uint64_t v6 = [(CLSAsset *)self brItemID];
      if (!v6)
      {
LABEL_30:

        goto LABEL_31;
      }
      BOOL v10 = [(CLSAsset *)self brZoneName];

      if (v10) {
        goto LABEL_13;
      }
    }
LABEL_31:
    CLSInitLog();
    id v21 = (void *)CLSLogAsset;
    if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      objc_super v23 = [(CLSAsset *)self objectID];
      int v25 = 138412290;
      v26 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Asset (%@) not syncable", (uint8_t *)&v25, 0xCu);
    }
    int64_t v13 = -1;
    goto LABEL_34;
  }
  if (v5 != (id)1) {
    goto LABEL_13;
  }
  if (![(CLSAsset *)self isUploaded]) {
    goto LABEL_31;
  }
  uint64_t v6 = [(CLSAsset *)self brItemID];
  if (!v6) {
    goto LABEL_30;
  }
  uint64_t v7 = [(CLSAsset *)self brZoneName];
  if (!v7) {
    goto LABEL_30;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(CLSAsset *)self brOwnerName];

  if (!v9) {
    goto LABEL_31;
  }
LABEL_13:
  v11 = [(CLSAsset *)self parentObjectID];
  unint64_t v12 = 0;
  int64_t v13 = 0;
  switch((unint64_t)[(CLSAsset *)self parentEntityType])
  {
    case 0uLL:
      CLSInitLog();
      BOOL v14 = CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Asset.parentEntityType is not set. Assuming the parent is a CLSHandoutAttachment and getting its syncBackend", (uint8_t *)&v25, 2u);
      }
      goto LABEL_16;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
LABEL_16:
      id v15 = [v4 select:objc_opt_class() identity:v11];
      unint64_t v12 = v15;
      if (!v15) {
        goto LABEL_18;
      }
      int64_t v13 = (int64_t)[v15 syncBackend:v4];
      if (v13 == -1) {
        goto LABEL_18;
      }
      goto LABEL_23;
    case 6uLL:
      goto LABEL_23;
    default:
LABEL_18:
      if ([(CLSAsset *)self isStaged])
      {
        if ([(CLSAsset *)self type] == (id)3) {
          int64_t v13 = 1;
        }
        else {
          int64_t v13 = -1;
        }
      }
      else
      {
        int64_t v13 = -1;
      }
LABEL_23:
      CLSInitLog();
      v16 = (void *)CLSLogAsset;
      if (os_log_type_enabled(CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        id v18 = [(CLSAsset *)self objectID];
        v19 = @"None";
        if (v13 == 1) {
          v19 = @"iCloud";
        }
        if (!v13) {
          v19 = @"Server";
        }
        id v20 = v19;
        int v25 = 138412546;
        v26 = v18;
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Asset (%@) sync backend set to %@", (uint8_t *)&v25, 0x16u);
      }
      break;
  }
LABEL_34:

  return v13;
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v10 setType:15];
  uint64_t v11 = (uint64_t)[v8 state];
  id v12 = v7;
  self;
  if (v11 != 3)
  {
    if (v11 == 2)
    {
      if ([v12 isStaged]) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    else
    {
      uint64_t v11 = v11 == 1;
    }
  }

  [(PDDPPayload *)v10 setAction:v11];
  if ([v8 state] == (id)3)
  {
    int64_t v13 = objc_opt_new();
    [(PDDPPayload *)v10 setAsset:v13];

    BOOL v14 = [v8 entityIdentity];
    id v15 = [(PDDPPayload *)v10 asset];
    [v15 setObjectId:v14];

    v16 = [v9 select:objc_opt_class() identity:v14];

    if (v16) {
      v17 = (void *)v16[2];
    }
    else {
      v17 = 0;
    }
    id v18 = v17;
  }
  else
  {
    v19 = sub_100025010(v12);
    [(PDDPPayload *)v10 setAsset:v19];

    BOOL v14 = [v12 objectID];
    sub_1001534A4(v9, v14);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v9;
  }

  id v20 = [v18 mutableCopy];
  id v21 = [(PDDPPayload *)v10 asset];
  [v21 setClassIds:v20];

  id v24 = v10;
  id v22 = +[NSArray arrayWithObjects:&v24 count:1];

  return v22;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v6 setType:15];
  id v7 = sub_100025010(self);
  [(PDDPPayload *)v6 setAsset:v7];

  id v8 = [v5 mutableCopy];
  id v9 = [(PDDPPayload *)v6 asset];
  [v9 setClassIds:v8];

  id v12 = v6;
  BOOL v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

@end