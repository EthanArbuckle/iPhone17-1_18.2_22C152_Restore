@interface CNAvatarView
+ (BOOL)defaultThreeDTouchSupport;
+ (id)descriptionForDisplayedImageState:(int64_t)a3;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3;
+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4 description:(id)a5;
+ (id)makeDescriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4;
+ (unint64_t)maxContactAvatars;
- (BOOL)allowStaleRendering;
- (BOOL)allowStaleRenderingWithMatchingContextToken;
- (BOOL)allowsAnimation;
- (BOOL)asynchronousRendering;
- (BOOL)autoUpdateContact;
- (BOOL)avatarCardController:(id)a3 shouldShowContact:(id)a4;
- (BOOL)bypassActionValidation;
- (BOOL)disableCornerRadiusForAvatar;
- (BOOL)enabled;
- (BOOL)isDisplayingContent;
- (BOOL)isPerformingTransition;
- (BOOL)isThreeDTouchEnabled;
- (BOOL)isUpdatingGroupViewConfiguration;
- (BOOL)prohibitsPersonaFetch;
- (BOOL)registeredContactAction;
- (BOOL)registeredInNotifier;
- (BOOL)shouldFetchSharedMeContactPhoto;
- (BOOL)shouldUpdateMaskedAvatars;
- (BOOL)shouldUpdateWithContacts:(id)a3;
- (BOOL)showsActionsOnForcePress;
- (BOOL)showsActionsOnTap;
- (BOOL)showsContactOnTap;
- (BOOL)transitioningImageVisible;
- (CALayer)sourceAvatarLayer;
- (CGRect)frameForAvatarAtIndex:(unint64_t)a3 inView:(id)a4;
- (CGRect)transitioningFrame;
- (CGRect)transitioningImageFrame;
- (CGSize)sizeThatFits:(CGSize)result;
- (CNAvatarCardController)cardController;
- (CNAvatarView)init;
- (CNAvatarView)initWithContact:(id)a3;
- (CNAvatarView)initWithFrame:(CGRect)a3;
- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5;
- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5 style:(unint64_t)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8;
- (CNAvatarView)initWithSettings:(id)a3;
- (CNAvatarViewDelegate)delegate;
- (CNAvatarViewUpdateToken)groupViewConfigurationUpdateToken;
- (CNCancelable)rendererToken;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (CNSchedulerProvider)schedulerProvider;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (CNUILikenessRendering)imageRenderer;
- (NSArray)actionCategories;
- (NSArray)contacts;
- (NSIndexSet)maskedAvatarIndices;
- (NSString)contextToken;
- (NSString)message;
- (NSString)name;
- (UIImage)contentImage;
- (UIImage)overrideImage;
- (UIImageView)alternativeImageView;
- (UIImageView)imageView;
- (UINavigationController)contactViewNavigationController;
- (UIView)forcePressView;
- (double)_diameter;
- (id)avatarCardController:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)currentLikenessScope;
- (id)descriptorForRequiredKeys;
- (id)presentingViewControllerForAvatarCardController:(id)a3;
- (id)updateViewWithGroupIdentity:(id)a3;
- (id)updateViewWithGroupIdentity:(id)a3 maskingContacts:(id)a4;
- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4;
- (int64_t)displayedImageState;
- (int64_t)monogrammerStyle;
- (unint64_t)backgroundStyle;
- (unint64_t)stateCaptureHandle;
- (unint64_t)style;
- (void)_renderContactsImage;
- (void)_setContacts:(id)a3;
- (void)_updateCardActions;
- (void)_updateRegistration;
- (void)avatarCacheDidUpdateForIdentifiers:(id)a3;
- (void)avatarCardControllerDidDismiss:(id)a3;
- (void)avatarCardControllerWillBeginPreviewInteraction:(id)a3;
- (void)avatarCardControllerWillDismiss:(id)a3;
- (void)clearImage;
- (void)contactDidChange;
- (void)contactDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dismissContactViewController:(id)a3;
- (void)layoutSubviews;
- (void)notifyDelegateOfGroupConfigurationUpdateWithError:(id)a3;
- (void)performTransitionAnimationWithCompletion:(id)a3;
- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4;
- (void)resetGroupUpdateTokenIfNeeded;
- (void)setActionCategories:(id)a3;
- (void)setAllowStaleRendering:(BOOL)a3;
- (void)setAllowStaleRenderingWithMatchingContextToken:(BOOL)a3;
- (void)setAllowsAnimation:(BOOL)a3;
- (void)setAlternativeImageView:(id)a3;
- (void)setAsynchronousRendering:(BOOL)a3;
- (void)setAutoUpdateContact:(BOOL)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setCardController:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactViewNavigationController:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContacts:(id)a3 forToken:(id)a4;
- (void)setContextToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCornerRadiusForAvatar:(BOOL)a3;
- (void)setDisplayedImageState:(int64_t)a3;
- (void)setForcePressView:(id)a3;
- (void)setGroupViewConfigurationUpdateToken:(id)a3;
- (void)setImage:(id)a3 state:(int64_t)a4;
- (void)setImageRenderer:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsPerformingTransition:(BOOL)a3;
- (void)setMaskedAvatarIndices:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMonogrammerStyle:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)setProhibitsPersonaFetch:(BOOL)a3;
- (void)setRegisteredContactAction:(BOOL)a3;
- (void)setRegisteredInNotifier:(BOOL)a3;
- (void)setRendererToken:(id)a3;
- (void)setSchedulerProvider:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setShouldFetchSharedMeContactPhoto:(BOOL)a3;
- (void)setShouldUpdateMaskedAvatars:(BOOL)a3;
- (void)setShowsActionsOnForcePress:(BOOL)a3;
- (void)setShowsActionsOnTap:(BOOL)a3;
- (void)setShowsContactOnTap:(BOOL)a3;
- (void)setStateCaptureHandle:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)setupAvatarCardControllerIfNeeded;
- (void)showContact:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CNAvatarView

- (BOOL)isDisplayingContent
{
  return [(CNAvatarView *)self displayedImageState] == 2;
}

- (void)setContextToken:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_contextToken != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_contextToken, a3);
    BOOL v6 = [(CNAvatarView *)self allowStaleRendering];
    v5 = v7;
    if (v6)
    {
      [(CNAvatarView *)self setAllowStaleRenderingWithMatchingContextToken:0];
      v5 = v7;
    }
  }
}

- (void)setActionCategories:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarView *)self cardController];
  [v5 setActionCategories:v4];
}

