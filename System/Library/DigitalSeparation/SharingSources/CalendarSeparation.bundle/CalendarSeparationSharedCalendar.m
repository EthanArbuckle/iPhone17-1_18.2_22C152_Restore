@interface CalendarSeparationSharedCalendar
- (CalendarSeparationParticipant)owner;
- (CalendarSeparationSharedCalendar)initWithCalendar:(id)a3;
- (EKCalendar)calendar;
- (id)displayDetail;
- (id)displayName;
- (int64_t)visibility;
- (void)makePrivateWithCompletion:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setOwner:(id)a3;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation CalendarSeparationSharedCalendar

- (CalendarSeparationSharedCalendar)initWithCalendar:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CalendarSeparationSharedCalendar;
  v6 = [(CalendarSeparationSharedCalendar *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendar, a3);
    v8 = objc_opt_new();
    [(CalendarSeparationSharedResource *)v7 setCsParticipants:v8];

    v9 = [[CalendarSeparationParticipant alloc] initWithEKCalendar:v5];
    objc_storeStrong((id *)&v7->_owner, v9);
    v10 = [(CalendarSeparationSharedResource *)v7 csParticipants];
    [v10 addObject:v9];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v5, "sharees", 0);
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[CalendarSeparationParticipant alloc] initWithEKSharee:*(void *)(*((void *)&v19 + 1) + 8 * (void)v15)];
          v17 = [(CalendarSeparationSharedResource *)v7 csParticipants];
          [v17 addObject:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
  return v7;
}

- (id)displayName
{
  v2 = [(CalendarSeparationSharedCalendar *)self calendar];
  v3 = [v2 title];

  return v3;
}

- (id)displayDetail
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Shared Calendar" value:&stru_8400 table:0];

  return v3;
}

- (int64_t)visibility
{
  v2 = [(CalendarSeparationSharedCalendar *)self calendar];
  unsigned int v3 = [v2 isPublished];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = [(CalendarSeparationSharedCalendar *)self calendar];

  if (!v8)
  {
    NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
    CFStringRef v79 = @"Resource is missing Calendar";
    long long v22 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    id v23 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v22];

    v7[2](v7, v23);
    goto LABEL_54;
  }
  v9 = [(CalendarSeparationSharedCalendar *)self calendar];
  v10 = [v9 eventStore];

  v11 = [(CalendarSeparationSharedCalendar *)self calendar];
  id v12 = (char *)[v11 sharingStatus];

  if (v12 == (unsigned char *)&dword_0 + 2)
  {
    if (v6)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v13 = [(CalendarSeparationSharedCalendar *)self calendar];
      uint64_t v14 = [v13 shareesAndOwner];

      id v15 = [v14 countByEnumeratingWithState:&v74 objects:v90 count:16];
      if (v15)
      {
        id v16 = v15;
        v60 = v10;
        uint64_t v17 = *(void *)v75;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v75 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = [[CalendarSeparationParticipant alloc] initWithEKSharee:*(void *)(*((void *)&v74 + 1) + 8 * i)];
            unsigned __int8 v20 = [(CalendarSeparationParticipant *)v19 matchesDSParticipation:v6];

            if (v20)
            {

              v10 = v60;
              goto LABEL_16;
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v74 objects:v90 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        id v21 = 0;
        v10 = v60;
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
LABEL_16:
      v24 = [(CalendarSeparationSharedCalendar *)self calendar];
      id v73 = 0;
      unsigned __int8 v25 = [v10 removeCalendar:v24 commit:1 error:&v73];
      id v21 = v73;

      if ((v25 & 1) != 0 || v21) {
        goto LABEL_21;
      }
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      CFStringRef v89 = @"Failed to remove calendar";
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      id v21 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v14];
    }
  }
  else
  {
    id v21 = 0;
  }
