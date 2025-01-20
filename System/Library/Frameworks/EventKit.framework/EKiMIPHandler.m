@interface EKiMIPHandler
+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4;
+ (id)emailsFromAttendees:(id)a3;
- (BOOL)sendEmail;
- (EKEvent)event;
- (EKiMIPHandler)initWithEvent:(id)a3;
- (id)attachmentData;
- (id)attendees;
- (id)emailAttachmentName;
- (id)emailBody;
- (id)emailSubject;
- (id)iCalendarDocumentWithMethod:(int)a3;
- (int)icsMethod;
- (void)sendEmail;
- (void)setEvent:(id)a3;
@end

@implementation EKiMIPHandler

- (EKiMIPHandler)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKiMIPHandler;
  v6 = [(EKiMIPHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (id)attachmentData
{
  v2 = [(EKiMIPHandler *)self iCalendarDocumentWithMethod:[(EKiMIPHandler *)self icsMethod]];
  v3 = [v2 ICSDataWithOptions:0];

  return v3;
}

- (BOOL)sendEmail
{
  v3 = [(EKiMIPHandler *)self attendees];
  v4 = +[EKiMIPHandler emailsFromAttendees:v3];

  if ([v4 count])
  {
    id v5 = [(EKiMIPHandler *)self emailSubject];
    if (!v5)
    {
      v6 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        [(EKiMIPHandler *)(uint64_t)self sendEmail];
      }
    }
  }
  else
  {
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      [(EKiMIPHandler *)(uint64_t)self sendEmail];
    }
  }

  return 0;
}

