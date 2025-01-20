@interface BCSBusinessCallerItem
+ (BOOL)supportsSecureCoding;
+ (id)itemFromStatement:(sqlite3_stmt *)a3;
+ (id)itemsFromRecords:(id)a3;
- (BCSBusinessCallerItem)initWithCoder:(id)a3;
- (BCSBusinessCallerItem)initWithParquetMessage:(id)a3;
- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 name:(id)a4 department:(id)a5 logoURL:(id)a6 logo:(id)a7 logoFormat:(id)a8 verified:(BOOL)a9;
- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 phoneHash:(int64_t)a4 localizedNames:(id)a5 localizedDepartments:(id)a6 logoURL:(id)a7 logo:(id)a8 logoFormat:(id)a9 verified:(BOOL)a10;
- (BCSBusinessCallerItemIdentifier)identifier;
- (BCSCallerIdParquetMessage)message;
- (BOOL)isVerified;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSData)logo;
- (NSDictionary)localizedDepartments;
- (NSDictionary)localizedNames;
- (NSString)department;
- (NSString)logoFormat;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)logoURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)itemIdentifier;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setLogoURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSBusinessCallerItem

- (BCSBusinessCallerItem)initWithParquetMessage:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v5 = [v3 names];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v7 = v3;
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  v9 = [v3 intents];
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v11 = [v3 names];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v17 isDefault])
        {
          uint64_t v18 = [v17 text];

          v14 = (void *)v18;
        }
        v19 = [v17 text];
        v20 = [v17 locale];
        [v6 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v21 = [v7 names];
  v22 = (BCSBusinessCallerItem *)[v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (!v22)
  {
    v23 = 0;
    v33 = self;
    goto LABEL_25;
  }
  v38 = v7;
  v23 = 0;
  uint64_t v24 = *(void *)v41;
  do
  {
    for (j = 0; j != v22; j = (BCSBusinessCallerItem *)((char *)j + 1))
    {
      if (*(void *)v41 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
      if ([v26 isDefault])
      {
        uint64_t v27 = [v26 text];

        v23 = (void *)v27;
      }
      v28 = [v26 text];
      v29 = [v26 locale];
      [v10 setObject:v28 forKeyedSubscript:v29];
    }
    v22 = (BCSBusinessCallerItem *)[v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
  }
  while (v22);

  if (!v14)
  {
    v7 = v38;
    goto LABEL_27;
  }
  v7 = v38;
  if (!v23)
  {
LABEL_27:
    v33 = self;
    goto LABEL_28;
  }
  v21 = [v38 phoneNumber];
  uint64_t v37 = [v38 phoneHash];
  v36 = [v38 names];
  v30 = [v38 intents];
  v31 = [v38 logo];
  v32 = [v38 logoFormat];
  LOBYTE(v35) = [v38 isVerified];
  v22 = [(BCSBusinessCallerItem *)self initWithPhoneNumber:v21 phoneHash:v37 localizedNames:v36 localizedDepartments:v30 logoURL:0 logo:v31 logoFormat:v32 verified:v35];

  v33 = v22;
LABEL_25:

LABEL_28:
  return v22;
}

+ (id)itemsFromRecords:(id)a3
{
  return 0;
}

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  sqlite3_column_int64(a3, 0);
  id v4 = sqlite3_column_text(a3, 1);
  if (v4)
  {
    v5 = [NSString stringWithUTF8String:v4];
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)sqlite3_column_blob(a3, 2);
  int v7 = sqlite3_column_bytes(a3, 2);
  if (v6)
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:v7];
  }
  id v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  if (v6)
  {
    v9 = [[BCSCallerIdParquetMessage alloc] initWithData:v6];
    if (v9)
    {
      v10 = [[BCSBusinessCallerItem alloc] initWithParquetMessage:v9];
      v11 = v10;
      if (v10)
      {
        [(BCSItem *)v10 setExpirationDate:v8];
        uint64_t v12 = v11;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  sqlite3_bind_int64(a3, 1, [a4 truncatedHash]);
  v6 = [(BCSBusinessCallerItem *)self message];
  id v7 = [v6 phoneNumber];
  sqlite3_bind_text(a3, 2, (const char *)[v7 UTF8String], -1, 0);

  id v8 = [(BCSBusinessCallerItem *)self message];
  v9 = [v8 data];

  id v12 = v9;
  sqlite3_bind_blob(a3, 3, (const void *)[v12 bytes], objc_msgSend(v12, "length"), 0);
  v10 = [(BCSItem *)self expirationDate];
  [v10 timeIntervalSince1970];
  sqlite3_bind_double(a3, 4, v11);
}

- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 name:(id)a4 department:(id)a5 logoURL:(id)a6 logo:(id)a7 logoFormat:(id)a8 verified:(BOOL)a9
{
  v31[1] = *MEMORY[0x263EF8340];
  id v28 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[BCSBusinessCallerItemIdentifier alloc] initWithPhoneNumber:v16];
  uint64_t v18 = [MEMORY[0x263EFF960] currentLocale];
  v19 = [v18 languageCode];

  v20 = objc_alloc_init(BCSCallerIdLocalizedString);
  [(BCSCallerIdLocalizedString *)v20 setLocale:v19];
  [(BCSCallerIdLocalizedString *)v20 setText:v15];

  [(BCSCallerIdLocalizedString *)v20 setIsDefault:1];
  v21 = objc_alloc_init(BCSCallerIdLocalizedString);
  [(BCSCallerIdLocalizedString *)v21 setLocale:v19];
  [(BCSCallerIdLocalizedString *)v21 setText:v14];

  [(BCSCallerIdLocalizedString *)v21 setIsDefault:1];
  uint64_t v22 = [(BCSBusinessCallerItemIdentifier *)v17 truncatedHash];
  v31[0] = v20;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  v30 = v21;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  LOBYTE(v27) = a9;
  v25 = [(BCSBusinessCallerItem *)self initWithPhoneNumber:v16 phoneHash:v22 localizedNames:v23 localizedDepartments:v24 logoURL:v13 logo:v28 logoFormat:@"heic" verified:v27];

  return v25;
}

- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 phoneHash:(int64_t)a4 localizedNames:(id)a5 localizedDepartments:(id)a6 logoURL:(id)a7 logo:(id)a8 logoFormat:(id)a9 verified:(BOOL)a10
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = (__CFString *)a9;
  v51.receiver = self;
  v51.super_class = (Class)BCSBusinessCallerItem;
  uint64_t v22 = [(BCSItem *)&v51 init];
  if (v22)
  {
    v23 = objc_alloc_init(BCSCallerIdParquetMessage);
    message = v22->_message;
    v22->_message = v23;

    [(BCSCallerIdParquetMessage *)v22->_message setPhoneHash:a4];
    id v42 = v16;
    [(BCSCallerIdParquetMessage *)v22->_message setPhoneNumber:v16];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v41 = v17;
    id v25 = v17;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(v25);
          }
          [(BCSCallerIdParquetMessage *)v22->_message addName:*(void *)(*((void *)&v47 + 1) + 8 * i)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v27);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v18;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          [(BCSCallerIdParquetMessage *)v22->_message addIntent:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v32);
    }

    [(BCSCallerIdParquetMessage *)v22->_message setLogo:v20];
    [(BCSCallerIdParquetMessage *)v22->_message setIsVerified:a10];
    if (v19)
    {
      uint64_t v35 = [v19 copy];
      logoURL = v22->_logoURL;
      v22->_logoURL = (NSURL *)v35;
    }
    if (v21) {
      uint64_t v37 = v21;
    }
    else {
      uint64_t v37 = @"heic";
    }
    [(BCSCallerIdParquetMessage *)v22->_message setLogoFormat:v37];
    v38 = [[BCSBusinessCallerItemIdentifier alloc] initWithTruncatedHash:a4];
    identifier = v22->_identifier;
    v22->_identifier = v38;

    id v17 = v41;
    id v16 = v42;
  }

  return v22;
}

