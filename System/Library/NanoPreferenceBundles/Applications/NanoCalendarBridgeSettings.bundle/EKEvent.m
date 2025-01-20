@interface EKEvent
- (id)nanoPrivacyAwareDescription;
@end

@implementation EKEvent

- (id)nanoPrivacyAwareDescription
{
  if (qword_15680 != -1) {
    dispatch_once(&qword_15680, &stru_106B8);
  }
  int v3 = byte_15688;
  v64 = [(EKEvent *)self objectID];
  v63 = [(EKEvent *)self title];
  if (v3)
  {
    uint64_t v46 = [(EKEvent *)self externalURL];
    v62 = [(EKEvent *)self calendar];
    uint64_t v50 = [v62 objectID];
    uint64_t v52 = [(EKEvent *)self startDate];
    uint64_t v48 = [(EKEvent *)self endDate];
    unsigned int v44 = [(EKEvent *)self isAllDay];
    v61 = [(EKEvent *)self structuredLocation];
    uint64_t v42 = [v61 objectID];
    v60 = [(EKEvent *)self structuredLocation];
    uint64_t v4 = [v60 title];
    v58 = [(EKEvent *)self structuredLocation];
    v57 = [v58 geoLocation];
    v56 = [(EKEvent *)self organizer];
    uint64_t v5 = [v56 objectID];
    v55 = [(EKEvent *)self organizer];
    uint64_t v6 = [v55 name];
    v7 = [(EKEvent *)self organizer];
    unsigned int v8 = [v7 isCurrentUser];
    EKEventStatus v9 = [(EKEvent *)self status];
    EKEventAvailability v10 = [(EKEvent *)self availability];
    v11 = [(EKEvent *)self occurrenceDate];
    unsigned int v12 = [(EKEvent *)self isDetached];
    v13 = [(EKEvent *)self calendar];
    BOOL v14 = [v13 type] == &dword_4;
    uint64_t v15 = v12;
    EKEventAvailability v39 = v10;
    v16 = (void *)v52;
    uint64_t v36 = v8;
    EKEventStatus v37 = v9;
    v18 = (void *)v48;
    v17 = (void *)v50;
    v54 = (void *)v6;
    uint64_t v35 = v6;
    v19 = (void *)v5;
    v59 = (void *)v4;
    uint64_t v33 = v4;
    v20 = (void *)v42;
    v21 = (void *)v46;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Event objectID=%@; title=%@; externalURL=%@; Cal objID=%@; startDate=%@; endDate=%@; allDay=%d; Loc objectID=%@; loc=%@; hasGeoLoc=%d; Organizer objectID=%@; name=%@; orgIsCurrUser=%d; status=%li; avail=%li; occurDate=%@; detached=%d; inBdayCal=%d",
      v64,
      v63,
      v46,
      v50,
      v52,
      v48,
      v44,
      v42,
      v33,
      v57 != 0,
      v5,
      v35,
      v36,
      v37,
      v39,
      v11,
      v15,
      v14);
  }
  else
  {
    id v45 = [v63 length];
    v21 = [(EKEvent *)self externalURL];
    v62 = [(EKEvent *)self calendar];
    uint64_t v51 = [v62 objectID];
    uint64_t v53 = [(EKEvent *)self startDate];
    uint64_t v49 = [(EKEvent *)self endDate];
    unsigned int v47 = [(EKEvent *)self isAllDay];
    v61 = [(EKEvent *)self structuredLocation];
    uint64_t v22 = [v61 objectID];
    v60 = [(EKEvent *)self structuredLocation];
    v59 = [v60 title];
    id v43 = [v59 length];
    v58 = [(EKEvent *)self structuredLocation];
    v57 = [v58 geoLocation];
    v56 = [(EKEvent *)self organizer];
    uint64_t v23 = [v56 objectID];
    v55 = [(EKEvent *)self organizer];
    v54 = [v55 name];
    id v41 = [v54 length];
    v7 = [(EKEvent *)self organizer];
    unsigned int v24 = [v7 isCurrentUser];
    EKEventStatus v25 = [(EKEvent *)self status];
    EKEventAvailability v26 = [(EKEvent *)self availability];
    v11 = [(EKEvent *)self occurrenceDate];
    unsigned int v27 = [(EKEvent *)self isDetached];
    v13 = [(EKEvent *)self calendar];
    BOOL v28 = [v13 type] == &dword_4;
    uint64_t v29 = v27;
    EKEventAvailability v40 = v26;
    uint64_t v30 = v24;
    v16 = (void *)v53;
    EKEventStatus v38 = v25;
    v18 = (void *)v49;
    v17 = (void *)v51;
    uint64_t v34 = v23;
    v19 = (void *)v23;
    v20 = (void *)v22;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Event objectID=%@; titleLen=%lu; externalURL=%@; Cal objID=%@; startDate=%@; endDate=%@; allDay=%d; Loc objectID=%@; locLen=%lu; hasGeoLoc=%d; Organizer objectID=%@; nameLen=%lu; orgIsCurrUser=%d; status=%li; avail=%li; occurDate=%@; detached=%d; inBdayCal=%d",
      v64,
      v45,
      v21,
      v51,
      v53,
      v49,
      v47,
      v22,
      v43,
      v57 != 0,
      v34,
      v41,
      v30,
      v38,
      v40,
      v11,
      v29,
      v28);
  v31 = };

  return v31;
}

@end