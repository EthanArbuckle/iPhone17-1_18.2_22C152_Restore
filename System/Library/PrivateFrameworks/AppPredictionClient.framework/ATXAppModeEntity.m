@interface ATXAppModeEntity
+ (BOOL)supportsSecureCoding;
- (ATXAppModeEntity)initWithBundleId:(id)a3;
- (ATXAppModeEntity)initWithBundleId:(id)a3 itunesGenreIds:(id)a4;
- (ATXAppModeEntity)initWithCoder:(id)a3;
- (ATXModeEntityScore)scoreMetadata;
- (BOOL)isEqual:(id)a3;
- (NSArray)itunesGenreIds;
- (NSString)bundleId;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)jsonDict;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setItunesGenreIds:(id)a3;
- (void)setScoreMetadata:(id)a3;
@end

@implementation ATXAppModeEntity

- (ATXAppModeEntity)initWithBundleId:(id)a3
{
  return [(ATXAppModeEntity *)self initWithBundleId:a3 itunesGenreIds:0];
}

- (ATXAppModeEntity)initWithBundleId:(id)a3 itunesGenreIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppModeEntity;
  v8 = [(ATXAppModeEntity *)&v13 init];
  if (v8)
  {
    if (!v6)
    {
      v9 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXAppModeEntity initWithBundleId:itunesGenreIds:](v9);
      }
    }
    uint64_t v10 = [v6 copy];
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v10;

    objc_storeStrong((id *)&v8->_itunesGenreIds, a4);
  }

  return v8;
}

- (id)identifier
{
  return self->_bundleId;
}

- (id)jsonDict
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"entityIdentifier";
  v3 = [(ATXAppModeEntity *)self identifier];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"scoreMetadata";
  v5 = [(ATXAppModeEntity *)self scoreMetadata];
  id v6 = [v5 jsonDict];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v7;
  v12[2] = @"genreId";
  v8 = [(NSArray *)self->_itunesGenreIds firstObject];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!v8) {

  }
  if (!v6) {
  if (!v3)
  }

  return v10;
}

- (NSString)debugDescription
{
  v2 = [(ATXAppModeEntity *)self jsonDict];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(ATXAppModeEntity *)self identifier];
  v5 = [(ATXAppModeEntity *)self scoreMetadata];
  [v5 score];
  id v7 = (void *)[v3 initWithFormat:@"entityIdentifier: %@, score: %.3f", v4, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXAppModeEntity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(ATXAppModeEntity *)self identifier];
      id v7 = [(ATXAppModeEntity *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ATXAppModeEntity *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXAppModeEntity *)self bundleId];
  [v4 encodeObject:v5 forKey:@"codingKeyForBundleId"];

  uint64_t v6 = [(ATXAppModeEntity *)self itunesGenreIds];
  [v4 encodeObject:v6 forKey:@"codingKeyForItunesGenreIds"];

  id v7 = [(ATXAppModeEntity *)self scoreMetadata];
  [v4 encodeObject:v7 forKey:@"codingKeyForScoreMetadata"];
}

- (ATXAppModeEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  char v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.appModeEntity" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    v12 = (void *)MEMORY[0x1AD0D3C30]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    v16 = __atxlog_handle_notification_management();
    v17 = [v11 robustDecodeObjectOfClasses:v15 forKey:@"codingKeyForItunesGenreIds" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appModeEntity" errorCode:-1 logHandle:v16];

    v18 = [v4 error];

    if (v18)
    {
      uint64_t v10 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v20 = objc_opt_class();
      v21 = __atxlog_handle_notification_management();
      v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"codingKeyForScoreMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appModeEntity" errorCode:-1 logHandle:v21];

      v23 = [v4 error];

      if (v23)
      {
        uint64_t v10 = 0;
      }
      else
      {
        self = [(ATXAppModeEntity *)self initWithBundleId:v8 itunesGenreIds:v17];
        [(ATXAppModeEntity *)self setScoreMetadata:v22];
        uint64_t v10 = self;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXAppModeEntity allocWithZone:a3];
  v5 = [(ATXAppModeEntity *)self bundleId];
  uint64_t v6 = [(ATXAppModeEntity *)self itunesGenreIds];
  id v7 = [(ATXAppModeEntity *)v4 initWithBundleId:v5 itunesGenreIds:v6];

  return v7;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSArray)itunesGenreIds
{
  return self->_itunesGenreIds;
}

- (void)setItunesGenreIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesGenreIds, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

- (void)initWithBundleId:(os_log_t)log itunesGenreIds:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "BundleId is nil while initializing ATXAppModeEntity", v1, 2u);
}

@end