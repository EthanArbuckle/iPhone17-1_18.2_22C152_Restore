@interface CSLPRFStingConfigurationHistoryData
+ (BOOL)supportsSecureCoding;
+ (id)fromExportData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingConfigurationHistoryData)init;
- (CSLPRFStingConfigurationHistoryData)initWithCoder:(id)a3;
- (NSDictionary)actionsDictionary;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toExportData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionsDictionary:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CSLPRFStingConfigurationHistoryData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsDictionary, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setActionsDictionary:(id)a3
{
}

- (NSDictionary)actionsDictionary
{
  return self->_actionsDictionary;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (id)toExportData
{
  [(CSLPRFStingConfigurationHistoryData *)self setVersion:@"0.2"];
  v3 = (void *)MEMORY[0x263F08910];
  return (id)[v3 archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_version withName:@"version" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_actionsDictionary withName:@"actions" skipIfNil:1];
  v5 = [v3 build];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  version = self->_version;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CSLPRFStingConfigurationHistoryData_isEqual___block_invoke;
  v18[3] = &unk_264A0B520;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:version counterpart:v18];
  actionsDictionary = self->_actionsDictionary;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __47__CSLPRFStingConfigurationHistoryData_isEqual___block_invoke_2;
  v16 = &unk_264A0BBC8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:actionsDictionary counterpart:&v13];
  LOBYTE(actionsDictionary) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)actionsDictionary;
}

uint64_t __47__CSLPRFStingConfigurationHistoryData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) version];
}

uint64_t __47__CSLPRFStingConfigurationHistoryData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionsDictionary];
}

- (unint64_t)hash
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_version];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_actionsDictionary;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = (id)[v3 appendObject:*(void *)(*((void *)&v19 + 1) + 8 * v15++)];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  unint64_t v17 = [v3 hash];
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingConfigurationHistoryData);
  v5 = (void *)[(NSString *)self->_version copy];
  [(CSLPRFStingConfigurationHistoryData *)v4 setVersion:v5];

  uint64_t v6 = (void *)[(NSDictionary *)self->_actionsDictionary copy];
  [(CSLPRFStingConfigurationHistoryData *)v4 setActionsDictionary:v6];

  return v4;
}

- (CSLPRFStingConfigurationHistoryData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFStingConfigurationHistoryData;
  v5 = [(CSLPRFStingConfigurationHistoryData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"actions"];
    actionsDictionary = v5->_actionsDictionary;
    v5->_actionsDictionary = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"version"];
  [v5 encodeObject:self->_actionsDictionary forKey:@"actions"];
}

- (CSLPRFStingConfigurationHistoryData)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFStingConfigurationHistoryData;
  v2 = [(CSLPRFStingConfigurationHistoryData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSLPRFStingConfigurationHistoryData *)v2 setVersion:@"0.2"];
  }
  return v3;
}

+ (id)fromExportData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v5 decodeObjectOfClasses:v12 forKey:*MEMORY[0x263F081D0]];
    uint64_t v14 = [v13 version];
    LOBYTE(v10) = [v14 isEqualToString:@"0.2"];

    if (v10)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = [v13 version];
        *(_DWORD *)buf = 138412802;
        id v20 = a1;
        __int16 v21 = 2112;
        id v22 = v18;
        __int16 v23 = 2112;
        long long v24 = @"0.2";
        _os_log_error_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_ERROR, "%@ unexpected model data version %@, expected %@", buf, 0x20u);
      }
      id v15 = 0;
    }
  }
  else
  {
    objc_super v5 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = a1;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_error_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_ERROR, "%@ incorrect data %@", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end