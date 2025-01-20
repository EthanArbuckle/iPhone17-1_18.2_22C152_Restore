@interface BPSLazyLoadingIconProperties
- (BOOL)flipsForRTL;
- (NSString)bundlePath;
- (NSString)identifier;
- (NSString)lazyIconID;
- (NSString)squareIconName;
- (void)setBundlePath:(id)a3;
- (void)setFlipsForRTL:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLazyIconID:(id)a3;
- (void)setSquareIconName:(id)a3;
@end

@implementation BPSLazyLoadingIconProperties

- (NSString)squareIconName
{
  return self->_squareIconName;
}

- (void)setSquareIconName:(id)a3
{
}

- (void)setLazyIconID:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setFlipsForRTL:(BOOL)a3
{
  self->_flipsForRTL = a3;
}

- (void)setBundlePath:(id)a3
{
}

- (NSString)lazyIconID
{
  return self->_lazyIconID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)flipsForRTL
{
  return self->_flipsForRTL;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lazyIconID, 0);
  objc_storeStrong((id *)&self->_squareIconName, 0);
}

@end