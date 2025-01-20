@interface AVTAvatarLibraryRecordItem
+ (id)cellIdentifier;
- (AVTAvatarLibraryRecordItem)initWithAvatarRecord:(id)a3 environment:(id)a4;
- (AVTAvatarRecord)avatarRecord;
- (AVTUIEnvironment)environment;
- (void)configureCell:(id)a3 imageProvider:(id)a4;
@end

@implementation AVTAvatarLibraryRecordItem

+ (id)cellIdentifier
{
  return @"AVTAvatarLibraryCollectionViewCell";
}

- (AVTAvatarLibraryRecordItem)initWithAvatarRecord:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarLibraryRecordItem;
  v9 = [(AVTAvatarLibraryRecordItem *)&v11 init];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v7 format];
    }
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v9->_environment, a4);
  }

  return v9;
}

- (void)configureCell:(id)a3 imageProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v6 format];
  }
  id v8 = v6;
  v9 = [(AVTAvatarLibraryRecordItem *)self environment];
  [v9 mainScreenScale];
  double v11 = v10;

  v12 = [[AVTRenderingScope alloc] initWithRenderingType:101 scale:v11];
  v13 = [(AVTAvatarLibraryRecordItem *)self avatarRecord];
  v14 = [v7 providerForRecord:v13 scope:v12];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__AVTAvatarLibraryRecordItem_configureCell_imageProvider___block_invoke;
  v18[3] = &unk_263FF0078;
  id v19 = v8;
  v15 = (uint64_t (*)(void *, void *, uint64_t))v14[2];
  id v16 = v8;
  id v17 = (id)v15(v14, v18, 1);
}

uint64_t __58__AVTAvatarLibraryRecordItem_configureCell_imageProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAvatarImage:a2];
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end