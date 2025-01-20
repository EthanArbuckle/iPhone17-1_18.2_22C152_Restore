@interface DEFileWriter
- (DEFileWriter)init;
- (DEFileWriter)initWithURL:(id)a3;
- (NSFileHandle)file;
- (NSURL)dest;
- (void)close;
- (void)dealloc;
- (void)setDest:(id)a3;
- (void)setFile:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEFileWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_dest, 0);
}

- (void)setFile:(id)a3
{
}

- (NSFileHandle)file
{
  return self->_file;
}

- (void)setDest:(id)a3
{
}

- (NSURL)dest
{
  return self->_dest;
}

- (void)writeData:(id)a3
{
}

- (void)close
{
  file = self->_file;
  if (file)
  {
    [(NSFileHandle *)file closeFile];
    v4 = self->_file;
    self->_file = 0;
  }
}

- (void)dealloc
{
  file = self->_file;
  if (file)
  {
    [(NSFileHandle *)file closeFile];
    v4 = self->_file;
    self->_file = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DEFileWriter;
  [(DEFileWriter *)&v5 dealloc];
}

- (DEFileWriter)init
{
  return [(DEFileWriter *)self initWithURL:0];
}

- (DEFileWriter)initWithURL:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DEFileWriter;
  v6 = [(DEFileWriter *)&v20 init];
  v7 = v6;
  if (v6)
  {
    p_dest = (id *)&v6->_dest;
    objc_storeStrong((id *)&v6->_dest, a3);
    file = v7->_file;
    v7->_file = 0;

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (v10)
    {
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      v12 = [*p_dest path];
      char v13 = [v11 createFileAtPath:v12 contents:0 attributes:0];

      id v14 = *p_dest;
      if (v13)
      {
        id v19 = 0;
        uint64_t v15 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v14 error:&v19];
        v16 = (DEFileWriter *)v19;
        v17 = v7->_file;
        v7->_file = (NSFileHandle *)v15;

        if (v16)
        {
          +[DELog error:@"Failed to write to file at \"%@\": %@", *p_dest, v16];

          v7 = v16;
        }
        else if (v7->_file)
        {
          goto LABEL_8;
        }
      }
      else
      {
        +[DELog error:@"Failed to create file at \"%@\": %@", *p_dest, 0];
      }
    }

    v7 = 0;
LABEL_8:
  }
  return v7;
}

@end