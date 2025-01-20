@interface NSURL(BLTReferenceCountedFile)
+ (__CFString)blt_metadataExtension;
- (id)blt_metadataURL;
@end

@implementation NSURL(BLTReferenceCountedFile)

- (id)blt_metadataURL
{
  v2 = [a1 pathExtension];
  v3 = objc_msgSend((id)objc_opt_class(), "blt_metadataExtension");
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = a1;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "blt_metadataExtension");
    id v5 = [a1 URLByAppendingPathExtension:v6];
  }
  return v5;
}

+ (__CFString)blt_metadataExtension
{
  return @"metadata";
}

@end