@interface BYODUser
+ (id)log;
- (BOOL)isFamilyMember;
- (BYODUser)initWithDictionary:(id)a3;
- (NSArray)emails;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)invitationStatus;
- (NSString)invitedEmail;
- (NSString)invitedOnDate;
- (NSString)invitedPhoneNumber;
- (NSString)lastName;
- (NSString)primaryEmail;
- (id)emailAddress;
- (id)fullName;
- (id)invitationHandle;
- (id)memberIdentifier;
- (id)phoneNumber;
- (void)setDsid:(id)a3;
- (void)setEmails:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setInvitationStatus:(id)a3;
- (void)setInvitedEmail:(id)a3;
- (void)setInvitedOnDate:(id)a3;
- (void)setInvitedPhoneNumber:(id)a3;
- (void)setIsFamilyMember:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setPrimaryEmail:(id)a3;
@end

@implementation BYODUser

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A44C;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D74D8 != -1) {
    dispatch_once(&qword_D74D8, block);
  }
  v2 = (void *)qword_D74D0;

  return v2;
}

- (BYODUser)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BYODUser;
  v5 = [(BYODUser *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"primaryEmail"];
    primaryEmail = v5->_primaryEmail;
    v5->_primaryEmail = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"isFamilyMember"];
    v5->_isFamilyMember = [v14 BOOLValue];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"invitedEmail"];
    invitedEmail = v5->_invitedEmail;
    v5->_invitedEmail = (NSString *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"invitedPhoneNumber"];
    invitedPhoneNumber = v5->_invitedPhoneNumber;
    v5->_invitedPhoneNumber = (NSString *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"invitedOnDate"];
    invitedOnDate = v5->_invitedOnDate;
    v5->_invitedOnDate = (NSString *)v19;

    v21 = [v4 objectForKeyedSubscript:@"emails"];
    id v22 = objc_alloc_init((Class)NSMutableArray);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v23 = v21;
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v26);
          v28 = [BYODEmail alloc];
          v29 = -[BYODEmail initWithDictionary:](v28, "initWithDictionary:", v27, (void)v33);
          [v22 addObject:v29];

          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v24);
    }

    objc_storeStrong((id *)&v5->_emails, v22);
    uint64_t v30 = [v4 objectForKeyedSubscript:@"invitationStatus"];
    invitationStatus = v5->_invitationStatus;
    v5->_invitationStatus = (NSString *)v30;
  }
  return v5;
}

- (id)fullName
{
  if ([(NSString *)self->_firstName length] || [(NSString *)self->_lastName length])
  {
    v3 = +[BYODContactsManager sharedInstance];
    id v4 = [v3 fullNameWithFirstName:self->_firstName lastName:self->_lastName];
  }
  else
  {
    v7 = +[BYODContactsManager sharedInstance];
    v3 = [v7 fetchNameFromContacts:self];

    if ([v3 length])
    {
      id v4 = v3;
      v3 = v4;
    }
    else
    {
      id v4 = [(BYODUser *)self invitationHandle];
    }
  }
  v5 = v4;

  return v5;
}

- (id)emailAddress
{
  p_primaryEmail = &self->_primaryEmail;
  if ([(NSString *)self->_primaryEmail length]) {
    goto LABEL_4;
  }
  invitedEmail = self->_invitedEmail;
  p_invitedEmail = &self->_invitedEmail;
  if ([(NSString *)invitedEmail length])
  {
    p_primaryEmail = p_invitedEmail;
LABEL_4:
    uint64_t v6 = (__CFString *)*p_primaryEmail;
    goto LABEL_5;
  }
  uint64_t v6 = &stru_B9F70;
LABEL_5:

  return v6;
}

- (id)phoneNumber
{
  if ([(NSString *)self->_invitedPhoneNumber length]) {
    invitedPhoneNumber = (__CFString *)self->_invitedPhoneNumber;
  }
  else {
    invitedPhoneNumber = &stru_B9F70;
  }

  return invitedPhoneNumber;
}

- (id)invitationHandle
{
  v3 = [(BYODUser *)self emailAddress];
  if ([v3 length])
  {
    id v4 = [(BYODUser *)self emailAddress];
  }
  else
  {
    v5 = [(BYODUser *)self phoneNumber];
    if ([v5 length])
    {
      id v4 = [(BYODUser *)self phoneNumber];
    }
    else
    {
      id v4 = &stru_B9F70;
    }
  }

  return v4;
}

- (id)memberIdentifier
{
  v3 = [(BYODUser *)self dsid];
  id v4 = [v3 length];

  if (v4)
  {
    v5 = [(BYODUser *)self dsid];
  }
  else
  {
    uint64_t v6 = [(BYODUser *)self invitationHandle];
    id v7 = [v6 length];

    if (v7)
    {
      v5 = [(BYODUser *)self invitationHandle];
    }
    else
    {
      uint64_t v8 = +[BYODUser log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "returning nil as member identifier.", v10, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (void)setPrimaryEmail:(id)a3
{
}

- (BOOL)isFamilyMember
{
  return self->_isFamilyMember;
}

- (void)setIsFamilyMember:(BOOL)a3
{
  self->_isFamilyMember = a3;
}

- (NSString)invitedEmail
{
  return self->_invitedEmail;
}

- (void)setInvitedEmail:(id)a3
{
}

- (NSString)invitedPhoneNumber
{
  return self->_invitedPhoneNumber;
}

- (void)setInvitedPhoneNumber:(id)a3
{
}

- (NSString)invitationStatus
{
  return self->_invitationStatus;
}

- (void)setInvitationStatus:(id)a3
{
}

- (NSArray)emails
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEmails:(id)a3
{
}

- (NSString)invitedOnDate
{
  return self->_invitedOnDate;
}

- (void)setInvitedOnDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedOnDate, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_invitationStatus, 0);
  objc_storeStrong((id *)&self->_invitedPhoneNumber, 0);
  objc_storeStrong((id *)&self->_invitedEmail, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end