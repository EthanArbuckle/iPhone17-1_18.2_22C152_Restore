@interface AKCompanionKeyEnvelope
+ (BOOL)supportsSecureCoding;
- (AKCompanionKeyEnvelope)initWithAltDSID:(id)a3 machineID:(id)a4 continuationKey:(id)a5 passwordResetKey:(id)a6;
- (AKCompanionKeyEnvelope)initWithCoder:(id)a3;
- (AKCompanionKeyEnvelope)initWithUsername:(id)a3 altDSID:(id)a4 machineID:(id)a5 continuationKey:(id)a6 passwordResetKey:(id)a7;
- (NSString)altDSID;
- (NSString)continuationKey;
- (NSString)machineID;
- (NSString)passwordResetKey;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKCompanionKeyEnvelope

- (AKCompanionKeyEnvelope)initWithUsername:(id)a3 altDSID:(id)a4 machineID:(id)a5 continuationKey:(id)a6 passwordResetKey:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AKCompanionKeyEnvelope;
  v17 = [(AKCompanionKeyEnvelope *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_username, a3);
    objc_storeStrong((id *)&v18->_altDSID, a4);
    objc_storeStrong((id *)&v18->_machineID, a5);
    objc_storeStrong((id *)&v18->_continuationKey, a6);
    objc_storeStrong((id *)&v18->_passwordResetKey, a7);
  }

  return v18;
}

- (AKCompanionKeyEnvelope)initWithAltDSID:(id)a3 machineID:(id)a4 continuationKey:(id)a5 passwordResetKey:(id)a6
{
  return [(AKCompanionKeyEnvelope *)self initWithUsername:0 altDSID:a3 machineID:a4 continuationKey:a5 passwordResetKey:a6];
}

- (AKCompanionKeyEnvelope)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"continuationKey"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passwordResetKey"];
  v10 = (void *)v9;
  if (!v6 || !v7 || !v8 || !v9)
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKCompanionKeyEnvelope initWithCoder:]((uint64_t)v4, v11);
    }

    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v12];
  }
  id v13 = [(AKCompanionKeyEnvelope *)self initWithUsername:v5 altDSID:v6 machineID:v7 continuationKey:v8 passwordResetKey:v10];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKCompanionKeyEnvelope *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  v6 = [(AKCompanionKeyEnvelope *)self altDSID];
  [v4 encodeObject:v6 forKey:@"altDSID"];

  v7 = [(AKCompanionKeyEnvelope *)self machineID];
  [v4 encodeObject:v7 forKey:@"machineID"];

  v8 = [(AKCompanionKeyEnvelope *)self continuationKey];
  [v4 encodeObject:v8 forKey:@"continuationKey"];

  id v9 = [(AKCompanionKeyEnvelope *)self passwordResetKey];
  [v4 encodeObject:v9 forKey:@"passwordResetKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AKCompanionKeyEnvelope alloc];
  id v16 = [(AKCompanionKeyEnvelope *)self username];
  v5 = (void *)[v16 copy];
  v6 = [(AKCompanionKeyEnvelope *)self altDSID];
  v7 = (void *)[v6 copy];
  v8 = [(AKCompanionKeyEnvelope *)self machineID];
  id v9 = (void *)[v8 copy];
  v10 = [(AKCompanionKeyEnvelope *)self continuationKey];
  v11 = (void *)[v10 copy];
  v12 = [(AKCompanionKeyEnvelope *)self passwordResetKey];
  id v13 = (void *)[v12 copy];
  id v14 = [(AKCompanionKeyEnvelope *)v4 initWithUsername:v5 altDSID:v7 machineID:v9 continuationKey:v11 passwordResetKey:v13];

  return v14;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSString)continuationKey
{
  return self->_continuationKey;
}

- (NSString)passwordResetKey
{
  return self->_passwordResetKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordResetKey, 0);
  objc_storeStrong((id *)&self->_continuationKey, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to decode companion key envelope with coder (%@)", (uint8_t *)&v2, 0xCu);
}

@end