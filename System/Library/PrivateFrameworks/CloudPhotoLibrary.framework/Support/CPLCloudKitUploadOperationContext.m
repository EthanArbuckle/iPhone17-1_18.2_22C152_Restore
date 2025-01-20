@interface CPLCloudKitUploadOperationContext
- (id)extendedStatusDescriptionStrings;
- (id)recordForRecordID:(id)a3;
- (void)addRecord:(id)a3 forRecordID:(id)a4 ignoreResources:(BOOL)a5;
- (void)recordCompletionForRecordID:(id)a3 withError:(id)a4;
- (void)updateProgress:(double)a3 forRecordID:(id)a4;
@end

@implementation CPLCloudKitUploadOperationContext

- (void)addRecord:(id)a3 forRecordID:(id)a4 ignoreResources:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  id v8 = a4;
  recordIDToProgressMap = self->_recordIDToProgressMap;
  if (!recordIDToProgressMap)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = self->_recordIDToProgressMap;
    self->_recordIDToProgressMap = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    recordIDToCPLRecordMap = self->_recordIDToCPLRecordMap;
    self->_recordIDToCPLRecordMap = v12;

    recordIDToProgressMap = self->_recordIDToProgressMap;
  }
  [(NSMutableDictionary *)recordIDToProgressMap setObject:&off_100291D40 forKey:v8];
  [(NSMutableDictionary *)self->_recordIDToCPLRecordMap setObject:v17 forKey:v8];
  if (v5)
  {
    ignoreResourcesForRecordIDs = self->_ignoreResourcesForRecordIDs;
    if (!ignoreResourcesForRecordIDs)
    {
      v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v16 = self->_ignoreResourcesForRecordIDs;
      self->_ignoreResourcesForRecordIDs = v15;

      ignoreResourcesForRecordIDs = self->_ignoreResourcesForRecordIDs;
    }
    [(NSMutableSet *)ignoreResourcesForRecordIDs addObject:v8];
  }
}

- (void)updateProgress:(double)a3 forRecordID:(id)a4
{
  id v8 = a4;
  v6 = -[NSMutableDictionary objectForKey:](self->_recordIDToProgressMap, "objectForKey:");

  if (v6)
  {
    v7 = +[NSNumber numberWithInteger:(uint64_t)(a3 * 100.0)];
    [(NSMutableDictionary *)self->_recordIDToProgressMap setObject:v7 forKey:v8];
  }
}

- (void)recordCompletionForRecordID:(id)a3 withError:(id)a4
{
  id v8 = a3;
  v6 = -[NSMutableDictionary objectForKey:](self->_recordIDToProgressMap, "objectForKey:");

  if (v6)
  {
    if (a4) {
      v7 = &off_100291D58;
    }
    else {
      v7 = &off_100291D70;
    }
    [(NSMutableDictionary *)self->_recordIDToProgressMap setObject:v7 forKey:v8];
  }
}

- (id)recordForRecordID:(id)a3
{
  return [(NSMutableDictionary *)self->_recordIDToCPLRecordMap objectForKey:a3];
}

- (id)extendedStatusDescriptionStrings
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(NSMutableDictionary *)self->_recordIDToProgressMap count];
  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"CPLUseCompactCloudKitStatus"];

  if (v4)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    recordIDToProgressMap = self->_recordIDToProgressMap;
    uint64_t v29 = 0;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100046BC8;
    v19 = &unk_100277BB0;
    v20 = self;
    v22 = &v26;
    char v25 = v6 ^ 1;
    id v8 = v3;
    id v21 = v8;
    v23 = &v30;
    v24 = &v34;
    [(NSMutableDictionary *)recordIDToProgressMap enumerateKeysAndObjectsUsingBlock:&v16];
    if ((v6 & 1) != 0 || (unint64_t)v31[3] >= 2)
    {
      id v9 = objc_alloc((Class)NSString);
      uint64_t v10 = v31[3];
      v11 = +[NSByteCountFormatter stringFromByteCount:v35[3] countStyle:3];
      id v12 = [v9 initWithFormat:@"\tTotal for %lu resources in operation: %@", v10, v11, v16, v17, v18, v19, v20];

      [v8 addObject:v12];
    }
    if (v27[3])
    {
      id v13 = objc_alloc((Class)NSString);
      id v14 = objc_msgSend(v13, "initWithFormat:", @"\t\t%lu records uploaded", v27[3]);
      [v8 addObject:v14];
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreResourcesForRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIDToCPLRecordMap, 0);
  objc_storeStrong((id *)&self->_recordIDToProgressMap, 0);
}

@end