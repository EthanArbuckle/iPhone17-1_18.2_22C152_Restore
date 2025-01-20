@interface TLAlert(BulletinBoard)
+ (uint64_t)bb_toneLibraryAlertTypeForSectionID:()BulletinBoard;
@end

@implementation TLAlert(BulletinBoard)

+ (uint64_t)bb_toneLibraryAlertTypeForSectionID:()BulletinBoard
{
  uint64_t v3 = bb_toneLibraryAlertTypeForSectionID__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&bb_toneLibraryAlertTypeForSectionID__onceToken, &__block_literal_global_16);
  }
  v5 = [(id)bb_toneLibraryAlertTypeForSectionID____sectionIDToAlertType objectForKey:v4];

  uint64_t v6 = [v5 integerValue];
  return v6;
}

@end