- (void)setForcePressView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forcePressView);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_forcePressView, obj);
    BOOL v6 = [(CNAvatarView *)self window];

    id v5 = obj;
    if (v6)
    {
      [(CNAvatarView *)self _updateCardActions];
      id v5 = obj;
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CNAvatarView;
  [(CNAvatarView *)&v3 didMoveToWindow];
  [(CNAvatarView *)self _updateCardActions];
  [(CNAvatarView *)self _updateRegistration];
  [(CNAvatarView *)self setNeedsLayout];
}

- (void)setContacts:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNAvatarView *)self resetGroupUpdateTokenIfNeeded];
  [(CNAvatarView *)self setGroupViewConfigurationUpdateToken:v6];

  [(CNAvatarView *)self _setContacts:v7];
}

- (void)setContacts:(id)a3
{
  id v4 = a3;
  contacts = self->_contacts;
  id v6 = v4;
  if (!v4)
  {
    if (contacts) {
      goto LABEL_5;
    }
    id v4 = 0;
  }
  if (![(NSArray *)contacts isEqualToArray:v4])
  {
LABEL_5:
    [(CNAvatarView *)self resetGroupUpdateTokenIfNeeded];
    [(CNAvatarView *)self _setContacts:v6];
  }
}

- (void)resetGroupUpdateTokenIfNeeded
{
  if ([(CNAvatarView *)self isUpdatingGroupViewConfiguration])
  {
    objc_super v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNUIAvatarViewErrorDomain" code:0 userInfo:0];
    [(CNAvatarView *)self notifyDelegateOfGroupConfigurationUpdateWithError:v3];

    [(CNAvatarView *)self setGroupViewConfigurationUpdateToken:0];
  }
}

- (id)updateViewWithGroupIdentity:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v4 groupPhoto];
  if (v6)
  {
    id v7 = [(CNAvatarView *)self contact];
    int v8 = [v7 isKeyAvailable:*MEMORY[0x1E4F1AF98]];

    if (v8)
    {
      v9 = [(CNAvatarView *)self contact];
      v10 = [v9 thumbnailImageData];
      char v11 = [v6 isEqualToData:v10];

      if (v11) {
        goto LABEL_8;
      }
    }
    v12 = [MEMORY[0x1E4F1BA40] contactWithDisplayName:0 emailOrPhoneNumber:0];
    [v12 setImageData:v6];
    [v12 setThumbnailImageData:v6];
    v18[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(CNAvatarView *)self setContacts:v13 forToken:v5];

LABEL_7:
LABEL_8:
    id v16 = v5;
    goto LABEL_9;
  }
  v14 = [v4 contacts];
  BOOL v15 = [(CNAvatarView *)self shouldUpdateWithContacts:v14];

  if (v15)
  {
    v12 = [v4 contacts];
    [(CNAvatarView *)self setContacts:v12 forToken:v5];
    goto LABEL_7;
  }
  id v16 = 0;
LABEL_9:

  return v16;
}

- (void)_setContacts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CNAvatarView *)self shouldUpdateWithContacts:v5])
  {
    self->_registeredInNotifier = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    p_contacts = &self->_contacts;
    id v15 = a3;
    id v6 = self->_contacts;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          v12 = +[CNUIContactsEnvironment currentEnvironment];
          v13 = [v12 contactChangesNotifier];
          [v13 unregisterObserver:self forContact:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    [(CNAvatarView *)self setShouldUpdateMaskedAvatars:0];
    [(CNAvatarView *)self clearImage];
    [(CNAvatarView *)self _renderContactsImage];
  }
}

- (BOOL)shouldUpdateWithContacts:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  if ([(CNAvatarView *)self shouldUpdateMaskedAvatars])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    contacts = self->_contacts;
    if (v4 | (unint64_t)contacts) {
      int v5 = [(NSArray *)contacts _cn_isIdenticalToArray:v4] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (BOOL)shouldUpdateMaskedAvatars
{
  return self->_shouldUpdateMaskedAvatars;
}

- (void)setShouldUpdateMaskedAvatars:(BOOL)a3
{
  self->_shouldUpdateMaskedAvatars = a3;
}

- (void)clearImage
{
}

- (void)_renderContactsImage
{
  v46[2] = *(id *)MEMORY[0x1E4F143B8];
  kdebug_trace();
  [(CNAvatarView *)self _updateRegistration];
  objc_super v3 = [(CNAvatarView *)self rendererToken];
  [v3 cancel];

  [(CNAvatarView *)self setRendererToken:0];
  unint64_t v4 = [(CNAvatarView *)self currentLikenessScope];
  if (v4)
  {
    if ([(CNAvatarView *)self displayedImageState])
    {
      int v5 = 0;
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v7 = [(CNAvatarView *)self imageRenderer];
      uint64_t v8 = [(CNAvatarView *)self contacts];
      uint64_t v9 = objc_msgSend(v7, "loadingPlaceholderForContactCount:scope:", objc_msgSend(v8, "count"), v4);

      [(CNAvatarView *)self setImage:v9 state:1];
      uint64_t v10 = [(CNAvatarView *)self imageView];
      uint64_t v11 = [v10 image];
      int v12 = [v9 isEqual:v11];

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4F5A6B0];
        v14 = [(CNAvatarView *)self contacts];
        int v5 = [v13 publicFingerprintForContacts:v14 scope:v4];

        id v15 = [(CNAvatarView *)self contacts];
        unint64_t v16 = [v15 count];
        BOOL v6 = v16 > 1;

        long long v17 = CNUILogAvatarView();
        long long v18 = v17;
        if (v16 < 2)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v5;
            _os_log_impl(&dword_18B625000, v18, OS_LOG_TYPE_INFO, "[CNAvatarView][LikenessRenderer] (%p) showing placeholder, requesting image for contact %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          _os_log_debug_impl(&dword_18B625000, v18, OS_LOG_TYPE_DEBUG, "[CNAvatarView][LikenessRenderer] (%p) showing placeholder, requesting image for group %{public}@", buf, 0x16u);
        }
      }
      else
      {
        int v5 = 0;
        BOOL v6 = 0;
      }
    }
    long long v19 = [(CNAvatarView *)self contacts];
    BOOL v20 = [v19 count] == 0;

    if (!v20)
    {
      uint64_t v21 = [(CNAvatarView *)self imageRenderer];
      v22 = [(CNAvatarView *)self contacts];
      v23 = [(CNAvatarView *)self schedulerProvider];
      v24 = [v23 backgroundScheduler];
      v25 = [v21 renderedLikenessesForContacts:v22 scope:v4 workScheduler:v24];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3042000000;
      v44 = __Block_byref_object_copy__2810;
      v45 = __Block_byref_object_dispose__2811;
      v46[0] = 0;
      objc_initWeak(&location, self);
      v26 = [(CNAvatarView *)self schedulerProvider];
      v27 = [v26 mainThreadScheduler];

      v28 = (void *)MEMORY[0x1E4F5A488];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __36__CNAvatarView__renderContactsImage__block_invoke;
      v36 = &unk_1E5496C08;
      objc_copyWeak(&v40, &location);
      BOOL v41 = v6;
      id v37 = v5;
      id v29 = v27;
      id v38 = v29;
      v39 = buf;
      v30 = [v28 observerWithResultBlock:&v33];
      v31 = objc_msgSend(v25, "subscribe:", v30, v33, v34, v35, v36);
      [(CNAvatarView *)self setRendererToken:v31];

      v32 = [(CNAvatarView *)self rendererToken];
      objc_storeWeak((id *)(*(void *)&buf[8] + 40), v32);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      objc_destroyWeak(v46);
    }
  }
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setImage:(id)a3 state:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CNAvatarView *)self imageView];
  uint64_t v8 = [v7 image];
  char v9 = [v6 isEqual:v8];

  if (v9)
  {
    [(CNAvatarView *)self setDisplayedImageState:a4];
    if (a4 != 2) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if ([(CNAvatarView *)self allowStaleRendering])
  {
    BOOL v10 = [(CNAvatarView *)self allowStaleRenderingWithMatchingContextToken];
    if (a4 == 1) {
      [(CNAvatarView *)self setAllowStaleRenderingWithMatchingContextToken:1];
    }
    char v11 = !v10;
    if (a4 == 2) {
      char v11 = 1;
    }
    if ((v11 & 1) == 0)
    {
      int v12 = CNUILogAvatarView();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        [(CNAvatarView *)self setDisplayedImageState:a4];
        goto LABEL_19;
      }
      v13 = [(id)objc_opt_class() descriptionForDisplayedImageState:a4];
      int v18 = 134218242;
      long long v19 = self;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "[CNAvatarView] %p ignoring setting image for state (%{public}@), showing stale image instead", (uint8_t *)&v18, 0x16u);
LABEL_12:

      goto LABEL_15;
    }
  }
  v14 = [(CNAvatarView *)self imageView];
  [v14 setImage:v6];

  if (a4 != 2)
  {
    int v12 = CNUILogAvatarView();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    v13 = [(CNAvatarView *)self contacts];
    int v18 = 138412290;
    long long v19 = v13;
    _os_log_debug_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEBUG, "[CNAvatarView] Setting placeholder image for %@", (uint8_t *)&v18, 0xCu);
    goto LABEL_12;
  }
  [(CNAvatarView *)self setDisplayedImageState:2];
