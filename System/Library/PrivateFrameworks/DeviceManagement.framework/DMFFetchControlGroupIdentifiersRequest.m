@interface DMFFetchControlGroupIdentifiersRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)includeTemporary;
- (DMFFetchControlGroupIdentifiersRequest)initWithCoder:(id)a3;
- (NSString)leaderIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeTemporary:(BOOL)a3;
- (void)setLeaderIdentifier:(id)a3;
@end

@implementation DMFFetchControlGroupIdentifiersRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchControlGroupIdentifiersRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchControlGroupIdentifiersRequest;
  v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeTemporary"];
    v5->_includeTemporary = [v6 BOOLValue];

    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"leaderIdentifier"];
    leaderIdentifier = v5->_leaderIdentifier;
    v5->_leaderIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFFetchControlGroupIdentifiersRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchControlGroupIdentifiersRequest includeTemporary](self, "includeTemporary", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"includeTemporary"];

  v6 = [(DMFFetchControlGroupIdentifiersRequest *)self leaderIdentifier];
  [v4 encodeObject:v6 forKey:@"leaderIdentifier"];
}

- (NSString)leaderIdentifier
{
  return self->_leaderIdentifier;
}

- (void)setLeaderIdentifier:(id)a3
{
}

- (BOOL)includeTemporary
{
  return self->_includeTemporary;
}

- (void)setIncludeTemporary:(BOOL)a3
{
  self->_includeTemporary = a3;
}

- (void).cxx_destruct
{
}

@end