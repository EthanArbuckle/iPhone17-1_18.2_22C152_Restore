@interface PHPhotoLibrary(LimitedLibraryPicker)
- (uint64_t)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker;
- (void)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker completionHandler:;
@end

@implementation PHPhotoLibrary(LimitedLibraryPicker)

- (void)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F14E98] authorizationStatusForAccessLevel:2] == 4)
  {
    v8 = (void *)[v7 copy];
    +[PHLimitedLibraryPicker presentLimitedLibraryPicker:&stru_26C82F0F0 waitForDismissal:0 viewController:v6 photoLibrary:a1 completionHandler:v8];
  }
  else
  {
    v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217C33000, v9, OS_LOG_TYPE_DEFAULT, "Limited library picker requires PHAuthorizationStatusLimited", v10, 2u);
    }
  }
}

- (uint64_t)presentLimitedLibraryPickerFromViewController:()LimitedLibraryPicker
{
  return [a1 presentLimitedLibraryPickerFromViewController:a3 completionHandler:&__block_literal_global_365];
}

@end