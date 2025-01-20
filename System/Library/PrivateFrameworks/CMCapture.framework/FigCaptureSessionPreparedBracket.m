@interface FigCaptureSessionPreparedBracket
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (int)colorSpaceProperties;
- (unsigned)imageCount;
- (unsigned)outputFormat;
- (void)setColorSpaceProperties:(int)a3;
- (void)setImageCount:(unsigned int)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setOutputFormat:(unsigned int)a3;
@end

@implementation FigCaptureSessionPreparedBracket

- (unsigned)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(unsigned int)a3
{
  self->_outputFormat = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (unsigned)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(unsigned int)a3
{
  self->_imageCount = a3;
}

- (int)colorSpaceProperties
{
  return self->_colorSpaceProperties;
}

- (void)setColorSpaceProperties:(int)a3
{
  self->_colorSpaceProperties = a3;
}

@end