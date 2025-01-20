@interface AVMobilePlaybackRateMenuController
+ (void)_loadPlaybackSpeedControlImageWithCompletionHandler:(id)a3;
- (AVMobilePlaybackRateMenuController)init;
- (AVPlaybackSpeedCollection)playbackSpeedCollection;
- (UIMenu)menu;
- (void)_reconstructPlaybackRateMenuItems;
- (void)_updatePlaybackRateMenuIfNeeded;
- (void)_updatePlaybackRateMenuItemStatesIfNeeded;
- (void)dealloc;
- (void)setPlaybackSpeedCollection:(id)a3;
@end

@implementation AVMobilePlaybackRateMenuController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_storeStrong((id *)&self->_activeSelectedPlaybackSpeed, 0);
  objc_storeStrong((id *)&self->_activePlaybackRateCollection, 0);
  objc_storeStrong((id *)&self->_activeMenuItems, 0);
  objc_storeStrong((id *)&self->_playbackRateMenu, 0);

  objc_storeStrong((id *)&self->_observationController, 0);
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (void)_updatePlaybackRateMenuItemStatesIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = self->_activeMenuItems;
  v4 = self->_activePlaybackRateCollection;
  v5 = [(AVPlaybackSpeedCollection *)v4 speeds];
  v6 = [(AVPlaybackSpeedCollection *)v4 activeSpeed];
  uint64_t v7 = [v5 indexOfObject:v6];

  uint64_t v8 = [(NSArray *)v3 count];
  if (v8 != [v5 count])
  {
    v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      v15 = v3;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency - playback speed menu item count does not equal the speed collection count. \n%@\n%@", (uint8_t *)&v14, 0x16u);
    }
  }
  uint64_t v10 = [(NSArray *)v3 count];
  BOOL v11 = v10 != [v5 count] || v7 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v11 && [(NSArray *)v3 count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [(NSArray *)v3 objectAtIndex:v12];
      [v13 setState:v7 == v12];

      ++v12;
    }
    while (v12 < [(NSArray *)v3 count]);
  }
}

- (void)_updatePlaybackRateMenuIfNeeded
{
  id obj = [(AVMobilePlaybackRateMenuController *)self playbackSpeedCollection];
  v3 = [obj activeSpeed];
  id v4 = (id)AVMobilePlaybackSpeedControlImage;
  BOOL v5 = v4 != 0;
  if (*(_OWORD *)&self->_activePlaybackRateCollection != __PAIR128__((unint64_t)v3, (unint64_t)obj)
    || self->_activeMenuHasImage != v5)
  {
    objc_storeStrong((id *)&self->_activePlaybackRateCollection, obj);
    objc_storeStrong((id *)&self->_activeSelectedPlaybackSpeed, v3);
    self->_activeMenuHasImage = v5;
    v6 = AVLocalizedString(@"Playback Speed");
    [(AVMobilePlaybackRateMenuController *)self willChangeValueForKey:@"menu"];
    uint64_t v7 = [MEMORY[0x1E4FB1970] menuWithTitle:v6 image:v4 identifier:@"AVPlaybackSpeedMenu" options:0 children:self->_activeMenuItems];
    playbackRateMenu = self->_playbackRateMenu;
    self->_playbackRateMenu = v7;

    [(AVMobilePlaybackRateMenuController *)self didChangeValueForKey:@"menu"];
  }
}

- (void)_reconstructPlaybackRateMenuItems
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(AVMobilePlaybackRateMenuController *)self playbackSpeedCollection];
  v3 = [v2 displaySpeeds];
  id v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [v9 localizedNumericName];
        BOOL v11 = [v2 activeSpeed];

        unint64_t v12 = (void *)MEMORY[0x1E4FB13F0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __71__AVMobilePlaybackRateMenuController__reconstructPlaybackRateMenuItems__block_invoke;
        v18[3] = &unk_1E5FC28B0;
        v18[4] = v9;
        id v19 = v2;
        v13 = [v12 actionWithTitle:v10 image:0 identifier:0 handler:v18];
        int v14 = v13;
        if (v11 == v9) {
          [v13 setState:1];
        }
        if ([v9 isSynthesized]) {
          [v14 setAttributes:1];
        }
        [(NSArray *)v4 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  activeMenuItems = self->_activeMenuItems;
  self->_activeMenuItems = v4;
}

uint64_t __71__AVMobilePlaybackRateMenuController__reconstructPlaybackRateMenuItems__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSynthesized];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return [v3 selectSpeed:v4];
  }
  return result;
}

- (UIMenu)menu
{
  return self->_playbackRateMenu;
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  uint64_t v5 = (AVPlaybackSpeedCollection *)a3;
  if (self->_playbackSpeedCollection != v5)
  {
    uint64_t v8 = v5;
    [(AVObservationController *)self->_observationController stopAllObservation];
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    playbackSpeedCollection = self->_playbackSpeedCollection;
    if (playbackSpeedCollection) {
      id v7 = [(AVObservationController *)self->_observationController startObserving:playbackSpeedCollection keyPath:@"selectedSpeed" includeInitialValue:0 observationHandler:&__block_literal_global_3218];
    }
    [(AVMobilePlaybackRateMenuController *)self _reconstructPlaybackRateMenuItems];
    [(AVMobilePlaybackRateMenuController *)self _updatePlaybackRateMenuIfNeeded];
    uint64_t v5 = v8;
  }
}

void __65__AVMobilePlaybackRateMenuController_setPlaybackSpeedCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id v8 = [v5 value];
  id v7 = [v5 oldValue];

  if (v8 && v7) {
    [v6 _updatePlaybackRateMenuItemStatesIfNeeded];
  }
  else {
    [v6 _reconstructPlaybackRateMenuItems];
  }
  [v6 _updatePlaybackRateMenuIfNeeded];
}

- (void)dealloc
{
  [(AVObservationController *)self->_observationController stopAllObservation];
  v3.receiver = self;
  v3.super_class = (Class)AVMobilePlaybackRateMenuController;
  [(AVMobilePlaybackRateMenuController *)&v3 dealloc];
}

- (AVMobilePlaybackRateMenuController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVMobilePlaybackRateMenuController;
  v2 = [(AVMobilePlaybackRateMenuController *)&v9 init];
  if (v2)
  {
    objc_super v3 = [[AVObservationController alloc] initWithOwner:v2];
    observationController = v2->_observationController;
    v2->_observationController = v3;

    objc_initWeak(&location, v2);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__AVMobilePlaybackRateMenuController_init__block_invoke;
    v6[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v7, &location);
    +[AVMobilePlaybackRateMenuController _loadPlaybackSpeedControlImageWithCompletionHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__AVMobilePlaybackRateMenuController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlaybackRateMenuIfNeeded];
}

+ (void)_loadPlaybackSpeedControlImageWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!AVMobilePlaybackSpeedControlImage)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__AVMobilePlaybackRateMenuController__loadPlaybackSpeedControlImageWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5FC2210;
    id v7 = v3;
    objc_msgSend(v4, "avkit_imageWithSymbolNamed:font:completion:", @"speedometer", v5, v6);
  }
}

void __90__AVMobilePlaybackRateMenuController__loadPlaybackSpeedControlImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)&AVMobilePlaybackSpeedControlImage, a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

@end