LABEL_17:
  id v15 = [(CNAvatarView *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    long long v17 = [(CNAvatarView *)self delegate];
    [v17 didUpdateContentForAvatarView:self];
  }
LABEL_19:
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (CNAvatarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarViewDelegate *)WeakRetained;
}

- (BOOL)allowStaleRendering
{
  return self->_allowStaleRendering;
}

- (void)setDisplayedImageState:(int64_t)a3
{
  self->_displayedImageState = a3;
}

- (void)_updateRegistration
{
  v33[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNAvatarView *)self autoUpdateContact];
  if (self->_registeredInNotifier != v3)
  {
    BOOL v4 = v3;
    if (v3)
    {
      BOOL v22 = v3;
      int v5 = [(CNAvatarView *)self descriptorForRequiredKeys];
      v33[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v7 = self->_contacts;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v13 = +[CNUIContactsEnvironment currentEnvironment];
            v14 = [v13 contactChangesNotifier];
            [v14 registerObserver:self forContact:v12 keysToFetch:v6];
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v9);
      }

      BOOL v4 = v22;
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = self->_contacts;
      uint64_t v15 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v6);
            }
            uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * j);
            __int16 v20 = +[CNUIContactsEnvironment currentEnvironment];
            uint64_t v21 = [v20 contactChangesNotifier];
            [v21 unregisterObserver:self forContact:v19];
          }
          uint64_t v16 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v16);
      }
    }

    self->_registeredInNotifier = v4;
  }
}

- (BOOL)autoUpdateContact
{
  return self->_autoUpdateContact;
}

- (void)setRendererToken:(id)a3
{
}

void __36__CNAvatarView__renderContactsImage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (*(unsigned char *)(a1 + 64))
  {
    id v6 = CNUILogAvatarView();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = v5;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_debug_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEBUG, "[CNAvatarView][LikenessRenderer] (%p) received image for group %{public}@, replacing placeholder", buf, 0x16u);
    }
    goto LABEL_8;
  }
  id v6 = [WeakRetained contacts];
  if ([v6 count] != 1)
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(a1 + 32);

  if (v8)
  {
    id v6 = CNUILogAvatarView();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "[CNAvatarView][LikenessRenderer] (%p) received image (%@) for contact %{public}@, replacing placeholder", buf, 0x20u);
    }
    goto LABEL_8;
  }
LABEL_9:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__CNAvatarView__renderContactsImage__block_invoke_62;
  v13[3] = &unk_1E5496BE0;
  char v11 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = v3;
  uint64_t v15 = v10;
  v13[4] = v5;
  id v12 = v3;
  [v11 performBlock:v13];
}

void __36__CNAvatarView__renderContactsImage__block_invoke_62(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rendererToken];

  id v3 = [*(id *)(a1 + 32) rendererToken];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  if (v2) {
    BOOL v5 = v3 == WeakRetained;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40) state:2];
  }
  kdebug_trace();
  if ([*(id *)(a1 + 32) isUpdatingGroupViewConfiguration])
  {
    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNUIAvatarViewErrorDomain" code:1 userInfo:0];
    }
    id v8 = (id)v7;
    [*(id *)(a1 + 32) notifyDelegateOfGroupConfigurationUpdateWithError:v7];
  }
}

- (CNCancelable)rendererToken
{
  return self->_rendererToken;
}

- (BOOL)isUpdatingGroupViewConfiguration
{
  v2 = [(CNAvatarView *)self groupViewConfigurationUpdateToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CNAvatarViewUpdateToken)groupViewConfigurationUpdateToken
{
  return self->_groupViewConfigurationUpdateToken;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)imageRenderer
{
  return self->_imageRenderer;
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [NSString stringWithUTF8String:"+[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:]"];
  char v6 = [a1 descriptorForRequiredKeysWithThreeDTouchEnabled:v3 shouldUseCachingRenderer:1 description:v5];

  return v6;
}

- (BOOL)allowStaleRenderingWithMatchingContextToken
{
  return self->_allowStaleRenderingWithMatchingContextToken;
}

- (void)notifyDelegateOfGroupConfigurationUpdateWithError:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(CNAvatarView *)self delegate];
  if (v9)
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    char v6 = [(CNAvatarView *)self delegate];
    uint64_t v7 = [(CNAvatarView *)self groupViewConfigurationUpdateToken];
    [v6 avatarView:self didFailToUpdateViewForGroupConfiguration:v7 withError:v9];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    char v6 = [(CNAvatarView *)self delegate];
    uint64_t v7 = [(CNAvatarView *)self groupViewConfigurationUpdateToken];
    [v6 avatarView:self didUpdateViewForGroupConfiguration:v7];
  }

