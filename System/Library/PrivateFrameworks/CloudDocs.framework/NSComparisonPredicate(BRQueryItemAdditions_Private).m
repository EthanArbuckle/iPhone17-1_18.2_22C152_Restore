@interface NSComparisonPredicate(BRQueryItemAdditions_Private)
- (BRInodeObjectID)br_fileObjectIDWithWatchedChildren;
- (id)br_urlWithWatchedChildren;
- (id)br_watchedFileObjectID;
- (id)br_watchedURL;
@end

@implementation NSComparisonPredicate(BRQueryItemAdditions_Private)

- (id)br_watchedURL
{
  if ([a1 predicateOperatorType] != 4)
  {
    v5 = 0;
    v2 = 0;
    v3 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  if ([v2 expressionType] != 3) {
    goto LABEL_8;
  }
  v4 = [v2 keyPath];
  if ([v4 isEqualToString:@"kMDItemURL.path"])
  {

    goto LABEL_7;
  }
  v6 = [v2 keyPath];
  int v7 = [v6 isEqualToString:@"NSMetadataUbiquitousItemURLInLocalContainerKey.path"];

  if (!v7)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
LABEL_7:
  if ([v3 expressionType]) {
    goto LABEL_8;
  }
  v8 = [v3 constantValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  }
  else
  {
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)br_urlWithWatchedChildren
{
  if ([a1 predicateOperatorType] != 4)
  {
    v5 = 0;
    v2 = 0;
    v3 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  if ([v2 expressionType] != 3) {
    goto LABEL_8;
  }
  v4 = [v2 keyPath];
  if ([v4 isEqualToString:@"kMDItemURL.URLByDeletingLastPathComponent.path"])
  {

    goto LABEL_7;
  }
  v6 = [v2 keyPath];
  int v7 = [v6 isEqualToString:@"NSMetadataUbiquitousItemURLInLocalContainerKey.URLByDeletingLastPathComponent.path"];

  if (!v7)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
LABEL_7:
  if ([v3 expressionType]) {
    goto LABEL_8;
  }
  v8 = [v3 constantValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  }
  else
  {
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (BRInodeObjectID)br_fileObjectIDWithWatchedChildren
{
  if ([a1 predicateOperatorType] != 4)
  {
    v2 = 0;
    v3 = 0;
LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  if ([v2 expressionType] != 3) {
    goto LABEL_7;
  }
  v4 = [v2 keyPath];
  int v5 = [v4 isEqualToString:@"BRMetadataItemParentFileIDKey"];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = [v3 constantValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v6;
    int v7 = [BRInodeObjectID alloc];
    uint64_t v8 = [v6 unsignedLongLongValue];

    v9 = [(BRInodeObjectID *)v7 initWithFileID:v8];
    goto LABEL_9;
  }
LABEL_8:
  v9 = 0;
LABEL_9:

  return v9;
}

- (id)br_watchedFileObjectID
{
  if ([a1 predicateOperatorType] != 4)
  {
    id v7 = 0;
    v2 = 0;
    v3 = 0;
LABEL_8:
    id v6 = 0;
    goto LABEL_9;
  }
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  if ([v2 expressionType] != 3
    || ([v2 keyPath],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"BRMetadataItemFileObjectIdentifierKey"],
        v4,
        !v5))
  {
    id v7 = 0;
    goto LABEL_8;
  }
  id v6 = [v3 constantValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v6 = v7;
  }
  else
  {
    id v7 = 0;
  }
LABEL_9:

  return v7;
}

@end