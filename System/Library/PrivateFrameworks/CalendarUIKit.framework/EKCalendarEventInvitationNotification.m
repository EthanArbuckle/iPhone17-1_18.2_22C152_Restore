@interface EKCalendarEventInvitationNotification
@end

@implementation EKCalendarEventInvitationNotification

void __103__EKCalendarEventInvitationNotification_CUIKDescription___attendeeReplyStringWithOptions_descriptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v5 = a2;
  id v32 = a2;
  int v7 = [v32 proposedStartDateDeclined];
  if (v7) {
    LOBYTE(v7) = [v32 isCurrentUser];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  if ([v32 statusChanged]) {
    BOOL v8 = [v32 participantStatus] == 3;
  }
  else {
    BOOL v8 = 0;
  }
  if ([v32 proposedStartDateChanged])
  {
    v9 = [v32 proposedStartDate];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  v11 = [v32 comment];
  v12 = [v11 CalStringByRemovingAutoComment];

  if (![v32 commentChanged])
  {
    BOOL v13 = 0;
    if (!v8) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL v13 = [v12 length] != 0;
  if (v8)
  {
LABEL_15:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
LABEL_16:
  unint64_t v14 = 0x1E4F29000uLL;
  if (v13)
  {
    v24 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Comment"];

    v25 = NSString;
    v26 = CUIKBundle();
    v27 = v26;
    if (v24)
    {
      v28 = [v26 localizedStringForKey:@"%@\n“%@”" value:&stru_1F187C430 table:0];
      v29 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Comment"];
      v30 = objc_msgSend(v25, "localizedStringWithFormat:", v28, v29, v12);
      [*(id *)(a1 + 32) setObject:v30 forKeyedSubscript:@"Comment"];
    }
    else
    {
      v28 = [v26 localizedStringForKey:@"“%@”" value:&stru_1F187C430 table:0];
      v29 = objc_msgSend(v25, "localizedStringWithFormat:", v28, v12);
      [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:@"Comment"];
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unint64_t v14 = 0x1E4F29000;
    if (v10) {
      goto LABEL_18;
    }
LABEL_25:
    if (!v8 && !v13) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (!v10) {
    goto LABEL_25;
  }
LABEL_18:
  v15 = v5;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v16 = +[CUIKDateDescriptionGenerator sharedGenerator];
  v17 = [v32 proposedStartDate];
  v18 = [v16 dateStringForDate:v17 allDay:0 standalone:1 shortFormat:0];

  if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) appendString:@"\n"];
  }
  v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  v20 = *(void **)(v14 + 24);
  v21 = CUIKBundle();
  v22 = [v21 localizedStringForKey:@"Proposed Time: %@" value:&stru_1F187C430 table:0];
  v23 = objc_msgSend(v20, "localizedStringWithFormat:", v22, v18);
  [v19 appendString:v23];

  v5 = v15;
LABEL_26:
  uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
  if (*(void *)(v31 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
  }
  objc_storeStrong((id *)(v31 + 40), v5);
LABEL_29:
}

@end