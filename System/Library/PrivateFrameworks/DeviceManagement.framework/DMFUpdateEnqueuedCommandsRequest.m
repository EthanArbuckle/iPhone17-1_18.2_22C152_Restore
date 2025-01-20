@interface DMFUpdateEnqueuedCommandsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFUpdateEnqueuedCommandsRequest)initWithCoder:(id)a3;
- (NSArray)addCommands;
- (NSArray)removeCommands;
- (NSString)organizationIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAddCommands:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setRemoveCommands:(id)a3;
@end

@implementation DMFUpdateEnqueuedCommandsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABDA8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFUpdateEnqueuedCommandsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFUpdateEnqueuedCommandsRequest;
  v5 = [(CATTaskRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodePropertyListForKey:@"addCommands"];
    addCommands = v5->_addCommands;
    v5->_addCommands = (NSArray *)v9;

    uint64_t v11 = [v4 decodePropertyListForKey:@"removeCommands"];
    removeCommands = v5->_removeCommands;
    v5->_removeCommands = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFUpdateEnqueuedCommandsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFUpdateEnqueuedCommandsRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMFUpdateEnqueuedCommandsRequest *)self addCommands];
  [v4 encodeObject:v6 forKey:@"addCommands"];

  uint64_t v7 = [(DMFUpdateEnqueuedCommandsRequest *)self removeCommands];
  [v4 encodeObject:v7 forKey:@"removeCommands"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSArray)addCommands
{
  return self->_addCommands;
}

- (void)setAddCommands:(id)a3
{
}

- (NSArray)removeCommands
{
  return self->_removeCommands;
}

- (void)setRemoveCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeCommands, 0);
  objc_storeStrong((id *)&self->_addCommands, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end