@interface HKEmergencyCardNameAndPictureTableItem
- (HKEmergencyCardRowHeightChangeDelegate)rowHeightChangeDelegate;
- (double)_cellFittedHeightWithWidth:(double)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_cell;
- (id)_makeMedicalIDPhotoMenu;
- (id)initInEditMode:(BOOL)a3;
- (id)title;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_checkOrRequestForCameraAccessIfNeededWithCompletion:(id)a3;
- (void)_editPhotoTapped:(id)a3;
- (void)_updateMedicalIDPhotoMenu;
- (void)commitEditing;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)medicalIDEditorCell:(id)a3 didChangeHeight:(double)a4 keepRectVisible:(CGRect)a5 inView:(id)a6;
- (void)medicalIDEditorCellDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5;
- (void)medicalIDEditorCellDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5;
- (void)medicalIDEditorCellDidChangeValue:(id)a3;
- (void)presentCameraAuthorizationStatusDeniedAlert;
- (void)setData:(id)a3;
- (void)setRowHeightChangeDelegate:(id)a3;
@end

@implementation HKEmergencyCardNameAndPictureTableItem

- (id)initInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKEmergencyCardNameAndPictureTableItem.m" lineNumber:36 description:@"HKEmergencyCardNameAndPictureTableItem only supports edit mode"];
  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardNameAndPictureTableItem;
  return [(HKEmergencyCardTableItem *)&v8 initInEditMode:v3];
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"name" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_cell
{
  cell = self->_cell;
  if (!cell)
  {
    v4 = [[HKMedicalIDEditorNameAndPhotoCell alloc] initWithStyle:0 reuseIdentifier:0];
    v5 = self->_cell;
    self->_cell = v4;

    [(HKMedicalIDEditorCell *)self->_cell setEditDelegate:self];
    [(HKMedicalIDEditorMultilineStringCell *)self->_cell setHeightChangeDelegate:self];
    [(HKEmergencyCardNameAndPictureTableItem *)self _updateMedicalIDPhotoMenu];
    v6 = [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell editPhotoButton];
    [v6 setShowsMenuAsPrimaryAction:1];

    v7 = [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell editPhotoLabelButton];
    [v7 setShowsMenuAsPrimaryAction:1];

    objc_super v8 = [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell editPhotoButton];
    [v8 addTarget:self action:sel__editPhotoTapped_ forControlEvents:64];

    v9 = [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell editPhotoLabelButton];
    [v9 addTarget:self action:sel__editPhotoTapped_ forControlEvents:64];

    cell = self->_cell;
  }
  return cell;
}

- (void)_editPhotoTapped:(id)a3
{
  v4 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  [v4 commitEditing];

  id v5 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  [v5 beginEditing];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  [a3 frame];
  [(HKEmergencyCardNameAndPictureTableItem *)self _cellFittedHeightWithWidth:v5];
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  [a3 frame];
  [(HKEmergencyCardNameAndPictureTableItem *)self _cellFittedHeightWithWidth:v5];
  return result;
}

- (double)_cellFittedHeightWithWidth:(double)a3
{
  double v5 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  [v5 layoutIfNeeded];

  v6 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  objc_msgSend(v6, "sizeThatFits:", a3, 1.79769313e308);
  double v8 = v7;

  return v8;
}

- (void)medicalIDEditorCell:(id)a3 didChangeHeight:(double)a4 keepRectVisible:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a6;
  id v12 = [(HKEmergencyCardNameAndPictureTableItem *)self rowHeightChangeDelegate];
  objc_msgSend(v12, "tableItem:heightDidChangeForRowIndex:keepRectVisible:inView:", self, 0, v11, x, y, width, height);
}

- (void)medicalIDEditorCellDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  id v11 = [(HKEmergencyCardNameAndPictureTableItem *)self rowHeightChangeDelegate];
  objc_msgSend(v11, "tableItemDidBeginEditing:keepRectVisible:inView:", self, v10, x, y, width, height);
}

- (void)medicalIDEditorCellDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  id v11 = [(HKEmergencyCardNameAndPictureTableItem *)self rowHeightChangeDelegate];
  objc_msgSend(v11, "tableItemDidChangeSelection:keepRectVisible:inView:", self, v10, x, y, width, height);
}

- (void)commitEditing
{
}

