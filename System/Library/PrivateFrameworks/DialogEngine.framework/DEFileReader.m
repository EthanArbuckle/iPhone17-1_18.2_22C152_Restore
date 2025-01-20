@interface DEFileReader
- (DEFileReader)init;
- (DEFileReader)initWithURL:(id)a3;
- (NSFileHandle)file;
- (NSURL)src;
- (id)readData;
- (id)readDataOfLength:(unint64_t)a3;
- (void)close;
- (void)dealloc;
- (void)setFile:(id)a3;
- (void)setSrc:(id)a3;
@end

@implementation DEFileReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_src, 0);
}

- (void)setFile:(id)a3
{
}

- (NSFileHandle)file
{
  return self->_file;
}

- (void)setSrc:(id)a3
{
}

- (NSURL)src
{
  return self->_src;
}

- (id)readData
{
  v3 = objc_opt_new();
  +[DEIO copyTo:v3 from:self];
  v4 = [v3 data];

  return v4;
}

- (id)readDataOfLength:(unint64_t)a3
{
  return [(NSFileHandle *)self->_file readDataOfLength:a3];
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
  v5.super_class = (Class)DEFileReader;
  [(DEFileReader *)&v5 dealloc];
}

- (DEFileReader)init
{
  return [(DEFileReader *)self initWithURL:0];
}

- (DEFileReader)initWithURL:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEFileReader;
  v6 = [(DEFileReader *)&v16 init];
  v7 = v6;
  if (v6)
  {
    p_src = &v6->_src;
    objc_storeStrong((id *)&v6->_src, a3);
    file = v7->_file;
    v7->_file = 0;

    src = v7->_src;
    id v15 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:src error:&v15];
    id v12 = v15;
    v13 = v7->_file;
    v7->_file = (NSFileHandle *)v11;

    if (v12)
    {
      +[DELog error:@"Failed to read from file at \"%@\": %@", *p_src, v12];
    }
    else if (v7->_file)
    {
      v7 = v7;
      goto LABEL_7;
    }

    v7 = 0;
LABEL_7:
  }
  return v7;
}

@end