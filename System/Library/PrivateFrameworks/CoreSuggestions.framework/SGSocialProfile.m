@interface SGSocialProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSGSocialProfile:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)service;
- (NSString)teamIdentifier;
- (NSString)userIdentifier;
- (NSString)username;
- (SGSocialProfile)initWithCoder:(id)a3;
- (SGSocialProfile)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8 label:(id)a9 extractionInfo:(id)a10 recordId:(id)a11;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGSocialProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)username
{
  return self->_username;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGLabeledObject *)self label];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    v6 = [(SGLabeledObject *)self label];
  }
  else
  {
    v6 = @"unlabeled";
  }
  v7 = (void *)[v3 initWithFormat:@"%@/[%@ %@:%@:%@:%@:%@]", v6, self->_displayName, self->_bundleIdentifier, self->_username, self->_userIdentifier, self->_service, self->_teamIdentifier];
  if (v5) {

  }
  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  p_userIdentifier = &self->_userIdentifier;
  if (![(NSString *)self->_userIdentifier length]) {
    p_userIdentifier = &self->_username;
  }
  return [(NSString *)*p_userIdentifier hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToSGSocialProfile:(id)a3
{
  v4 = (id *)a3;
  if (![(SGLabeledObject *)self isEqualToLabeledObject:v4]) {
    goto LABEL_20;
  }
  username = self->_username;
  v6 = (NSString *)v4[5];
  if (username == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = username;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
  }
  userIdentifier = self->_userIdentifier;
  v11 = (NSString *)v4[6];
  if (userIdentifier == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = userIdentifier;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_20;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  v16 = (NSString *)v4[7];
  if (bundleIdentifier == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = bundleIdentifier;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_20;
    }
  }
  displayName = self->_displayName;
  v21 = (NSString *)v4[8];
  if (displayName == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = displayName;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_20;
    }
  }
  service = self->_service;
  v26 = (NSString *)v4[9];
  if (service == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = service;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_20:
      char v30 = 0;
      goto LABEL_21;
    }
  }
  v32 = self->_teamIdentifier;
  v33 = v32;
  if (v32 == v4[10]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSString isEqual:](v32, "isEqual:");
  }

LABEL_21:
  return v30;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGSocialProfile *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSocialProfile *)self isEqualToSGSocialProfile:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGSocialProfile;
  id v4 = a3;
  [(SGLabeledObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_username, @"username", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_userIdentifier forKey:@"userIdentifier"];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v4 encodeObject:self->_displayName forKey:@"displayName"];
  [v4 encodeObject:self->_service forKey:@"service"];
  [v4 encodeObject:self->_teamIdentifier forKey:@"teamIdentifier"];
}

- (SGSocialProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SGSocialProfile;
  objc_super v5 = [(SGLabeledObject *)&v27 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    if (!v12)
    {
      v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A4D8C000, v13, OS_LOG_TYPE_FAULT, "Nil bundle id used in SGSocialProfile", buf, 2u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      v12 = &stru_1EF915628;
    }
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = &v12->isa;
    v15 = v12;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v17;

    char v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"service"];
    service = v5->_service;
    v5->_service = (NSString *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v23;
  }
  return v5;
}

- (SGSocialProfile)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8 label:(id)a9 extractionInfo:(id)a10 recordId:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)SGSocialProfile;
  uint64_t v23 = [(SGLabeledObject *)&v37 initWithLabel:a9 extractionInfo:a10 recordId:a11];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    username = v23->_username;
    v23->_username = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    userIdentifier = v23->_userIdentifier;
    v23->_userIdentifier = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    displayName = v23->_displayName;
    v23->_displayName = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    service = v23->_service;
    v23->_service = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    teamIdentifier = v23->_teamIdentifier;
    v23->_teamIdentifier = (NSString *)v34;
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end