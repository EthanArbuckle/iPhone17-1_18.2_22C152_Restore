@interface ABVCardCardDAVRecord
+ (BOOL)includeABClipRectInVCardPhotos;
+ (BOOL)includeAddressingGrammarInVCards;
+ (BOOL)includeImageURIInVCards;
+ (BOOL)includeNotesInVCards;
+ (BOOL)includeREVInVCards;
+ (BOOL)includeWallpaperURIInVCards;
- (BOOL)useThumbnailImageFormatIfAvailable;
@end

@implementation ABVCardCardDAVRecord

+ (BOOL)includeREVInVCards
{
  return 1;
}

+ (BOOL)includeNotesInVCards
{
  return 1;
}

- (BOOL)useThumbnailImageFormatIfAvailable
{
  return 0;
}

+ (BOOL)includeImageURIInVCards
{
  return 1;
}

+ (BOOL)includeABClipRectInVCardPhotos
{
  return 1;
}

+ (BOOL)includeAddressingGrammarInVCards
{
  return 1;
}

+ (BOOL)includeWallpaperURIInVCards
{
  return 1;
}

@end