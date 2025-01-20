@interface MFTypeInfo
- (NSString)filename;
- (NSString)mimeType;
- (NSString)pathExtension;
- (unsigned)osType;
- (void)setFilename:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setOsType:(unsigned int)a3;
- (void)setPathExtension:(id)a3;
@end

@implementation MFTypeInfo

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)pathExtension
{
  return self->_pathExtension;
}

- (void)setPathExtension:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (unsigned)osType
{
  return self->_osType;
}

- (void)setOsType:(unsigned int)a3
{
  self->_osType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
}

@end