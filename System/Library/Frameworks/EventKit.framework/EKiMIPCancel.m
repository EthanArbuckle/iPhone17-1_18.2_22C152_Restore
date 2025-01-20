@interface EKiMIPCancel
+ (BOOL)shouldSendEmailForEvent:(id)a3 removedAttendees:(id *)a4;
- (EKiMIPCancel)initWithEvent:(id)a3 andAttendees:(id)a4;
- (id)attachmentData;
- (id)attendees;
- (id)emailAttachmentName;
- (id)emailBody;
- (id)emailSubject;
- (int)icsMethod;
@end

@implementation EKiMIPCancel

+ (BOOL)shouldSendEmailForEvent:(id)a3 removedAttendees:(id *)a4
{
  id v5 = a3;
  if ([v5 isSelfOrganized])
  {
    if ([v5 isDeleted])
    {
      char v6 = 1;
    }
    else if (a4)
    {
      v7 = [v5 diffFromCommitted];
      v8 = [v7 relationshipMultiValueRemoves];
      v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F56BA8]];

      uint64_t v10 = [v9 count];
      char v6 = v10 != 0;
      if (v10) {
        *a4 = v9;
      }
    }
    else
    {
      char v6 = [v5 hasAttendees];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (EKiMIPCancel)initWithEvent:(id)a3 andAttendees:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKiMIPCancel;
  v8 = [(EKiMIPHandler *)&v14 initWithEvent:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attendees, a4);
    uint64_t v10 = [(EKiMIPHandler *)v9 iCalendarDocumentWithMethod:[(EKiMIPCancel *)v9 icsMethod]];
    uint64_t v11 = [v10 ICSDataWithOptions:0];
    attachmentData = v9->_attachmentData;
    v9->_attachmentData = (NSData *)v11;
  }
  return v9;
}

- (id)attachmentData
{
  return self->_attachmentData;
}

- (id)attendees
{
  return self->_attendees;
}

- (id)emailSubject
{
  v3 = NSString;
  v4 = EKBundle();
  id v5 = [v4 localizedStringForKey:@"Event canceled: %@" value:&stru_1EF932508 table:@"iTIP"];
  char v6 = [(EKiMIPHandler *)self event];
  id v7 = [v6 title];
  v8 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);

  return v8;
}

- (id)emailBody
{
  v3 = NSString;
  v4 = EKBundle();
  id v5 = [v4 localizedStringForKey:@"%@ has canceled the event: %@. To handle this cancellation, click the link below.\n", &stru_1EF932508, @"iTIP" value table];
  char v6 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v7 = [v6 myShortDisplayName];
  v8 = [(EKiMIPHandler *)self event];
  v9 = [v8 title];
  uint64_t v10 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7, v9);

  return v10;
}

- (id)emailAttachmentName
{
  return @"iCal-Cancel.ics";
}

- (int)icsMethod
{
  return 5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentData, 0);

  objc_storeStrong((id *)&self->_attendees, 0);
}

@end