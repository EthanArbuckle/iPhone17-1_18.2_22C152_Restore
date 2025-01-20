@interface NSString(BRCBookmarkAdditions_Legacy)
+ (id)bookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZone:;
+ (id)itemResolutionStringWithRelativePath:()BRCBookmarkAdditions_Legacy;
+ (id)unsaltedBookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZoneMangledID:;
@end

@implementation NSString(BRCBookmarkAdditions_Legacy)

+ (id)itemResolutionStringWithRelativePath:()BRCBookmarkAdditions_Legacy
{
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "documentID"));
  v5 = [a1 itemResolutionStringWithDocumentID:v4];

  return v5;
}

+ (id)bookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZone:
{
  id v6 = a4;
  v7 = [a1 itemResolutionStringWithRelativePath:a3];
  v8 = [a1 bookmarkDataWithItemResolutionString:v7 serverZone:v6];

  return v8;
}

+ (id)unsaltedBookmarkDataWithRelativePath:()BRCBookmarkAdditions_Legacy serverZoneMangledID:
{
  id v6 = a4;
  v7 = [a1 itemResolutionStringWithRelativePath:a3];
  v8 = [NSString unsaltedBookmarkDataWithItemResolutionString:v7 serverZoneMangledID:v6];

  return v8;
}

@end