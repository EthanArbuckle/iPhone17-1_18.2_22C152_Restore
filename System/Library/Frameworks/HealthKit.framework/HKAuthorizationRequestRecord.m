@interface HKAuthorizationRequestRecord
+ (BOOL)supportsSecureCoding;
- (HKAuthorizationRequestRecord)init;
- (HKAuthorizationRequestRecord)initWithCoder:(id)a3;
- (HKAuthorizationRequestRecord)initWithSource:(id)a3 session:(id)a4 readTypes:(id)a5 writeTypes:(id)a6;
- (HKSource)source;
- (NSSet)typesRequiringReadAuthorization;
- (NSSet)typesRequiringShareAuthorization;
- (NSUUID)sessionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAuthorizationRequestRecord

- (HKAuthorizationRequestRecord)initWithSource:(id)a3 session:(id)a4 readTypes:(id)a5 writeTypes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKAuthorizationRequestRecord;
  v14 = [(HKAuthorizationRequestRecord *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    source = v14->_source;
    v14->_source = (HKSource *)v15;

    uint64_t v17 = [v11 copy];
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSUUID *)v17;

    uint64_t v19 = [v12 copy];
    typesRequiringReadAuthorization = v14->_typesRequiringReadAuthorization;
    v14->_typesRequiringReadAuthorization = (NSSet *)v19;

    uint64_t v21 = [v13 copy];
    typesRequiringShareAuthorization = v14->_typesRequiringShareAuthorization;
    v14->_typesRequiringShareAuthorization = (NSSet *)v21;
  }
  return v14;
}

- (HKAuthorizationRequestRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"session_identifier"];
  [v5 encodeObject:self->_typesRequiringShareAuthorization forKey:@"share_types"];
  [v5 encodeObject:self->_typesRequiringReadAuthorization forKey:@"read_types"];
}

- (HKAuthorizationRequestRecord)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKAuthorizationRequestRecord;
  id v5 = [(HKAuthorizationRequestRecord *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (HKSource *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session_identifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"share_types"];
    typesRequiringShareAuthorization = v5->_typesRequiringShareAuthorization;
    v5->_typesRequiringShareAuthorization = (NSSet *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"read_types"];
    typesRequiringReadAuthorization = v5->_typesRequiringReadAuthorization;
    v5->_typesRequiringReadAuthorization = (NSSet *)v18;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKAuthorizationRequestRecord;
  id v4 = [(HKAuthorizationRequestRecord *)&v7 description];
  id v5 = [v3 stringWithFormat:@"<%@ %@ %@ read:%@, write:%@>", v4, self->_source, self->_sessionIdentifier, self->_typesRequiringReadAuthorization, self->_typesRequiringShareAuthorization];

  return v5;
}

- (HKSource)source
{
  return self->_source;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSSet)typesRequiringShareAuthorization
{
  return self->_typesRequiringShareAuthorization;
}

- (NSSet)typesRequiringReadAuthorization
{
  return self->_typesRequiringReadAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesRequiringReadAuthorization, 0);
  objc_storeStrong((id *)&self->_typesRequiringShareAuthorization, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end