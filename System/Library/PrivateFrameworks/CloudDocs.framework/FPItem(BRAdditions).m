@interface FPItem(BRAdditions)
- (BOOL)br_isDocumentsFolder;
@end

@implementation FPItem(BRAdditions)

- (BOOL)br_isDocumentsFolder
{
  v1 = [a1 providerItemIdentifier];
  v2 = +[BRFileObjectID fileObjectIDWithString:v1];

  if (v2) {
    BOOL v3 = [v2 type] == 4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end