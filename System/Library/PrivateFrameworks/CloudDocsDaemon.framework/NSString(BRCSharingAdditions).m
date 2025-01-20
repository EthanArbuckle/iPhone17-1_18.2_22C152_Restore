@interface NSString(BRCSharingAdditions)
- (id)brc_fixDocumentExtensionIfNeededForShareURL:()BRCSharingAdditions;
@end

@implementation NSString(BRCSharingAdditions)

- (id)brc_fixDocumentExtensionIfNeededForShareURL:()BRCSharingAdditions
{
  v4 = objc_msgSend(a3, "brc_iWorkPathExtensions");
  if ([v4 count]
    && (objc_msgSend(a1, "br_pathExtension"),
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 containsObject:v5],
        v5,
        (v6 & 1) == 0))
  {
    v8 = [v4 firstObject];
    id v7 = [a1 stringByAppendingPathExtension:v8];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

@end