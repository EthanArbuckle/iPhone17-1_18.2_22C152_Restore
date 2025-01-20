@interface KGErrorMarker
- (BOOL)markerExists;
- (KGErrorMarker)initWithDatabaseURL:(id)a3;
- (id)readComment;
- (void)createWithComment:(id)a3;
- (void)removeMarker;
@end

@implementation KGErrorMarker

- (void).cxx_destruct
{
}

- (void)removeMarker
{
  v2 = [(NSURL *)self->_fileURL fileSystemRepresentation];
  unlink(v2);
}

- (void)createWithComment:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 514, 384);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    [v4 getCString:__s maxLength:128 encoding:4];
    size_t v7 = strlen(__s);
    write(v6, __s, v7 + 1);
    close(v6);
  }
}

- (id)readComment
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 0);
  if (v2 < 0)
  {
    int v5 = 0;
  }
  else
  {
    int v3 = v2;
    ssize_t v4 = read(v2, v9, 0x80uLL);
    if (v4 < 1)
    {
      int v5 = 0;
    }
    else
    {
      v9[v4] = 0;
      int v5 = (__CFString *)[[NSString alloc] initWithBytes:v9 length:v4 encoding:4];
    }
    close(v3);
  }
  if (v5) {
    int v6 = v5;
  }
  else {
    int v6 = &stru_1F2802F38;
  }
  size_t v7 = v6;

  return v7;
}

- (BOOL)markerExists
{
  int v2 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 0);
  int v3 = v2;
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  return v3 >= 0;
}

- (KGErrorMarker)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGErrorMarker;
  int v5 = [(KGErrorMarker *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathExtension:@"errormarker"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;
  }
  return v5;
}

@end