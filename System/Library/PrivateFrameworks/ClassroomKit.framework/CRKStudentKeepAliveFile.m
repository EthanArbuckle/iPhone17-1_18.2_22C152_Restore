@interface CRKStudentKeepAliveFile
+ (id)fileURL;
- (BOOL)createWithError:(id *)a3;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)exists;
- (CRKMarker)fileMarker;
- (CRKStudentKeepAliveFile)init;
@end

@implementation CRKStudentKeepAliveFile

- (CRKStudentKeepAliveFile)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKStudentKeepAliveFile;
  v2 = [(CRKStudentKeepAliveFile *)&v8 init];
  if (v2)
  {
    v3 = [CRKFileBackedMarker alloc];
    v4 = [(id)objc_opt_class() fileURL];
    uint64_t v5 = [(CRKFileBackedMarker *)v3 initWithFileURL:v4];
    fileMarker = v2->_fileMarker;
    v2->_fileMarker = (CRKMarker *)v5;
  }
  return v2;
}

- (BOOL)exists
{
  v2 = [(CRKStudentKeepAliveFile *)self fileMarker];
  char v3 = [v2 exists];

  return v3;
}

- (BOOL)createWithError:(id *)a3
{
  v4 = [(CRKStudentKeepAliveFile *)self fileMarker];
  LOBYTE(a3) = [v4 createWithError:a3];

  return (char)a3;
}

- (BOOL)deleteWithError:(id *)a3
{
  v4 = [(CRKStudentKeepAliveFile *)self fileMarker];
  LOBYTE(a3) = [v4 deleteWithError:a3];

  return (char)a3;
}

+ (id)fileURL
{
  v2 = objc_msgSend(MEMORY[0x263F08850], "crk_nonContainerizedHomeDirectoryURL");
  char v3 = [v2 URLByAppendingPathComponent:@"Library/studentd/isConnected"];

  return v3;
}

- (CRKMarker)fileMarker
{
  return self->_fileMarker;
}

- (void).cxx_destruct
{
}

@end