@interface CRKFileWrapperBackedFileSystemNode
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3;
- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3 parentFileWrapper:(id)a4;
- (NSData)content;
- (NSDictionary)children;
- (NSFileWrapper)fileWrapper;
- (NSFileWrapper)parentFileWrapper;
- (NSString)fileName;
- (id)addChildWithDescriptor:(id)a3;
- (int64_t)type;
- (void)removeFromParent;
- (void)setFileName:(id)a3;
@end

@implementation CRKFileWrapperBackedFileSystemNode

- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3
{
  return [(CRKFileWrapperBackedFileSystemNode *)self initWithFileWrapper:a3 parentFileWrapper:0];
}

- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3 parentFileWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFileWrapperBackedFileSystemNode;
  v9 = [(CRKFileWrapperBackedFileSystemNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileWrapper, a3);
    objc_storeStrong((id *)&v10->_parentFileWrapper, a4);
  }

  return v10;
}

- (NSString)fileName
{
  v2 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  v3 = [v2 filename];

  return (NSString *)v3;
}

- (void)setFileName:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  [v5 setFilename:v4];
}

- (int64_t)type
{
  v2 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  int64_t v3 = [v2 isDirectory] ^ 1;

  return v3;
}

- (NSData)content
{
  v2 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  int64_t v3 = [v2 regularFileContents];

  return (NSData *)v3;
}

- (NSDictionary)children
{
  int64_t v3 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  id v4 = [v3 fileWrappers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__CRKFileWrapperBackedFileSystemNode_children__block_invoke;
  v7[3] = &unk_2646F4B48;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "crk_mapToDictionary:", v7);

  return (NSDictionary *)v5;
}

void __46__CRKFileWrapperBackedFileSystemNode_children__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void, void))
{
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  v11 = [CRKFileWrapperBackedFileSystemNode alloc];
  id v13 = [*(id *)(a1 + 32) fileWrapper];
  objc_super v12 = [(CRKFileWrapperBackedFileSystemNode *)v11 initWithFileWrapper:v9 parentFileWrapper:v13];

  ((void (**)(void, id, CRKFileWrapperBackedFileSystemNode *))a4)[2](v8, v10, v12);
}

- (id)addChildWithDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    id v8 = objc_alloc(MEMORY[0x263F08870]);
    id v9 = [v4 content];
    id v7 = (void *)[v8 initRegularFileWithContents:v9];

    goto LABEL_5;
  }
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F08870]);
    id v7 = (void *)[v6 initDirectoryWithFileWrappers:MEMORY[0x263EFFA78]];
LABEL_5:
    id v10 = [v4 fileName];
    [v7 setFilename:v10];

    v11 = [v4 fileName];
    [v7 setPreferredFilename:v11];

    objc_super v12 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
    id v13 = (id)[v12 addFileWrapper:v7];

    v14 = [CRKFileWrapperBackedFileSystemNode alloc];
    v15 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
    v16 = [(CRKFileWrapperBackedFileSystemNode *)v14 initWithFileWrapper:v7 parentFileWrapper:v15];

    goto LABEL_7;
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (void)removeFromParent
{
  id v4 = [(CRKFileWrapperBackedFileSystemNode *)self parentFileWrapper];
  int64_t v3 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  [v4 removeFileWrapper:v3];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(CRKFileWrapperBackedFileSystemNode *)self fileWrapper];
  if ([v7 writeToURL:v6 options:1 originalContentsURL:0 error:a4])
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v13 = *MEMORY[0x263F08010];
    v14[0] = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v10 = [v6 path];
    char v11 = [v8 setAttributes:v9 ofItemAtPath:v10 error:a4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSFileWrapper)fileWrapper
{
  return self->_fileWrapper;
}

- (NSFileWrapper)parentFileWrapper
{
  return self->_parentFileWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFileWrapper, 0);

  objc_storeStrong((id *)&self->_fileWrapper, 0);
}

@end