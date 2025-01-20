@interface ACUISSystemApertureMetricsRequest
+ (ACUISSystemApertureMetricsRequest)new;
+ (BOOL)supportsSecureCoding;
- (ACUISActivityItemMetricsRequest)compactLeadingMetricsRequest;
- (ACUISActivityItemMetricsRequest)compactMetricsRequest;
- (ACUISActivityItemMetricsRequest)compactTrailingMetricsRequest;
- (ACUISActivityItemMetricsRequest)expandedMetricsRequest;
- (ACUISActivityItemMetricsRequest)minimalMetricsRequest;
- (ACUISSystemApertureMetricsRequest)init;
- (ACUISSystemApertureMetricsRequest)initWithCoder:(id)a3;
- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7;
- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactMetricsRequest:(id)a5 minimalMetricsRequest:(id)a6;
- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8;
- (BOOL)isEqual:(id)a3;
- (CGSize)obstructionSize;
- (double)obstructionTopMargin;
- (id)_initWithMetricsRequest:(id)a3;
- (id)_systemApertureMetricsRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCompactLeadingMetricsRequest:(id)a3;
- (void)setCompactMetricsRequest:(id)a3;
- (void)setCompactTrailingMetricsRequest:(id)a3;
- (void)setExpandedMetricsRequest:(id)a3;
- (void)setMinimalMetricsRequest:(id)a3;
- (void)setObstructionSize:(CGSize)a3;
- (void)setObstructionTopMargin:(double)a3;
@end

@implementation ACUISSystemApertureMetricsRequest

+ (ACUISSystemApertureMetricsRequest)new
{
  return 0;
}

- (ACUISSystemApertureMetricsRequest)init
{
  return 0;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8
{
  double height = a3.height;
  double width = a3.width;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ACUISSystemApertureMetricsRequest;
  v19 = [(ACUISSystemApertureMetricsRequest *)&v28 init];
  if (v19)
  {
    v20 = [_TtC18ActivityUIServices28SystemApertureMetricsRequest alloc];
    v21 = [v15 _activityItemMetricsRequest];
    v22 = [v16 _activityItemMetricsRequest];
    v23 = [v17 _activityItemMetricsRequest];
    v24 = [v18 _activityItemMetricsRequest];
    uint64_t v25 = -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](v20, "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v21, v22, v23, v24, width, height, a4);
    metricsRequest = v19->_metricsRequest;
    v19->_metricsRequest = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)v25;
  }
  return v19;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7
{
  double height = a3.height;
  double width = a3.width;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ACUISSystemApertureMetricsRequest;
  id v17 = [(ACUISSystemApertureMetricsRequest *)&v26 init];
  if (v17)
  {
    id v18 = [_TtC18ActivityUIServices28SystemApertureMetricsRequest alloc];
    v19 = [v13 _activityItemMetricsRequest];
    v20 = [v14 _activityItemMetricsRequest];
    v21 = [v15 _activityItemMetricsRequest];
    v22 = [v16 _activityItemMetricsRequest];
    uint64_t v23 = -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](v18, "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v19, v20, v21, v22, width, height, 0.0);
    metricsRequest = v17->_metricsRequest;
    v17->_metricsRequest = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)v23;
  }
  return v17;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactMetricsRequest:(id)a5 minimalMetricsRequest:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)[v12 copy];
  id v15 = [v14 edgeInsets];
  [v15 setTrailing:0.0];
  [v14 setEdgeInsets:v15];
  id v16 = (void *)[v12 copy];

  id v17 = [v16 edgeInsets];
  [v17 setLeading:0.0];
  [v16 setEdgeInsets:v17];
  id v18 = -[ACUISSystemApertureMetricsRequest initWithObstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](self, "initWithObstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v13, v14, v16, v11, width, height);

  return v18;
}

- (id)_initWithMetricsRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISSystemApertureMetricsRequest;
  v6 = [(ACUISSystemApertureMetricsRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metricsRequest, a3);
  }

  return v7;
}

- (CGSize)obstructionSize
{
  [(SystemApertureMetricsRequest *)self->_metricsRequest obstructionSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setObstructionSize:(CGSize)a3
{
}

- (double)obstructionTopMargin
{
  [(SystemApertureMetricsRequest *)self->_metricsRequest obstructionTopMargin];
  return result;
}

- (void)setObstructionTopMargin:(double)a3
{
}

- (void)setExpandedMetricsRequest:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(SystemApertureMetricsRequest *)self->_metricsRequest setExpandedMetricsRequest:v4];
}

- (ACUISActivityItemMetricsRequest)expandedMetricsRequest
{
  double v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(SystemApertureMetricsRequest *)self->_metricsRequest expandedMetricsRequest];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactLeadingMetricsRequest:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(SystemApertureMetricsRequest *)self->_metricsRequest setCompactLeadingMetricsRequest:v4];
}

- (ACUISActivityItemMetricsRequest)compactLeadingMetricsRequest
{
  double v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(SystemApertureMetricsRequest *)self->_metricsRequest compactLeadingMetricsRequest];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactTrailingMetricsRequest:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(SystemApertureMetricsRequest *)self->_metricsRequest setCompactTrailingMetricsRequest:v4];
}

- (ACUISActivityItemMetricsRequest)compactTrailingMetricsRequest
{
  double v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(SystemApertureMetricsRequest *)self->_metricsRequest compactTrailingMetricsRequest];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactMetricsRequest:(id)a3
{
  id v4 = a3;
  id v8 = (id)[v4 copy];
  id v5 = [v8 edgeInsets];
  [v5 setTrailing:0.0];
  [v8 setEdgeInsets:v5];
  [(ACUISSystemApertureMetricsRequest *)self setCompactLeadingMetricsRequest:v8];
  v6 = (void *)[v4 copy];

  v7 = [v6 edgeInsets];
  [v7 setLeading:0.0];
  [v6 setEdgeInsets:v7];
  [(ACUISSystemApertureMetricsRequest *)self setCompactLeadingMetricsRequest:v6];
}

- (ACUISActivityItemMetricsRequest)compactMetricsRequest
{
  double v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(SystemApertureMetricsRequest *)self->_metricsRequest compactLeadingMetricsRequest];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setMinimalMetricsRequest:(id)a3
{
  id v4 = [a3 _activityItemMetricsRequest];
  [(SystemApertureMetricsRequest *)self->_metricsRequest setMinimalMetricsRequest:v4];
}

- (ACUISActivityItemMetricsRequest)minimalMetricsRequest
{
  double v3 = [ACUISActivityItemMetricsRequest alloc];
  id v4 = [(SystemApertureMetricsRequest *)self->_metricsRequest minimalMetricsRequest];
  id v5 = [(ACUISActivityItemMetricsRequest *)v3 _initWithItemMetrics:v4];

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACUISSystemApertureMetricsRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SystemApertureMetricsRequest *)self->_metricsRequest isEqual:v4->_metricsRequest];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(SystemApertureMetricsRequest *)self->_metricsRequest hash];
}

- (id)description
{
  double v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_metricsRequest withName:@"metrics"];
  BOOL v5 = [v3 build];

  return v5;
}

- (id)_systemApertureMetricsRequest
{
  return self->_metricsRequest;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ACUISSystemApertureMetricsRequest allocWithZone:a3];
  BOOL v5 = (void *)[(SystemApertureMetricsRequest *)self->_metricsRequest copy];
  id v6 = [(ACUISSystemApertureMetricsRequest *)v4 _initWithMetricsRequest:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISSystemApertureMetricsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metricsRequest"];

  id v6 = [(ACUISSystemApertureMetricsRequest *)self _initWithMetricsRequest:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end