@interface NSNullFileHandle
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)synchronizeAndReturnError:(id *)a3;
- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (id)availableData;
- (id)readDataOfLength:(unint64_t)a3;
- (id)readDataToEndOfFile;
- (id)readDataToEndOfFileAndReturnError:(id *)a3;
- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4;
- (id)readabilityHandler;
- (id)writeabilityHandler;
- (int)fileDescriptor;
- (unint64_t)offsetInFile;
- (unint64_t)seekToEndOfFile;
@end

@implementation NSNullFileHandle

- (BOOL)closeAndReturnError:(id *)a3
{
  return 1;
}

- (id)availableData
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (id)readDataToEndOfFile
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (id)readDataToEndOfFileAndReturnError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)readDataOfLength:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3, a4);
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  return 1;
}

- (unint64_t)offsetInFile
{
  return 0;
}

- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  return 0;
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)synchronizeAndReturnError:(id *)a3
{
  return 1;
}

- (int)fileDescriptor
{
  return -1;
}

- (id)writeabilityHandler
{
  return 0;
}

- (id)readabilityHandler
{
  return 0;
}

@end