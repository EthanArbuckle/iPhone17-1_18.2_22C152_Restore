@interface ACUISActivityMetricsRequest
+ (BOOL)supportsSecureCoding;
- (ACUISActivityItemMetricsRequest)ambientMetrics;
- (ACUISActivityItemMetricsRequest)lockScreenMetrics;
- (ACUISActivityMetricsRequest)initWithCoder:(id)a3;
- (ACUISActivityMetricsRequest)initWithLockScreenMetrics:(id)a3;
- (ACUISSystemApertureMetricsRequest)systemApertureMetrics;
- (BOOL)isEqual:(id)a3;
- (id)_ACUISItemMetricsRequestFromRequest:(id)a3;
- (id)_activityMetricsRequest;
- (id)_initWithMetricsRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientMetrics:(id)a3;
- (void)setLockScreenMetrics:(id)a3;
- (void)setSystemApertureMetrics:(id)a3;
@end

@implementation ACUISActivityMetricsRequest

- (id)_initWithMetricsRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISActivityMetricsRequest;
  v5 = [(ACUISActivityMetricsRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    metricsRequest = v5->_metricsRequest;
    v5->_metricsRequest = (_TtC18ActivityUIServices22ActivityMetricsRequest *)v6;
  }
  return v5;
}

- (ACUISActivityMetricsRequest)initWithLockScreenMetrics:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACUISActivityMetricsRequest;
  v5 = [(ACUISActivityMetricsRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [_TtC18ActivityUIServices22ActivityMetricsRequest alloc];
    v7 = [v4 _activityItemMetricsRequest];
    uint64_t v8 = [(ActivityMetricsRequest *)v6 initWithLockScreenMetrics:v7 systemApertureMetrics:0 ambientMetrics:0];
    metricsRequest = v5->_metricsRequest;
    v5->_metricsRequest = (_TtC18ActivityUIServices22ActivityMetricsRequest *)v8;
  }
  return v5;
}

- (void)setAmbientMetrics:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(ActivityMetricsRequest *)self->_metricsRequest setAmbientMetrics:v4];
}

- (ACUISActivityItemMetricsRequest)ambientMetrics
{
  v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(ActivityMetricsRequest *)self->_metricsRequest ambientMetrics];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(ActivityMetricsRequest *)self->_metricsRequest setLockScreenMetrics:v4];
}

- (ACUISActivityItemMetricsRequest)lockScreenMetrics
{
  v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(ActivityMetricsRequest *)self->_metricsRequest lockScreenMetrics];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setSystemApertureMetrics:(id)a3
{
  id v4 = [a3 _systemApertureMetricsRequest];
  [(ActivityMetricsRequest *)self->_metricsRequest setSystemApertureMetrics:v4];
}

- (ACUISSystemApertureMetricsRequest)systemApertureMetrics
{
  v3 = [(ActivityMetricsRequest *)self->_metricsRequest systemApertureMetrics];

  if (v3)
  {
    id v4 = [ACUISSystemApertureMetricsRequest alloc];
    id v5 = [(ActivityMetricsRequest *)self->_metricsRequest systemApertureMetrics];
    id v6 = [(ACUISSystemApertureMetricsRequest *)v4 _initWithMetricsRequest:v5];
  }
  else
  {
    id v6 = 0;
  }
  return (ACUISSystemApertureMetricsRequest *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACUISActivityMetricsRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ActivityMetricsRequest *)self->_metricsRequest isEqual:v4->_metricsRequest];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(ActivityMetricsRequest *)self->_metricsRequest hash];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_metricsRequest withName:@"metrics"];
  BOOL v5 = [v3 build];

  return v5;
}

- (id)_activityMetricsRequest
{
  return self->_metricsRequest;
}

- (id)_ACUISItemMetricsRequestFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[ACUISActivityItemMetricsRequest alloc] _initWithItemMetrics:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ACUISActivityMetricsRequest alloc];
  BOOL v5 = (void *)[(ActivityMetricsRequest *)self->_metricsRequest copy];
  id v6 = [(ACUISActivityMetricsRequest *)v4 _initWithMetricsRequest:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISActivityMetricsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];

  id v6 = [[ACUISActivityMetricsRequest alloc] _initWithMetricsRequest:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end