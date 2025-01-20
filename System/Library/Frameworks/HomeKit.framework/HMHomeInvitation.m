@interface HMHomeInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMHome)home;
- (HMHomeInvitation)initWithCoder:(id)a3;
- (HMHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4;
- (HMHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4;
- (HMHomeInvitationData)invitationData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSURL)homeObjectURL;
- (NSUUID)identifier;
- (_HMContext)context;
- (int64_t)invitationState;
- (unint64_t)hash;
- (void)_updateInvitationState:(int64_t)a3;
- (void)cancelInviteWithCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setHome:(id)a3;
- (void)setInvitationData:(id)a3;
@end

@implementation HMHomeInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeObjectURL, 0);

  objc_destroyWeak((id *)&self->_home);
}

- (void)setInvitationData:(id)a3
{
}

- (HMHomeInvitationData)invitationData
{
  return self->_invitationData;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (HMHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"home"];

  v9 = [(HMHomeInvitation *)self initWithInvitationData:v6 home:v8];
  return v9;
}

- (HMHomeInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMHomeInvitation *)self initWithInvitationData:0 home:0];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v5->_home, v6);
  }
  return v5;
}

- (void)_updateInvitationState:(int64_t)a3
{
  id v4 = [(HMHomeInvitation *)self invitationData];
  [v4 setInvitationState:a3];
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v7);
  }
  id v4 = [(HMHomeInvitation *)self context];
  v5 = [v4 delegateCaller];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:48 userInfo:0];
  [v5 callCompletion:v8 error:v6];
}

- (int64_t)invitationState
{
  v2 = [(HMHomeInvitation *)self invitationData];
  int64_t v3 = [v2 invitationState];

  return v3;
}

- (NSDate)endDate
{
  v2 = [(HMHomeInvitation *)self invitationData];
  int64_t v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (NSDate)startDate
{
  v2 = [(HMHomeInvitation *)self invitationData];
  int64_t v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSUUID)identifier
{
  v2 = [(HMHomeInvitation *)self invitationData];
  int64_t v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSURL)homeObjectURL
{
  int64_t v3 = [(HMHomeInvitation *)self uniqueIdentifier];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  homeObjectURL = self->_homeObjectURL;
  if (!homeObjectURL)
  {
    id v6 = [v3 UUIDString];
    id v7 = +[HMBulletinObjectTuple tupleWithQueryType:4 uuidString:v6];

    generateURLForHomeKitObject(v7, 0);
    id v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v9 = self->_homeObjectURL;
    self->_homeObjectURL = v8;

    homeObjectURL = self->_homeObjectURL;
  }
  v10 = homeObjectURL;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMHomeInvitation *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMHomeInvitation *)self identifier];
      id v8 = [(HMHomeInvitation *)v6 identifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMHomeInvitation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMHomeInvitation;
  char v9 = [(HMHomeInvitation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_invitationData, a3);
    objc_storeWeak((id *)&v10->_home, v8);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end