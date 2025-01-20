@interface CalendarSeparationParticipant
- (BOOL)matchesDSParticipation:(id)a3;
- (CalendarSeparationParticipant)initWithEKCalendar:(id)a3;
- (CalendarSeparationParticipant)initWithEKSharee:(id)a3;
- (CalendarSeparationParticipant)initWithGrantedDelegate:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation CalendarSeparationParticipant

- (BOOL)matchesDSParticipation:(id)a3
{
  v4 = (CalendarSeparationParticipant *)a3;
  if (v4 == self) {
    goto LABEL_4;
  }
  v5 = [(CalendarSeparationParticipant *)self emailAddress];
  v6 = [v5 stringRemovingMailto];
  v7 = [(CalendarSeparationParticipant *)v4 identity];
  v8 = [v7 emailAddress];
  v9 = [v8 stringRemovingMailto];
  unsigned __int8 v10 = [v6 isEqualToString:v9];

  if (v10) {
    goto LABEL_4;
  }
  v11 = [(CalendarSeparationParticipant *)self phoneNumber];
  v12 = [(CalendarSeparationParticipant *)v4 identity];
  v13 = [v12 phoneNumber];
  unsigned __int8 v14 = [v11 isEqualToString:v13];

  if (v14) {
    goto LABEL_4;
  }
  v17 = [(CalendarSeparationParticipant *)self emailAddress];
  if (v17)
  {
    v12 = [(CalendarSeparationParticipant *)v4 identity];
    uint64_t v18 = [v12 emailAddress];
    if (v18)
    {
      v19 = (void *)v18;
LABEL_20:

LABEL_21:
      BOOL v15 = 0;
      goto LABEL_5;
    }
  }
  v20 = [(CalendarSeparationParticipant *)self phoneNumber];
  if (v20)
  {
    v21 = [(CalendarSeparationParticipant *)v4 identity];
    v22 = [v21 phoneNumber];

    if (v17)
    {
    }
    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v17)
    {
    }
  }
  v17 = [(CalendarSeparationParticipant *)self nameComponents];
  v12 = [v17 givenName];
  v19 = [(CalendarSeparationParticipant *)v4 identity];
  v23 = [v19 nameComponents];
  v24 = [v23 givenName];
  if (![v12 isEqualToString:v24])
  {

    goto LABEL_20;
  }
  v30 = [(CalendarSeparationParticipant *)self nameComponents];
  v25 = [v30 familyName];
  v26 = [(CalendarSeparationParticipant *)v4 identity];
  v27 = [v26 nameComponents];
  v28 = [v27 familyName];
  unsigned __int8 v29 = [v25 isEqualToString:v28];

  if ((v29 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_4:
  BOOL v15 = 1;
LABEL_5:

  return v15;
}

- (CalendarSeparationParticipant)initWithGrantedDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CalendarSeparationParticipant;
  v5 = [(CalendarSeparationParticipant *)&v14 init];
  if (v5)
  {
    v6 = (char *)[v4 permission];
    uint64_t v7 = 1;
    if (v6 != (unsigned char *)&dword_0 + 1) {
      uint64_t v7 = 2;
    }
    v5->permission = v7;
    v5->role = 2;
    uint64_t v8 = [v4 preferredUserAddress];
    emailAddress = v5->emailAddress;
    v5->emailAddress = (NSString *)v8;

    unsigned __int8 v10 = [v4 displayName];
    uint64_t v11 = +[CalPersonNameComponentsFormatter personNameComponentsFromString:v10];
    nameComponents = v5->nameComponents;
    v5->nameComponents = (NSPersonNameComponents *)v11;
  }
  return v5;
}

