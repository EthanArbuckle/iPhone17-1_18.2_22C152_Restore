@interface AIAudiogramCropResult
- (CGRect)graphRect;
- (CGRect)symbolsRect;
- (id)description;
- (void)setGraphRect:(CGRect)a3;
- (void)setSymbolsRect:(CGRect)a3;
@end

@implementation AIAudiogramCropResult

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AIAudiogramCropResult;
  v4 = [(AIAudiogramCropResult *)&v9 description];
  [(AIAudiogramCropResult *)self graphRect];
  v5 = NSStringFromCGRect(v11);
  [(AIAudiogramCropResult *)self symbolsRect];
  v6 = NSStringFromCGRect(v12);
  v7 = [v3 stringWithFormat:@"%@\nGraph: %@\nSymbols: %@", v4, v5, v6];

  return v7;
}

- (CGRect)graphRect
{
  double x = self->_graphRect.origin.x;
  double y = self->_graphRect.origin.y;
  double width = self->_graphRect.size.width;
  double height = self->_graphRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGraphRect:(CGRect)a3
{
  self->_graphRect = a3;
}

- (CGRect)symbolsRect
{
  double x = self->_symbolsRect.origin.x;
  double y = self->_symbolsRect.origin.y;
  double width = self->_symbolsRect.size.width;
  double height = self->_symbolsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSymbolsRect:(CGRect)a3
{
  self->_symbolsRect = a3;
}

@end