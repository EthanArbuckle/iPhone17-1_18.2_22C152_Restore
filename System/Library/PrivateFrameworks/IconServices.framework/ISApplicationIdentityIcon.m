@interface ISApplicationIdentityIcon
+ (BOOL)supportsSecureCoding;
- (ISApplicationIdentityIcon)initWithApplicationIdentity:(id)a3;
- (ISApplicationIdentityIcon)initWithCoder:(id)a3;
- (NSString)identityString;
- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3;
- (id)_resourceForPersona:(unint64_t)a3;
- (id)description;
- (id)makeResourceProvider;
- (id)makeSymbolResourceProvider;
- (unint64_t)_personaType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISApplicationIdentityIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISApplicationIdentityIcon)initWithApplicationIdentity:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 identityString];
  v8 = [v6 stringByAppendingPathComponent:v7];

  id v32 = 0;
  v9 = [v4 findApplicationRecordWithError:&v32];
  id v10 = v32;
  if (!v9)
  {
    v18 = _ISDefaultLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v19 = [v4 identityString];
    v20 = [v10 localizedDescription];
    *(_DWORD *)buf = 138412546;
    v34 = v19;
    __int16 v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_1AE771000, v18, OS_LOG_TYPE_DEFAULT, "No record for identity: %@. Error: %@", buf, 0x16u);

    goto LABEL_15;
  }
  if ([v9 isPlaceholder])
  {
    v11 = [v9 URL];
    v12 = objc_msgSend(v11, "__is__contentModifiedDate");

    v13 = NSString;
    [v12 timeIntervalSinceReferenceDate];
    v15 = objc_msgSend(v13, "stringWithFormat:", @"%f", v14);
    v16 = [v8 stringByAppendingPathComponent:v15];

    v17 = _ISDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ISApplicationIdentityIcon initWithApplicationIdentity:]();
    }

LABEL_11:
    goto LABEL_12;
  }
  v21 = [v9 persistentIdentifier];

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E4F29128];
    v23 = [v9 persistentIdentifier];
    v24 = objc_msgSend(v22, "_IF_UUIDWithData:", v23);
    v25 = [v24 UUIDString];
    v16 = [v8 stringByAppendingPathComponent:v25];

    v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ISApplicationIdentityIcon initWithApplicationIdentity:]();
    }
    goto LABEL_11;
  }
  v16 = v8;
LABEL_12:
  v18 = [v9 alternateIconName];
  if (v18)
  {
    v8 = [v16 stringByAppendingPathComponent:v18];

    v19 = _ISDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ISApplicationIdentityIcon initWithApplicationIdentity:]();
    }
LABEL_15:

    goto LABEL_17;
  }
  v8 = v16;
LABEL_17:

  v26 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v8);
  v31.receiver = self;
  v31.super_class = (Class)ISApplicationIdentityIcon;
  v27 = [(ISConcreteIcon *)&v31 initWithDigest:v26];
  if (v27)
  {
    uint64_t v28 = [v4 identityString];
    identityString = v27->_identityString;
    v27->_identityString = (NSString *)v28;
  }
  return v27;
}

- (ISApplicationIdentityIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISApplicationIdentityIcon;
  v5 = [(ISConcreteIcon *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityString"];
    identityString = v5->_identityString;
    v5->_identityString = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISApplicationIdentityIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityString, @"identityString", v5.receiver, v5.super_class);
}

- (id)_resourceForPersona:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:10];
  v11[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v3 setSymbolColors:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:4];
  id v10 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v3 setEnclosureColors:v7];

  [v3 setRenderingMode:3];
  v8 = +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:v3 symbolName:@"frying.pan" url:0];

  return v8;
}

- (unint64_t)_personaType
{
  id v3 = objc_alloc(MEMORY[0x1E4F223B0]);
  id v4 = [(ISApplicationIdentityIcon *)self identityString];
  objc_super v5 = (void *)[v3 initWithIdentityString:v4];

  unint64_t v6 = [v5 personaType];
  return v6;
}

- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F223B0]);
  unint64_t v6 = [(ISApplicationIdentityIcon *)self identityString];
  v7 = (void *)[v5 initWithIdentityString:v6];

  [(ISApplicationIdentityIcon *)self _personaType];
  id v23 = 0;
  v8 = [v7 findApplicationRecordWithError:&v23];
  id v9 = v23;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = 1;
  }
  else
  {
    v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1AE771000, v12, OS_LOG_TYPE_DEFAULT, "Unable to create resource provider for %@ - unable to find record. Error: %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F22490];
    v15 = [(id)*MEMORY[0x1E4F44320] identifier];
    id v10 = [v14 typeRecordWithIdentifier:v15];

    if (v10) {
      id v16 = v10;
    }

    uint64_t v11 = 0;
  }
  v17 = [[ISRecordResourceProvider alloc] initWithRecord:v10 options:0];
  v18 = v17;
  if (v3)
  {
    v19 = [(ISRecordResourceProvider *)v17 iconResource];

    if (!v19)
    {
      v20 = _ISDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ISApplicationIdentityIcon _makeResourceProviderAllowIconResourceFallback:]();
      }

      v21 = +[ISResourceProvider defaultAppIconResourceProvider];

      [(ISResourceProvider *)v21 setPlaceholder:1];
      v18 = v21;
    }
  }
  [(ISResourceProvider *)v18 setResourceType:v11];

  return v18;
}

- (id)makeResourceProvider
{
  return [(ISApplicationIdentityIcon *)self _makeResourceProviderAllowIconResourceFallback:1];
}

- (id)makeSymbolResourceProvider
{
  return [(ISApplicationIdentityIcon *)self _makeResourceProviderAllowIconResourceFallback:0];
}

- (id)description
{
  BOOL v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ISApplicationIdentityIcon;
  id v4 = [(ISApplicationIdentityIcon *)&v9 description];
  id v5 = [(ISApplicationIdentityIcon *)self identityString];
  unint64_t v6 = [(ISConcreteIcon *)self digest];
  v7 = [v3 stringWithFormat:@"%@ identity: %@ digest: %@", v4, v5, v6];

  return v7;
}

- (NSString)identityString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithApplicationIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Custom icon suffixed identity bundle ID: %@", v2, v3, v4, v5, v6);
}

- (void)initWithApplicationIdentity:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Placeholder identity bundle suffixed bundle ID: %@", v2, v3, v4, v5, v6);
}

- (void)initWithApplicationIdentity:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Suffixed identity bundle ID: %@", v2, v3, v4, v5, v6);
}

- (void)_makeResourceProviderAllowIconResourceFallback:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1AE771000, v1, OS_LOG_TYPE_ERROR, "Failed to find icon resources for application identity %@ - %@. Creating placeholder provider", v2, 0x16u);
}

@end