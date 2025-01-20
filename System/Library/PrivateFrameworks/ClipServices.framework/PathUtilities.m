@interface PathUtilities
+ (id)clipURLLookupDatabaseURL;
+ (id)daemonLibraryDirectoryURL;
+ (id)domainHashFilesDirectoryURL;
@end

@implementation PathUtilities

+ (id)daemonLibraryDirectoryURL
{
  if (qword_10001A310 != -1) {
    dispatch_once(&qword_10001A310, &stru_100014B88);
  }
  v2 = (void *)qword_10001A308;

  return v2;
}

+ (id)domainHashFilesDirectoryURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB28;
  block[3] = &unk_100014BA8;
  block[4] = a1;
  if (qword_10001A320 != -1) {
    dispatch_once(&qword_10001A320, block);
  }
  v2 = (void *)qword_10001A318;

  return v2;
}

+ (id)clipURLLookupDatabaseURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AC2C;
  block[3] = &unk_100014BA8;
  block[4] = a1;
  if (qword_10001A330 != -1) {
    dispatch_once(&qword_10001A330, block);
  }
  v2 = (void *)qword_10001A328;

  return v2;
}

@end