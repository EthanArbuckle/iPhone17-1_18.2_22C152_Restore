@interface FMInternalKeychainItem
- (FMInternalKeychainItem)initWithResults:(id)a3;
- (NSData)rawData;
- (NSDate)creationDate;
- (NSDate)lastModifyDate;
- (NSString)password;
- (void)setCreationDate:(id)a3;
- (void)setLastModifyDate:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRawData:(id)a3;
@end

@implementation FMInternalKeychainItem

- (FMInternalKeychainItem)initWithResults:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FMInternalKeychainItem;
  v5 = [(FMInternalKeychainItem *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B688]];
    v7 = objc_opt_new();
    char v8 = [v6 isEqualToData:v7];

    uint64_t v9 = [v6 length];
    uint64_t v10 = *MEMORY[0x1E4F3BD38];
    v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    v12 = objc_opt_new();
    char v13 = [v11 isEqualToData:v12];

    uint64_t v14 = [v11 length];
    if (v6 && (v8 & 1) == 0 && v9)
    {
      id v15 = v6;
    }
    else
    {
      if (v11) {
        char v16 = v13;
      }
      else {
        char v16 = 1;
      }
      if ((v16 & 1) != 0
        || !v14
        || ([v4 objectForKeyedSubscript:v10], (id v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {

        v20 = 0;
        goto LABEL_15;
      }
    }
    v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];
    [(FMInternalKeychainItem *)v5 setCreationDate:v17];

    v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B790]];
    [(FMInternalKeychainItem *)v5 setLastModifyDate:v18];

    [(FMInternalKeychainItem *)v5 setRawData:v15];
    v19 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
    [(FMInternalKeychainItem *)v5 setPassword:v19];
  }
  v20 = v5;
LABEL_15:

  return v20;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSDate)lastModifyDate
{
  return self->_lastModifyDate;
}

- (void)setLastModifyDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastModifyDate, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end