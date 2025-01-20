@interface CTVoiceLinkQualityMetric
+ (BOOL)supportsSecureCoding;
- (CTVoiceLinkQualityMetric)initWithCoder:(id)a3;
- (CTVoiceLinkQualityMetric)initWithLinkQuality:(id)a3;
- (NSNumber)linkQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkQuality:(id)a3;
@end

@implementation CTVoiceLinkQualityMetric

- (CTVoiceLinkQualityMetric)initWithLinkQuality:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTVoiceLinkQualityMetric;
  v6 = [(CTVoiceLinkQualityMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_linkQuality, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTVoiceLinkQualityMetric *)self linkQuality];
  [v3 appendFormat:@", linkQuality=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTVoiceLinkQualityMetric *)self linkQuality];
  v6 = (void *)[v5 copy];
  [v4 setLinkQuality:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTVoiceLinkQualityMetric *)self linkQuality];
  [v4 encodeObject:v5 forKey:@"link_quality"];
}

- (CTVoiceLinkQualityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTVoiceLinkQualityMetric;
  id v5 = [(CTVoiceLinkQualityMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link_quality"];
    linkQuality = v5->_linkQuality;
    v5->_linkQuality = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(id)a3
{
}

- (void).cxx_destruct
{
}

@end