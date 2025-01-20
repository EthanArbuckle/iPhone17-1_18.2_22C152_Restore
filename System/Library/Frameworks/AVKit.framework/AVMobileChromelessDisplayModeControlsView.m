@interface AVMobileChromelessDisplayModeControlsView
- (AVButton)fullScreenButton;
- (AVButton)pictureInPictureButton;
- (AVMobileChromelessContainerView)containerView;
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileChromelessDisplayModeControlsView)initWithStyleSheet:(id)a3;
- (AVMobileChromelessDisplayModeControlsViewDelegate)delegate;
- (AVRoutePickerView)routePickerButton;
- (AVRoutePickerView)routePickerView;
- (AVRoutingConfiguration)routingConfiguration;
- (BOOL)includesFullscreenControl;
- (BOOL)includesPictureInPictureControl;
- (BOOL)includesRoutePickerControl;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)customActions;
- (id)menuForMenuButton:(id)a3;
- (unint64_t)fullscreenIcon;
- (void)_updateFullscreenControlIcon;
- (void)_updateItemViewsIfNeeded;
- (void)containerView:(id)a3 layoutWithHiddenViews:(id)a4;
- (void)didMoveToWindow;
- (void)fullScreenButtonWasPressed;
- (void)layoutSubviews;
- (void)menuButtonDidHideMenu:(id)a3;
- (void)menuButtonWillShowMenu:(id)a3;
- (void)pictureInPictureControlWasPressed;
- (void)setCustomActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFullscreenIcon:(unint64_t)a3;
- (void)setIncludesFullscreenControl:(BOOL)a3;
- (void)setIncludesPictureInPictureControl:(BOOL)a3;
- (void)setIncludesRoutePickerControl:(BOOL)a3;
- (void)setRoutePickerButton:(id)a3;
- (void)setRoutingConfiguration:(id)a3;
- (void)setStyleSheet:(id)a3;
@end

@implementation AVMobileChromelessDisplayModeControlsView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_routePickerButton, 0);
  objc_storeStrong((id *)&self->_pictureInPictureButton, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);

  objc_storeStrong((id *)&self->_viewToIdentifierMap, 0);
}

- (AVMobileChromelessDisplayModeControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessDisplayModeControlsViewDelegate *)WeakRetained;
}

- (AVRoutingConfiguration)routingConfiguration
{
  return self->_routingConfiguration;
}

- (BOOL)includesRoutePickerControl
{
  return self->_includesRoutePickerControl;
}

- (BOOL)includesFullscreenControl
{
  return self->_includesFullscreenControl;
}

- (BOOL)includesPictureInPictureControl
{
  return self->_includesPictureInPictureControl;
}

- (unint64_t)fullscreenIcon
{
  return self->_fullscreenIcon;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (void)setRoutePickerButton:(id)a3
{
}

- (void)menuButtonDidHideMenu:(id)a3
{
  v4 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
    [v6 displayModeControlsViewDidDismissContextMenu:self];
  }
}

- (void)menuButtonWillShowMenu:(id)a3
{
  v4 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
    [v6 displayModeControlsViewWillPresentContextMenu:self];
  }
}

- (id)menuForMenuButton:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [(NSMapTable *)self->_viewToIdentifierMap objectForKey:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_customActions;
  id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = [v9 contextMenu];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)containerView:(id)a3 layoutWithHiddenViews:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [(NSMapTable *)self->_viewToIdentifierMap objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v11)];
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__AVMobileChromelessDisplayModeControlsView_containerView_layoutWithHiddenViews___block_invoke;
  v14[3] = &unk_1E5FC3D18;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __81__AVMobileChromelessDisplayModeControlsView_containerView_layoutWithHiddenViews___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 displayModeControlsView:*(void *)(a1 + 32) layoutWithHiddenIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)fullScreenButtonWasPressed
{
  id v3 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
    [v5 displayModeControlsViewFullscreenButtonWasPressed:self];
  }
}