- (NSString)phoneNumber
{
  return [(BCSCallerIdParquetMessage *)self->_message phoneNumber];
}

- (void)setPhoneNumber:(id)a3
{
  id v4 = (id)[a3 copy];
  [(BCSCallerIdParquetMessage *)self->_message setPhoneNumber:v4];
}

- (NSString)name
{
  v2 = [(BCSCallerIdParquetMessage *)self->_message names];
  id v3 = [v2 defaultLocalizedStringsValue];

  return (NSString *)v3;
}

- (NSString)department
{
  v2 = [(BCSCallerIdParquetMessage *)self->_message intents];
  id v3 = [v2 defaultLocalizedStringsValue];

  return (NSString *)v3;
}

- (NSDictionary)localizedNames
{
  v2 = [(BCSCallerIdParquetMessage *)self->_message names];
  id v3 = [v2 localizedStringsToDictionary];

  return (NSDictionary *)v3;
}

- (NSDictionary)localizedDepartments
{
  v2 = [(BCSCallerIdParquetMessage *)self->_message intents];
  id v3 = [v2 localizedStringsToDictionary];

  return (NSDictionary *)v3;
}

- (NSData)logo
{
  return [(BCSCallerIdParquetMessage *)self->_message logo];
}

- (BOOL)isVerified
{
  return [(BCSCallerIdParquetMessage *)self->_message isVerified];
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessCallerItem;
  id v4 = [(BCSBusinessCallerItem *)&v13 description];
  v5 = [(BCSBusinessCallerItem *)self phoneNumber];
  v6 = [(BCSBusinessCallerItem *)self name];
  id v7 = [(BCSBusinessCallerItem *)self department];
  id v8 = [(BCSBusinessCallerItem *)self logoURL];
  v9 = [v8 absoluteString];
  v10 = [(BCSBusinessCallerItem *)self identifier];
  double v11 = [v3 stringWithFormat:@"%@ - phone:%@ name:%@ department:%@ logoURL:%@ (%@)", v4, v5, v6, v7, v9, v10];

  return v11;
}

