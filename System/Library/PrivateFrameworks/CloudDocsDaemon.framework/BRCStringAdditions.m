@interface BRCStringAdditions
+ (id)_br_currentMobileDocumentsDirForLegacy;
@end

@implementation BRCStringAdditions

+ (id)_br_currentMobileDocumentsDirForLegacy
{
  if (BRCurrentPersonaIsDataSeparated())
  {
    v2 = objc_msgSend(NSString, "br_personaGroupDirForFPFS:", 0);
    v3 = [v2 stringByAppendingPathComponent:@"File Provider Storage/Library/Mobile Documents"];
  }
  else
  {
    v2 = objc_msgSend(NSString, "br_currentHomeDir");
    v4 = [v2 stringByAppendingPathComponent:@"Library"];
    v3 = [v4 stringByAppendingPathComponent:*MEMORY[0x1E4F59410]];
  }
  return v3;
}

@end