LABEL_21:
  v26 = [(CalendarSeparationSharedCalendar *)self calendar];
  v27 = (char *)[v26 sharingStatus];

  if (v27 == (unsigned char *)&dword_0 + 1)
  {
    v58 = v21;
    v59 = v7;
    v61 = v10;
    v28 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v29 = [(CalendarSeparationSharedCalendar *)self calendar];
    v30 = [v29 sharees];

    id v31 = [v30 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v70;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v70 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
          v36 = [[CalendarSeparationParticipant alloc] initWithEKSharee:v35];
          v37 = v36;
          if (!v6 || [(CalendarSeparationParticipant *)v36 matchesDSParticipation:v6])
          {
            [v35 setShareeMuteRemoval:1];
            [v28 addObject:v35];
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v32);
    }

    v38 = [(CalendarSeparationSharedCalendar *)self calendar];
    id v68 = v58;
    unsigned __int8 v39 = [v10 saveCalendar:v38 commit:1 error:&v68];
    id v40 = v68;

    if (v39)
    {
      v7 = v59;
    }
    else
    {
      v7 = v59;
      if (!v40)
      {
        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        CFStringRef v86 = @"Failed to save sharee notification mute";
        v41 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        id v40 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v41];
      }
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v42 = v28;
    id v43 = [v42 countByEnumeratingWithState:&v64 objects:v84 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v65;
      do
      {
        for (k = 0; k != v44; k = (char *)k + 1)
        {
          if (*(void *)v65 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v64 + 1) + 8 * (void)k);
          v48 = [(CalendarSeparationSharedCalendar *)self calendar];
          [v48 removeSharee:v47];
        }
        id v44 = [v42 countByEnumeratingWithState:&v64 objects:v84 count:16];
      }
      while (v44);
    }

    v49 = [(CalendarSeparationSharedCalendar *)self calendar];
    id v63 = v40;
    v10 = v61;
    unsigned __int8 v50 = [v61 saveCalendar:v49 commit:1 error:&v63];
    id v21 = v63;

    if ((v50 & 1) == 0 && !v21)
    {
      NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
      CFStringRef v83 = @"Failed to remove sharees from calendar";
      v51 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      id v21 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v51];
    }
  }
  if (v6
    || ([(CalendarSeparationSharedCalendar *)self calendar],
        v52 = objc_claimAutoreleasedReturnValue(),
        unsigned int v53 = [v52 isPublished],
        v52,
        !v53))
  {
    id v23 = v21;
  }
  else
  {
    v54 = [(CalendarSeparationSharedCalendar *)self calendar];
    [v54 setIsPublished:0];

    v55 = [(CalendarSeparationSharedCalendar *)self calendar];
    id v62 = v21;
    unsigned __int8 v56 = [v10 saveCalendar:v55 commit:1 error:&v62];
    id v23 = v62;

    if ((v56 & 1) == 0 && !v23)
    {
      NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
      CFStringRef v81 = @"Failed to unpublish calendar";
      v57 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      id v23 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v57];
    }
  }
  v7[2](v7, v23);

LABEL_54:
}

- (void)makePrivateWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, id))a3;
  id v5 = [(CalendarSeparationSharedCalendar *)self calendar];
  unsigned int v6 = [v5 isPublished];

  if (!v6) {
    goto LABEL_7;
  }
  v7 = [(CalendarSeparationSharedCalendar *)self calendar];
  v8 = [v7 eventStore];

  v9 = [(CalendarSeparationSharedCalendar *)self calendar];
  [v9 setIsPublished:0];

  v10 = [(CalendarSeparationSharedCalendar *)self calendar];
  id v17 = 0;
  unsigned __int8 v11 = [v8 saveCalendar:v10 commit:1 error:&v17];
  id v12 = v17;

  if ((v11 & 1) == 0 && !v12)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"Failed to unpublish calendar";
    id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v12 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v13];
  }
  if (v12)
  {
    uint64_t v14 = 0;
  }
  else
  {
LABEL_7:
    id v15 = [CalendarSeparationSharedCalendar alloc];
    id v16 = [(CalendarSeparationSharedCalendar *)self calendar];
    uint64_t v14 = [(CalendarSeparationSharedCalendar *)v15 initWithCalendar:v16];

    id v12 = 0;
  }
  v4[2](v4, v14, v12);
}

- (EKCalendar)calendar
{
  return (EKCalendar *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCalendar:(id)a3
{
}

- (CalendarSeparationParticipant)owner
{
  return (CalendarSeparationParticipant *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end