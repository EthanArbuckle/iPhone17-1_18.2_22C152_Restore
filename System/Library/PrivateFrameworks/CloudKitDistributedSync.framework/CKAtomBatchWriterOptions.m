@interface CKAtomBatchWriterOptions
- (BOOL)fileBacked;
- (CKAtomBatchWriterOptions)init;
- (NSDictionary)underlyingWriterOptionsByClass;
- (NSURL)fileURL;
- (unsigned)formatVersion;
- (void)setFileBacked:(BOOL)a3;
- (void)setFileURL:(id)a3;
- (void)setFormatVersion:(unsigned __int8)a3;
- (void)setUnderlyingWriterOptionsByClass:(id)a3;
@end

@implementation CKAtomBatchWriterOptions

- (CKAtomBatchWriterOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKAtomBatchWriterOptions;
  result = [(CKAtomBatchWriterOptions *)&v3 init];
  if (result) {
    *(_WORD *)&result->_formatVersion = 3;
  }
  return result;
}

- (unsigned)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(unsigned __int8)a3
{
  self->_formatVersion = a3;
}

- (BOOL)fileBacked
{
  return self->_fileBacked;
}

- (void)setFileBacked:(BOOL)a3
{
  self->_fileBacked = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSDictionary)underlyingWriterOptionsByClass
{
  return self->_underlyingWriterOptionsByClass;
}

- (void)setUnderlyingWriterOptionsByClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingWriterOptionsByClass, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end