LABEL_7:
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)CNAvatarView;
  [(CNAvatarView *)&v25 layoutSubviews];
  BOOL v3 = [(CNAvatarView *)self window];

  if (v3)
  {
    [(CNAvatarView *)self bounds];
    -[CNAvatarView sizeThatFits:](self, "sizeThatFits:", v4, v5);
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = [(CNAvatarView *)self imageView];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      if ([(CNAvatarView *)self displayedImageState]) {
        return;
      }
    }
    else
    {
      double v15 = *MEMORY[0x1E4F1DB28];
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v17 = [(CNAvatarView *)self imageView];
      objc_msgSend(v17, "setFrame:", v15, v16, v7, v9);

      __int16 v18 = [(CNAvatarView *)self alternativeImageView];
      objc_msgSend(v18, "setFrame:", v15, v16, v7, v9);

      id v19 = [(CNAvatarView *)self alternativeImageView];
      __int16 v20 = [v19 layer];
      [v20 frame];
      double v22 = v21 * 0.5;
      long long v23 = [(CNAvatarView *)self alternativeImageView];
      long long v24 = [v23 layer];
      [v24 setCornerRadius:v22];

      if ([(CNAvatarView *)self displayedImageState] == 1) {
        [(CNAvatarView *)self setImage:0 state:0];
      }
    }
    [(CNAvatarView *)self _renderContactsImage];
  }
}

- (int64_t)displayedImageState
{
  return self->_displayedImageState;
}

- (UIImageView)alternativeImageView
{
  return self->_alternativeImageView;
}

- (id)currentLikenessScope
{
  BOOL v3 = [(CNAvatarView *)self window];

  if (!v3) {
    goto LABEL_9;
  }
  double v4 = [(CNAvatarView *)self imageView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v6 == v9 && v8 == v10)
  {
LABEL_9:
    long long v24 = 0;
  }
  else
  {
    double v12 = [(CNAvatarView *)self imageView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;

    uint64_t v17 = [(CNAvatarView *)self window];
    __int16 v18 = [v17 screen];
    [v18 scale];
    double v20 = v19;

    double v21 = [(CNAvatarView *)self window];
    uint64_t v22 = [v21 effectiveUserInterfaceLayoutDirection];

    unint64_t v23 = [(CNAvatarView *)self backgroundStyle];
    if (!v23)
    {
      if ([(CNAvatarView *)self style])
      {
        unint64_t v23 = 0;
      }
      else
      {
        objc_super v25 = [(CNAvatarView *)self traitCollection];
        unint64_t v23 = [v25 userInterfaceStyle] == 2;
      }
    }
    unint64_t v26 = [(CNAvatarView *)self style];
    long long v27 = [(CNAvatarView *)self maskedAvatarIndices];
    long long v28 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v22 == 1, v26, v23, 0, v27, v14, v16, v20, 0.0);

    long long v24 = [v28 likenessRenderingScope];
  }

  return v24;
}

- (unint64_t)style
{
  return self->_style;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.width >= result.height) {
    result.double width = result.height;
  }
  double width = result.width;
  result.height = width;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNAvatarView;
  id v4 = a3;
  [(CNAvatarView *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  double v6 = [(CNAvatarView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  unint64_t v8 = [(CNAvatarView *)self style];
  if (v5 != v7 && !v8) {
    [(CNAvatarView *)self _renderContactsImage];
  }
}

- (NSIndexSet)maskedAvatarIndices
{
  return self->_maskedAvatarIndices;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setAllowStaleRenderingWithMatchingContextToken:(BOOL)a3
{
  self->_allowStaleRenderingWithMatchingContextToken = a3;
}

- (void)setupAvatarCardControllerIfNeeded
{
  BOOL v3 = [(CNAvatarView *)self cardController];
  if (!v3)
  {
    if ([(CNAvatarView *)self isThreeDTouchEnabled])
    {
      id v4 = [(CNAvatarView *)self traitCollection];
      BOOL v5 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:v4];

      if (!v5) {
        return;
      }
      double v6 = objc_alloc_init(CNAvatarCardController);
      [(CNAvatarCardController *)v6 setAvatarView:self];
      [(CNAvatarCardController *)v6 setDelegate:self];
      [(CNAvatarView *)self setCardController:v6];
      BOOL v3 = v6;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
}

- (void)_updateCardActions
{
  if ([(CNAvatarView *)self isThreeDTouchEnabled])
  {
    BOOL v3 = [(CNAvatarView *)self traitCollection];
    if (+[CNAvatarCardController avatarCardEnabledForTraitCollection:v3]&& ([(CNAvatarView *)self window], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v5 = (void *)v4;
      double v6 = [(CNAvatarView *)self delegate];

      if (v6)
      {
        id v8 = [(CNAvatarView *)self forcePressView];
        uint64_t v7 = [(CNAvatarView *)self cardController];
        [v7 setSourceView:v8];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v8 = [(CNAvatarView *)self cardController];
  [v8 setSourceView:0];
LABEL_8:
}

- (CNAvatarCardController)cardController
{
  return self->_cardController;
}

- (id)descriptorForRequiredKeys
{
  BOOL v3 = objc_opt_class();
  BOOL v4 = [(CNAvatarView *)self isThreeDTouchEnabled];

  return (id)[v3 descriptorForRequiredKeysWithThreeDTouchEnabled:v4];
}

- (BOOL)isThreeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4 description:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3)
  {
    objc_super v9 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
    BOOL v10 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:v9];

    int v11 = !v10;
    BOOL v12 = !v5;
    if (v5 && (v11 & 1) == 0)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke;
      v30[3] = &unk_1E5496B90;
      v31[1] = a1;
      BOOL v32 = v10;
      BOOL v33 = v5;
      double v13 = (id *)v31;
      v31[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_1 != -1) {
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_1, v30);
      }
      double v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1;
      goto LABEL_21;
    }
  }
  else
  {
    BOOL v10 = 0;
    BOOL v12 = !v5;
    int v11 = 1;
  }
  if (v12 || v10)
  {
    if ((v11 | v5))
    {
      if (v10 || v5)
      {
        id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't be reached" userInfo:0];
        objc_exception_throw(v17);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_4;
      v18[3] = &unk_1E5496B90;
      v19[1] = a1;
      BOOL v20 = v10;
      BOOL v21 = v5;
      double v13 = (id *)v19;
      v19[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_4 != -1) {
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_4, v18);
      }
      double v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4;
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_3;
      v22[3] = &unk_1E5496B90;
      v23[1] = a1;
      BOOL v24 = v10;
      BOOL v25 = v5;
      double v13 = (id *)v23;
      v23[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_3 != -1) {
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_3, v22);
      }
      double v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_2;
    block[3] = &unk_1E5496B90;
    v27[1] = a1;
    BOOL v28 = v10;
    BOOL v29 = v5;
    double v13 = (id *)v27;
    v27[0] = v8;
    if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_2 != -1) {
      dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_2, block);
    }
    double v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2;
  }
LABEL_21:
  id v15 = (id)*v14;

  return v15;
}

- (UIView)forcePressView
{
  p_forcePressView = &self->_forcePressView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forcePressView);

  if (WeakRetained)
  {
    BOOL v5 = (CNAvatarView *)objc_loadWeakRetained((id *)p_forcePressView);
LABEL_8:
    id v8 = v5;
    goto LABEL_9;
  }
  double v6 = self;
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_7:
    BOOL v5 = v7;
    goto LABEL_8;
  }
  id v8 = v6;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v9 = [v8 superview];

    id v8 = (void *)v9;
    if (!v9) {
      goto LABEL_7;
    }
  }
