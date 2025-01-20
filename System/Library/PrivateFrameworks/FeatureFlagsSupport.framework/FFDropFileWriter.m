@interface FFDropFileWriter
- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5;
@end

@implementation FFDropFileWriter

- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4
{
  return 1;
}

@end