- (void)pictureInPictureControlWasPressed
{
  id v3 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessDisplayModeControlsView *)self delegate];
    [v5 displayModeControlsViewPictureInPictureButtonWasPressed:self];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessDisplayModeControlsView;
  [(AVView *)&v8 layoutSubviews];
  id v3 = [(AVMobileChromelessDisplayModeControlsView *)self containerView];
  [(AVMobileChromelessDisplayModeControlsView *)self bounds];
  objc_msgSend(v3, "avkit_setFrame:inLayoutDirection:", -[AVMobileChromelessDisplayModeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v4, v5, v6, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(AVMobileChromelessDisplayModeControlsView *)self containerView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(AVMobileChromelessDisplayModeControlsView *)self containerView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)didMoveToWindow
{
  -[AVMobileChromelessDisplayModeControlsView _updateFullscreenControlIcon](self);

  -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
}

- (void)_updateFullscreenControlIcon
{
  if (!result) {
    return result;
  }
  v1 = result;
  uint64_t v2 = result[65];
  if (!v2)
  {
    double v3 = AVMobileAccessibilityIdentifierCloseButton;
    double v4 = AVMobileImageNameDone;
    goto LABEL_6;
  }
  if (v2 == 1)
  {
    double v3 = AVMobileAccessibilityIdentifierFullScreenButton;
    double v4 = &AVMobileImageNameEnterFullScreen;
LABEL_6:
    double v5 = [result fullScreenButton];
    [v5 setImageName:*v4];

    double v6 = [v1 fullScreenButton];
    [v6 setAccessibilityIdentifier:*v3];
  }

  return (void *)[v1 setNeedsLayout];
}

- (void)_updateItemViewsIfNeeded
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    uint64_t v2 = [a1 window];

    if (v2)
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v1 includesFullscreenControl])
      {
        double v3 = [v1 fullScreenButton];
        [v37 addObject:v3];
      }
      if ([v1 includesPictureInPictureControl])
      {
        double v4 = [v1 pictureInPictureButton];
        [v37 addObject:v4];
      }
      if ([v1 includesRoutePickerControl])
      {
        double v5 = [v1 routePickerButton];
        [v37 addObject:v5];
      }
      double v6 = [v1 customActions];

      if (v6)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id obj = [v1 customActions];
        uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v40;
          uint64_t v10 = *MEMORY[0x1E4FB2998];
          double v11 = *MEMORY[0x1E4FB09D8];
          unint64_t v12 = 0x1E4FB0000uLL;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v40 != v9) {
                objc_enumerationMutation(obj);
              }
              id v14 = *(id *)(*((void *)&v39 + 1) + 8 * i);
              id v15 = [v14 contextMenu];

              long long v16 = [v14 accessibilityIdentifier];
              long long v17 = [v14 accessibilityLabel];
              if (v15)
              {
                long long v18 = +[AVMenuButton buttonWithAccessibilityIdentifier:v16 accessibilityLabel:v17 isSecondGeneration:1];

                long long v19 = [v14 contextMenu];
                [v18 setMenu:v19];

                [v18 setShowsMenuAsPrimaryAction:1];
                [v18 setAppliesTransformToImageViewWhenHighlighted:1];
                [v18 setDelegate:v1];
              }
              else
              {
                long long v18 = +[AVButton buttonWithAccessibilityIdentifier:v16 accessibilityLabel:v17 isSecondGeneration:1];

                [v18 addAction:v14 forControlEvents:64];
                [v18 setShowsMenuAsPrimaryAction:0];
              }
              [v18 setAutoresizingMask:0];
              v20 = objc_msgSend(*(id *)(v12 + 2272), "avkit_nonScalingFontWithTextStyle:weight:", v10, v11);
              [v18 setInlineFont:v20];
              uint64_t v21 = [v14 tintColor];
              if (v21)
              {
                [v18 setTintColor:v21];
              }
              else
              {
                [MEMORY[0x1E4FB1618] whiteColor];
                v38 = v20;
                uint64_t v22 = v8;
                uint64_t v23 = v10;
                uint64_t v24 = v9;
                v25 = v1;
                v27 = unint64_t v26 = v12;
                [v18 setTintColor:v27];

                unint64_t v12 = v26;
                v1 = v25;
                uint64_t v9 = v24;
                uint64_t v10 = v23;
                uint64_t v8 = v22;
                v20 = v38;
              }

              v28 = [v14 image];

              if (v28)
              {
                v29 = [v14 image];
                [v18 setImage:v29 forState:0];
              }
              else
              {
                v29 = [v14 title];
                [v18 setTitle:v29 forState:0];
              }

              v30 = [v14 accessibilityLabel];
              [v18 setAccessibilityLabel:v30];

              v31 = [v14 accessibilityHint];
              [v18 setAccessibilityHint:v31];

              if (v18)
              {
                [v37 addObject:v18];
                v32 = (void *)v1[57];
                v33 = [v14 identifier];
                [v32 setObject:v33 forKey:v18];
              }
            }
            uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v8);
        }
      }
      v34 = [v1 containerView];
      [v34 setItemViews:v37];

      [v1 invalidateIntrinsicContentSize];
      v35 = [v1 superview];
      objc_msgSend(v35, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v1);
    }
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(AVMobileChromelessDisplayModeControlsView *)self routePickerButton];
  [v6 setDelegate:v5];
}

- (void)setRoutingConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMobileChromelessDisplayModeControlsView *)self routePickerButton];
  [v5 setRoutingConfiguration:v4];
}

