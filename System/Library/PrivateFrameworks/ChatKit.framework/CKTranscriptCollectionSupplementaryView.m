@interface CKTranscriptCollectionSupplementaryView
+ (id)supplementaryViewKindForGUID:(id)a3;
+ (id)supplementaryViewKindPrefix;
@end

@implementation CKTranscriptCollectionSupplementaryView

+ (id)supplementaryViewKindPrefix
{
  return @"b:";
}

+ (id)supplementaryViewKindForGUID:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [a1 supplementaryViewKindPrefix];
  v7 = [v4 stringWithFormat:@"%@%@", v6, v5];

  return v7;
}

@end