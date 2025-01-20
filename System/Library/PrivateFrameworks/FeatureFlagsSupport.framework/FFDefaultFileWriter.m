@interface FFDefaultFileWriter
- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5;
- (FFDefaultFileWriter)init;
- (NSDictionary)dirAttributes;
- (NSDictionary)fileAttributes;
@end

@implementation FFDefaultFileWriter

- (FFDefaultFileWriter)init
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)FFDefaultFileWriter;
  v2 = [(FFDefaultFileWriter *)&v11 init];
  if (v2)
  {
    uint64_t v4 = *MEMORY[0x1E4F282D8];
    v14[0] = *MEMORY[0x1E4F28318];
    uint64_t v3 = v14[0];
    v14[1] = v4;
    v16[0] = &unk_1F38A9B68;
    v16[1] = &unk_1F38A9B68;
    uint64_t v15 = *MEMORY[0x1E4F28330];
    uint64_t v5 = v15;
    v16[2] = &unk_1F38A9B80;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v14 count:3];
    fileAttributes = v2->_fileAttributes;
    v2->_fileAttributes = (NSDictionary *)v6;

    v12[0] = v3;
    v12[1] = v4;
    v13[0] = &unk_1F38A9B68;
    v13[1] = &unk_1F38A9B68;
    v12[2] = v5;
    v13[2] = &unk_1F38A9B98;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    dirAttributes = v2->_dirAttributes;
    v2->_dirAttributes = (NSDictionary *)v8;
  }
  return v2;
}

- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v11 = [v9 path];
  int v12 = [v10 fileExistsAtPath:v11];

  if (v12) {
    [v10 removeItemAtURL:v9 error:0];
  }
  v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:100 options:0 error:a5];
  v14 = v13;
  if (v13)
  {
    char v15 = [v13 writeToURL:v9 options:0x10000000 error:a5];
    v16 = [(FFDefaultFileWriter *)self fileAttributes];
    v17 = [v9 path];
    [v10 setAttributes:v16 ofItemAtPath:v17 error:0];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)createDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    objc_super v11 = [(FFDefaultFileWriter *)self dirAttributes];
    char v10 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v11 error:a4];
  }
  return v10;
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSDictionary)dirAttributes
{
  return self->_dirAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirAttributes, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
}

@end