@interface HKClinicalAccountLoginCompletionState
+ (BOOL)supportsSecureCoding;
+ (id)completionStateWithError:(id)a3;
- (BOOL)didSucceed;
- (BOOL)wasRelogin;
- (HKClinicalAccount)account;
- (HKClinicalAccountLoginCompletionState)initWithAccount:(id)a3 alternateCredentialPersistentID:(id)a4 wasRelogin:(BOOL)a5 error:(id)a6;
- (HKClinicalAccountLoginCompletionState)initWithCoder:(id)a3;
- (NSError)error;
- (NSNumber)alternateCredentialPersistentID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateCredentialPersistentID:(id)a3;
@end

@implementation HKClinicalAccountLoginCompletionState

- (HKClinicalAccountLoginCompletionState)initWithAccount:(id)a3 alternateCredentialPersistentID:(id)a4 wasRelogin:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalAccountLoginCompletionState;
  v13 = [(HKClinicalAccountLoginCompletionState *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    account = v13->_account;
    v13->_account = (HKClinicalAccount *)v14;

    uint64_t v16 = [v11 copy];
    alternateCredentialPersistentID = v13->_alternateCredentialPersistentID;
    v13->_alternateCredentialPersistentID = (NSNumber *)v16;

    v13->_wasRelogin = a5;
    uint64_t v18 = [v12 copy];
    error = v13->_error;
    v13->_error = (NSError *)v18;
  }
  return v13;
}

+ (id)completionStateWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAccount:0 alternateCredentialPersistentID:0 wasRelogin:0 error:v4];

  return v5;
}

- (BOOL)didSucceed
{
  return self->_error == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalAccountLoginCompletionState)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"wasRelogin"])
  {
    v14.receiver = self;
    v14.super_class = (Class)HKClinicalAccountLoginCompletionState;
    v5 = [(HKClinicalAccountLoginCompletionState *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
      account = v5->_account;
      v5->_account = (HKClinicalAccount *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialPersistentID"];
      alternateCredentialPersistentID = v5->_alternateCredentialPersistentID;
      v5->_alternateCredentialPersistentID = (NSNumber *)v8;

      v5->_wasRelogin = [v4 decodeBoolForKey:@"wasRelogin"];
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
      error = v5->_error;
      v5->_error = (NSError *)v10;
    }
    self = v5;
    id v12 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [v5 encodeObject:account forKey:@"account"];
  [v5 encodeObject:self->_alternateCredentialPersistentID forKey:@"credentialPersistentID"];
  [v5 encodeBool:self->_wasRelogin forKey:@"wasRelogin"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKClinicalAccount *)self->_account identifier];
  alternateCredentialPersistentID = self->_alternateCredentialPersistentID;
  v7 = HKStringFromBool();
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> account: %@, alternate credential: %@, was relogin: %@, error: %@", v4, self, v5, alternateCredentialPersistentID, v7, self->_error];

  return v8;
}

- (HKClinicalAccount)account
{
  return self->_account;
}

- (NSNumber)alternateCredentialPersistentID
{
  return self->_alternateCredentialPersistentID;
}

- (void)setAlternateCredentialPersistentID:(id)a3
{
}

- (BOOL)wasRelogin
{
  return self->_wasRelogin;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_alternateCredentialPersistentID, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end