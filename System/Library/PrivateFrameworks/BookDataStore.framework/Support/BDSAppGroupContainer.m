@interface BDSAppGroupContainer
+ (BOOL)isUnitTesting;
+ (NSURL)containerURL;
+ (NSURL)documentsURL;
+ (id)containerIdentifier;
+ (void)setUnitTesting:(BOOL)a3;
@end

@implementation BDSAppGroupContainer

+ (BOOL)isUnitTesting
{
  if (qword_1002974F8 != -1) {
    dispatch_once(&qword_1002974F8, &stru_10025FC48);
  }
  return (byte_100297500 | byte_1002974F0) != 0;
}

+ (void)setUnitTesting:(BOOL)a3
{
  byte_100297500 = a3;
}

+ (id)containerIdentifier
{
  return BUBooksGroupContainerIdentifier;
}

+ (NSURL)containerURL
{
  if ([a1 isUnitTesting])
  {
    if (qword_100297508 != -1) {
      dispatch_once(&qword_100297508, &stru_10025FC68);
    }
    id v2 = (id)qword_100297510;
  }
  else
  {
    id v2 = +[NSURL bu_booksGroupContainerURL];
  }
  return (NSURL *)v2;
}

+ (NSURL)documentsURL
{
  id v2 = [(id)objc_opt_class() containerURL];
  v3 = [v2 URLByAppendingPathComponent:@"Documents"];

  return (NSURL *)v3;
}

@end