LABEL_9:

  return (UIView *)v8;
}

- (void)setCardController:(id)a3
{
}

+ (id)descriptionForDisplayedImageState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unexpected Image State";
  }
  else {
    return off_1E5496C28[a3];
  }
}

- (void)setGroupViewConfigurationUpdateToken:(id)a3
{
}

- (void)setName:(id)a3
{
}

+ (unint64_t)maxContactAvatars
{
  return [MEMORY[0x1E4F5A6E8] maxContacts];
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5 style:(unint64_t)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  double v18 = *MEMORY[0x1E4F1DB28];
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v33.receiver = self;
  v33.super_class = (Class)CNAvatarView;
  BOOL v20 = -[CNAvatarView initWithFrame:](&v33, sel_initWithFrame_, v18, v19, *(double *)&CNAvatarViewDefaultSize, unk_1E913ED70);
  BOOL v21 = v20;
  if (v20)
  {
    v20->_threeDTouchEnabled = a4;
    objc_storeStrong((id *)&v20->_contactStore, a5);
    objc_storeStrong((id *)&v21->_imageRenderer, a3);
    v21->_style = a6;
    uint64_t v22 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v21->_imageView;
    v21->_imageView = v22;

    BOOL v24 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    alternativeImageView = v21->_alternativeImageView;
    v21->_alternativeImageView = v24;

    [(UIImageView *)v21->_alternativeImageView setContentMode:2];
    [(UIImageView *)v21->_alternativeImageView setClipsToBounds:1];
    objc_storeStrong((id *)&v21->_schedulerProvider, a7);
    v21->_backgroundStyle = a8;
    unint64_t v26 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    int v27 = [v26 isInternalBuild];

    if (v27)
    {
      objc_initWeak(&location, v21);
      id v28 = MEMORY[0x1E4F14428];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v31, &location);
      -[CNAvatarView setStateCaptureHandle:](v21, "setStateCaptureHandle:", os_state_add_handler(), v30, 3221225472, __110__CNAvatarView_initWithImageRenderer_threeDTouchEnabled_contactStore_style_schedulerProvider_backgroundStyle___block_invoke, &unk_1E5496BB8);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    [(CNAvatarView *)v21 addSubview:v21->_imageView];
    [(CNAvatarView *)v21 addSubview:v21->_alternativeImageView];
    [(CNAvatarView *)v21 setupAvatarCardControllerIfNeeded];
    [(CNAvatarView *)v21 setShowsContactOnTap:0];
    [(CNAvatarView *)v21 setAutoUpdateContact:1];
  }

  return v21;
}

- (void)setShowsContactOnTap:(BOOL)a3
{
  if (self->_showsContactOnTap != a3) {
    self->_showsContactOnTap = a3;
  }
}

- (void)setStateCaptureHandle:(unint64_t)a3
{
  self->_stateCaptureHandle = a3;
}

- (void)setAutoUpdateContact:(BOOL)a3
{
  if (self->_autoUpdateContact != a3)
  {
    self->_autoUpdateContact = a3;
    [(CNAvatarView *)self _updateRegistration];
  }
}

- (CNAvatarView)initWithSettings:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 likenessRenderer];
  if ([v5 conformsToProtocol:&unk_1ED9F0FB8]) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;
  id v8 = v7;
  if (v7) {
    [v7 addDelegate:self];
  }
  uint64_t v9 = [v4 threeDTouchEnabled];
  BOOL v10 = [v4 contactStore];
  uint64_t v11 = [v4 style];
  BOOL v12 = [v4 schedulerProvider];
  uint64_t v13 = [v4 backgroundStyle];

  double v14 = [(CNAvatarView *)self initWithImageRenderer:v5 threeDTouchEnabled:v9 contactStore:v10 style:v11 schedulerProvider:v12 backgroundStyle:v13];
  return v14;
}

- (void)setAllowStaleRendering:(BOOL)a3
{
  self->_allowStaleRendering = a3;
}

- (void)setAsynchronousRendering:(BOOL)a3
{
  self->_asynchronousRendering = a3;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAvatarView *)self cardController];
  [v4 setBypassActionValidation:v3];
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    id v4 = [(CNAvatarView *)self contacts];

    if (v4)
    {
      [(CNAvatarView *)self _renderContactsImage];
    }
  }
}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = [*(id *)(a1 + 40) makeDescriptorForRequiredKeysWithThreeDTouchEnabled:*(unsigned __int8 *)(a1 + 48) shouldUseCachingRenderer:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v3 = [v2 descriptorWithKeyDescriptors:v5 description:*(void *)(a1 + 32)];
  id v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2 = v3;
}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = [*(id *)(a1 + 40) makeDescriptorForRequiredKeysWithThreeDTouchEnabled:*(unsigned __int8 *)(a1 + 48) shouldUseCachingRenderer:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v3 = [v2 descriptorWithKeyDescriptors:v5 description:*(void *)(a1 + 32)];
  id v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1 = v3;
}

+ (id)makeDescriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  double v6 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  if (v4) {
    [MEMORY[0x1E4F5A6C0] descriptorForRequiredKeysForCaching];
  }
  else {
  id v8 = [MEMORY[0x1E4F5A6C0] descriptorForRequiredKeys];
  }
  uint64_t v9 = [v7 arrayByAddingObject:v8];

  if (v5)
  {
    uint64_t v10 = +[CNAvatarCardController descriptorForRequiredKeysIncludingAvatarViewDescriptors:0];
    uint64_t v11 = [v9 arrayByAddingObject:v10];

    uint64_t v9 = (void *)v10;
  }
  else
  {
    uint64_t v11 = [v9 arrayByAddingObject:*MEMORY[0x1E4F1AE28]];
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_groupViewConfigurationUpdateToken, 0);
  objc_storeStrong((id *)&self->_cardController, 0);
  objc_storeStrong((id *)&self->_contactViewNavigationController, 0);
  objc_storeStrong((id *)&self->_alternativeImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_rendererToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_maskedAvatarIndices, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);

  objc_destroyWeak((id *)&self->_forcePressView);
}

