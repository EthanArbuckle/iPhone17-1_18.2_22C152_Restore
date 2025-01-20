@interface MUImpressionElement
- (CGRect)frame;
- (MUImpressionElement)initWithElementIdentifier:(id)a3 visibilityThreshold:(double)a4;
- (NSObject)customData;
- (NSString)debugString;
- (NSUUID)elementIdentifier;
- (NSUUID)sessionIdentifier;
- (double)visibilityThreshold;
- (void)setCustomData:(id)a3;
- (void)setDebugString:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation MUImpressionElement

- (MUImpressionElement)initWithElementIdentifier:(id)a3 visibilityThreshold:(double)a4
{
  id v7 = a3;
  if (v7 && (a4 > 0.0 ? (BOOL v8 = a4 <= 1.0) : (BOOL v8 = 0), v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)MUImpressionElement;
    v10 = [(MUImpressionElement *)&v13 init];
    v11 = (double *)v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_elementIdentifier, a3);
      v11[3] = a4;
    }
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSUUID)elementIdentifier
{
  return self->_elementIdentifier;
}

- (double)visibilityThreshold
{
  return self->_visibilityThreshold;
}

- (NSObject)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end