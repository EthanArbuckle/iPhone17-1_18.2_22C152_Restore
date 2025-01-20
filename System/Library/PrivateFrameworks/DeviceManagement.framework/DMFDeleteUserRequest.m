@interface DMFDeleteUserRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (BOOL)forceDeletion;
- (DMFDeleteUserRequest)initWithCoder:(id)a3;
- (NSString)username;
- (void)encodeWithCoder:(id)a3;
- (void)setForceDeletion:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation DMFDeleteUserRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB610;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFDeleteUserRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFDeleteUserRequest;
  v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"forceDeletion"];
    v5->_forceDeletion = [v9 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFDeleteUserRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFDeleteUserRequest *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFDeleteUserRequest forceDeletion](self, "forceDeletion"));
  [v4 encodeObject:v6 forKey:@"forceDeletion"];
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)forceDeletion
{
  return self->_forceDeletion;
}

- (void)setForceDeletion:(BOOL)a3
{
  self->_forceDeletion = a3;
}

- (void).cxx_destruct
{
}

@end