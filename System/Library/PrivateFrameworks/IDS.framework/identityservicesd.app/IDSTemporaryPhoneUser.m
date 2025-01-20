@interface IDSTemporaryPhoneUser
+ (BOOL)supportsSecureCoding;
- (BOOL)finishedRegistration;
- (BOOL)hasBeenProvisioned;
- (BOOL)hasNotifiedSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTemporaryPhoneUser:(id)a3;
- (BOOL)isIdenticalToUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSPhoneUser)phoneUser;
- (IDSTemporaryPhoneUser)initWithCoder:(id)a3;
- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3;
- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3 expirationDate:(id)a4 finishedRegistration:(BOOL)a5;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithFinishedRegistration;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithNotifiedSuccess;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithUpdatedExpirationDate:(id)a3;
- (NSDate)expirationDate;
- (NSString)countryCode;
- (NSString)description;
- (NSString)labelID;
- (NSString)networkCode;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)storageIdentifier;
- (id)uniqueIdentifier;
- (id)unprefixedIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFinishedRegistration:(BOOL)a3;
- (void)setHasBeenProvisioned:(BOOL)a3;
- (void)setHasNotifiedSuccess:(BOOL)a3;
- (void)setPhoneUser:(id)a3;
@end

@implementation IDSTemporaryPhoneUser

- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
  v6 = [(IDSTemporaryPhoneUser *)self initWithPhoneUser:v4 expirationDate:v5 finishedRegistration:0];

  return v6;
}

- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3 expirationDate:(id)a4 finishedRegistration:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSTemporaryPhoneUser;
  v11 = [(IDSTemporaryPhoneUser *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_phoneUser, a3);
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_finishedRegistration = a5;
  }

  return v12;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithUpdatedExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSTemporaryPhoneUser *)self copy];
  [v5 setExpirationDate:v4];

  [v5 setHasBeenProvisioned:1];

  return (IDSTemporaryPhoneUser *)v5;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithFinishedRegistration
{
  id v2 = [(IDSTemporaryPhoneUser *)self copy];
  [v2 setFinishedRegistration:1];

  return (IDSTemporaryPhoneUser *)v2;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithNotifiedSuccess
{
  id v2 = [(IDSTemporaryPhoneUser *)self copy];
  [v2 setHasNotifiedSuccess:1];

  return (IDSTemporaryPhoneUser *)v2;
}

- (id)uniqueIdentifier
{
  uint64_t v3 = [(IDSTemporaryPhoneUser *)self phoneNumber];
  id v4 = (void *)v3;
  id v5 = &stru_10099BE78;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = [(IDSTemporaryPhoneUser *)self phoneUser];
  v8 = [v7 uniqueIdentifier];
  id v9 = [@"tp" stringByAppendingString:v8];
  id v10 = [v9 stringByAppendingString:v6];

  return v10;
}

- (int64_t)realm
{
  return 2;
}

- (id)realmPrefixedIdentifier
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 realmPrefixedIdentifier];

  return v3;
}

- (id)unprefixedIdentifier
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 unprefixedIdentifier];

  return v3;
}

- (id)storageIdentifier
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 storageIdentifier];
  id v4 = [@"tp" stringByAppendingString:v3];

  return v4;
}

- (NSString)phoneNumber
{
  uint64_t v3 = [(IDSTemporaryPhoneUser *)self phoneUser];
  id v4 = [v3 phoneNumber];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(IDSTemporaryPhoneUser *)self phoneUser];
    id v6 = [v7 phoneBookNumber];
  }

  return (NSString *)v6;
}

- (NSString)countryCode
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 countryCode];

  return (NSString *)v3;
}

- (NSString)networkCode
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 networkCode];

  return (NSString *)v3;
}

- (NSString)labelID
{
  id v2 = [(IDSTemporaryPhoneUser *)self phoneUser];
  uint64_t v3 = [v2 labelID];

  return (NSString *)v3;
}

