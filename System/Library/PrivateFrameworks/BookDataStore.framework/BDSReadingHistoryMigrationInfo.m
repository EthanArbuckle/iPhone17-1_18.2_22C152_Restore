@interface BDSReadingHistoryMigrationInfo
+ (NSString)booksFinishedUserDefaultsKey;
+ (NSString)dataHasBeenMovedUserDefaultsKey;
+ (NSString)streakDayUserDefaultsKey;
+ (NSURL)readingHistoryFileURL;
+ (id)description;
@end

@implementation BDSReadingHistoryMigrationInfo

+ (NSURL)readingHistoryFileURL
{
  v8 = objc_msgSend_documentsURL(BDSAppGroupContainer, a2, v2, v3, v4, v5, v6, v7);
  v15 = objc_msgSend_URLByAppendingPathComponent_(v8, v9, @"BCCloudData-AppMigration", v10, v11, v12, v13, v14);

  return (NSURL *)v15;
}

+ (NSString)booksFinishedUserDefaultsKey
{
  return (NSString *)@"booksFinishedUserDefaultsKey";
}

+ (NSString)streakDayUserDefaultsKey
{
  return (NSString *)@"streakDatUserDefaultsKey";
}

+ (NSString)dataHasBeenMovedUserDefaultsKey
{
  return (NSString *)@"readingHistoryDataHasBeenMovedDefaultsKey";
}

+ (id)description
{
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v12 = objc_msgSend_readingHistoryFileURL(BDSReadingHistoryMigrationInfo, v5, v6, v7, v8, v9, v10, v11);
  v20 = objc_msgSend_booksFinishedUserDefaultsKey(BDSReadingHistoryMigrationInfo, v13, v14, v15, v16, v17, v18, v19);
  v28 = objc_msgSend_streakDayUserDefaultsKey(BDSReadingHistoryMigrationInfo, v21, v22, v23, v24, v25, v26, v27);
  v35 = objc_msgSend_stringWithFormat_(v2, v29, @"<%@ readingHistoryFileURL=%@ booksFinishedUserDefaultsKey=%@ streakDayUserDefaultsKey=%@>", v30, v31, v32, v33, v34, v4, v12, v20, v28);

  return v35;
}

@end