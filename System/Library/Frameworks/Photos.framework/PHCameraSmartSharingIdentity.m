@interface PHCameraSmartSharingIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)contactIdentifiers;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (PHCameraSmartSharingIdentity)initWithCoder:(id)a3;
- (PHCameraSmartSharingIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHCameraSmartSharingIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
  [v4 encodeObject:v5 forKey:@"phoneNumber"];

  v6 = [(PHCameraSmartSharingIdentity *)self emailAddress];
  [v4 encodeObject:v6 forKey:@"emailAddress"];

  id v7 = [(PHCameraSmartSharingIdentity *)self contactIdentifiers];
  [v4 encodeObject:v7 forKey:@"contactIdentifiers"];
}

- (PHCameraSmartSharingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v8 = [v4 decodeArrayOfObjectsOfClasses:v7 forKey:@"contactIdentifiers"];

  if ([v5 length] || objc_msgSend(v6, "length") || objc_msgSend(v8, "count"))
  {
    self = [(PHCameraSmartSharingIdentity *)self initWithPhoneNumber:v5 emailAddress:v6 contactIdentifiers:v8];
    v9 = self;
  }
  else
  {
    v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingIdentity] decode fail, no valid properties", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
    unint64_t v6 = [v5 hash];
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = [(PHCameraSmartSharingIdentity *)self emailAddress];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(PHCameraSmartSharingIdentity *)self emailAddress];
    v6 ^= [v9 hash];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(PHCameraSmartSharingIdentity *)self contactIdentifiers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v6 ^= [*(id *)(*((void *)&v16 + 1) + 8 * v14++) hash];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (PHCameraSmartSharingIdentity *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
      if (v6
        || ([(PHCameraSmartSharingIdentity *)v5 phoneNumber],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v7 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
        uint64_t v8 = [(PHCameraSmartSharingIdentity *)v5 phoneNumber];
        int v9 = [v7 isEqual:v8];

        if (v6)
        {

          if (!v9) {
            goto LABEL_19;
          }
        }
        else
        {

          if ((v9 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v11 = [(PHCameraSmartSharingIdentity *)self emailAddress];
      if (!v11)
      {
        v3 = [(PHCameraSmartSharingIdentity *)v5 emailAddress];
        if (!v3)
        {
LABEL_14:
          v15 = [(PHCameraSmartSharingIdentity *)self contactIdentifiers];
          if (v15
            || ([(PHCameraSmartSharingIdentity *)v5 contactIdentifiers],
                (v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            long long v16 = [(PHCameraSmartSharingIdentity *)self contactIdentifiers];
            long long v17 = [(PHCameraSmartSharingIdentity *)v5 contactIdentifiers];
            char v10 = [v16 isEqual:v17];

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            char v10 = 1;
          }

          goto LABEL_23;
        }
      }
      uint64_t v12 = [(PHCameraSmartSharingIdentity *)self emailAddress];
      uint64_t v13 = [(PHCameraSmartSharingIdentity *)v5 emailAddress];
      int v14 = [v12 isEqual:v13];

      if (v11)
      {

        if (v14) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_14;
        }
      }
    }
LABEL_19:
    char v10 = 0;
    goto LABEL_20;
  }
  char v10 = 1;
LABEL_20:

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PHCameraSmartSharingIdentity *)self phoneNumber];
  id v7 = [(PHCameraSmartSharingIdentity *)self emailAddress];
  uint64_t v8 = [(PHCameraSmartSharingIdentity *)self contactIdentifiers];
  int v9 = [v8 componentsJoinedByString:@", "];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; phoneNumber:%@ emailAddress:%@ contactIdentifier:%@>",
    v5,
    self,
    v6,
    v7,
  char v10 = v9);

  return v10;
}

- (PHCameraSmartSharingIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHCameraSmartSharingIdentity;
  uint64_t v11 = [(PHCameraSmartSharingIdentity *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    phoneNumber = v11->_phoneNumber;
    v11->_phoneNumber = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    emailAddress = v11->_emailAddress;
    v11->_emailAddress = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    contactIdentifiers = v11->_contactIdentifiers;
    v11->_contactIdentifiers = (NSArray *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end