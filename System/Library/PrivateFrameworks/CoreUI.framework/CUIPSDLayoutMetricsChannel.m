@interface CUIPSDLayoutMetricsChannel
- (CGRect)edgeInsets;
- (CUIPSDLayoutMetricsChannel)initWithEdgeInsets:(CGRect)a3;
- (NSString)name;
- (void)dealloc;
- (void)sanitizeEdgeInsets;
- (void)setEdgeInsets:(CGRect)a3;
- (void)setName:(id)a3;
@end

@implementation CUIPSDLayoutMetricsChannel

- (void)dealloc
{
  [(CUIPSDLayoutMetricsChannel *)self setName:0];
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayoutMetricsChannel;
  [(CUIPSDLayoutMetricsChannel *)&v3 dealloc];
}

- (void)sanitizeEdgeInsets
{
  if (self->_edgeInsets.origin.x < 0.0) {
    self->_edgeInsets.origin.x = 0.0;
  }
  if (self->_edgeInsets.origin.y < 0.0) {
    self->_edgeInsets.origin.y = 0.0;
  }
  if (self->_edgeInsets.size.width < 0.0) {
    self->_edgeInsets.size.width = 0.0;
  }
  if (self->_edgeInsets.size.height < 0.0) {
    self->_edgeInsets.size.height = 0.0;
  }
}

- (CUIPSDLayoutMetricsChannel)initWithEdgeInsets:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDLayoutMetricsChannel;
  v7 = [(CUIPSDLayoutMetricsChannel *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_edgeInsets.origin.CGFloat x = x;
    v7->_edgeInsets.origin.CGFloat y = y;
    v7->_edgeInsets.size.CGFloat width = width;
    v7->_edgeInsets.size.CGFloat height = height;
    [(CUIPSDLayoutMetricsChannel *)v7 sanitizeEdgeInsets];
  }
  return v8;
}

- (void)setEdgeInsets:(CGRect)a3
{
  self->_edgeInsets = a3;
  [(CUIPSDLayoutMetricsChannel *)self sanitizeEdgeInsets];
}

- (CGRect)edgeInsets
{
  double x = self->_edgeInsets.origin.x;
  double y = self->_edgeInsets.origin.y;
  double width = self->_edgeInsets.size.width;
  double height = self->_edgeInsets.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end