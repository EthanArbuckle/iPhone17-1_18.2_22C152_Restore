@interface PFZipCentralDirectoryFileHeader
- (PFZipCentralDirectoryFileHeader)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFZipCentralDirectoryFileHeader

- (PFZipCentralDirectoryFileHeader)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  result = [(PFZipCentralDirectoryFileHeader *)&v3 init];
  if (result)
  {
    result->_externalFileAttrs = 0;
    result->_localFileHeaderRelativeOffset = 0;
    *(_OWORD *)&result->_versionMadeBy = 0u;
    *(_OWORD *)&result->_compressedSize = 0u;
    result->_internalFileAttrs = 0;
    result->_extraFieldData = 0;
    result->_fileComment = 0;
    result->_filename = 0;
  }
  return result;
}

- (void)dealloc
{
  self->_filename = 0;
  self->_extraFieldData = 0;

  self->_fileComment = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  [(PFZipCentralDirectoryFileHeader *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  return (id)[NSString stringWithFormat:@"%@ - %@", -[PFZipCentralDirectoryFileHeader description](&v3, sel_description), self->_filename];
}

@end