@interface CKShare(BRSharingAdditions)
- (BOOL)br_isCloudDocsShare;
@end

@implementation CKShare(BRSharingAdditions)

- (BOOL)br_isCloudDocsShare
{
  v1 = [a1 valueForKey:@"BRAssociatedURLWrapperDataKey"];
  BOOL v2 = v1 != 0;

  return v2;
}

@end