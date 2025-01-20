@interface MSASSharingRelationship
+ (BOOL)supportsSecureCoding;
+ (id)MSASPSharingRelationshipFromProtocolDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharingRelationship:(id)a3;
- (BOOL)isMine;
- (MSASSharingRelationship)init;
- (MSASSharingRelationship)initWithCoder:(id)a3;
- (NSArray)emails;
- (NSArray)phones;
- (NSDate)subscriptionDate;
- (NSString)GUID;
- (NSString)albumGUID;
- (NSString)email;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)personID;
- (id)_fullName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumGUID:(id)a3;
- (void)setEmail:(id)a3;
- (void)setEmails:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPhones:(id)a3;
- (void)setState:(int)a3;
- (void)setSubscriptionDate:(id)a3;
@end

@implementation MSASSharingRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionDate, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setSubscriptionDate:(id)a3
{
}

- (NSDate)subscriptionDate
{
  return self->_subscriptionDate;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setFullName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setPhones:(id)a3
{
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setEmails:(id)a3
{
}

- (NSArray)emails
{
  return self->_emails;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)fullName
{
  fullName = self->_fullName;
  if (fullName) {
    goto LABEL_2;
  }
  fullName = self->_firstName;
  lastName = self->_lastName;
  if (fullName)
  {
    if (!lastName)
    {
LABEL_2:
      v3 = fullName;
      goto LABEL_3;
    }
    v3 = [NSString stringWithFormat:@"%@ %@", fullName, lastName];
  }
  else if (lastName)
  {
    v3 = lastName;
  }
  else
  {
    v3 = 0;
  }
LABEL_3:
  return v3;
}

- (id)redactedDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MSASSharingRelationship;
  v3 = [(MSASSharingRelationship *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@", self->_GUID];
  }
  if (self->_albumGUID) {
    [v4 appendFormat:@" Album GUID: %@", self->_albumGUID];
  }
  if (self->_personID) {
    [v4 appendFormat:@" PersonID: %@", self->_personID];
  }
  if (self->_subscriptionDate) {
    [v4 appendFormat:@" Subscription Date: %@", self->_subscriptionDate];
  }
  uint64_t state = self->_state;
  if (state > 5) {
    v6 = @"undefined";
  }
  else {
    v6 = off_1E6C3CF38[state];
  }
  [v4 appendFormat:@" State: %@", v6];
  if (self->_isMine) {
    [v4 appendString:@" IsMine"];
  }
  return v4;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)MSASSharingRelationship;
  v3 = [(MSASSharingRelationship *)&v10 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@", self->_GUID];
  }
  if (self->_albumGUID) {
    [v4 appendFormat:@" Album GUID: %@", self->_albumGUID];
  }
  if (self->_email) {
    [v4 appendFormat:@" email: %@", self->_email];
  }
  if (self->_emails) {
    [v4 appendFormat:@" emails: %@", self->_emails];
  }
  if (self->_phones) {
    [v4 appendFormat:@" phones: %@", self->_phones];
  }
  uint64_t v5 = [(MSASSharingRelationship *)self fullName];
  v6 = (void *)v5;
  if (v5) {
    [v4 appendFormat:@" Full Name: %@", v5];
  }
  if (self->_personID) {
    [v4 appendFormat:@" PersonID: %@", self->_personID];
  }
  if (self->_subscriptionDate) {
    [v4 appendFormat:@" Subscription Date: %@", self->_subscriptionDate];
  }
  uint64_t state = self->_state;
  if (state > 5) {
    objc_super v8 = @"undefined";
  }
  else {
    objc_super v8 = off_1E6C3CF38[state];
  }
  [v4 appendFormat:@" State: %@", v8];
  if (self->_isMine) {
    [v4 appendString:@" IsMine"];
  }

  return v4;
}

- (MSASSharingRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSASSharingRelationship;
  uint64_t v5 = [(MSASSharingRelationship *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"albumGUID"];
    albumGUID = v5->_albumGUID;
    v5->_albumGUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
    email = v5->_email;
    v5->_email = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"emails"];
    emails = v5->_emails;
    v5->_emails = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"phones"];
    phones = v5->_phones;
    v5->_phones = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personID"];
    personID = v5->_personID;
    v5->_personID = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionDate"];
    subscriptionDate = v5->_subscriptionDate;
    v5->_subscriptionDate = (NSDate *)v30;

    v5->_uint64_t state = [v4 decodeIntForKey:@"state"];
    v5->_isMine = [v4 decodeBoolForKey:@"isMine"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  GUID = self->_GUID;
  id v15 = v4;
  if (GUID)
  {
    [v4 encodeObject:GUID forKey:@"GUID"];
    id v4 = v15;
  }
  albumGUID = self->_albumGUID;
  if (albumGUID)
  {
    [v15 encodeObject:albumGUID forKey:@"albumGUID"];
    id v4 = v15;
  }
  email = self->_email;
  if (email)
  {
    [v15 encodeObject:email forKey:@"email"];
    id v4 = v15;
  }
  emails = self->_emails;
  if (emails)
  {
    [v15 encodeObject:emails forKey:@"emails"];
    id v4 = v15;
  }
  phones = self->_phones;
  if (phones)
  {
    [v15 encodeObject:phones forKey:@"phones"];
    id v4 = v15;
  }
  firstName = self->_firstName;
  if (firstName)
  {
    [v15 encodeObject:firstName forKey:@"firstName"];
    id v4 = v15;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    [v15 encodeObject:lastName forKey:@"lastName"];
    id v4 = v15;
  }
  fullName = self->_fullName;
  if (fullName)
  {
    [v15 encodeObject:fullName forKey:@"fullName"];
    id v4 = v15;
  }
  personID = self->_personID;
  if (personID)
  {
    [v15 encodeObject:personID forKey:@"personID"];
    id v4 = v15;
  }
  subscriptionDate = self->_subscriptionDate;
  if (subscriptionDate)
  {
    [v15 encodeObject:subscriptionDate forKey:@"subscriptionDate"];
    id v4 = v15;
  }
  [v4 encodeInt:self->_state forKey:@"state"];
  [v15 encodeBool:self->_isMine forKey:@"isMine"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MSASSharingRelationship);
  uint64_t v5 = [(MSASSharingRelationship *)self GUID];
  [(MSASSharingRelationship *)v4 setGUID:v5];

  uint64_t v6 = [(MSASSharingRelationship *)self albumGUID];
  [(MSASSharingRelationship *)v4 setAlbumGUID:v6];

  v7 = [(MSASSharingRelationship *)self email];
  [(MSASSharingRelationship *)v4 setEmail:v7];

  uint64_t v8 = [(MSASSharingRelationship *)self emails];
  [(MSASSharingRelationship *)v4 setEmails:v8];

  v9 = [(MSASSharingRelationship *)self phones];
  [(MSASSharingRelationship *)v4 setPhones:v9];

  uint64_t v10 = [(MSASSharingRelationship *)self _fullName];
  [(MSASSharingRelationship *)v4 setFullName:v10];

  v11 = [(MSASSharingRelationship *)self firstName];
  [(MSASSharingRelationship *)v4 setFirstName:v11];

  v12 = [(MSASSharingRelationship *)self lastName];
  [(MSASSharingRelationship *)v4 setLastName:v12];

  uint64_t v13 = [(MSASSharingRelationship *)self personID];
  [(MSASSharingRelationship *)v4 setPersonID:v13];

  v14 = [(MSASSharingRelationship *)self subscriptionDate];
  [(MSASSharingRelationship *)v4 setSubscriptionDate:v14];

  [(MSASSharingRelationship *)v4 setState:[(MSASSharingRelationship *)self state]];
  [(MSASSharingRelationship *)v4 setIsMine:[(MSASSharingRelationship *)self isMine]];
  return v4;
}

- (BOOL)isEqualToSharingRelationship:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASSharingRelationship *)self GUID];
  uint64_t v6 = [v4 GUID];
  if (MSObjectsAreEquivalent(v5, v6))
  {
    v7 = [(MSASSharingRelationship *)self albumGUID];
    uint64_t v8 = [v4 albumGUID];
    if (MSObjectsAreEquivalent(v7, v8))
    {
      v9 = [(MSASSharingRelationship *)self email];
      uint64_t v10 = [v4 email];
      if (MSObjectsAreEquivalent(v9, v10))
      {
        v11 = [(MSASSharingRelationship *)self emails];
        v12 = [v4 emails];
        if (MSObjectsAreEquivalent(v11, v12))
        {
          v34 = v11;
          uint64_t v13 = [(MSASSharingRelationship *)self phones];
          [v4 phones];
          v35 = v36 = v13;
          if (MSObjectsAreEquivalent(v13, v35))
          {
            v14 = [(MSASSharingRelationship *)self firstName];
            v32 = [v4 firstName];
            objc_super v33 = v14;
            if (MSObjectsAreEquivalent(v14, v32))
            {
              id v15 = [(MSASSharingRelationship *)self lastName];
              uint64_t v30 = [v4 lastName];
              v31 = v15;
              if (MSObjectsAreEquivalent(v15, v30))
              {
                v16 = [(MSASSharingRelationship *)self _fullName];
                uint64_t v28 = [v4 _fullName];
                v29 = v16;
                if (MSObjectsAreEquivalent(v16, v28))
                {
                  v17 = [(MSASSharingRelationship *)self personID];
                  uint64_t v26 = [v4 personID];
                  v27 = v17;
                  if (MSObjectsAreEquivalent(v17, v26))
                  {
                    uint64_t v18 = [(MSASSharingRelationship *)self subscriptionDate];
                    uint64_t v24 = [v4 subscriptionDate];
                    v25 = v18;
                    BOOL v19 = MSObjectsAreEquivalent(v18, v24);
                    v11 = v34;
                    if (v19
                      && (int v23 = [(MSASSharingRelationship *)self state],
                          v23 == [v4 state]))
                    {
                      BOOL v20 = [(MSASSharingRelationship *)self isMine];
                      int v21 = v20 ^ [v4 isMine] ^ 1;
                    }
                    else
                    {
                      LOBYTE(v21) = 0;
                    }
                  }
                  else
                  {
                    LOBYTE(v21) = 0;
                    v11 = v34;
                  }
                }
                else
                {
                  LOBYTE(v21) = 0;
                  v11 = v34;
                }
              }
              else
              {
                LOBYTE(v21) = 0;
                v11 = v34;
              }
            }
            else
            {
              LOBYTE(v21) = 0;
              v11 = v34;
            }
          }
          else
          {
            LOBYTE(v21) = 0;
            v11 = v34;
          }
        }
        else
        {
          LOBYTE(v21) = 0;
        }
      }
      else
      {
        LOBYTE(v21) = 0;
      }
    }
    else
    {
      LOBYTE(v21) = 0;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (id)_fullName
{
  return self->_fullName;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MSASSharingRelationship *)self GUID];
    uint64_t v6 = [v4 GUID];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSASSharingRelationship;
    unsigned __int8 v7 = [(MSASSharingRelationship *)&v9 isEqual:v4];
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_GUID hash];
}

- (MSASSharingRelationship)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSASSharingRelationship;
  result = [(MSASSharingRelationship *)&v3 init];
  if (result) {
    result->_isMine = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)MSASPSharingRelationshipFromProtocolDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MSASSharingRelationship);
  int v5 = _setFieldsInSharingRelationship(v4, v3);

  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  unsigned __int8 v7 = v6;

  return v7;
}

@end