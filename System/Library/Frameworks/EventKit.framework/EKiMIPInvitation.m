@interface EKiMIPInvitation
+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4;
- (EKiMIPInvitation)initWithEvent:(id)a3 withDiff:(id)a4;
- (id)attendees;
- (id)emailBody;
- (id)emailSubject;
@end

@implementation EKiMIPInvitation

- (EKiMIPInvitation)initWithEvent:(id)a3 withDiff:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKiMIPInvitation;
  v7 = [(EKiMIPHandler *)&v12 initWithEvent:a3];
  if (v7)
  {
    v8 = [v6 relationshipMultiValueAdds];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F56BA8]];
    attendees = v7->_attendees;
    v7->_attendees = (NSSet *)v9;
  }
  return v7;
}

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  id v5 = a4;
  if ([a3 isSelfOrganized])
  {
    id v6 = [v5 relationshipMultiValueAdds];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F56BA8]];

    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)attendees
{
  return [(NSSet *)self->_attendees allObjects];
}

- (id)emailSubject
{
  v3 = NSString;
  v4 = EKBundle();
  id v5 = [v4 localizedStringForKey:@"Event invitation: %@" value:&stru_1EF932508 table:@"iTIP"];
  id v6 = [(EKiMIPHandler *)self event];
  v7 = [v6 title];
  BOOL v8 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);

  return v8;
}

- (id)emailBody
{
  v3 = [(EKiMIPHandler *)self event];
  v4 = [v3 startDate];
  uint64_t v42 = [v4 localizedLongDate];

  id v5 = [(EKiMIPHandler *)self event];
  if ([v5 isAllDay])
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = [(EKiMIPHandler *)self event];
    BOOL v8 = [v7 startDate];
    uint64_t v6 = [v8 localizedShortTime];
  }
  v41 = (void *)v6;

  uint64_t v9 = (void *)MEMORY[0x1E4F576C8];
  v10 = [(EKiMIPHandler *)self event];
  v11 = [v10 startDate];
  int v12 = [v9 requiresSingularLocalizationForDate:v11];

  v13 = [MEMORY[0x1E4F576B0] defaultProvider];
  v14 = (void *)MEMORY[0x1E4F1CB10];
  v15 = [v13 myEmailAddress];
  uint64_t v16 = [v14 URLForMail:v15];

  v40 = (void *)v16;
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB7FB0]) initWithURL:v16];
  v18 = [v13 myShortDisplayName];
  [v17 setCn:v18];

  v19 = [(EKiMIPHandler *)self event];
  int v20 = [v19 isAllDay];

  if (v20)
  {
    v21 = NSString;
    v22 = EKBundle();
    v23 = [v22 localizedStringForKey:@"%@ has invited you to the event: %@, scheduled for %@. To accept or decline this invitation, click the link below.\n", &stru_1EF932508, @"iTIP" value table];
    v24 = [v17 displayName];
    v25 = [(EKiMIPHandler *)self event];
    v26 = [v25 title];
    v27 = (void *)v42;
    v28 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v24, v26, v42);
    v29 = v41;
  }
  else
  {
    v30 = [(EKiMIPHandler *)self event];
    int v31 = [v30 isFloating];

    v39 = NSString;
    v32 = EKBundle();
    v22 = v32;
    v27 = (void *)v42;
    if (v31)
    {
      if (v12) {
        v33 = @"itip invitation singular";
      }
      else {
        v33 = @"itip invitation plural";
      }
      v23 = [v32 localizedStringForKey:v33, @"%@ has invited you to the event: %@, scheduled for %@ at %@. To accept or decline this invitation, click the link below.\n", @"iTIP" value table];
      v24 = [v17 displayName];
      v25 = [(EKiMIPHandler *)self event];
      v26 = [v25 title];
      v29 = v41;
      v28 = objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41);
    }
    else
    {
      v38 = v32;
      if (v12)
      {
        v23 = [v32 localizedStringForKey:@"itip invitation with timezone singular", @"%@ has invited you to the event: %@, scheduled for %@ at %@ (%@). To accept or decline this invitation, click the link below.\n", @"iTIP" value table];
        v24 = [v17 displayName];
        v25 = [(EKiMIPHandler *)self event];
        v26 = [v25 title];
        v37 = [(EKiMIPHandler *)self event];
        v34 = [v37 timeZone];
        v29 = v41;
        v27 = (void *)v42;
        v28 = objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41, v34);
      }
      else
      {
        v23 = [v32 localizedStringForKey:@"itip invitation with timezone plural", @"%@ has invited you to the event: %@, scheduled for %@ at %@ (%@). To accept or decline this invitation, click the link below.\n", @"iTIP" value table];
        v24 = [v17 displayName];
        v25 = [(EKiMIPHandler *)self event];
        v26 = [v25 title];
        v37 = [(EKiMIPHandler *)self event];
        v35 = [v37 timeZone];
        v27 = (void *)v42;
        v28 = objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41, v35);

        v29 = v41;
      }
      v22 = v38;
    }
  }

  return v28;
}

- (void).cxx_destruct
{
}

@end