- (void)setData:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HKEmergencyCardNameAndPictureTableItem;
  [(HKEmergencyCardTableItem *)&v12 setData:a3];
  v4 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  double v5 = [(HKEmergencyCardTableItem *)self data];
  v6 = [v5 name];
  [v4 setName:v6];

  double v7 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  double v8 = (void *)MEMORY[0x1E4FB1818];
  v9 = [(HKEmergencyCardTableItem *)self data];
  id v10 = [v9 pictureData];
  id v11 = [v8 imageWithData:v10];
  [v7 setPhoto:v11];
}

- (void)_updateMedicalIDPhotoMenu
{
  id v7 = [(HKEmergencyCardNameAndPictureTableItem *)self _makeMedicalIDPhotoMenu];
  BOOL v3 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  v4 = [v3 editPhotoButton];
  [v4 setMenu:v7];

  double v5 = [(HKEmergencyCardNameAndPictureTableItem *)self _cell];
  v6 = [v5 editPhotoLabelButton];
  [v6 setMenu:v7];
}

- (id)_makeMedicalIDPhotoMenu
{
  objc_initWeak(&location, self);
  int v3 = [MEMORY[0x1E4FB1828] isSourceTypeAvailable:1];
  v4 = [(HKEmergencyCardTableItem *)self data];
  double v5 = [v4 pictureData];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = [v8 localizedStringForKey:@"take_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"camera"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke;
    v31[3] = &unk_1E6D522F8;
    objc_copyWeak(&v32, &location);
    id v11 = [v7 actionWithTitle:v9 image:v10 identifier:@"com.apple.health.medical_id.take_photo" handler:v31];

    [v6 addObject:v11];
    objc_destroyWeak(&v32);
  }
  objc_super v12 = (void *)MEMORY[0x1E4FB13F0];
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"choose_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.on.rectangle"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_3;
  v29[3] = &unk_1E6D522F8;
  objc_copyWeak(&v30, &location);
  v16 = [v12 actionWithTitle:v14 image:v15 identifier:@"com.apple.health.medical_id.choose_photo" handler:v29];

  [v6 addObject:v16];
  if (v5)
  {
    v17 = (void *)MEMORY[0x1E4FB13F0];
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v19 = [v18 localizedStringForKey:@"delete_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_4;
    v27 = &unk_1E6D522F8;
    objc_copyWeak(&v28, &location);
    v21 = [v17 actionWithTitle:v19 image:v20 identifier:@"com.apple.health.medical_id.delete_photo" handler:&v24];

    objc_msgSend(v21, "setAttributes:", 2, v24, v25, v26, v27);
    [v6 addObject:v21];

    objc_destroyWeak(&v28);
  }
  v22 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3B9CF20 image:0 identifier:0 options:0 children:v6];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return v22;
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_2;
  v2[3] = &unk_1E6D522D0;
  v2[4] = WeakRetained;
  [WeakRetained _checkOrRequestForCameraAccessIfNeededWithCompletion:v2];
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    id v10 = *(void **)(a1 + 32);
    [v10 presentCameraAuthorizationStatusDeniedAlert];
  }
  else if (a2 == 3)
  {
    HKLogCameraAccess();
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1828]);
    [v3 setDelegate:*(void *)(a1 + 32)];
    [v3 setSourceType:1];
    [v3 setCameraDevice:1];
    [v3 setAllowsEditing:1];
    v4 = (void *)MEMORY[0x1E4F1CA60];
    double v5 = [v3 _properties];
    id v6 = [v4 dictionaryWithDictionary:v5];

    uint64_t v7 = *MEMORY[0x1E4FB3210];
    v11[0] = *MEMORY[0x1E4FB3250];
    v11[1] = v7;
    v12[0] = MEMORY[0x1E4F1CC38];
    v12[1] = MEMORY[0x1E4F1CC38];
    v11[2] = *MEMORY[0x1E4FB31D0];
    v12[2] = MEMORY[0x1E4F1CC38];
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    [v6 addEntriesFromDictionary:v8];

    [v3 _setProperties:v6];
    v9 = [*(id *)(a1 + 32) owningViewController];
    [v9 presentViewController:v3 animated:1 completion:0];
  }
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKLogPhotoAccess();
  id v1 = objc_alloc_init(MEMORY[0x1E4FB1828]);
  [v1 setDelegate:WeakRetained];
  [v1 setSourceType:0];
  [v1 setAllowsEditing:1];
  v2 = [WeakRetained owningViewController];
  [v2 presentViewController:v1 animated:1 completion:0];
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained data];
  [v1 setPictureData:0];

  v2 = [WeakRetained _cell];
  [v2 setPhoto:0];

  [WeakRetained _updateMedicalIDPhotoMenu];
}

