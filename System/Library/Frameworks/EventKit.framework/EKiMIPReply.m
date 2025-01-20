@interface EKiMIPReply
+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4;
- (id)attendees;
- (id)emailAttachmentName;
- (id)emailBody;
- (id)emailSubject;
- (int)icsMethod;
@end

@implementation EKiMIPReply

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  id v5 = a4;
  if ([a3 isSelfOrganized])
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v5 summaryDictionary];
    v8 = [v7 objectForKey:@"selfAttendee.statusRaw"];

    BOOL v6 = v8 != 0;
  }

  return v6;
}

- (id)attendees
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(EKiMIPHandler *)self event];
  v3 = [v2 organizer];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)emailSubject
{
  v3 = [(EKiMIPHandler *)self event];
  uint64_t v4 = [v3 participationStatus];

  switch(v4)
  {
    case 4:
      id v5 = EKBundle();
      BOOL v6 = v5;
      v7 = @"Event tentatively accepted: %@";
      break;
    case 3:
      id v5 = EKBundle();
      BOOL v6 = v5;
      v7 = @"Event declined: %@";
      break;
    case 2:
      id v5 = EKBundle();
      BOOL v6 = v5;
      v7 = @"Event accepted: %@";
      break;
    default:
      goto LABEL_9;
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1EF932508 table:@"iTIP"];

  if (v8)
  {
    v9 = NSString;
    v10 = [(EKiMIPHandler *)self event];
    v11 = [v10 title];
    v12 = [v9 localizedStringWithValidatedFormat:v8, @"%@", 0, v11 validFormatSpecifiers error];

    goto LABEL_10;
  }
LABEL_9:
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)emailBody
{
  v3 = (void *)MEMORY[0x1E4F576C8];
  uint64_t v4 = [(EKiMIPHandler *)self event];
  id v5 = [v4 startDate];
  int v6 = [v3 requiresSingularLocalizationForDate:v5];

  v7 = [(EKiMIPHandler *)self event];
  uint64_t v8 = [v7 participationStatus];

  switch(v8)
  {
    case 4:
      v14 = [(EKiMIPHandler *)self event];
      int v15 = [v14 isAllDay];

      if (v15)
      {
        v11 = EKBundle();
        v12 = v11;
        v13 = @"%@ has tentatively accepted your invitation to the event: %@, scheduled for %@.\n";
        goto LABEL_10;
      }
      v21 = [(EKiMIPHandler *)self event];
      int v22 = [v21 isFloating];

      v12 = EKBundle();
      if (v22)
      {
        if (v6) {
          v13 = @"iTIP tentative acceptance floating event singular hour";
        }
        else {
          v13 = @"iTIP tentative acceptance floating event plural hour";
        }
        v18 = @"%@ has tentatively accepted your invitation to the event: %@, scheduled for %@ at %@.\n";
      }
      else
      {
        if (v6) {
          v13 = @"iTIP tentative acceptance timed event singular hour";
        }
        else {
          v13 = @"iTIP tentative acceptance timed event plural hour";
        }
        v18 = @"%@ has tentatively accepted your invitation to the event: %@, scheduled for %@ at %@ (%@).\n";
      }
      break;
    case 3:
      v16 = [(EKiMIPHandler *)self event];
      int v17 = [v16 isAllDay];

      if (v17)
      {
        v11 = EKBundle();
        v12 = v11;
        v13 = @"%@ has declined your invitation to the event: %@, scheduled for %@.\n";
        goto LABEL_10;
      }
      v23 = [(EKiMIPHandler *)self event];
      int v24 = [v23 isFloating];

      v12 = EKBundle();
      if (v24)
      {
        if (v6) {
          v13 = @"iTIP decline floating event singular hour";
        }
        else {
          v13 = @"iTIP decline floating event plural hour";
        }
        v18 = @"%@ has declined your invitation to the event: %@, scheduled for %@ at %@.\n";
      }
      else
      {
        if (v6) {
          v13 = @"iTIP decline timed event singular hour";
        }
        else {
          v13 = @"iTIP decline timed event plural hour";
        }
        v18 = @"%@ has declined your invitation to the event: %@, scheduled for %@ at %@ (%@).\n";
      }
      break;
    case 2:
      v9 = [(EKiMIPHandler *)self event];
      int v10 = [v9 isAllDay];

      if (v10)
      {
        v11 = EKBundle();
        v12 = v11;
        v13 = @"%@ has accepted your invitation to the event: %@, scheduled for %@.\n";
LABEL_10:
        v18 = &stru_1EF932508;
        goto LABEL_39;
      }
      v19 = [(EKiMIPHandler *)self event];
      int v20 = [v19 isFloating];

      v12 = EKBundle();
      if (v20)
      {
        if (v6) {
          v13 = @"iTIP accept floating event singular hour";
        }
        else {
          v13 = @"iTIP accept floating event plural hour";
        }
        v18 = @"%@ has accepted your invitation to the event: %@, scheduled for %@ at %@.\n";
      }
      else
      {
        if (v6) {
          v13 = @"iTIP accept timed event singular hour";
        }
        else {
          v13 = @"iTIP accept timed event plural hour";
        }
        v18 = @"%@ has accepted your invitation to the event: %@, scheduled for %@ at %@ (%@).\n";
      }
      break;
    default:
LABEL_42:
      v38 = 0;
      goto LABEL_48;
  }
  v11 = v12;
LABEL_39:
  v25 = [v11 localizedStringForKey:v13 value:v18 table:@"iTIP"];

  if (!v25) {
    goto LABEL_42;
  }
  v26 = [MEMORY[0x1E4F576B0] defaultProvider];
  v27 = [v26 myFullName];

  v28 = [(EKiMIPHandler *)self event];
  v29 = [v28 startDate];
  v30 = [v29 localizedLongDate];

  v31 = [(EKiMIPHandler *)self event];
  v32 = [v31 startDate];
  v33 = [v32 localizedShortTime];

  v34 = [(EKiMIPHandler *)self event];
  LODWORD(v32) = [v34 isAllDay];

  if (v32)
  {
    v35 = NSString;
    v36 = [(EKiMIPHandler *)self event];
    v37 = [v36 title];
    [v35 localizedStringWithValidatedFormat:v25, @"%@%@%@", 0, v27, v37, v30, v46 validFormatSpecifiers error];
  }
  else
  {
    v39 = [(EKiMIPHandler *)self event];
    int v40 = [v39 isFloating];

    v41 = NSString;
    v36 = [(EKiMIPHandler *)self event];
    uint64_t v42 = [v36 title];
    v37 = (void *)v42;
    if (!v40)
    {
      v43 = [(EKiMIPHandler *)self event];
      v44 = [v43 timeZone];
      v38 = [v41 localizedStringWithValidatedFormat:v25, @"%@%@%@%@%@", 0, v27, v37, v30, v33, v44 validFormatSpecifiers error];

      v25 = v43;
      goto LABEL_47;
    }
    [v41 localizedStringWithValidatedFormat:v25, @"%@%@%@%@", 0, v27, v42, v30, v33 validFormatSpecifiers error];
  v38 = };
LABEL_47:

LABEL_48:

  return v38;
}

- (id)emailAttachmentName
{
  return @"iCal-Reply.ics";
}

- (int)icsMethod
{
  return 3;
}

@end