- (CalendarSeparationParticipant)initWithEKSharee:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CalendarSeparationParticipant;
  v5 = [(CalendarSeparationParticipant *)&v35 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (char *)[v4 shareeAccessLevel];
      uint64_t v7 = 1;
      if (v6 != (unsigned char *)&dword_0 + 1) {
        uint64_t v7 = 2;
      }
      v5->permission = v7;
      v5->role = 2;
      uint64_t v8 = [v4 emailAddress];
      v9 = v8;
      if (v8)
      {
        unsigned __int8 v10 = v8;
      }
      else
      {
        unsigned __int8 v10 = [v4 address];
      }
      emailAddress = v5->emailAddress;
      v5->emailAddress = v10;

      BOOL v15 = +[CalContactsProvider defaultProvider];
      v16 = [v4 contactPredicate];
      v36 = CNContactIdentifierKey;
      v17 = +[NSArray arrayWithObjects:&v36 count:1];
      id v12 = [v15 unifiedContactsMatchingPredicate:v16 keysToFetch:v17];

      v13 = [v12 firstObject];
      uint64_t v18 = [v13 identifier];
      unifiedContactIdentifier = v5->unifiedContactIdentifier;
      v5->unifiedContactIdentifier = (NSString *)v18;
    }
    else
    {
      *(_OWORD *)&v5->permission = xmmword_69F0;
      uint64_t v11 = [v4 emailAddress];
      id v12 = v11;
      if (v11)
      {
        id v12 = v11;
        v13 = v5->emailAddress;
        v5->emailAddress = (NSString *)v12;
        goto LABEL_13;
      }
      v13 = [v4 URL];
      uint64_t v20 = [v13 absoluteString];
      unifiedContactIdentifier = v5->emailAddress;
      v5->emailAddress = (NSString *)v20;
    }

LABEL_13:
    uint64_t v21 = [v4 phoneNumber];
    phoneNumber = v5->phoneNumber;
    v5->phoneNumber = (NSString *)v21;

    v23 = [v4 firstName];
    if (v23)
    {
    }
    else
    {
      v24 = [v4 lastName];

      if (!v24)
      {
        v30 = [v4 name];

        if (!v30) {
          goto LABEL_18;
        }
        v31 = [v4 name];
        uint64_t v32 = +[CalPersonNameComponentsFormatter personNameComponentsFromString:v31];
        nameComponents = v5->nameComponents;
        v5->nameComponents = (NSPersonNameComponents *)v32;

        v28 = [(NSPersonNameComponents *)v5->nameComponents familyName];
        if (!v28)
        {
          v34 = [(NSPersonNameComponents *)v5->nameComponents givenName];

          if (v34) {
            goto LABEL_18;
          }
          v28 = [v4 name];
          [(NSPersonNameComponents *)v5->nameComponents setNickname:v28];
        }
        goto LABEL_17;
      }
    }
    uint64_t v25 = objc_opt_new();
    v26 = v5->nameComponents;
    v5->nameComponents = (NSPersonNameComponents *)v25;

    v27 = [v4 firstName];
    [(NSPersonNameComponents *)v5->nameComponents setGivenName:v27];

    v28 = [v4 lastName];
    [(NSPersonNameComponents *)v5->nameComponents setFamilyName:v28];
LABEL_17:
  }
LABEL_18:

  return v5;
}

- (CalendarSeparationParticipant)initWithEKCalendar:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CalendarSeparationParticipant;
  v5 = [(CalendarSeparationParticipant *)&v15 init];
  v6 = (CalendarSeparationParticipant *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_69F0;
    uint64_t v7 = [v4 sharedOwnerPhoneNumber];
    phoneNumber = v6->phoneNumber;
    v6->phoneNumber = (NSString *)v7;

    uint64_t v9 = [v4 sharedOwnerEmail];
    emailAddress = v6->emailAddress;
    v6->emailAddress = (NSString *)v9;

    uint64_t v11 = [v4 sharedOwnerName];
    uint64_t v12 = +[CalPersonNameComponentsFormatter personNameComponentsFromString:v11];
    nameComponents = v6->nameComponents;
    v6->nameComponents = (NSPersonNameComponents *)v12;
  }
  return v6;
}

- (int64_t)permission
{
  return self->permission;
}

- (int64_t)role
{
  return self->role;
}

- (NSPersonNameComponents)nameComponents
{
  return self->nameComponents;
}

- (NSString)emailAddress
{
  return self->emailAddress;
}

- (NSString)phoneNumber
{
  return self->phoneNumber;
}

- (NSString)unifiedContactIdentifier
{
  return self->unifiedContactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->unifiedContactIdentifier, 0);
  objc_storeStrong((id *)&self->phoneNumber, 0);
  objc_storeStrong((id *)&self->emailAddress, 0);

  objc_storeStrong((id *)&self->nameComponents, 0);
}

@end