@interface PFZipEndOfCentralDirectoryRecord
- (PFZipEndOfCentralDirectoryRecord)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFZipEndOfCentralDirectoryRecord

- (PFZipEndOfCentralDirectoryRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  result = [(PFZipEndOfCentralDirectoryRecord *)&v3 init];
  if (result)
  {
    result->_comment = 0;
    *(void *)&result->_numberOfDisk = 0;
    *(void *)&result->_byteSizeOfCentralDirectory = 0;
    result->_commentLength = 0;
  }
  return result;
}

- (void)dealloc
{
  self->_comment = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  [(PFZipEndOfCentralDirectoryRecord *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  return (id)[NSString stringWithFormat:@"%@ - %d:%d:%d:%d:%d:%d", -[PFZipEndOfCentralDirectoryRecord description](&v3, sel_description), self->_diskWhereCentralDirectoryStarts, self->_numberOfDisk, self->_numberOfCentralDirectoryRecordsOnThisDisk, self->_totalNumberOfCentralDirectoryRecords, self->_byteSizeOfCentralDirectory, self->_centralDirectoryOffset];
}

@end