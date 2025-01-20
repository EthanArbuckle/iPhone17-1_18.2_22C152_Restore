@interface AXUIViewServiceUtilities
+ (BOOL)axTCCAllowsPhotoLibraryAccess;
@end

@implementation AXUIViewServiceUtilities

+ (BOOL)axTCCAllowsPhotoLibraryAccess
{
  if (qword_10002E790 != -1) {
    dispatch_once(&qword_10002E790, &stru_100024BE8);
  }
  return byte_10002E788;
}

@end