- (void)_checkOrRequestForCameraAccessIfNeededWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F15C18];
  uint64_t v5 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:v4];
  uint64_t v6 = v5;
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        -[HKEmergencyCardNameAndPictureTableItem _checkOrRequestForCameraAccessIfNeededWithCompletion:](v6, v10);
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_340;
      void v11[3] = &unk_1E6D52348;
      uint64_t v7 = &v13;
      id v13 = v3;
      id v12 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v11);
      v9 = v12;
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F16440];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_2;
      v14[3] = &unk_1E6D52370;
      uint64_t v7 = &v16;
      id v16 = v3;
      id v15 = v4;
      [v8 requestAccessForMediaType:v15 completionHandler:v14];
      v9 = v15;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke;
    block[3] = &unk_1E6D52320;
    uint64_t v7 = (id *)v18;
    v18[0] = v3;
    v18[1] = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_3;
  v2[3] = &unk_1E6D52348;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:*(void *)(a1 + 32)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_340(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:*(void *)(a1 + 32)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)presentCameraAuthorizationStatusDeniedAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v5 = [v4 localizedStringForKey:@"tcc_camera_denied_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v7 = [v6 localizedStringForKey:@"tcc_camera_denied_message" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v17 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v10 = [v9 localizedStringForKey:@"tcc_camera_denied_cancel_action" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v11 = [v8 actionWithTitle:v10 style:1 handler:0];

  [v17 addAction:v11];
  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"tcc_camera_denied_default_action" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v15 = [v12 actionWithTitle:v14 style:0 handler:&__block_literal_global_14];

  [v17 addAction:v15];
  [v17 setPreferredAction:v15];
  id v16 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v16 presentViewController:v17 animated:1 completion:0];
}

void __85__HKEmergencyCardNameAndPictureTableItem_presentCameraAuthorizationStatusDeniedAlert__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=HEALTH"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  id v5 = [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell name];
  id v4 = [(HKEmergencyCardTableItem *)self data];
  [v4 setName:v5];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  if (a4)
  {
    id v34 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4FB2A00]];
    [v34 size];
    double v6 = v5;
    [v34 size];
    double v8 = v7;
    [v34 size];
    double v10 = v9;
    [v34 size];
    double v12 = v11;
    [v34 size];
    double v14 = v13;
    double v16 = v15;
    [v34 size];
    if (v10 <= v12)
    {
      double v20 = 0.0;
      if (v16 <= v17)
      {
        double v21 = 0.0;
      }
      else
      {
        [v34 size];
        double v23 = v22;
        [v34 size];
        double v25 = (v23 - v24) * 0.5;
        double v21 = 0.0;
        double v20 = v25 + 0.0;
        double v8 = v6;
      }
    }
    else
    {
      double v19 = (v14 - v18) * 0.5;
      double v20 = 0.0;
      double v21 = v19 + 0.0;
      double v6 = v8;
    }
    v26 = objc_msgSend(v34, "hk_croppedImageWithRect:", v21, v20, v6, v8);
    objc_msgSend(v26, "imageByPreparingThumbnailOfSize:", 100.0, 100.0);
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v28 = v27;
    if (v27)
    {
      [(UIImage *)v27 size];
      if (v29 > 0.0)
      {
        [(UIImage *)v28 size];
        if (v30 > 0.0)
        {
          v31 = UIImageJPEGRepresentation(v28, 1.0);
          id v32 = [(HKEmergencyCardTableItem *)self data];
          [v32 setPictureData:v31];

          [(HKMedicalIDEditorNameAndPhotoCell *)self->_cell setPhoto:v28];
        }
      }
    }
    v33 = [(HKEmergencyCardTableItem *)self owningViewController];
    [v33 dismissViewControllerAnimated:1 completion:0];

    [(HKEmergencyCardNameAndPictureTableItem *)self _updateMedicalIDPhotoMenu];
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v3 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 navigationControllerSupportedInterfaceOrientations:v3];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (HKEmergencyCardRowHeightChangeDelegate)rowHeightChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rowHeightChangeDelegate);
  return (HKEmergencyCardRowHeightChangeDelegate *)WeakRetained;
}

- (void)setRowHeightChangeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowHeightChangeDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

- (void)_checkOrRequestForCameraAccessIfNeededWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Medical ID Camera Access: Unexpected return value %ld", (uint8_t *)&v2, 0xCu);
}

@end