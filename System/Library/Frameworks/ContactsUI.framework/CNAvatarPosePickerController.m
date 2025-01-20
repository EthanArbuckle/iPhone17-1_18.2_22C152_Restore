@interface CNAvatarPosePickerController
- (CGSize)desiredContentSize;
- (CNAvatarPosePickerController)initWithAnimojiProviderItem:(id)a3 variantsManager:(id)a4;
- (CNAvatarPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4;
- (CNAvatarPosePickerControllerDelegate)delegate;
- (CNPhotoPickerAnimojiProviderItem)originalProviderItem;
- (CNPhotoPickerVariantListController)posePickerController;
- (CNPhotoPickerVariantsManager)variantsManager;
- (id)posePickerViewController;
- (int64_t)numberOfItemsPerRow;
- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4;
- (void)photoPickerVariantListControllerDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredContentSize:(CGSize)a3;
- (void)setNumberOfItemsPerRow:(int64_t)a3;
- (void)setOriginalProviderItem:(id)a3;
- (void)setPosePickerController:(id)a3;
- (void)setVariantsManager:(id)a3;
@end

@implementation CNAvatarPosePickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posePickerController, 0);
  objc_storeStrong((id *)&self->_originalProviderItem, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPosePickerController:(id)a3
{
}

- (CNPhotoPickerVariantListController)posePickerController
{
  return self->_posePickerController;
}

- (void)setOriginalProviderItem:(id)a3
{
}

- (CNPhotoPickerAnimojiProviderItem)originalProviderItem
{
  return self->_originalProviderItem;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (CGSize)desiredContentSize
{
  double width = self->_desiredContentSize.width;
  double height = self->_desiredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)numberOfItemsPerRow
{
  return self->_numberOfItemsPerRow;
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarPosePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarPosePickerControllerDelegate *)WeakRetained;
}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v4 = [(CNAvatarPosePickerController *)self delegate];
  [v4 posePickerController:self didSelectProviderItem:0];
}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v6 = v9;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(CNAvatarPosePickerController *)self delegate];
    [v8 posePickerController:self didSelectProviderItem:v7];
  }
}

- (id)posePickerViewController
{
  posePickerController = self->_posePickerController;
  if (posePickerController)
  {
    v3 = posePickerController;
  }
  else
  {
    id v5 = [CNPhotoPickerVariantListController alloc];
    v6 = [(CNAvatarPosePickerController *)self variantsManager];
    id v7 = [(CNAvatarPosePickerController *)self originalProviderItem];
    v8 = [(CNPhotoPickerVariantListController *)v5 initWithVariantsManager:v6 originalItem:v7];

    [(CNPhotoPickerVariantListController *)v8 setDelegate:self];
    [(CNPhotoPickerVariantListController *)v8 setShowPreview:0];
    [(CNPhotoPickerVariantListController *)v8 setCellStyle:0];
    int64_t v9 = [(CNAvatarPosePickerController *)self numberOfItemsPerRow];
    uint64_t v10 = 3;
    if (v9) {
      uint64_t v10 = v9;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__CNAvatarPosePickerController_posePickerViewController__block_invoke;
    v17[3] = &__block_descriptor_40_e39_q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v17[4] = v10;
    [(CNPhotoPickerVariantListController *)v8 setNumberOfItemsPerRowProvider:v17];
    [(CNPhotoPickerVariantListController *)v8 setCommitsChangesOnSelection:1];
    [(CNAvatarPosePickerController *)self desiredContentSize];
    if (v12 != *MEMORY[0x1E4F1DB30] || v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [(CNAvatarPosePickerController *)self desiredContentSize];
      -[CNPhotoPickerVariantListController setPreferredContentSize:](v8, "setPreferredContentSize:");
    }
    [(CNPhotoPickerVariantListController *)v8 setShowsSelection:0];
    v14 = self->_posePickerController;
    self->_posePickerController = v8;
    v15 = v8;

    v3 = self->_posePickerController;
  }

  return v3;
}

uint64_t __56__CNAvatarPosePickerController_posePickerViewController__block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)setDesiredContentSize:(CGSize)a3
{
  if (self->_desiredContentSize.width != a3.width || self->_desiredContentSize.height != a3.height)
  {
    self->_desiredContentSize = a3;
    -[CNPhotoPickerVariantListController setPreferredContentSize:](self->_posePickerController, "setPreferredContentSize:");
  }
}

- (void)setNumberOfItemsPerRow:(int64_t)a3
{
  if (self->_numberOfItemsPerRow != a3)
  {
    self->_numberOfItemsPerRow = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__CNAvatarPosePickerController_setNumberOfItemsPerRow___block_invoke;
    v3[3] = &__block_descriptor_40_e39_q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v3[4] = a3;
    [(CNPhotoPickerVariantListController *)self->_posePickerController setNumberOfItemsPerRowProvider:v3];
  }
}

uint64_t __55__CNAvatarPosePickerController_setNumberOfItemsPerRow___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (CNAvatarPosePickerController)initWithAnimojiProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarPosePickerController;
  int64_t v9 = [(CNAvatarPosePickerController *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_variantsManager, a4);
    objc_storeStrong((id *)&v10->_originalProviderItem, a3);
    double v11 = v10;
  }

  return v10;
}

- (CNAvatarPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  id v6 = a4;
  id v7 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:a3];
  id v8 = [(CNAvatarPosePickerController *)self initWithAnimojiProviderItem:v7 variantsManager:v6];

  return v8;
}

@end