- (void)setProhibitsPersonaFetch:(BOOL)a3
{
  self->_prohibitsPersonaFetch = a3;
}

- (BOOL)prohibitsPersonaFetch
{
  return self->_prohibitsPersonaFetch;
}

- (void)setAllowsAnimation:(BOOL)a3
{
  self->_allowsAnimation = a3;
}

- (BOOL)allowsAnimation
{
  return self->_allowsAnimation;
}

- (NSString)contextToken
{
  return self->_contextToken;
}

- (BOOL)asynchronousRendering
{
  return self->_asynchronousRendering;
}

- (void)setMonogrammerStyle:(int64_t)a3
{
  self->_monogrammerStyle = a3;
}

- (int64_t)monogrammerStyle
{
  return self->_monogrammerStyle;
}

- (void)setSchedulerProvider:(id)a3
{
}

- (BOOL)shouldFetchSharedMeContactPhoto
{
  return self->_shouldFetchSharedMeContactPhoto;
}

- (void)setImageRenderer:(id)a3
{
}

- (BOOL)disableCornerRadiusForAvatar
{
  return self->_disableCornerRadiusForAvatar;
}

- (void)setOverrideImage:(id)a3
{
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (void)setRegisteredContactAction:(BOOL)a3
{
  self->_registeredContactAction = a3;
}

- (BOOL)registeredContactAction
{
  return self->_registeredContactAction;
}

- (void)setRegisteredInNotifier:(BOOL)a3
{
  self->_registeredInNotifier = a3;
}

- (BOOL)registeredInNotifier
{
  return self->_registeredInNotifier;
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  self->_isPerformingTransition = a3;
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (unint64_t)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setContactViewNavigationController:(id)a3
{
}

- (UINavigationController)contactViewNavigationController
{
  return self->_contactViewNavigationController;
}

- (void)setAlternativeImageView:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (BOOL)showsContactOnTap
{
  return self->_showsContactOnTap;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (NSString)name
{
  return self->_name;
}

- (void)setMaskedAvatarIndices:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(id, uint64_t))a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(CNAvatarView *)self sharedProfileStateOracle];

  if (!v8)
  {
    uint64_t v9 = CNUILogAvatarView();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_7;
  }
  if (![(CNAvatarView *)self isPerformingTransition])
  {
    uint64_t v10 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    uint64_t v11 = [(CNAvatarView *)self sharedProfileStateOracle];
    uint64_t v12 = [v11 avatarViewAnimationTypeForEffectiveState];

    if (v6) {
      v6[2](v6, v12);
    }
    if (v12 == 2)
    {
      double v19 = CNUILogAvatarView();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7) {
        v7[2](v7, 2);
      }
      goto LABEL_25;
    }
    if (v12 == 1)
    {
      [(CNAvatarView *)self setIsPerformingTransition:1];
      BOOL v20 = CNUILogAvatarView();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v20, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      BOOL v21 = [(CNAvatarView *)self sharedProfileStateOracle];
      uint64_t v22 = [v21 pendingNickname];
      unint64_t v23 = [(CNAvatarView *)self sharedProfileStateOracle];
      BOOL v24 = [v23 contact];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke_93;
      v25[3] = &unk_1E549B710;
      v25[4] = self;
      unint64_t v26 = v7;
      [(CNSharedProfileAnimationGenerator *)v10 performPeekABooAnimationForAnimatingAvatarView:self pendingNickname:v22 contact:v24 completionHandler:v25];

      double v18 = v26;
    }
    else
    {
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
      [(CNAvatarView *)self setIsPerformingTransition:1];
      uint64_t v13 = CNUILogAvatarView();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v13, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      double v14 = [(CNAvatarView *)self sharedProfileStateOracle];
      id v15 = [v14 pendingNickname];
      id v16 = [(CNAvatarView *)self sharedProfileStateOracle];
      id v17 = [v16 contact];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v27[3] = &unk_1E549B710;
      v27[4] = self;
      id v28 = v7;
      [(CNSharedProfileAnimationGenerator *)v10 performCoinFlipAnimationForAnimatingAvatarView:self pendingNickname:v15 contact:v17 completionHandler:v27];

      double v18 = v28;
    }

    goto LABEL_25;
  }
  uint64_t v9 = CNUILogAvatarView();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_7:

  if (v7) {
    v7[2](v7, 2);
  }
LABEL_26:
}

uint64_t __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPerformingTransition:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke_93(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPerformingTransition:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
}

- (CALayer)sourceAvatarLayer
{
  v2 = [(CNAvatarView *)self imageView];
  uint64_t v3 = [v2 layer];

  return (CALayer *)v3;
}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNAvatarView *)self contacts];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke;
  v12[3] = &unk_1E549C040;
  id v6 = v4;
  id v13 = v6;
  int v7 = objc_msgSend(v5, "_cn_any:", v12);

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v9 = [v8 schedulerProvider];
    uint64_t v10 = [v9 mainThreadScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke_2;
    v11[3] = &unk_1E549B488;
    v11[4] = self;
    [v10 performBlock:v11];
  }
}

uint64_t __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v2, "_cn_containsObject:", v3);

  return v4;
}

uint64_t __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) contactDidChange];
}

- (BOOL)transitioningImageVisible
{
  return 0;
}

- (CGRect)transitioningImageFrame
{
  uint64_t v3 = [(CNAvatarView *)self forcePressView];
  [(CNAvatarView *)self contentImageFrame];
  objc_msgSend(v3, "convertRect:fromView:", self);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)transitioningFrame
{
  v2 = [(CNAvatarView *)self forcePressView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)contactDidChange:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_contacts count] == 1)
  {
    v17[0] = v4;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    contacts = self->_contacts;
    self->_contacts = v5;
  }
  else
  {
    double v7 = (NSArray *)[(NSArray *)self->_contacts mutableCopy];
    double v8 = [v4 identifier];
    double v9 = self->_contacts;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__CNAvatarView_contactDidChange___block_invoke;
    v15[3] = &unk_1E5498720;
    id v16 = v8;
    contacts = v8;
    uint64_t v10 = [(NSArray *)v9 indexOfObjectPassingTest:v15];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSArray *)v7 replaceObjectAtIndex:v10 withObject:v4];
    }
    double v11 = self->_contacts;
    self->_contacts = v7;
    double v12 = v7;
  }
  double v13 = [(CNAvatarView *)self cardController];

  if (v13)
  {
    double v14 = [(CNAvatarView *)self cardController];
    [v14 prepareWithContacts:0 store:0];
  }
  [(CNAvatarView *)self contactDidChange];
}

