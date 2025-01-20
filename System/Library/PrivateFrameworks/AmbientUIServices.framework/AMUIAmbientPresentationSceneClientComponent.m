@interface AMUIAmbientPresentationSceneClientComponent
- (BOOL)_isAmbientPresentedForScene:(id)a3;
- (BOOL)isAmbientPresented;
- (int64_t)_ambientDisplayStyleForScene:(id)a3;
- (int64_t)ambientDisplayStyle;
- (void)_sceneWillConnect:(id)a3;
- (void)_updateAmbientTraitsForWindowScene:(id)a3;
- (void)dealloc;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)setAmbientDisplayStyle:(int64_t)a3;
- (void)setAmbientPresented:(BOOL)a3;
- (void)setScene:(id)a3;
@end

@implementation AMUIAmbientPresentationSceneClientComponent

- (void)setScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMUIAmbientPresentationSceneClientComponent;
  [(FBSSceneComponent *)&v11 setScene:v4];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  self->_ambientPresented = [(AMUIAmbientPresentationSceneClientComponent *)self _isAmbientPresentedForScene:v8];
  int64_t v9 = [(AMUIAmbientPresentationSceneClientComponent *)self _ambientDisplayStyleForScene:v8];

  self->_ambientDisplayStyle = v9;
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel__sceneWillConnect_ name:*MEMORY[0x263F1D580] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D580] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientPresentationSceneClientComponent;
  [(AMUIAmbientPresentationSceneClientComponent *)&v4 dealloc];
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 settingsDiff];
  if ([v8 containsProperty:sel_isAmbientPresented])
  {

LABEL_4:
    self->_ambientPresented = [(AMUIAmbientPresentationSceneClientComponent *)self _isAmbientPresentedForScene:v6];
    self->_ambientDisplayStyle = [(AMUIAmbientPresentationSceneClientComponent *)self _ambientDisplayStyleForScene:v6];
    objc_super v11 = [MEMORY[0x263F1C408] sharedApplication];
    v12 = [v11 connectedScenes];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__AMUIAmbientPresentationSceneClientComponent_scene_didUpdateSettings___block_invoke;
    v13[3] = &unk_2652287E0;
    v13[4] = self;
    [v12 enumerateObjectsUsingBlock:v13];

    goto LABEL_5;
  }
  int64_t v9 = [v7 settingsDiff];
  int v10 = [v9 containsProperty:sel_ambientDisplayStyle];

  if (v10) {
    goto LABEL_4;
  }
LABEL_5:
}

void __71__AMUIAmbientPresentationSceneClientComponent_scene_didUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  [*(id *)(a1 + 32) _updateAmbientTraitsForWindowScene:v6];
}

- (BOOL)_isAmbientPresentedForScene:(id)a3
{
  id v3 = [a3 settings];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isAmbientPresented];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)_ambientDisplayStyleForScene:(id)a3
{
  id v3 = [a3 settings];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 ambientDisplayStyle];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_sceneWillConnect:(id)a3
{
  int64_t v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [(AMUIAmbientPresentationSceneClientComponent *)self _updateAmbientTraitsForWindowScene:v8];
}

- (void)_updateAmbientTraitsForWindowScene:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 traitOverrides];
    if ([(AMUIAmbientPresentationSceneClientComponent *)self isAmbientPresented]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    id v7 = self;
    [v5 setNSIntegerValue:v6 forTrait:v7];

    id v10 = [v4 traitOverrides];

    int64_t v8 = [(AMUIAmbientPresentationSceneClientComponent *)self ambientDisplayStyle];
    int64_t v9 = self;
    [v10 setNSIntegerValue:v8 forTrait:v9];
  }
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

@end