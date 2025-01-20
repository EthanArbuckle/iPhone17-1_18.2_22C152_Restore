@interface PKTextEffectsWindowObserver
- (id)keyWindow;
- (void)_handleKeyWindowDidChangeNotification:(id)a3;
- (void)_handleSceneDidActivateNotification:(id)a3;
- (void)_installColorAppearanceTraitObserver:(void *)a1;
- (void)_updateCachedKeyWindowBounds;
- (void)initWithTextEffectsWindow:(void *)a1;
@end

@implementation PKTextEffectsWindowObserver

- (void)initWithTextEffectsWindow:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTextEffectsWindowObserver;
    id v4 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 7, v3);
      v5 = -[PKTextEffectsWindowObserver keyWindow]((uint64_t)a1);
      [v5 bounds];
      a1[1] = v6;
      a1[2] = v7;
      a1[3] = v8;
      a1[4] = v9;
      v10 = [v5 traitCollection];
      a1[5] = [v10 userInterfaceStyle];

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:a1 selector:sel__handleTextEffectsWindowDidRotateNotification_ name:*MEMORY[0x1E4FB3000] object:v3];
      [v11 addObserver:a1 selector:sel__handleKeyWindowDidChangeNotification_ name:*MEMORY[0x1E4FB30E8] object:0];
      uint64_t v12 = *MEMORY[0x1E4FB2E80];
      v13 = [v5 windowScene];
      [v11 addObserver:a1 selector:sel__handleSceneDidActivateNotification_ name:v12 object:v13];

      -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](a1, v3);
      -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](a1, v5);
    }
  }

  return a1;
}

- (id)keyWindow
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v2 = objc_msgSend(WeakRetained, "windowScene", 0);
    id v3 = [v2 _visibleWindows];

    id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v7 isKeyWindow])
          {
            id v4 = v7;
            goto LABEL_12;
          }
        }
        id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_installColorAppearanceTraitObserver:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PKTextEffectsWindowObserver__installColorAppearanceTraitObserver___block_invoke;
    v6[3] = &unk_1E64C7008;
    objc_copyWeak(&v7, &location);
    id v5 = (id)[v3 registerForTraitChanges:v4 withHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_updateCachedKeyWindowBounds
{
  if (a1)
  {
    -[PKTextEffectsWindowObserver keyWindow](a1);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 bounds];
    CGFloat v3 = v2;
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    v13.origin.x = v2;
    v13.origin.y = v4;
    v13.size.width = v6;
    v13.size.height = v8;
    if (!CGRectEqualToRect(*(CGRect *)(a1 + 8), v13))
    {
      *(CGFloat *)(a1 + 8) = v3;
      *(CGFloat *)(a1 + 16) = v5;
      *(CGFloat *)(a1 + 24) = v7;
      *(CGFloat *)(a1 + 32) = v9;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained textEffectsWindowDidChangeKeyWindowBounds:a1];
    }
  }
}

- (void)_handleKeyWindowDidChangeNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138477827;
    id v8 = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "key window did change: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  CGFloat v6 = -[PKTextEffectsWindowObserver keyWindow]((uint64_t)self);
  -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](self, v6);
}

- (void)_handleSceneDidActivateNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "scene did activate: %{private}@", (uint8_t *)&v6, 0xCu);
  }

  -[PKTextEffectsWindowObserver _updateCachedKeyWindowBounds]((uint64_t)self);
}

void __68__PKTextEffectsWindowObserver__installColorAppearanceTraitObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    CGFloat v2 = -[PKTextEffectsWindowObserver keyWindow]((uint64_t)WeakRetained);
    CGFloat v3 = [v2 traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (*((void *)v6 + 5) != v4)
    {
      *((void *)v6 + 5) = v4;
      id v5 = objc_loadWeakRetained((id *)v6 + 6);
      [v5 textEffectsWindowDidChangeKeyWindowUserInterfaceStyle:v6];
    }
    id WeakRetained = v6;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textEffectsWindow);

  objc_destroyWeak((id *)&self->_delegate);
}

@end