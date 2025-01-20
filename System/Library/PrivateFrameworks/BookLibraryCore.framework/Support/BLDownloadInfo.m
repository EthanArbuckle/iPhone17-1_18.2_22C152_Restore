@interface BLDownloadInfo
+ (BOOL)_shouldBeDiscretionary:(id)a3;
+ (BOOL)shouldBeDiscretionary:(id)a3;
+ (NSMutableSet)forcedNonDiscretionaryAssetIDs;
- (BOOL)shouldBeDiscretionary;
- (id)copyEvaluatorDownload;
- (id)createDownload;
- (unint64_t)fileSize;
- (void)forceNonDiscretionary;
@end

@implementation BLDownloadInfo

+ (NSMutableSet)forcedNonDiscretionaryAssetIDs
{
  if (qword_1001C8170 != -1) {
    dispatch_once(&qword_1001C8170, &stru_1001A22E8);
  }
  v2 = (void *)qword_1001C8168;

  return (NSMutableSet *)v2;
}

- (id)createDownload
{
  v3 = objc_opt_new();
  v4 = [(BLDownloadInfo *)self managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F674;
  v8[3] = &unk_1001A11A8;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [v4 performBlockAndWait:v8];

  id v6 = v5;
  return v6;
}

- (id)copyEvaluatorDownload
{
  return +[BLEvaluatorDownload copyEvaluatorDownloadWithParameters:self];
}

- (unint64_t)fileSize
{
  v2 = [(BLDownloadInfo *)self size];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (BOOL)shouldBeDiscretionary
{
  return +[BLDownloadInfo _shouldBeDiscretionary:self];
}

- (void)forceNonDiscretionary
{
  id v3 = [(BLDownloadInfo *)self isAutomaticDownload];

  if (v3)
  {
    [(BLDownloadInfo *)self setIsAutomaticDownload:&__kCFBooleanFalse];
    id v5 = +[BLDownloadInfo forcedNonDiscretionaryAssetIDs];
    v4 = [(BLDownloadInfo *)self storeIdentifier];
    [v5 addObject:v4];
  }
}

+ (BOOL)_shouldBeDiscretionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isAutomaticDownload];
  unsigned int v6 = [v5 BOOLValue];

  v8 = [v4 isRestore];
  unsigned __int8 v7 = [v8 BOOLValue];

  LOBYTE(v8) = 0;
  if (v6 && (v7 & 1) == 0)
  {
    id v9 = [a1 forcedNonDiscretionaryAssetIDs];
    v10 = [v4 storeIdentifier];
    LODWORD(v8) = [v9 containsObject:v10] ^ 1;
  }
  return (char)v8;
}

+ (BOOL)shouldBeDiscretionary:(id)a3
{
  return [a1 _shouldBeDiscretionary:a3];
}

@end