@interface _PHPhotoLibraryValidator
- (BOOL)isValidImagePathExtension:(id)a3;
- (BOOL)isValidVideoPathExtension:(id)a3;
- (PLPhotoLibrary)photoLibrary;
- (_PHPhotoLibraryValidator)initWithPhotoLibrary:(id)a3;
@end

@implementation _PHPhotoLibraryValidator

- (void).cxx_destruct
{
}

- (PLPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  return (PLPhotoLibrary *)WeakRetained;
}

- (BOOL)isValidVideoPathExtension:(id)a3
{
  return [MEMORY[0x1E4F8AA78] isVideoFileExtension:a3];
}

- (BOOL)isValidImagePathExtension:(id)a3
{
  return [MEMORY[0x1E4F8AA78] isImageFileExtension:a3];
}

- (_PHPhotoLibraryValidator)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(_PHPhotoLibraryValidator *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
  }

  return v6;
}

@end