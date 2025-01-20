@interface NSArray(FPFetchThumbnailsOperation)
- (id)fp_shortDescriptionExpandingAtMost:()FPFetchThumbnailsOperation;
@end

@implementation NSArray(FPFetchThumbnailsOperation)

- (id)fp_shortDescriptionExpandingAtMost:()FPFetchThumbnailsOperation
{
  if ([a1 count] <= a3)
  {
    v9 = NSString;
    v5 = [a1 componentsJoinedByString:@", "];
    v8 = [v9 stringWithFormat:@"[%@]", v5];
  }
  else
  {
    v5 = objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v6 = NSString;
    v7 = [v5 componentsJoinedByString:@","];
    v8 = [v6 stringWithFormat:@"[%@, (+%lu more)]", v7, objc_msgSend(a1, "count") - a3];
  }

  return v8;
}

@end