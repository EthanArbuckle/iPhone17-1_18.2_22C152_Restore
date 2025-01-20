@interface EDAMNoteAttributes
+ (id)structFields;
+ (id)structName;
- (EDAMLazyMap)applicationData;
- (NSDictionary)classifications;
- (NSNumber)altitude;
- (NSNumber)creatorId;
- (NSNumber)lastEditorId;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)noteTitleQuality;
- (NSNumber)reminderDoneTime;
- (NSNumber)reminderOrder;
- (NSNumber)reminderTime;
- (NSNumber)shareDate;
- (NSNumber)sharedWithBusiness;
- (NSNumber)subjectDate;
- (NSString)author;
- (NSString)conflictSourceNoteGuid;
- (NSString)contentClass;
- (NSString)lastEditedBy;
- (NSString)placeName;
- (NSString)source;
- (NSString)sourceApplication;
- (NSString)sourceURL;
- (void)setAltitude:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setClassifications:(id)a3;
- (void)setConflictSourceNoteGuid:(id)a3;
- (void)setContentClass:(id)a3;
- (void)setCreatorId:(id)a3;
- (void)setLastEditedBy:(id)a3;
- (void)setLastEditorId:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setNoteTitleQuality:(id)a3;
- (void)setPlaceName:(id)a3;
- (void)setReminderDoneTime:(id)a3;
- (void)setReminderOrder:(id)a3;
- (void)setReminderTime:(id)a3;
- (void)setShareDate:(id)a3;
- (void)setSharedWithBusiness:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setSubjectDate:(id)a3;
@end

@implementation EDAMNoteAttributes

+ (id)structFields
{
  v30[22] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1524;
  if (!structFields_structFields_1524)
  {
    v29 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"subjectDate"];
    v30[0] = v29;
    v28 = +[FATField fieldWithIndex:10 type:4 optional:1 name:@"latitude"];
    v30[1] = v28;
    v27 = +[FATField fieldWithIndex:11 type:4 optional:1 name:@"longitude"];
    v30[2] = v27;
    v26 = +[FATField fieldWithIndex:12 type:4 optional:1 name:@"altitude"];
    v30[3] = v26;
    v25 = +[FATField fieldWithIndex:13 type:11 optional:1 name:@"author"];
    v30[4] = v25;
    v24 = +[FATField fieldWithIndex:14 type:11 optional:1 name:@"source"];
    v30[5] = v24;
    v23 = +[FATField fieldWithIndex:15 type:11 optional:1 name:@"sourceURL"];
    v30[6] = v23;
    v22 = +[FATField fieldWithIndex:16 type:11 optional:1 name:@"sourceApplication"];
    v30[7] = v22;
    v21 = +[FATField fieldWithIndex:17 type:10 optional:1 name:@"shareDate"];
    v30[8] = v21;
    v20 = +[FATField fieldWithIndex:18 type:10 optional:1 name:@"reminderOrder"];
    v30[9] = v20;
    v19 = +[FATField fieldWithIndex:19 type:10 optional:1 name:@"reminderDoneTime"];
    v30[10] = v19;
    v18 = +[FATField fieldWithIndex:20 type:10 optional:1 name:@"reminderTime"];
    v30[11] = v18;
    v17 = +[FATField fieldWithIndex:21 type:11 optional:1 name:@"placeName"];
    v30[12] = v17;
    v16 = +[FATField fieldWithIndex:22 type:11 optional:1 name:@"contentClass"];
    v30[13] = v16;
    v3 = +[FATField fieldWithIndex:23 type:12 optional:1 name:@"applicationData" structClass:objc_opt_class()];
    v30[14] = v3;
    v4 = +[FATField fieldWithIndex:24 type:11 optional:1 name:@"lastEditedBy"];
    v30[15] = v4;
    v5 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v7 = +[FATField fieldWithIndex:26 type:13 optional:1 name:@"classifications" keyField:v5 valueField:v6];
    v30[16] = v7;
    v8 = +[FATField fieldWithIndex:27 type:8 optional:1 name:@"creatorId"];
    v30[17] = v8;
    v9 = +[FATField fieldWithIndex:28 type:8 optional:1 name:@"lastEditorId"];
    v30[18] = v9;
    v10 = +[FATField fieldWithIndex:29 type:2 optional:1 name:@"sharedWithBusiness"];
    v30[19] = v10;
    v11 = +[FATField fieldWithIndex:30 type:11 optional:1 name:@"conflictSourceNoteGuid"];
    v30[20] = v11;
    v12 = +[FATField fieldWithIndex:31 type:8 optional:1 name:@"noteTitleQuality"];
    v30[21] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:22];
    v14 = (void *)structFields_structFields_1524;
    structFields_structFields_1524 = v13;

    v2 = (void *)structFields_structFields_1524;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteAttributes";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteTitleQuality, 0);
  objc_storeStrong((id *)&self->_conflictSourceNoteGuid, 0);
  objc_storeStrong((id *)&self->_sharedWithBusiness, 0);
  objc_storeStrong((id *)&self->_lastEditorId, 0);
  objc_storeStrong((id *)&self->_creatorId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_lastEditedBy, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_contentClass, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_reminderTime, 0);
  objc_storeStrong((id *)&self->_reminderDoneTime, 0);
  objc_storeStrong((id *)&self->_reminderOrder, 0);
  objc_storeStrong((id *)&self->_shareDate, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_subjectDate, 0);
}

- (void)setNoteTitleQuality:(id)a3
{
}

- (NSNumber)noteTitleQuality
{
  return self->_noteTitleQuality;
}

- (void)setConflictSourceNoteGuid:(id)a3
{
}

- (NSString)conflictSourceNoteGuid
{
  return self->_conflictSourceNoteGuid;
}

- (void)setSharedWithBusiness:(id)a3
{
}

- (NSNumber)sharedWithBusiness
{
  return self->_sharedWithBusiness;
}

- (void)setLastEditorId:(id)a3
{
}

- (NSNumber)lastEditorId
{
  return self->_lastEditorId;
}

- (void)setCreatorId:(id)a3
{
}

- (NSNumber)creatorId
{
  return self->_creatorId;
}

- (void)setClassifications:(id)a3
{
}

- (NSDictionary)classifications
{
  return self->_classifications;
}

- (void)setLastEditedBy:(id)a3
{
}

- (NSString)lastEditedBy
{
  return self->_lastEditedBy;
}

- (void)setApplicationData:(id)a3
{
}

- (EDAMLazyMap)applicationData
{
  return self->_applicationData;
}

- (void)setContentClass:(id)a3
{
}

- (NSString)contentClass
{
  return self->_contentClass;
}

- (void)setPlaceName:(id)a3
{
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setReminderTime:(id)a3
{
}

- (NSNumber)reminderTime
{
  return self->_reminderTime;
}

- (void)setReminderDoneTime:(id)a3
{
}

- (NSNumber)reminderDoneTime
{
  return self->_reminderDoneTime;
}

- (void)setReminderOrder:(id)a3
{
}

- (NSNumber)reminderOrder
{
  return self->_reminderOrder;
}

- (void)setShareDate:(id)a3
{
}

- (NSNumber)shareDate
{
  return self->_shareDate;
}

- (void)setSourceApplication:(id)a3
{
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (void)setSourceURL:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAltitude:(id)a3
{
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setSubjectDate:(id)a3
{
}

- (NSNumber)subjectDate
{
  return self->_subjectDate;
}

@end