- (BOOL)shouldReplace:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  id v2 = [(IDSTemporaryPhoneUser *)self uniqueIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSTemporaryPhoneUser *)self isEqualToTemporaryPhoneUser:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToTemporaryPhoneUser:(id)a3
{
  id v4 = (IDSTemporaryPhoneUser *)a3;
  BOOL v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v6 = [(IDSTemporaryPhoneUser *)v4 uniqueIdentifier];
    v7 = [(IDSTemporaryPhoneUser *)self uniqueIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(IDSTemporaryPhoneUser *)v5 phoneNumber];
      id v9 = [(IDSTemporaryPhoneUser *)self phoneNumber];
      unsigned __int8 v10 = [v8 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  return v10;
}

- (BOOL)isIdenticalToUser:(id)a3
{
  id v4 = a3;
  if ([(IDSTemporaryPhoneUser *)self isEqualToUser:v4])
  {
    id v5 = v4;
    id v6 = [v5 expirationDate];
    v7 = [(IDSTemporaryPhoneUser *)self expirationDate];
    if ([v6 isEqualToDate:v7]
      && (unsigned int v8 = [v5 finishedRegistration],
          v8 == [(IDSTemporaryPhoneUser *)self finishedRegistration])
      && (unsigned int v9 = [v5 hasBeenProvisioned],
          v9 == [(IDSTemporaryPhoneUser *)self hasBeenProvisioned]))
    {
      unsigned int v12 = [v5 hasNotifiedSuccess];
      unsigned int v10 = v12 ^ [(IDSTemporaryPhoneUser *)self hasNotifiedSuccess] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSTemporaryPhoneUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneUser"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finished"];
  id v8 = [v7 BOOLValue];

  id v9 = [v4 decodeBoolForKey:@"Provisioned"];
  id v10 = [v4 decodeBoolForKey:@"notifiedSuccess"];

  v11 = [(IDSTemporaryPhoneUser *)self initWithPhoneUser:v5 expirationDate:v6 finishedRegistration:v8];
  [(IDSTemporaryPhoneUser *)v11 setHasBeenProvisioned:v9];
  [(IDSTemporaryPhoneUser *)v11 setHasNotifiedSuccess:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSTemporaryPhoneUser *)self phoneUser];
  [v7 encodeObject:v4 forKey:@"phoneUser"];

  id v5 = [(IDSTemporaryPhoneUser *)self expirationDate];
  [v7 encodeObject:v5 forKey:@"expiration"];

  id v6 = +[NSNumber numberWithBool:[(IDSTemporaryPhoneUser *)self finishedRegistration]];
  [v7 encodeObject:v6 forKey:@"finished"];

  objc_msgSend(v7, "encodeBool:forKey:", -[IDSTemporaryPhoneUser hasBeenProvisioned](self, "hasBeenProvisioned"), @"Provisioned");
  objc_msgSend(v7, "encodeBool:forKey:", -[IDSTemporaryPhoneUser hasNotifiedSuccess](self, "hasNotifiedSuccess"), @"notifiedSuccess");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(IDSTemporaryPhoneUser *)self phoneUser];
  id v6 = [v5 copy];
  id v7 = [(IDSTemporaryPhoneUser *)self expirationDate];
  id v8 = objc_msgSend(v4, "initWithPhoneUser:expirationDate:finishedRegistration:", v6, v7, -[IDSTemporaryPhoneUser finishedRegistration](self, "finishedRegistration"));

  objc_msgSend(v8, "setHasNotifiedSuccess:", -[IDSTemporaryPhoneUser hasNotifiedSuccess](self, "hasNotifiedSuccess"));
  objc_msgSend(v8, "setHasBeenProvisioned:", -[IDSTemporaryPhoneUser hasBeenProvisioned](self, "hasBeenProvisioned"));
  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSTemporaryPhoneUser *)self uniqueIdentifier];
  id v5 = [(IDSTemporaryPhoneUser *)self phoneNumber];
  id v6 = [(IDSTemporaryPhoneUser *)self expirationDate];
  unsigned int v7 = [(IDSTemporaryPhoneUser *)self finishedRegistration];
  CFStringRef v8 = @"NO";
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  id v9 = +[NSString stringWithFormat:@"<%@:%p> uid: %@, pn: %@, expiration: %@, finished : %@", v3, self, v4, v5, v6, v8];

  return (NSString *)v9;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)hasBeenProvisioned
{
  return self->_hasBeenProvisioned;
}

- (void)setHasBeenProvisioned:(BOOL)a3
{
  self->_hasBeenProvisioned = a3;
}

- (BOOL)finishedRegistration
{
  return self->_finishedRegistration;
}

- (void)setFinishedRegistration:(BOOL)a3
{
  self->_finishedRegistration = a3;
}

- (BOOL)hasNotifiedSuccess
{
  return self->_hasNotifiedSuccess;
}

- (void)setHasNotifiedSuccess:(BOOL)a3
{
  self->_hasNotifiedSuccess = a3;
}

- (IDSPhoneUser)phoneUser
{
  return self->_phoneUser;
}

- (void)setPhoneUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneUser, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end