- (NSString)logoFormat
{
  return [(BCSCallerIdParquetMessage *)self->_message logoFormat];
}

- (id)itemIdentifier
{
  v2 = [(BCSBusinessCallerItem *)self identifier];
  id v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  v2 = [(BCSBusinessCallerItem *)self identifier];
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  v2 = [(BCSBusinessCallerItem *)self identifier];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  v5 = [(BCSBusinessCallerItem *)self identifier];
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    char v6 = [(BCSBusinessCallerItem *)self message];
    uint64_t v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[4];
    v5[4] = v7;

    v9 = [(BCSBusinessCallerItem *)self logoURL];
    uint64_t v10 = [v9 copyWithZone:a3];
    double v11 = (void *)v5[2];
    v5[2] = v10;

    id v12 = [(BCSBusinessCallerItem *)self identifier];
    uint64_t v13 = [v12 copyWithZone:a3];
    id v14 = (void *)v5[3];
    v5[3] = v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BCSBusinessCallerItem *)self message];
  char v6 = [v5 data];
  [v4 encodeObject:v6 forKey:@"Message"];

  id v7 = [(BCSBusinessCallerItem *)self logoURL];
  [v4 encodeObject:v7 forKey:@"LogoURL"];
}

- (BCSBusinessCallerItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessCallerItem;
  v5 = [(BCSItem *)&v13 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Message"];
    id v7 = [[BCSCallerIdParquetMessage alloc] initWithData:v6];
    if (!v7)
    {

      double v11 = 0;
      goto LABEL_6;
    }
    id v8 = v7;
    v5 = [(BCSBusinessCallerItem *)v5 initWithParquetMessage:v7];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LogoURL"];
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v9;
  }
  v5 = v5;
  double v11 = v5;
LABEL_6:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
}

- (BCSBusinessCallerItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSCallerIdParquetMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_logoURL, 0);
}

@end