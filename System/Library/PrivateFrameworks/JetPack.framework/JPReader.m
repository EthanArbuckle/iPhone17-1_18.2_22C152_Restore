@interface JPReader
- (BOOL)processStream:(id)a3 signatureVerifier:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (JPReader)init;
- (JetPackReader)backing;
- (id)convertError;
- (id)dataSegmentFound;
- (id)fileEntryFound;
- (id)keyForIdentifier;
- (void)dealloc;
- (void)setBacking:(JetPackReader *)a3;
- (void)setDataSegmentFound:(id)a3;
- (void)setFileEntryFound:(id)a3;
- (void)setKeyForIdentifier:(id)a3;
@end

@implementation JPReader

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyForIdentifier, 0);
  objc_storeStrong(&self->_dataSegmentFound, 0);
  objc_storeStrong(&self->_fileEntryFound, 0);
}

- (void)setKeyForIdentifier:(id)a3
{
}

- (void)setFileEntryFound:(id)a3
{
}

- (void)setDataSegmentFound:(id)a3
{
}

- (id)dataSegmentFound
{
  return self->_dataSegmentFound;
}

- (id)fileEntryFound
{
  return self->_fileEntryFound;
}

- (id)keyForIdentifier
{
  return self->_keyForIdentifier;
}

- (void)dealloc
{
  JetPackReaderDestroy((uint64_t)[(JPReader *)self backing]);
  v3.receiver = self;
  v3.super_class = (Class)JPReader;
  [(JPReader *)&v3 dealloc];
}

- (BOOL)processStream:(id)a3 signatureVerifier:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(JPReader *)self backing];
  v13 = (uint64_t *)[v11 backing];

  v14 = (uint64_t *)[v10 backing];
  char v15 = JetPackReaderProcess((uint64_t *)v12, v13, v14, v7);
  BOOL v16 = v15;
  if (a6 && (v15 & 1) == 0)
  {
    *a6 = [(JPReader *)self convertError];
  }
  return v16;
}

- (JetPackReader)backing
{
  return self->_backing;
}

- (JPReader)init
{
  v5.receiver = self;
  v5.super_class = (Class)JPReader;
  id v2 = [(JPReader *)&v5 init];
  if (v2)
  {
    uint64_t v3 = JetPackReaderCreate();
    *((void *)v2 + 4) = v3;
    JetPackReaderSetProperty(v3, 0, (uint64_t)v2);
    JetPackReaderSetFileEntryFoundCallback(*((uint64_t **)v2 + 4), (uint64_t)fileEntryFound);
    JetPackReaderSetDataSegmentFoundCallback(*((uint64_t **)v2 + 4), (uint64_t)dataSegmentFound);
    JetPackReaderSetKeyForIdentifierCallback(*((uint64_t **)v2 + 4), (uint64_t)keyForIdentifier);
  }
  return (JPReader *)v2;
}

- (id)convertError
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t ErrorMessage = JetPackReaderGetErrorMessage((uint64_t)[(JPReader *)self backing]);
  if (ErrorMessage && (uint64_t v3 = [[NSString alloc] initWithUTF8String:ErrorMessage]) != 0)
  {
    v4 = (void *)v3;
    objc_super v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = v3;
    v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v7 = [v5 errorWithDomain:@"JPErrorDomain" code:0 userInfo:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    id v11 = @"An unknown error occurred";
    v4 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    char v7 = [v8 errorWithDomain:@"JPErrorDomain" code:0 userInfo:v4];
  }

  return v7;
}

- (void)setBacking:(JetPackReader *)a3
{
  self->_backing = a3;
}

@end