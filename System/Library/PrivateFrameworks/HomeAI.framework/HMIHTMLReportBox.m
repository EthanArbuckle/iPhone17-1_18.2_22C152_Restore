@interface HMIHTMLReportBox
- (CGRect)boundingBox;
- (HMIHTMLReportBox)initWithBoundingBox:(CGRect)a3 text:(id)a4 color:(id)a5 opacity:(float)a6 value:(float)a7;
- (NSString)color;
- (NSString)text;
- (float)opacity;
- (float)value;
@end

@implementation HMIHTMLReportBox

- (HMIHTMLReportBox)initWithBoundingBox:(CGRect)a3 text:(id)a4 color:(id)a5 opacity:(float)a6 value:(float)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMIHTMLReportBox;
  v18 = [(HMIHTMLReportBox *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_boundingBox.origin.CGFloat x = x;
    v18->_boundingBox.origin.CGFloat y = y;
    v18->_boundingBox.size.CGFloat width = width;
    v18->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v18->_text, a4);
    objc_storeStrong((id *)&v19->_color, a5);
    v19->_opacitCGFloat y = a6;
    v19->_value = a7;
  }

  return v19;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)color
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (float)opacity
{
  return self->_opacity;
}

- (float)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end