@interface CRKSettingsUIVisibilityIndicatorFile
+ (id)fileURL;
- (BOOL)createWithError:(id *)a3;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)exists;
- (CRKSettingsUIVisibilityIndicatorFile)init;
@end

@implementation CRKSettingsUIVisibilityIndicatorFile

+ (id)fileURL
{
  v2 = objc_msgSend(MEMORY[0x263F08850], "crk_nonContainerizedHomeDirectoryURL");
  v3 = [v2 URLByAppendingPathComponent:@"Library/studentd/settingsUIVisible"];

  return v3;
}

- (CRKSettingsUIVisibilityIndicatorFile)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKSettingsUIVisibilityIndicatorFile;
  v2 = [(CRKSettingsUIVisibilityIndicatorFile *)&v8 init];
  if (v2)
  {
    v3 = [CRKFileBackedMarker alloc];
    v4 = [(id)objc_opt_class() fileURL];
    uint64_t v5 = [(CRKFileBackedMarker *)v3 initWithFileURL:v4];
    mFileMarker = v2->mFileMarker;
    v2->mFileMarker = (CRKMarker *)v5;
  }
  return v2;
}

- (BOOL)exists
{
  return [(CRKMarker *)self->mFileMarker exists];
}

- (BOOL)createWithError:(id *)a3
{
  return [(CRKMarker *)self->mFileMarker createWithError:a3];
}

- (BOOL)deleteWithError:(id *)a3
{
  return [(CRKMarker *)self->mFileMarker deleteWithError:a3];
}

- (void).cxx_destruct
{
}

@end