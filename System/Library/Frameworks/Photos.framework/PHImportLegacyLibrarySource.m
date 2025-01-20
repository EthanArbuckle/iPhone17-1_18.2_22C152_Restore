@interface PHImportLegacyLibrarySource
- (BOOL)canReference;
- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3;
- (BOOL)isLibrary;
- (BOOL)isReadonlyVolume;
- (PHImportLegacyLibrarySource)initWithURLs:(id)a3;
- (id)name;
- (id)productKind;
- (void)loadSidecarsFor:(id)a3;
@end

@implementation PHImportLegacyLibrarySource

- (void).cxx_destruct
{
}

- (id)name
{
  v2 = [(PHImportUrlSource *)self prefix];
  v3 = [v2 lastPathComponent];
  v4 = [v3 stringByDeletingPathExtension];

  return v4;
}

- (BOOL)isLibrary
{
  return 1;
}

- (BOOL)canReference
{
  return 0;
}

- (id)productKind
{
  return @"Legacy Library";
}

- (void)loadSidecarsFor:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = PLImportGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[PHImportLegacyLibrarySource loadSidecarsFor:]";
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%s should never be called on an PHImportLegacyLibrarySource", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isReadonlyVolume
{
  return 1;
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PHImportLegacyLibrarySource;
  BOOL v5 = -[PHImportUrlSource containsSupportedMediaWithImportExceptions:](&v14, sel_containsSupportedMediaWithImportExceptions_);
  if (!v5)
  {
    uint64_t v6 = [(NSURL *)self->_libraryURL path];
    v7 = v6;
    if (a3)
    {
      v8 = [v6 stringByAppendingPathComponent:@"Masters"];
      if (+[PHImportAsset directoryExists:v8])
      {
LABEL_6:

        goto LABEL_7;
      }
      v9 = [v7 stringByAppendingPathComponent:@"Originals"];
      BOOL v10 = +[PHImportAsset directoryExists:v9];

      if (!v10)
      {
        v11 = [PHImportException alloc];
        v8 = [(NSURL *)self->_libraryURL path];
        v12 = [(PHImportException *)v11 initWithType:8 path:v8 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLegacyLibrarySource.m" line:42];
        v15[0] = v12;
        *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

        goto LABEL_6;
      }
    }
LABEL_7:
  }
  return v5;
}

- (PHImportLegacyLibrarySource)initWithURLs:(id)a3
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] != 1)
  {
    p_super = PLImportGetLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "Unexpected: Attempting to create a library import source with more than on URL: %@", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_7;
  }
  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"Masters"];
  v15[0] = v6;
  v7 = [v5 URLByAppendingPathComponent:@"Originals"];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12.receiver = self;
  v12.super_class = (Class)PHImportLegacyLibrarySource;
  v9 = [(PHImportUrlSource *)&v12 initWithURLs:v8];

  if (v9)
  {
    self = v5;
    p_super = &v9->_libraryURL->super;
    v9->_libraryURL = (NSURL *)self;
LABEL_7:

    BOOL v5 = self;
  }

  return v9;
}

@end