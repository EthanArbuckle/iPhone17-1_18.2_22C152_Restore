@interface PFZipLocalFileHeader
- (PFZipLocalFileHeader)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFZipLocalFileHeader

- (PFZipLocalFileHeader)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  result = [(PFZipLocalFileHeader *)&v3 init];
  if (result)
  {
    result->_lastModDate = 0;
    *(void *)&result->_versionNeededToExtract = 0;
    *(void *)&result->_uncompressedSize = 0;
    *(void *)&result->_crc32 = 0;
    result->_filename = 0;
    result->_extraFieldData = 0;
  }
  return result;
}

- (void)dealloc
{
  self->_filename = 0;
  self->_extraFieldData = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  [(PFZipLocalFileHeader *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  return (id)[NSString stringWithFormat:@"%@ - %@", -[PFZipLocalFileHeader description](&v3, sel_description), self->_filename];
}

@end