+ (id)emailsFromAttendees:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "emailAddress", (void)v14);

        if (v11)
        {
          uint64_t v12 = [v10 emailAddress];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)iCalendarDocumentWithMethod:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v4 = [(EKiMIPHandler *)self event];
  id v5 = [v4 exportToICS];

  uint64_t v6 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v92 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v5 options:0 error:&v92];
  id v8 = v92;
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v69 = v8;
    v70 = v5;
    uint64_t v19 = [v7 calendar];
    [v19 setMethod:v3];

    v20 = [v7 calendar];
    objc_msgSend(v20, "setX_calendarserver_access:", 0);

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v68 = v7;
    v21 = [v7 calendar];
    v22 = [v21 components];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v88 objects:v95 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v89;
      v73 = v6;
      int v72 = v3;
      v78 = v22;
      uint64_t v71 = *(void *)v89;
      do
      {
        uint64_t v26 = 0;
        uint64_t v79 = v24;
        do
        {
          if (*(void *)v89 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v88 + 1) + 8 * v26);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = v27;
            v29 = v28;
            switch(v3)
            {
              case 2:
                v59 = [v28 organizer];

                if (!v59)
                {
                  v60 = v29;
                  v61 = (void *)MEMORY[0x1E4F1CB10];
                  v62 = [v6 myEmailAddress];
                  v63 = [v61 URLForMail:v62];

                  if (v63)
                  {
                    v64 = (void *)[objc_alloc(MEMORY[0x1E4FB7FB0]) initWithURL:v63];
                    [v60 setOrganizer:v64];

                    v65 = [v6 myShortDisplayName];
                    v66 = [v60 organizer];
                    [v66 setCn:v65];

                    uint64_t v24 = v79;
                  }

                  v29 = v60;
                }
                break;
              case 5:
                v44 = [v28 organizer];

                if (!v44)
                {
                  v45 = v29;
                  v46 = (void *)MEMORY[0x1E4F1CB10];
                  v47 = [v6 myEmailAddress];
                  v48 = [v46 URLForMail:v47];

                  if (v48)
                  {
                    v49 = (void *)[objc_alloc(MEMORY[0x1E4FB7FB0]) initWithURL:v48];
                    [v45 setOrganizer:v49];

                    v50 = [v6 myShortDisplayName];
                    v51 = [v45 organizer];
                    [v51 setCn:v50];
                  }
                  v29 = v45;
                }
                v52 = v6;
                long long v82 = 0u;
                long long v83 = 0u;
                long long v80 = 0u;
                long long v81 = 0u;
                v53 = v29;
                v54 = [v29 attendee];
                uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v93 count:16];
                if (v55)
                {
                  uint64_t v56 = v55;
                  uint64_t v57 = *(void *)v81;
                  do
                  {
                    for (uint64_t i = 0; i != v56; ++i)
                    {
                      if (*(void *)v81 != v57) {
                        objc_enumerationMutation(v54);
                      }
                      [*(id *)(*((void *)&v80 + 1) + 8 * i) setRsvp:0];
                    }
                    uint64_t v56 = [v54 countByEnumeratingWithState:&v80 objects:v93 count:16];
                  }
                  while (v56);
                }

                v29 = v53;
                objc_msgSend(v53, "setSequence:", objc_msgSend(v53, "sequence") + 1);
                [v53 setStatus:8];
                objc_msgSend(v53, "setX_wr_rsvpneeded:", 0);
                uint64_t v6 = v52;
                v22 = v78;
                uint64_t v24 = v79;
                break;
              case 3:
                v30 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
                uint64_t v31 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
                [MEMORY[0x1E4F1C9C8] date];
                v33 = v32 = v29;
                v76 = v30;
                v34 = [v30 components:252 fromDate:v33];

                v75 = (void *)v31;
                v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v34, "year"), objc_msgSend(v34, "month"), objc_msgSend(v34, "day"), objc_msgSend(v34, "hour"), objc_msgSend(v34, "minute"), objc_msgSend(v34, "second"), v31);
                [v32 setDtstamp:v35];
                long long v86 = 0u;
                long long v87 = 0u;
                long long v84 = 0u;
                long long v85 = 0u;
                v77 = v32;
                v36 = [v32 attendee];
                v37 = (void *)[v36 countByEnumeratingWithState:&v84 objects:v94 count:16];
                if (v37)
                {
                  v74 = v35;
                  uint64_t v38 = *(void *)v85;
                  while (2)
                  {
                    for (j = 0; j != v37; j = (char *)j + 1)
                    {
                      if (*(void *)v85 != v38) {
                        objc_enumerationMutation(v36);
                      }
                      v40 = *(void **)(*((void *)&v84 + 1) + 8 * (void)j);
                      v41 = [MEMORY[0x1E4F576B0] defaultProvider];
                      v42 = [v40 value];
                      int v43 = [v41 urlMatchesOneOfMyEmails:v42];

                      if (v43)
                      {
                        v37 = [MEMORY[0x1E4F1C978] arrayWithObject:v40];
                        goto LABEL_43;
                      }
                    }
                    v37 = (void *)[v36 countByEnumeratingWithState:&v84 objects:v94 count:16];
                    if (v37) {
                      continue;
                    }
                    break;
                  }
LABEL_43:
                  uint64_t v6 = v73;
                  v35 = v74;
                }
                else
                {
                  uint64_t v6 = v73;
                }

                [v77 setAttendee:v37];
                v29 = v77;

                LODWORD(v3) = v72;
                v22 = v78;
                uint64_t v24 = v79;
                uint64_t v25 = v71;
                break;
            }
          }
          ++v26;
        }
        while (v26 != v24);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v88 objects:v95 count:16];
      }
      while (v24);
    }

    uint64_t v7 = v68;
    id v18 = v68;
    uint64_t v9 = v69;
    id v5 = v70;
  }
  else
  {
    uint64_t v11 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKiMIPHandler iCalendarDocumentWithMethod:]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
    id v18 = 0;
  }

  return v18;
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  return 0;
}

- (id)attendees
{
  return 0;
}

- (id)emailSubject
{
  return 0;
}

- (id)emailBody
{
  return 0;
}

- (id)emailAttachmentName
{
  return 0;
}

- (int)icsMethod
{
  return 0;
}

- (void)sendEmail
{
}

- (void)iCalendarDocumentWithMethod:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end