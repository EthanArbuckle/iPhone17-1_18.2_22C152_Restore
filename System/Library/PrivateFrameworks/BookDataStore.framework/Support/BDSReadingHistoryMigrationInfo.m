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
  v2 = +[BDSAppGroupContainer documentsURL];
  v3 = [v2 URLByAppendingPathComponent:@"BCCloudData-AppMigration"];

  return (NSURL *)v3;
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
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = +[BDSReadingHistoryMigrationInfo readingHistoryFileURL];
  v5 = +[BDSReadingHistoryMigrationInfo booksFinishedUserDefaultsKey];
  v6 = +[BDSReadingHistoryMigrationInfo streakDayUserDefaultsKey];
  v7 = +[NSString stringWithFormat:@"<%@ readingHistoryFileURL=%@ booksFinishedUserDefaultsKey=%@ streakDayUserDefaultsKey=%@>", v3, v4, v5, v6];

  return v7;
}

@end