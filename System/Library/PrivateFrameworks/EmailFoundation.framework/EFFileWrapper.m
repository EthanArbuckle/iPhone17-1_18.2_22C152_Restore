@interface EFFileWrapper
- (EFFileWrapper)init;
- (EFFileWrapper)initWithSerializedRepresentation:(id)a3;
- (EFFileWrapper)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (EFPathComponent)filenamePathComponent;
- (EFPathComponent)preferredFilenamePathComponent;
- (id)filename;
- (id)initDirectoryWithFileWrappers:(id)a3;
- (id)initRegularFileWithContents:(id)a3;
- (id)preferredFilename;
- (void)_initializePathComponents;
- (void)setFilename:(id)a3;
- (void)setFilenamePathComponent:(id)a3;
- (void)setPreferredFilename:(id)a3;
- (void)setPreferredFilenamePathComponent:(id)a3;
@end

@implementation EFFileWrapper

- (EFFileWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)EFFileWrapper;
  v2 = [(EFFileWrapper *)&v5 init];
  v3 = v2;
  if (v2) {
    -[EFFileWrapper _initializePathComponents](v2);
  }
  return v3;
}

- (void)_initializePathComponents
{
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)EFFileWrapper;
    v2 = objc_msgSendSuper2(&v9, sel_filename);
    uint64_t v3 = +[EFPathComponent pathComponentWithString:v2];
    v4 = (void *)a1[12];
    a1[12] = v3;

    v8.receiver = a1;
    v8.super_class = (Class)EFFileWrapper;
    objc_super v5 = objc_msgSendSuper2(&v8, sel_preferredFilename);
    uint64_t v6 = +[EFPathComponent pathComponentWithString:v5];
    v7 = (void *)a1[11];
    a1[11] = v6;
  }
}

- (id)initRegularFileWithContents:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  objc_super v5 = [(EFFileWrapper *)&v8 initRegularFileWithContents:v4];
  uint64_t v6 = v5;
  if (v5) {
    -[EFFileWrapper _initializePathComponents](v5);
  }

  return v6;
}

- (EFFileWrapper)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EFFileWrapper;
  objc_super v9 = [(EFFileWrapper *)&v12 initWithURL:v8 options:a4 error:a5];
  v10 = v9;
  if (v9) {
    -[EFFileWrapper _initializePathComponents](v9);
  }

  return v10;
}

- (id)initDirectoryWithFileWrappers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  objc_super v5 = [(EFFileWrapper *)&v8 initDirectoryWithFileWrappers:v4];
  uint64_t v6 = v5;
  if (v5) {
    -[EFFileWrapper _initializePathComponents](v5);
  }

  return v6;
}

- (EFFileWrapper)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  objc_super v5 = [(EFFileWrapper *)&v8 initWithSerializedRepresentation:v4];
  uint64_t v6 = v5;
  if (v5) {
    -[EFFileWrapper _initializePathComponents](v5);
  }

  return v6;
}

- (void)setPreferredFilenamePathComponent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_preferredFilenamePathComponent, a3);
  uint64_t v6 = [v5 sanitizedString];
  v7.receiver = self;
  v7.super_class = (Class)EFFileWrapper;
  [(EFFileWrapper *)&v7 setPreferredFilename:v6];
}

- (void)setFilenamePathComponent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_filenamePathComponent, a3);
  uint64_t v6 = [v5 sanitizedString];
  v7.receiver = self;
  v7.super_class = (Class)EFFileWrapper;
  [(EFFileWrapper *)&v7 setFilename:v6];
}

- (id)preferredFilename
{
  return [(EFPathComponent *)self->_preferredFilenamePathComponent sanitizedString];
}

- (void)setPreferredFilename:(id)a3
{
  id v4 = +[EFPathComponent pathComponentWithString:a3];
  -[EFFileWrapper setPreferredFilenamePathComponent:](self, "setPreferredFilenamePathComponent:");
}

- (id)filename
{
  return [(EFPathComponent *)self->_filenamePathComponent sanitizedString];
}

- (void)setFilename:(id)a3
{
  id v4 = +[EFPathComponent pathComponentWithString:a3];
  -[EFFileWrapper setFilenamePathComponent:](self, "setFilenamePathComponent:");
}

- (EFPathComponent)preferredFilenamePathComponent
{
  return self->_preferredFilenamePathComponent;
}

- (EFPathComponent)filenamePathComponent
{
  return self->_filenamePathComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenamePathComponent, 0);
  objc_storeStrong((id *)&self->_preferredFilenamePathComponent, 0);
}

@end