@interface CTEnhancedDataLinkQualityMetric
+ (BOOL)supportsSecureCoding;
- (CTEnhancedDataLinkQualityMetric)initWithCoder:(id)a3;
- (CTEnhancedDataLinkQualityMetric)initWithType:(int64_t)a3 enhancedLinkQuality:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)metricType;
- (void)encodeWithCoder:(id)a3;
- (void)setMetricType:(int64_t)a3;
@end

@implementation CTEnhancedDataLinkQualityMetric

- (CTEnhancedDataLinkQualityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  v5 = [(CTEnhancedLinkQualityMetric *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_metricType = [v4 decodeIntegerForKey:@"metric_type"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTEnhancedLinkQualityMetric *)self enhancedLinkQuality];
  [v3 appendFormat:@", enhancedLinkQuality=%@", v4];

  int64_t v5 = [(CTEnhancedDataLinkQualityMetric *)self metricType];
  if ((unint64_t)(v5 - 1) > 8) {
    v6 = "CTEnhancedLQMIndicationTypeUnknown";
  }
  else {
    v6 = off_1E5263118[v5 - 1];
  }
  [v3 appendFormat:@", metricType=%s", v6];
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  id v4 = a3;
  [(CTEnhancedLinkQualityMetric *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTEnhancedDataLinkQualityMetric metricType](self, "metricType", v5.receiver, v5.super_class), @"metric_type");
}

- (int64_t)metricType
{
  return self->_metricType;
}

- (CTEnhancedDataLinkQualityMetric)initWithType:(int64_t)a3 enhancedLinkQuality:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  result = [(CTEnhancedLinkQualityMetric *)&v6 initWithEnhancedLinkQuality:a4];
  if (result) {
    result->_metricType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  id v4 = [(CTEnhancedLinkQualityMetric *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setMetricType:", -[CTEnhancedDataLinkQualityMetric metricType](self, "metricType"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMetricType:(int64_t)a3
{
  self->_metricType = a3;
}

@end