uint64_t __33__CNAvatarView_contactDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  double v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)avatarCardControllerDidDismiss:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CNAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CNAvatarView *)self delegate];
    [v6 didDismissActionsForAvatarView:self];
  }
  double v7 = [(CNAvatarView *)self contacts];
  double v8 = [v9 contacts];

  if (v7 != v8) {
    [v9 cleanupAfterDisplay];
  }
}

- (void)avatarCardControllerWillDismiss:(id)a3
{
  uint64_t v4 = [(CNAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAvatarView *)self delegate];
    [v6 willDismissActionsForAvatarView:self];
  }
}

- (BOOL)avatarCardController:(id)a3 shouldShowContact:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAvatarView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(CNAvatarView *)self delegate];
    char v9 = [v8 avatarView:self shouldShowContact:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)avatarCardController:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = [(CNAvatarView *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CNAvatarView *)self delegate];
    double v12 = [v11 avatarView:self orderedPropertiesForProperties:v7 category:v8];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)avatarCardControllerWillBeginPreviewInteraction:(id)a3
{
  uint64_t v4 = [(CNAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAvatarView *)self delegate];
    [v6 willBeginPreviewInteractionForAvatarView:self];
  }
}

- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(CNAvatarView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNAvatarView *)self delegate];
    char v9 = +[CNAvatarCardController descriptorForRequiredKeys];
    v26[0] = v9;
    char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    double v11 = [v8 contactsForPreviewInteractionForAvatarView:self suggestedKeysToFetch:v10];
  }
  else
  {
    double v11 = [(CNAvatarView *)self contacts];
  }
  if (![v11 count]) {
    goto LABEL_12;
  }
  double v12 = [(CNAvatarView *)self contactStore];
  [v5 prepareWithContacts:v11 store:v12];

  int v13 = [v5 hasActions];
  double v14 = [(CNAvatarView *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = [(CNAvatarView *)self delegate];
    id v17 = [v16 overrideImageDataForPreviewInteractionForAvatarView:self];

    [v5 prepareWithOverrideImageData:v17];
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else if (!v13)
  {
LABEL_12:
    int64_t v24 = 2;
    goto LABEL_13;
  }
  double v18 = [(CNAvatarView *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    BOOL v20 = [(CNAvatarView *)self delegate];
    int v21 = [v20 shouldShowActionsForAvatarView:self];

    if (!v21) {
      goto LABEL_12;
    }
  }
  [v5 prepareForDisplay];
  uint64_t v22 = [(CNAvatarView *)self name];
  [v5 setName:v22];

  unint64_t v23 = [(CNAvatarView *)self message];
  [v5 setMessage:v23];

  int64_t v24 = 0;
LABEL_13:

  return v24;
}

- (id)presentingViewControllerForAvatarCardController:(id)a3
{
  uint64_t v4 = [(CNAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAvatarView *)self delegate];
    char v7 = [v6 presentingViewControllerForAvatarView:self];

    objc_msgSend(v7, "set_cardViewControllerTransitioning:", self);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)bypassActionValidation
{
  v2 = [(CNAvatarView *)self cardController];
  char v3 = [v2 bypassActionValidation];

  return v3;
}

- (NSArray)actionCategories
{
  v2 = [(CNAvatarView *)self cardController];
  char v3 = [v2 actionCategories];

  return (NSArray *)v3;
}

- (void)contactDidChange
{
  [(CNAvatarView *)self clearImage];

  [(CNAvatarView *)self _renderContactsImage];
}

- (void)dismissContactViewController:(id)a3
{
  uint64_t v4 = [(CNAvatarView *)self contactViewNavigationController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CNAvatarView_dismissContactViewController___block_invoke;
  v5[3] = &unk_1E549B488;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __45__CNAvatarView_dismissContactViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContactViewNavigationController:0];
}

- (void)showContact:(id)a3
{
  id v9 = [(CNAvatarView *)self contact];
  char v3 = [v9 identifier];
  if ([v9 hasBeenPersisted])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    char v5 = [NSString stringWithFormat:@"contact://show?id=%@", v3];
    id v6 = [v4 URLWithString:v5];

    char v7 = +[CNUIContactsEnvironment currentEnvironment];
    id v8 = [v7 applicationWorkspace];
    [v8 openSensitiveURLInBackground:v6 withOptions:0];
  }
}

- (double)_diameter
{
  [(CNAvatarView *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(CNAvatarView *)self bounds];
  double result = CGRectGetHeight(v6);
  if (Width < result) {
    return Width;
  }
  return result;
}

- (UIImage)contentImage
{
  v2 = [(CNAvatarView *)self imageView];
  char v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setDisableCornerRadiusForAvatar:(BOOL)a3
{
  if (self->_disableCornerRadiusForAvatar != a3)
  {
    self->_disableCornerRadiusForAvatar = a3;
    [(CNAvatarView *)self setNeedsLayout];
  }
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  if (self->_threeDTouchEnabled != a3)
  {
    self->_threeDTouchEnabled = a3;
    if (a3) {
      [(CNAvatarView *)self setupAvatarCardControllerIfNeeded];
    }
    [(CNAvatarView *)self _updateCardActions];
  }
}

- (CGRect)frameForAvatarAtIndex:(unint64_t)a3 inView:(id)a4
{
  id v6 = a4;
  char v7 = (void *)MEMORY[0x1E4F5A618];
  id v8 = [(CNAvatarView *)self contacts];
  id v9 = objc_msgSend(v7, "layoutConfigurationsForType:withItemCount:", 2, objc_msgSend(v8, "count"));

  if ([v9 count] <= a3)
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    char v10 = [v9 objectAtIndex:a3];
    BOOL v11 = [(CNAvatarView *)self effectiveUserInterfaceLayoutDirection] == 1;
    double v12 = [(CNAvatarView *)self imageView];
    [v12 bounds];
    objc_msgSend(v10, "itemFrameInContainingBounds:isRTL:", v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    -[CNAvatarView convertRect:toView:](self, "convertRect:toView:", v6, v14, v16, v18, v20);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
  }
  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.height = v32;
  result.size.double width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)updateViewWithGroupIdentity:(id)a3 maskingContacts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 groupPhoto];

  if (v8)
  {
    [(CNAvatarView *)self setShouldUpdateMaskedAvatars:0];
    id v9 = [MEMORY[0x1E4F28D60] indexSet];
    [(CNAvatarView *)self setMaskedAvatarIndices:v9];
  }
  else
  {
    char v10 = [v7 contacts];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__CNAvatarView_updateViewWithGroupIdentity_maskingContacts___block_invoke;
    v15[3] = &unk_1E5498720;
    id v16 = v6;
    BOOL v11 = [v10 indexesOfObjectsPassingTest:v15];

    double v12 = [(CNAvatarView *)self maskedAvatarIndices];
    -[CNAvatarView setShouldUpdateMaskedAvatars:](self, "setShouldUpdateMaskedAvatars:", [v12 isEqualToIndexSet:v11] ^ 1);

    [(CNAvatarView *)self setMaskedAvatarIndices:v11];
  }
  double v13 = [(CNAvatarView *)self updateViewWithGroupIdentity:v7];

  return v13;
}

uint64_t __60__CNAvatarView_updateViewWithGroupIdentity_maskingContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cn_containsObject:", a2);
}

