@interface LNTranscriptMatchingPredicate
+ (BOOL)supportsSecureCoding;
- (LNEntityIdentifier)entityIdentifier;
- (LNTranscriptMatchingPredicate)initWithBundleIdentifier:(id)a3 type:(int64_t)a4 executionUUID:(id)a5 entityIdentifier:(id)a6 actionType:(id)a7 entityType:(id)a8;
- (LNTranscriptMatchingPredicate)initWithCoder:(id)a3;
- (NSString)actionType;
- (NSString)bundleIdentifier;
- (NSString)entityType;
- (NSUUID)executionUUID;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation LNTranscriptMatchingPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)entityType
{
  return self->_entityType;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (LNEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNTranscriptMatchingPredicate *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNTranscriptMatchingPredicate type](self, "type"), @"type");
  v6 = [(LNTranscriptMatchingPredicate *)self executionUUID];
  [v4 encodeObject:v6 forKey:@"executionUUID"];

  v7 = [(LNTranscriptMatchingPredicate *)self entityIdentifier];
  [v4 encodeObject:v7 forKey:@"entityIdentifier"];

  v8 = [(LNTranscriptMatchingPredicate *)self actionType];
  [v4 encodeObject:v8 forKey:@"actionType"];

  id v9 = [(LNTranscriptMatchingPredicate *)self entityType];
  [v4 encodeObject:v9 forKey:@"entityType"];
}

- (LNTranscriptMatchingPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionUUID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityIdentifier"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionType"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityType"];

  v11 = [(LNTranscriptMatchingPredicate *)self initWithBundleIdentifier:v5 type:v6 executionUUID:v7 entityIdentifier:v8 actionType:v9 entityType:v10];
  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNTranscriptMatchingPredicate *)self bundleIdentifier];
  unint64_t v7 = [(LNTranscriptMatchingPredicate *)self type] - 1;
  if (v7 > 2) {
    v8 = @"Donation Record";
  }
  else {
    v8 = off_1E5B3A3A0[v7];
  }
  id v9 = [(LNTranscriptMatchingPredicate *)self executionUUID];
  v10 = [(LNTranscriptMatchingPredicate *)self entityIdentifier];
  v11 = [(LNTranscriptMatchingPredicate *)self actionType];
  v12 = [(LNTranscriptMatchingPredicate *)self entityType];
  v13 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, type: %@, executionUUID: %@, entityIdentifier: %@, actionType: %@, entityType: %@>", v5, self, v6, v8, v9, v10, v11, v12];

  return v13;
}

- (LNTranscriptMatchingPredicate)initWithBundleIdentifier:(id)a3 type:(int64_t)a4 executionUUID:(id)a5 entityIdentifier:(id)a6 actionType:(id)a7 entityType:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LNTranscriptMatchingPredicate;
  v19 = [(LNTranscriptMatchingPredicate *)&v32 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    v19->_type = a4;
    uint64_t v22 = [v15 copy];
    executionUUID = v19->_executionUUID;
    v19->_executionUUID = (NSUUID *)v22;

    uint64_t v24 = [v16 copy];
    entityIdentifier = v19->_entityIdentifier;
    v19->_entityIdentifier = (LNEntityIdentifier *)v24;

    uint64_t v26 = [v17 copy];
    actionType = v19->_actionType;
    v19->_actionType = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    entityType = v19->_entityType;
    v19->_entityType = (NSString *)v28;

    v30 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end