@interface CNPhotoPickerProviderAnimojiGroup
- (BOOL)allowAddItem;
- (BOOL)canCreateMemoji;
- (CNPhotoPickerProviderAnimojiGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
@end

@implementation CNPhotoPickerProviderAnimojiGroup

- (BOOL)allowAddItem
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerProviderAnimojiGroup;
  BOOL v3 = [(CNPhotoPickerProviderGroup *)&v5 allowAddItem];
  if (v3) {
    LOBYTE(v3) = [(CNPhotoPickerProviderAnimojiGroup *)self canCreateMemoji];
  }
  return v3;
}

- (BOOL)canCreateMemoji
{
  v2 = [(CNPhotoPickerProviderGroup *)self providers];
  BOOL v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_11485);

  if (v3) {
    char v4 = [v3 canCreateMemoji];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __52__CNPhotoPickerProviderAnimojiGroup_canCreateMemoji__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CNPhotoPickerProviderAnimojiGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerProviderAnimojiGroup;
  objc_super v5 = [(CNPhotoPickerProviderGroup *)&v9 initWithProviders:a3 groupType:2 environment:a4 allowAddItem:a5];
  v6 = v5;
  if (v5) {
    v7 = v5;
  }

  return v6;
}

@end