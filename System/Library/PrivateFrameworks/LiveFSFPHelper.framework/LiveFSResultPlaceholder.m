@interface LiveFSResultPlaceholder
- (NSDictionary)xattrs;
- (NSNumber)modTime;
- (NSString)filename;
- (NSString)path;
- (void)setFilename:(id)a3;
- (void)setModTime:(id)a3;
- (void)setPath:(id)a3;
- (void)setXattrs:(id)a3;
@end

@implementation LiveFSResultPlaceholder

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilename:(id)a3
{
}

- (NSNumber)modTime
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModTime:(id)a3
{
}

- (NSDictionary)xattrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXattrs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_modTime, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end