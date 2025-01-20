@interface DEDAttachmentItem
- (BOOL)pointsToReachableDir;
@end

@implementation DEDAttachmentItem

- (BOOL)pointsToReachableDir
{
  v3 = [(DEDAttachmentItem *)self attachedPath];
  id v8 = 0;
  unsigned int v4 = [v3 getResourceValue:&v8 forKey:NSURLIsDirectoryKey error:0];
  id v5 = v8;

  if (v4 && [v5 BOOLValue]) {
    unsigned __int8 v6 = [(DEDAttachmentItem *)self isLocal];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end