@interface SHCatalogConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)installationID;
- (SHCatalogConfiguration)init;
- (SHCatalogConfiguration)initWithCoder:(id)a3;
- (SHRange)signatureDurationRange;
- (double)streamingBufferDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallationID:(id)a3;
- (void)setSignatureDurationRange:(id)a3;
- (void)setStreamingBufferDuration:(double)a3;
@end

@implementation SHCatalogConfiguration

- (SHCatalogConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)SHCatalogConfiguration;
  v2 = [(SHCatalogConfiguration *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    installationID = v2->_installationID;
    v2->_installationID = (NSString *)v4;

    uint64_t v6 = +[SHRange rangeWithLowerBound:3.0 upperBound:12.0];
    signatureDurationRange = v2->_signatureDurationRange;
    v2->_signatureDurationRange = (SHRange *)v6;

    v2->_streamingBufferDuration = 24.0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  v5 = [(SHCatalogConfiguration *)self installationID];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setInstallationID:v6];

  v7 = [(SHCatalogConfiguration *)self signatureDurationRange];
  v8 = (void *)[v7 copy];
  [v4 setSignatureDurationRange:v8];

  [(SHCatalogConfiguration *)self streamingBufferDuration];
  objc_msgSend(v4, "setStreamingBufferDuration:");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SHCatalogConfiguration *)self installationID];
  [v4 encodeObject:v5 forKey:@"SHCatalogConfigurationInstallationIDKey"];

  [(SHCatalogConfiguration *)self streamingBufferDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SHCatalogConfigurationBufferDurationKey");
  id v6 = [(SHCatalogConfiguration *)self signatureDurationRange];
  [v4 encodeObject:v6 forKey:@"SHCatalogConfigurationSignatureDurationRangeKey"];
}

- (SHCatalogConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHCatalogConfiguration;
  v5 = [(SHCatalogConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHCatalogConfigurationInstallationIDKey"];
    installationID = v5->_installationID;
    v5->_installationID = (NSString *)v6;

    [v4 decodeDoubleForKey:@"SHCatalogConfigurationBufferDurationKey"];
    v5->_streamingBufferDuration = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHCatalogConfigurationSignatureDurationRangeKey"];
    signatureDurationRange = v5->_signatureDurationRange;
    v5->_signatureDurationRange = (SHRange *)v9;
  }
  return v5;
}

- (NSString)installationID
{
  return self->_installationID;
}

- (void)setInstallationID:(id)a3
{
}

- (SHRange)signatureDurationRange
{
  return self->_signatureDurationRange;
}

- (void)setSignatureDurationRange:(id)a3
{
}

- (double)streamingBufferDuration
{
  return self->_streamingBufferDuration;
}

- (void)setStreamingBufferDuration:(double)a3
{
  self->_streamingBufferDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDurationRange, 0);

  objc_storeStrong((id *)&self->_installationID, 0);
}

@end