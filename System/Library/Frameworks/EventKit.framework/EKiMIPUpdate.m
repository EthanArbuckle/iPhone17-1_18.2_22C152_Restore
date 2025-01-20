@interface EKiMIPUpdate
+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4;
- (id)attendees;
- (id)emailAttachmentName;
- (id)emailBody;
- (id)emailSubject;
- (int)icsMethod;
@end

@implementation EKiMIPUpdate

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  v29[10] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([a3 isSelfOrganized])
  {
    v6 = [v5 differentKeys];
    uint64_t v7 = *MEMORY[0x1E4F56C38];
    v29[0] = *MEMORY[0x1E4F56D40];
    v29[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F56D08];
    v29[2] = *MEMORY[0x1E4F56D00];
    v29[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F56D10];
    v29[4] = *MEMORY[0x1E4F56FB0];
    v29[5] = v9;
    uint64_t v10 = *MEMORY[0x1E4F56BE0];
    v29[6] = *MEMORY[0x1E4F56BA0];
    v29[7] = v10;
    uint64_t v11 = *MEMORY[0x1E4F56BD8];
    v29[8] = *MEMORY[0x1E4F56C80];
    v29[9] = v11;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:10];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(v6, "containsObject:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24))
          {
            BOOL v20 = 1;
            v17 = v12;
            goto LABEL_16;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v17 = [v5 relationshipMultiValueAdds];
    uint64_t v18 = *MEMORY[0x1E4F56BA8];
    v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F56BA8]];
    if (v19)
    {
      BOOL v20 = 1;
    }
    else
    {
      v21 = [v5 relationshipMultiValueRemoves];
      v22 = [v21 objectForKeyedSubscript:v18];
      BOOL v20 = v22 != 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)attendees
{
  v2 = [(EKiMIPHandler *)self event];
  v3 = [v2 attendees];

  return v3;
}

- (id)emailSubject
{
  v3 = NSString;
  v4 = EKBundle();
  id v5 = [v4 localizedStringForKey:@"Event update: %@" value:&stru_1EF932508 table:@"iTIP"];
  v6 = [(EKiMIPHandler *)self event];
  uint64_t v7 = [v6 title];
  uint64_t v8 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);

  return v8;
}

- (id)emailBody
{
  v3 = [(EKiMIPHandler *)self event];
  v4 = [v3 startDate];
  uint64_t v43 = [v4 localizedLongDate];

  id v5 = [(EKiMIPHandler *)self event];
  if ([v5 isAllDay])
  {
    uint64_t v44 = 0;
  }
  else
  {
    v6 = [(EKiMIPHandler *)self event];
    uint64_t v7 = [v6 startDate];
    uint64_t v44 = [v7 localizedShortTime];
  }
  uint64_t v8 = [MEMORY[0x1E4F576B0] defaultProvider];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v10 = [v8 myEmailAddress];
  uint64_t v11 = [v9 URLForMail:v10];

  v42 = (void *)v11;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB7FB0]) initWithURL:v11];
  uint64_t v13 = [v8 myShortDisplayName];
  [v12 setCn:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F576C8];
  uint64_t v15 = [(EKiMIPHandler *)self event];
  v16 = [v15 startDate];
  int v17 = [v14 requiresSingularLocalizationForDate:v16];

  uint64_t v18 = [(EKiMIPHandler *)self event];
  LODWORD(v16) = [v18 isAllDay];

  if (v16)
  {
    v19 = NSString;
    BOOL v20 = EKBundle();
    v21 = [v20 localizedStringForKey:@"%@ has updated the event: %@, scheduled for %@. To acknowledge this invitation, click the link below.\n", &stru_1EF932508, @"iTIP" value table];
    v22 = [v12 displayName];
    v23 = [(EKiMIPHandler *)self event];
    long long v24 = [v23 title];
    long long v25 = v19;
    long long v26 = (void *)v43;
    long long v27 = objc_msgSend(v25, "localizedStringWithFormat:", v21, v22, v24, v43);
  }
  else
  {
    v28 = [(EKiMIPHandler *)self event];
    int v29 = [v28 isFloating];

    v30 = EKBundle();
    v31 = v30;
    v32 = (void *)v44;
    if (v29)
    {
      if (v17) {
        v33 = @"iTIP update floating event singular hour";
      }
      else {
        v33 = @"iTIP update floating event plural hour";
      }
      BOOL v20 = [v30 localizedStringForKey:v33, @"%@ has updated the event: %@, scheduled for %@ at %@. To acknowledge this invitation, click the link below.\n", @"iTIP" value table];

      v36 = NSString;
      v21 = [v12 displayName];
      v22 = [(EKiMIPHandler *)self event];
      v23 = [v22 title];
      long long v26 = (void *)v43;
      long long v27 = objc_msgSend(v36, "localizedStringWithFormat:", v20, v21, v23, v43, v44);
      goto LABEL_15;
    }
    if (v17)
    {
      BOOL v20 = [v30 localizedStringForKey:@"iTIP update timed event singular hour", @"%@ has updated the event: %@, scheduled for %@ at %@ (%@). To acknowledge this invitation, click the link below.\n", @"iTIP" value table];

      v40 = NSString;
      v21 = [v12 displayName];
      v22 = [(EKiMIPHandler *)self event];
      v23 = [v22 title];
      v34 = [(EKiMIPHandler *)self event];
      v35 = [v34 timeZone];
      long long v26 = (void *)v43;
      long long v27 = objc_msgSend(v40, "localizedStringWithFormat:", v20, v21, v23, v43, v44, v35);
    }
    else
    {
      BOOL v20 = [v30 localizedStringForKey:@"iTIP update timed event plural hour", @"%@ has updated the event: %@, scheduled for %@ at %@ (%@). To acknowledge this invitation, click the link below.\n", @"iTIP" value table];

      v41 = NSString;
      v21 = [v12 displayName];
      v22 = [(EKiMIPHandler *)self event];
      v23 = [v22 title];
      v37 = [(EKiMIPHandler *)self event];
      v38 = [v37 timeZone];
      long long v27 = objc_msgSend(v41, "localizedStringWithFormat:", v20, v21, v23, v43, v44, v38);

      long long v26 = (void *)v43;
    }
  }
  v32 = (void *)v44;
LABEL_15:

  return v27;
}

- (id)emailAttachmentName
{
  return @"iCal-Request.ics";
}

- (int)icsMethod
{
  return 2;
}

@end