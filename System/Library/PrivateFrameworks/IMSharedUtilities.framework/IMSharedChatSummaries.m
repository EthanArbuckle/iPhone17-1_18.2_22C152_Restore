@interface IMSharedChatSummaries
+ (id)unreadSummaryWithUnreadCount:(int64_t)a3 withParticipants:(id)a4 withGroupChatName:(id)a5;
@end

@implementation IMSharedChatSummaries

+ (id)unreadSummaryWithUnreadCount:(int64_t)a3 withParticipants:(id)a4 withGroupChatName:(id)a5
{
  uint64_t v8 = [a4 count];
  if (a3 == 1) {
    uint64_t v9 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"1 unread" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
  }
  else {
    uint64_t v9 = [NSString localizedStringWithFormat:objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", @"%@ unread", &stru_1EF2CAD28, @"IMSharedUtilities", objc_msgSend(NSNumber, "numberWithLongLong:", a3)];
  }
  v10 = (void *)v9;
  if (!a5)
  {
    switch(v8)
    {
      case 0:
        v11 = NSString;
        uint64_t v12 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"Empty chat (%@)" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
        id v24 = v10;
        goto LABEL_6;
      case 1:
        v19 = NSString;
        uint64_t v20 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"%@ (%@)" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
        id v24 = (id)[a4 objectAtIndex:0];
        uint64_t v25 = (uint64_t)v10;
        goto LABEL_14;
      case 2:
        v19 = NSString;
        v21 = (void *)IMSharedUtilitiesFrameworkBundle();
        v22 = @"%@, %@ (%@)";
        goto LABEL_13;
      case 3:
        v19 = NSString;
        v21 = (void *)IMSharedUtilitiesFrameworkBundle();
        v22 = @"%@, %@ and 1 other person (%@)";
LABEL_13:
        uint64_t v20 = [v21 localizedStringForKey:v22 value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
        uint64_t v23 = [a4 objectAtIndex:0];
        uint64_t v25 = [a4 objectAtIndex:1];
        v26 = v10;
        id v24 = (id)v23;
LABEL_14:
        v13 = v19;
        uint64_t v12 = v20;
        return (id)objc_msgSend(v13, "stringWithFormat:", v12, v24, v25, v26, v27);
      default:
        v14 = NSString;
        uint64_t v15 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"%@, %@ and %@ other people (%@)", &stru_1EF2CAD28, @"IMSharedUtilities" value table];
        uint64_t v16 = [a4 objectAtIndex:0];
        uint64_t v17 = [a4 objectAtIndex:1];
        return (id)objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, objc_msgSend(MEMORY[0x1E4F28EE0], "localizedStringFromNumber:numberStyle:", objc_msgSend(NSNumber, "numberWithLong:", v8 - 2), 0), v10);
    }
  }
  v11 = NSString;
  uint64_t v12 = [(id)IMSharedUtilitiesFrameworkBundle() localizedStringForKey:@"%@ (%@)" value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
  id v24 = a5;
  uint64_t v25 = (uint64_t)v10;
LABEL_6:
  v13 = v11;
  return (id)objc_msgSend(v13, "stringWithFormat:", v12, v24, v25, v26, v27);
}

@end