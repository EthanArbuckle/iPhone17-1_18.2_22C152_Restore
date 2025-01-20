@interface ATXAppDigestSetupEntity
+ (BOOL)supportsSecureCoding;
- (ATXAppDigestSetupEntity)initWithBundleId:(id)a3 numBasicNotifications:(unint64_t)a4 numMessageNotifications:(unint64_t)a5 numTimeSenstiveNonMessageNotifications:(unint64_t)a6;
- (ATXAppDigestSetupEntity)initWithCoder:(id)a3;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numBasicNotifications;
- (unint64_t)numMessageNotifications;
- (unint64_t)numTimeSensitiveNonMessageNotifications;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setNumBasicNotifications:(unint64_t)a3;
- (void)setNumMessageNotifications:(unint64_t)a3;
- (void)setNumTimeSensitiveNonMessageNotifications:(unint64_t)a3;
@end

@implementation ATXAppDigestSetupEntity

- (ATXAppDigestSetupEntity)initWithBundleId:(id)a3 numBasicNotifications:(unint64_t)a4 numMessageNotifications:(unint64_t)a5 numTimeSenstiveNonMessageNotifications:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXAppDigestSetupEntity;
  v12 = [(ATXAppDigestSetupEntity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    v13->_numBasicNotifications = a4;
    v13->_numMessageNotifications = a5;
    v13->_numTimeSensitiveNonMessageNotifications = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXAppDigestSetupEntity *)self bundleId];
  [v4 encodeObject:v5 forKey:@"codingKeyForBundleId"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numBasicNotifications](self, "numBasicNotifications"));
  [v4 encodeObject:v6 forKey:@"codingKeyForNumBasicNotifications"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numMessageNotifications](self, "numMessageNotifications"));
  [v4 encodeObject:v7 forKey:@"codingKeyForNumMessageNotifications"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numTimeSensitiveNonMessageNotifications](self, "numTimeSensitiveNonMessageNotifications"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"codingKeyForNumTimeSensitiveNotifications"];
}

- (ATXAppDigestSetupEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_notification_management();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appDigestSetupEntity" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_notification_management();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForNumBasicNotifications" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appDigestSetupEntity" errorCode:-1 logHandle:v13];

    objc_super v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_notification_management();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForNumMessageNotifications" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appDigestSetupEntity" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_notification_management();
        v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForNumTimeSensitiveNotifications" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.appDigestSetupEntity" errorCode:-1 logHandle:v23];

        v25 = [v4 error];

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          self = -[ATXAppDigestSetupEntity initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:](self, "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v8, [v14 unsignedIntegerValue], objc_msgSend(v19, "unsignedIntegerValue"), objc_msgSend(v24, "unsignedIntegerValue"));
          v10 = self;
        }
      }
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ATXAppDigestSetupEntity alloc];
  v5 = [(ATXAppDigestSetupEntity *)self bundleId];
  uint64_t v6 = [(ATXAppDigestSetupEntity *)v4 initWithBundleId:v5 numBasicNotifications:[(ATXAppDigestSetupEntity *)self numBasicNotifications] numMessageNotifications:[(ATXAppDigestSetupEntity *)self numMessageNotifications] numTimeSenstiveNonMessageNotifications:[(ATXAppDigestSetupEntity *)self numTimeSensitiveNonMessageNotifications]];

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (unint64_t)numBasicNotifications
{
  return self->_numBasicNotifications;
}

- (void)setNumBasicNotifications:(unint64_t)a3
{
  self->_numBasicNotifications = a3;
}

- (unint64_t)numMessageNotifications
{
  return self->_numMessageNotifications;
}

- (void)setNumMessageNotifications:(unint64_t)a3
{
  self->_numMessageNotifications = a3;
}

- (unint64_t)numTimeSensitiveNonMessageNotifications
{
  return self->_numTimeSensitiveNonMessageNotifications;
}

- (void)setNumTimeSensitiveNonMessageNotifications:(unint64_t)a3
{
  self->_numTimeSensitiveNonMessageNotifications = a3;
}

- (void).cxx_destruct
{
}

@end