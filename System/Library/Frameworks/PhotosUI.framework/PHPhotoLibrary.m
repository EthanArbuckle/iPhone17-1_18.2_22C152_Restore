@interface PHPhotoLibrary
@end

@implementation PHPhotoLibrary

void __86__PHPhotoLibrary_LimitedLibraryPicker__presentLimitedLibraryPickerFromViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = PLPickerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_217C33000, v3, OS_LOG_TYPE_DEBUG, "Limited library picker selected new assets with identifiers: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end