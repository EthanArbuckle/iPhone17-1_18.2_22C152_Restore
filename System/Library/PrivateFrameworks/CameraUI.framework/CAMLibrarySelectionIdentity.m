@interface CAMLibrarySelectionIdentity
+ (id)identityWithDevice:(id)a3;
+ (id)identityWithPerson:(id)a3;
+ (id)identityWithPhotosIdentity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CAMLibrarySelectionIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5;
- (NSArray)contactIdentifiers;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CAMLibrarySelectionIdentity

+ (id)identityWithPerson:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 contactID];
  v6 = +[CAMCaptureCapabilities capabilities];
  int v7 = [v6 librarySelectionMockAutomationModeEnabled];

  if (v7)
  {
    v8 = @"mockContactID";
    if (v5) {
      v8 = v5;
    }
    v9 = v8;

    v5 = v9;
LABEL_6:
    int v10 = 0;
    if ([(__CFString *)v5 length]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v5) {
    goto LABEL_6;
  }
  int v10 = 1;
LABEL_9:
  v11 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v20 = v4;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Person has unresolved contactID: %{private}@", buf, 0xCu);
  }

LABEL_12:
  id v12 = objc_alloc((Class)a1);
  v13 = [v4 identifier];
  v14 = [v4 identifier];
  if (v10)
  {
    v15 = (void *)[v12 initWithPhoneNumber:v13 emailAddress:v14 contactIdentifiers:0];
  }
  else
  {
    v18 = v5;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v15 = (void *)[v12 initWithPhoneNumber:v13 emailAddress:v14 contactIdentifiers:v16];
  }
  return v15;
}

+ (id)identityWithPhotosIdentity:(id)a3
{
  id v3 = a3;
  id v4 = [CAMLibrarySelectionIdentity alloc];
  v5 = [v3 phoneNumber];
  v6 = [v3 emailAddress];
  int v7 = [v3 contactIdentifiers];

  v8 = [(CAMLibrarySelectionIdentity *)v4 initWithPhoneNumber:v5 emailAddress:v6 contactIdentifiers:v7];
  return v8;
}

- (CAMLibrarySelectionIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CAMLibrarySelectionIdentity;
  v11 = [(CAMLibrarySelectionIdentity *)&v19 init];
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

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = CAMLibrarySelectionIdentityDescription(self);
  int v7 = [v3 stringWithFormat:@"<%@:%p; %@>", v5, self, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CAMLibrarySelectionIdentity *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(CAMLibrarySelectionIdentity *)self phoneNumber];
      if (v6
        || ([(CAMLibrarySelectionIdentity *)v5 phoneNumber],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v7 = [(CAMLibrarySelectionIdentity *)self phoneNumber];
        id v8 = [(CAMLibrarySelectionIdentity *)v5 phoneNumber];
        int v9 = [v7 isEqualToString:v8];

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
      v11 = [(CAMLibrarySelectionIdentity *)self emailAddress];
      if (!v11)
      {
        id v3 = [(CAMLibrarySelectionIdentity *)v5 emailAddress];
        if (!v3)
        {
LABEL_14:
          v15 = [(CAMLibrarySelectionIdentity *)self contactIdentifiers];
          if (v15
            || ([(CAMLibrarySelectionIdentity *)v5 contactIdentifiers],
                (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v16 = [(CAMLibrarySelectionIdentity *)self contactIdentifiers];
            v17 = [(CAMLibrarySelectionIdentity *)v5 contactIdentifiers];
            char v10 = [v16 isEqualToArray:v17];

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
      uint64_t v12 = [(CAMLibrarySelectionIdentity *)self emailAddress];
      v13 = [(CAMLibrarySelectionIdentity *)v5 emailAddress];
      int v14 = [v12 isEqualToString:v13];

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

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(CAMLibrarySelectionIdentity *)self phoneNumber];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(CAMLibrarySelectionIdentity *)self phoneNumber];
    unint64_t v6 = [v5 hash] + 31;
  }
  else
  {
    unint64_t v6 = 1;
  }
  int v7 = [(CAMLibrarySelectionIdentity *)self emailAddress];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int v9 = [(CAMLibrarySelectionIdentity *)self emailAddress];
    unint64_t v6 = [v9 hash] - v6 + 32 * v6;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v10 = [(CAMLibrarySelectionIdentity *)self contactIdentifiers];
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
        unint64_t v6 = [*(id *)(*((void *)&v16 + 1) + 8 * v14++) hash] - v6 + 32 * v6;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CAMLibrarySelectionIdentity alloc];
  v5 = [(CAMLibrarySelectionIdentity *)self phoneNumber];
  unint64_t v6 = [(CAMLibrarySelectionIdentity *)self emailAddress];
  int v7 = [(CAMLibrarySelectionIdentity *)self contactIdentifiers];
  uint64_t v8 = [(CAMLibrarySelectionIdentity *)v4 initWithPhoneNumber:v5 emailAddress:v6 contactIdentifiers:v7];

  return v8;
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

+ (id)identityWithDevice:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 contactIdentifier];
  unint64_t v6 = +[CAMCaptureCapabilities capabilities];
  int v7 = [v6 librarySelectionMockAutomationModeEnabled];

  if (v7)
  {
    uint64_t v8 = @"mockContactID";
    if (v5) {
      uint64_t v8 = v5;
    }
    int v9 = v8;

    v5 = v9;
LABEL_6:
    int v10 = 0;
    if ([(__CFString *)v5 length]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v5) {
    goto LABEL_6;
  }
  int v10 = 1;
LABEL_9:
  uint64_t v11 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v20 = v4;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Device has unresolved contactID: %{private}@", buf, 0xCu);
  }

LABEL_12:
  id v12 = objc_alloc((Class)a1);
  uint64_t v13 = [v4 accountID];
  uint64_t v14 = [v4 accountID];
  if (v10)
  {
    v15 = (void *)[v12 initWithPhoneNumber:v13 emailAddress:v14 contactIdentifiers:0];
  }
  else
  {
    long long v18 = v5;
    long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v15 = (void *)[v12 initWithPhoneNumber:v13 emailAddress:v14 contactIdentifiers:v16];
  }
  return v15;
}

@end