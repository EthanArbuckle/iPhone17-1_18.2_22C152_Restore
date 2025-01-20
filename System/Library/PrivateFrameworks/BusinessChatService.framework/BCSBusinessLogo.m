@interface BCSBusinessLogo
+ (BOOL)supportsSecureCoding;
+ (id)itemFromStatement:(sqlite3_stmt *)a3;
- (BCSBusinessLogo)initWithBusinessId:(id)a3 logo:(id)a4;
- (BCSBusinessLogo)initWithBusinessId:(id)a3 logoURL:(id)a4 logoFormat:(id)a5;
- (BCSBusinessLogo)initWithCoder:(id)a3;
- (BCSBusinessLogo)initWithMessage:(id)a3 logoURL:(id)a4;
- (BCSBusinessLogoItemIdentifier)identifier;
- (BCSEmailLogoParquetMessage)message;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSData)logo;
- (NSString)businessId;
- (NSString)logoFormat;
- (NSURL)logoURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemIdentifier;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessId:(id)a3;
- (void)setLogo:(id)a3;
- (void)setLogoFormat:(id)a3;
- (void)setLogoURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSBusinessLogo

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  sqlite3_column_int64(a3, 0);
  v4 = BCSEmailStoreDataFromStatement(a3);
  sqlite3_int64 v5 = sqlite3_column_int64(a3, 2);
  v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  v7 = 0;
  if (v4 && v5 == 2)
  {
    v8 = [[BCSEmailLogoParquetMessage alloc] initWithData:v4];
    if (v8)
    {
      v9 = [[BCSBusinessLogo alloc] initWithMessage:v8 logoURL:0];
      v7 = v9;
      if (v9)
      {
        [(BCSItem *)v9 setExpirationDate:v6];
        v10 = v7;
      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  sqlite3_bind_int64(a3, 1, [a4 truncatedHash]);
  v6 = [(BCSBusinessLogo *)self message];
  v7 = [v6 data];

  id v10 = v7;
  sqlite3_bind_blob(a3, 2, (const void *)[v10 bytes], objc_msgSend(v10, "length"), 0);
  sqlite3_bind_int64(a3, 3, 2);
  v8 = [(BCSItem *)self expirationDate];
  [v8 timeIntervalSince1970];
  sqlite3_bind_double(a3, 4, v9);
}

- (BCSBusinessLogo)initWithBusinessId:(id)a3 logo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSBusinessLogo;
  v8 = [(BCSItem *)&v16 init];
  if (v8)
  {
    double v9 = objc_alloc_init(BCSEmailLogoParquetMessage);
    message = v8->_message;
    v8->_message = v9;

    [(BCSEmailLogoParquetMessage *)v8->_message setBusinessId:v6];
    [(BCSEmailLogoParquetMessage *)v8->_message setLogo:v7];
    v11 = [BCSBusinessLogoItemIdentifier alloc];
    v12 = [(BCSEmailLogoParquetMessage *)v8->_message businessId];
    v13 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v11, v12);
    identifier = v8->_identifier;
    v8->_identifier = v13;
  }
  return v8;
}

- (BCSBusinessLogo)initWithBusinessId:(id)a3 logoURL:(id)a4 logoFormat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSBusinessLogo;
  v11 = [(BCSItem *)&v19 init];
  if (v11)
  {
    v12 = objc_alloc_init(BCSEmailLogoParquetMessage);
    message = v11->_message;
    v11->_message = v12;

    [(BCSEmailLogoParquetMessage *)v11->_message setBusinessId:v8];
    [(BCSEmailLogoParquetMessage *)v11->_message setLogoFormat:v10];
    objc_storeStrong((id *)&v11->_logoURL, a4);
    v14 = [BCSBusinessLogoItemIdentifier alloc];
    v15 = [(BCSEmailLogoParquetMessage *)v11->_message businessId];
    objc_super v16 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v14, v15);
    identifier = v11->_identifier;
    v11->_identifier = v16;
  }
  return v11;
}

- (BCSBusinessLogo)initWithMessage:(id)a3 logoURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BCSBusinessLogo;
  id v8 = [(BCSItem *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    message = v8->_message;
    v8->_message = (BCSEmailLogoParquetMessage *)v9;

    uint64_t v11 = [v7 copy];
    logoURL = v8->_logoURL;
    v8->_logoURL = (NSURL *)v11;

    v13 = [BCSBusinessLogoItemIdentifier alloc];
    v14 = [(BCSEmailLogoParquetMessage *)v8->_message businessId];
    v15 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v13, v14);
    identifier = v8->_identifier;
    v8->_identifier = v15;
  }
  return v8;
}

- (NSString)businessId
{
  return [(BCSEmailLogoParquetMessage *)self->_message businessId];
}

- (NSData)logo
{
  return [(BCSEmailLogoParquetMessage *)self->_message logo];
}

- (void)setLogo:(id)a3
{
}

- (NSString)logoFormat
{
  return [(BCSEmailLogoParquetMessage *)self->_message logoFormat];
}

- (id)itemIdentifier
{
  v2 = [(BCSBusinessLogo *)self identifier];
  v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  v2 = [(BCSBusinessLogo *)self identifier];
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  v2 = [(BCSBusinessLogo *)self identifier];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  sqlite3_int64 v5 = [(BCSBusinessLogo *)self identifier];
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  sqlite3_int64 v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    char v6 = [(BCSBusinessLogo *)self message];
    uint64_t v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[6];
    v5[6] = v7;

    uint64_t v9 = [(BCSBusinessLogo *)self logoURL];
    uint64_t v10 = [v9 copyWithZone:a3];
    uint64_t v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = [(BCSBusinessLogo *)self identifier];
    uint64_t v13 = [v12 copyWithZone:a3];
    v14 = (void *)v5[5];
    v5[5] = v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  sqlite3_int64 v5 = [(BCSBusinessLogo *)self message];
  char v6 = [v5 data];
  [v4 encodeObject:v6 forKey:@"Message"];

  id v7 = [(BCSBusinessLogo *)self logoURL];
  [v4 encodeObject:v7 forKey:@"LogoURL"];
}

- (BCSBusinessLogo)initWithCoder:(id)a3
{
  id v4 = a3;
  sqlite3_int64 v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Message"];
  char v6 = [[BCSEmailLogoParquetMessage alloc] initWithData:v5];
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LogoURL"];
    self = [(BCSBusinessLogo *)self initWithMessage:v6 logoURL:v7];

    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBusinessId:(id)a3
{
}

- (void)setLogoFormat:(id)a3
{
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
}

- (BCSBusinessLogoItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSEmailLogoParquetMessage)message
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
  objc_storeStrong((id *)&self->_logoFormat, 0);

  objc_storeStrong((id *)&self->_businessId, 0);
}

@end