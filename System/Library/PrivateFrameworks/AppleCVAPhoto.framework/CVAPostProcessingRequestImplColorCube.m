@interface CVAPostProcessingRequestImplColorCube
- (BOOL)isMono;
- (NSData)backgroundColorCube;
- (NSData)foregroundColorCube;
- (NSData)singleColorCube;
- (void)setBackgroundColorCube:(id)a3;
- (void)setForegroundColorCube:(id)a3;
- (void)setIsMono:(BOOL)a3;
- (void)setSingleColorCube:(id)a3;
@end

@implementation CVAPostProcessingRequestImplColorCube

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleColorCube, 0);
  objc_storeStrong((id *)&self->_foregroundColorCube, 0);

  objc_storeStrong((id *)&self->_backgroundColorCube, 0);
}

- (void)setIsMono:(BOOL)a3
{
  self->_isMono = a3;
}

- (BOOL)isMono
{
  return self->_isMono;
}

- (void)setSingleColorCube:(id)a3
{
}

- (NSData)singleColorCube
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setForegroundColorCube:(id)a3
{
}

- (NSData)foregroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundColorCube:(id)a3
{
}

- (NSData)backgroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

@end