- (void)setShouldFetchSharedMeContactPhoto:(BOOL)a3
{
  if (self->_shouldFetchSharedMeContactPhoto != a3)
  {
    BOOL v3 = a3;
    self->_shouldFetchSharedMeContactPhoto = a3;
    uint64_t v4 = [(CNAvatarView *)self imageRenderer];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setLookupOptions:v5];
  }
}

- (void)dealloc
{
  BOOL v3 = [(CNAvatarView *)self rendererToken];
  [v3 cancel];

  uint64_t v4 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v5 = [v4 contactChangesNotifier];
  [v5 removeEntriesWithoutObservers];

  if ([(CNAvatarView *)self stateCaptureHandle])
  {
    [(CNAvatarView *)self stateCaptureHandle];
    os_state_remove_handler();
  }
  v6.receiver = self;
  v6.super_class = (Class)CNAvatarView;
  [(CNAvatarView *)&v6 dealloc];
}

- (CNAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CNAvatarView *)self init];
  id v8 = v7;
  if (v7) {
    -[CNAvatarView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (CNAvatarView)init
{
  BOOL v3 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v4 = [v3 cachingLikenessRenderer];
  uint64_t v5 = [(id)objc_opt_class() defaultThreeDTouchSupport];
  objc_super v6 = [v3 contactStore];
  id v7 = [(CNAvatarView *)self initWithImageRenderer:v4 threeDTouchEnabled:v5 contactStore:v6];

  return v7;
}

_DWORD *__110__CNAvatarView_initWithImageRenderer_threeDTouchEnabled_contactStore_style_schedulerProvider_backgroundStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id v5 = WeakRetained;
    objc_super v6 = v5;
    if (v5 && ([v5 window], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      id v8 = [v6 contacts];
      id v9 = [v8 description];

      char v10 = [v6 window];
      [v6 center];
      double v12 = v11;
      double v14 = v13;
      double v15 = [v6 superview];
      objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
      CGFloat v17 = v16;
      CGFloat v19 = v18;

      double v20 = NSString;
      v28.double x = v17;
      v28.double y = v19;
      double v21 = NSStringFromCGPoint(v28);
      double v22 = [v20 stringWithFormat:@"CNAvatarViewDebug, view at %@ shows %@", v21, v9];

      double v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v22 format:200 options:0 error:0];
      size_t v24 = [v23 length];
      double v25 = malloc_type_calloc(1uLL, v24 + 200, 0x9A04E9B0uLL);
      _DWORD *v25 = 1;
      v25[1] = v24;
      id v26 = v23;
      memcpy(v25 + 50, (const void *)[v26 bytes], v24);
    }
    else
    {
      double v25 = 0;
    }
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  char v10 = +[CNUIContactsEnvironment currentEnvironment];
  double v11 = [v10 defaultSchedulerProvider];

  double v12 = [(CNAvatarView *)self initWithImageRenderer:v9 threeDTouchEnabled:v5 contactStore:v8 style:0 schedulerProvider:v11 backgroundStyle:0];
  return v12;
}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = [*(id *)(a1 + 40) makeDescriptorForRequiredKeysWithThreeDTouchEnabled:*(unsigned __int8 *)(a1 + 48) shouldUseCachingRenderer:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v3 = [v2 descriptorWithKeyDescriptors:v5 description:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3 = v3;
}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = [*(id *)(a1 + 40) makeDescriptorForRequiredKeysWithThreeDTouchEnabled:*(unsigned __int8 *)(a1 + 48) shouldUseCachingRenderer:*(unsigned __int8 *)(a1 + 49)];
  uint64_t v3 = [v2 descriptorWithKeyDescriptors:v5 description:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4 = v3;
}

+ (BOOL)defaultThreeDTouchSupport
{
  return 1;
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)showsActionsOnForcePress
{
  return self->_showsActionsOnForcePress;
}

- (void)setShowsActionsOnForcePress:(BOOL)a3
{
  if (self->_showsActionsOnForcePress != a3)
  {
    self->_showsActionsOnForcePress = a3;
    [(CNAvatarView *)self _updateCardActions];
  }
}

- (BOOL)showsActionsOnTap
{
  return self->_showsActionsOnTap;
}

- (void)setShowsActionsOnTap:(BOOL)a3
{
  if (self->_showsActionsOnTap != a3)
  {
    self->_showsActionsOnTap = a3;
    [(CNAvatarView *)self _updateCardActions];
  }
}

- (CNContact)contact
{
  v2 = [(CNAvatarView *)self contacts];
  uint64_t v3 = [v2 firstObject];

  return (CNContact *)v3;
}

- (void)setContact:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(CNAvatarView *)self setContacts:v6];
  }
  else
  {
    [(CNAvatarView *)self setContacts:MEMORY[0x1E4F1CBF0]];
  }
}

- (CNAvatarView)initWithContact:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNAvatarView *)self init];
  if (v5)
  {
    if (v4)
    {
      v8[0] = v4;
      objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      objc_super v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(CNAvatarView *)v5 setContacts:v6];
  }
  return v5;
}

+ (id)descriptorForRequiredKeys
{
  return (id)[a1 descriptorForRequiredKeysWithThreeDTouchEnabled:1];
}

void __30___CNAvatarView_setupSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) bounds];
    double v8 = v7;
    double v10 = v9;
    double v11 = [*(id *)(a1 + 32) window];
    double v12 = [v11 screen];
    [v12 scale];
    double v14 = objc_msgSend(v16, "_cnui_likenessForSize:scale:", v8, v10, v13);
  }
  else
  {
    double v14 = objc_msgSend(v16, "_cnui_likeness");
  }
  double v15 = (void *)[objc_alloc(MEMORY[0x1E4F89D40]) initWithLikeness:v14];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) addObject:v15];
  [*(id *)(a1 + 32) addSubview:v15];
  if (a3 == 1) {
    *a4 = 1;
  }
}

@end