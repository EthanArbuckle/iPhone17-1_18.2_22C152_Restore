@interface CTEnhancedLinkQualityMetric
+ (BOOL)supportsSecureCoding;
- (CTEnhancedLinkQualityMetric)initWithCoder:(id)a3;
- (CTEnhancedLinkQualityMetric)initWithEnhancedLinkQuality:(id)a3;
- (NSData)enhancedLinkQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnhancedLinkQuality:(id)a3;
@end

@implementation CTEnhancedLinkQualityMetric

- (CTEnhancedLinkQualityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTEnhancedLinkQualityMetric;
  v5 = [(CTEnhancedLinkQualityMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link_quality"];
    enhancedLinkQuality = v5->_enhancedLinkQuality;
    v5->_enhancedLinkQuality = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTEnhancedLinkQualityMetric *)self enhancedLinkQuality];
  [v4 encodeObject:v5 forKey:@"link_quality"];
}

- (NSData)enhancedLinkQuality
{
  return self->_enhancedLinkQuality;
}

- (void).cxx_destruct
{
}

- (CTEnhancedLinkQualityMetric)initWithEnhancedLinkQuality:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTEnhancedLinkQualityMetric;
  uint64_t v6 = [(CTEnhancedLinkQualityMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enhancedLinkQuality, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTEnhancedLinkQualityMetric *)self enhancedLinkQuality];
  [v3 appendFormat:@", enhancedLinkQuality=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTEnhancedLinkQualityMetric *)self enhancedLinkQuality];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setEnhancedLinkQuality:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEnhancedLinkQuality:(id)a3
{
}

@end