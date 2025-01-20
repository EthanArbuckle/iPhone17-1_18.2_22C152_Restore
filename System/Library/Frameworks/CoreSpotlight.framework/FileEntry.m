@interface FileEntry
- (FileEntry)initWithFilePath:(id)a3 journalNumber:(unint64_t)a4 fileSize:(unint64_t)a5;
- (NSString)filePath;
- (unint64_t)fileSize;
- (unint64_t)journalNumber;
- (void)setFilePath:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setJournalNumber:(unint64_t)a3;
@end

@implementation FileEntry

- (FileEntry)initWithFilePath:(id)a3 journalNumber:(unint64_t)a4 fileSize:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FileEntry;
  v9 = [(FileEntry *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    filePath = v9->_filePath;
    v9->_filePath = v10;

    v9->_journalNumber = a4;
    v9->_fileSize = a5;
  }

  return v9;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (unint64_t)journalNumber
{
  return self->_journalNumber;
}

- (void)setJournalNumber:(unint64_t)a3
{
  self->_journalNumber = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
}

@end