- (void)setIncludesRoutePickerControl:(BOOL)a3
{
  if (self->_includesRoutePickerControl != a3)
  {
    self->_includesRoutePickerControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setIncludesPictureInPictureControl:(BOOL)a3
{
  if (self->_includesPictureInPictureControl != a3)
  {
    self->_includesPictureInPictureControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setIncludesFullscreenControl:(BOOL)a3
{
  if (self->_includesFullscreenControl != a3)
  {
    self->_includesFullscreenControl = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (void)setFullscreenIcon:(unint64_t)a3
{
  if (self->_fullscreenIcon != a3)
  {
    self->_fullscreenIcon = a3;
    -[AVMobileChromelessDisplayModeControlsView _updateFullscreenControlIcon](self);
  }
}

- (void)setStyleSheet:(id)a3
{
  id v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_styleSheet, a3);
    p_styleSheet = (AVMobileChromelessControlsStyleSheet **)[(AVMobileChromelessDisplayModeControlsView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_styleSheet, v5);
}

- (void)setCustomActions:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_customActions] & 1) == 0)
  {
    id v4 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6 copyItems:1];
    customActions = self->_customActions;
    self->_customActions = v4;

    -[AVMobileChromelessDisplayModeControlsView _updateItemViewsIfNeeded](self);
  }
}

- (AVMobileChromelessContainerView)containerView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    id v4 = objc_alloc_init(AVMobileChromelessContainerView);
    id v5 = self->_containerView;
    self->_containerView = v4;

    [(AVMobileChromelessContainerView *)self->_containerView setSpacing:26.0];
    [(AVMobileChromelessContainerView *)self->_containerView setDelegate:self];
    [(AVMobileChromelessContainerView *)self->_containerView setAutoresizingMask:0];
    [(AVMobileChromelessDisplayModeControlsView *)self addSubview:self->_containerView];
    containerView = self->_containerView;
  }

  return containerView;
}

- (AVRoutePickerView)routePickerView
{
  if ([(AVMobileChromelessDisplayModeControlsView *)self includesRoutePickerControl])
  {
    double v3 = [(AVMobileChromelessDisplayModeControlsView *)self routePickerButton];
  }
  else
  {
    double v3 = 0;
  }

  return (AVRoutePickerView *)v3;
}

- (AVRoutePickerView)routePickerButton
{
  routePickerButton = self->_routePickerButton;
  if (!routePickerButton)
  {
    id v4 = objc_alloc_init(AVRoutePickerView);
    id v5 = self->_routePickerButton;
    self->_routePickerButton = v4;

    [(AVRoutePickerView *)self->_routePickerButton setAutoresizingMask:0];
    [(AVRoutePickerView *)self->_routePickerButton setPrioritizesVideoDevices:1];
    id v6 = self->_routePickerButton;
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(AVRoutePickerView *)v6 setTintColor:v7];

    [(NSMapTable *)self->_viewToIdentifierMap setObject:@"AVRoutePickerControl" forKey:self->_routePickerButton];
    routePickerButton = self->_routePickerButton;
  }

  return routePickerButton;
}

- (AVButton)pictureInPictureButton
{
  pictureInPictureButton = self->_pictureInPictureButton;
  if (!pictureInPictureButton)
  {
    id v4 = +[AVButton buttonWithAccessibilityIdentifier:@"PIP Button" isSecondGeneration:1];
    id v5 = self->_pictureInPictureButton;
    self->_pictureInPictureButton = v4;

    [(AVButton *)self->_pictureInPictureButton addTarget:self action:sel_pictureInPictureControlWasPressed forControlEvents:64];
    [(AVButton *)self->_pictureInPictureButton setImageName:@"pip.enter"];
    id v6 = self->_pictureInPictureButton;
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(AVButton *)v6 setTintColor:v7];

    [(AVButton *)self->_pictureInPictureButton setAutoresizingMask:0];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], *MEMORY[0x1E4FB09D8]);
    [(AVButton *)self->_pictureInPictureButton setInlineFont:v8];
    [(NSMapTable *)self->_viewToIdentifierMap setObject:@"AVPictureInPictureControl" forKey:self->_pictureInPictureButton];

    pictureInPictureButton = self->_pictureInPictureButton;
  }

  return pictureInPictureButton;
}

- (AVButton)fullScreenButton
{
  fullScreenButton = self->_fullScreenButton;
  if (!fullScreenButton)
  {
    id v4 = +[AVButton buttonWithAccessibilityIdentifier:@"Fullscreen Button" isSecondGeneration:1];
    id v5 = self->_fullScreenButton;
    self->_fullScreenButton = v4;

    [(AVButton *)self->_fullScreenButton addTarget:self action:sel_fullScreenButtonWasPressed forControlEvents:64];
    [(AVButton *)self->_fullScreenButton setImageName:@"xmark"];
    id v6 = self->_fullScreenButton;
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(AVButton *)v6 setTintColor:v7];

    [(AVButton *)self->_fullScreenButton setAutoresizingMask:0];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], *MEMORY[0x1E4FB09D8]);
    [(AVButton *)self->_fullScreenButton setInlineFont:v8];
    [(NSMapTable *)self->_viewToIdentifierMap setObject:@"AVFullScreenControl" forKey:self->_fullScreenButton];

    fullScreenButton = self->_fullScreenButton;
  }

  return fullScreenButton;
}

- (AVMobileChromelessDisplayModeControlsView)initWithStyleSheet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessDisplayModeControlsView;
  id v6 = -[AVView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    v7->_includesPictureInPictureControl = 0;
    v7->_includesFullscreenControl = 1;
    v7->_includesRoutePickerControl = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
    viewToIdentifierMap = v7->_viewToIdentifierMap;
    v7->_viewToIdentifierMap = (NSMapTable *)v8;

    [(AVView *)v7 setIgnoresTouches:1];
  }

  return v7;
}

@end