@interface SHCustomCatalogConfiguration
+ (BOOL)supportsSecureCoding;
+ (double)maximumSearchableQuerySignatureDuration;
+ (double)minimumQuerySignatureDurationForTracking;
- (BOOL)forwardPassOnly;
- (BOOL)refineStartEnd;
- (BOOL)singlePassOnly;
- (BOOL)supportsSignatureTracking;
- (SHCustomCatalogConfiguration)init;
- (SHCustomCatalogConfiguration)initWithCoder:(id)a3;
- (float)frequencyPenaltyMultiplier;
- (float)queryThreshold;
- (float)scoreThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)algorithm;
- (int64_t)boundingBox;
- (int64_t)density;
- (int64_t)numHistogramBuckets;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithm:(int64_t)a3;
- (void)setBoundingBox:(int64_t)a3;
- (void)setDensity:(int64_t)a3;
- (void)setForwardPassOnly:(BOOL)a3;
- (void)setFrequencyPenaltyMultiplier:(float)a3;
- (void)setNumHistogramBuckets:(int64_t)a3;
- (void)setQueryThreshold:(float)a3;
- (void)setRefineStartEnd:(BOOL)a3;
- (void)setScoreThreshold:(float)a3;
- (void)setSinglePassOnly:(BOOL)a3;
- (void)setSupportsSignatureTracking:(BOOL)a3;
@end

@implementation SHCustomCatalogConfiguration

- (SHCustomCatalogConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHCustomCatalogConfiguration;
  v2 = [(SHCatalogConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_density = 3;
    v2->_algorithm = 0;
    v4 = +[SHRange rangeWithLowerBound:1.0 upperBound:12.0];
    [(SHCatalogConfiguration *)v3 setSignatureDurationRange:v4];

    [(SHCatalogConfiguration *)v3 setStreamingBufferDuration:240.0];
    [(SHCustomCatalogConfiguration *)v3 setSupportsSignatureTracking:0];
    v3->_numHistogramBuckets = 6;
    v3->_scoreThreshold = 1.0;
    v3->_queryThreshold = 1.0;
    v3->_boundingBox = 3;
    v3->_frequencyPenaltyMultiplier = 0.5;
    v3->_forwardPassOnly = 0;
    v3->_singlePassOnly = 0;
    v3->_refineStartEnd = 0;
  }
  return v3;
}

+ (double)maximumSearchableQuerySignatureDuration
{
  return 12.0;
}

+ (double)minimumQuerySignatureDurationForTracking
{
  return 2.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  objc_super v6 = [(SHCatalogConfiguration *)self installationID];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInstallationID:v7];

  objc_msgSend(v5, "setDensity:", -[SHCustomCatalogConfiguration density](self, "density"));
  objc_msgSend(v5, "setAlgorithm:", -[SHCustomCatalogConfiguration algorithm](self, "algorithm"));
  objc_msgSend(v5, "setSupportsSignatureTracking:", -[SHCustomCatalogConfiguration supportsSignatureTracking](self, "supportsSignatureTracking"));
  v8 = [(SHCatalogConfiguration *)self signatureDurationRange];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setSignatureDurationRange:v9];

  [(SHCatalogConfiguration *)self streamingBufferDuration];
  objc_msgSend(v5, "setStreamingBufferDuration:");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SHCustomCatalogConfiguration;
  id v4 = a3;
  [(SHCatalogConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHCustomCatalogConfiguration density](self, "density", v5.receiver, v5.super_class), @"SHCatalogConfigurationDensityKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHCustomCatalogConfiguration algorithm](self, "algorithm"), @"SHCatalogConfigurationAlgorithmKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SHCustomCatalogConfiguration supportsSignatureTracking](self, "supportsSignatureTracking"), @"SHCatalogConfigurationSupportsSignatureTrackingKey");
}

- (SHCustomCatalogConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SHCustomCatalogConfiguration;
  objc_super v5 = [(SHCatalogConfiguration *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_density = [v4 decodeIntegerForKey:@"SHCatalogConfigurationDensityKey"];
    v5->_algorithm = [v4 decodeIntegerForKey:@"SHCatalogConfigurationAlgorithmKey"];
    v5->_supportsSignatureTracking = [v4 decodeBoolForKey:@"SHCatalogConfigurationSupportsSignatureTrackingKey"];
  }

  return v5;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (int64_t)density
{
  return self->_density;
}

- (void)setDensity:(int64_t)a3
{
  self->_density = a3;
}

- (BOOL)supportsSignatureTracking
{
  return self->_supportsSignatureTracking;
}

- (void)setSupportsSignatureTracking:(BOOL)a3
{
  self->_supportsSignatureTracking = a3;
}

- (int64_t)numHistogramBuckets
{
  return self->_numHistogramBuckets;
}

- (void)setNumHistogramBuckets:(int64_t)a3
{
  self->_numHistogramBuckets = a3;
}

- (float)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(float)a3
{
  self->_scoreThreshold = a3;
}

- (float)queryThreshold
{
  return self->_queryThreshold;
}

- (void)setQueryThreshold:(float)a3
{
  self->_queryThreshold = a3;
}

- (int64_t)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(int64_t)a3
{
  self->_boundingBox = a3;
}

- (float)frequencyPenaltyMultiplier
{
  return self->_frequencyPenaltyMultiplier;
}

- (void)setFrequencyPenaltyMultiplier:(float)a3
{
  self->_frequencyPenaltyMultiplier = a3;
}

- (BOOL)forwardPassOnly
{
  return self->_forwardPassOnly;
}

- (void)setForwardPassOnly:(BOOL)a3
{
  self->_forwardPassOnly = a3;
}

- (BOOL)singlePassOnly
{
  return self->_singlePassOnly;
}

- (void)setSinglePassOnly:(BOOL)a3
{
  self->_singlePassOnly = a3;
}

- (BOOL)refineStartEnd
{
  return self->_refineStartEnd;
}

- (void)setRefineStartEnd:(BOOL)a3
{
  self->_refineStartEnd = a3;
}

@end