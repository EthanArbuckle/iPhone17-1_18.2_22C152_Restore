@interface IMDCoreSpotlightMessageTapbackIndexer
+ (int)_searchableAttributeFromAssociatedMessageType:(int64_t)a3;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageTapbackIndexer

+ (int)_searchableAttributeFromAssociatedMessageType:(int64_t)a3
{
  int result = 1;
  if (a3 > 2999)
  {
    if ((unint64_t)(a3 - 3000) < 8) {
      return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 2001:
        int result = 2;
        break;
      case 2002:
        int result = 3;
        break;
      case 2003:
        int result = 5;
        break;
      case 2004:
        int result = 4;
        break;
      case 2005:
        int result = 6;
        break;
      case 2006:
        int result = 7;
        break;
      case 2007:
        int result = 9;
        break;
      default:
        if ((unint64_t)a3 <= 3 && a3 != 1 || (unint64_t)(a3 - 1000) < 2) {
          return 0;
        }
        break;
    }
  }
  return result;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v20 = a3;
  id v9 = a6;
  v10 = [v20 objectForKey:@"associatedMessageType"];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 integerValue];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [a1 _searchableAttributeFromAssociatedMessageType:v12];
      v15 = [v20 objectForKey:@"associatedMessageGUID"];
      v16 = [v20 objectForKey:@"attributedBody"];
      v17 = [v16 string];

      v18 = _IMDCoreSpotlightStrippedBody(v20, @"plainBody", v17);
      [v9 setTextContent:v18];
      [v9 setMessageTapbackType:v14];
      [v9 setTapbackAssociatedMessageID:v15];
      [v9 setMessageType:@"tpbck"];
      [v9 setDisableSearchInSpotlight:MEMORY[0x1E4F1CC38]];
      if (v13 == 2006)
      {
        v19 = [v20 objectForKey:@"associatedMessageEmoji"];
        [v9 setMessageTapbackStringValue:v19];
      }
    }
  }
}

@end