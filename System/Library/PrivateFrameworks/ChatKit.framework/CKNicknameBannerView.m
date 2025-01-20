@interface CKNicknameBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKNicknameBannerView)initWithStyle:(unint64_t)a3 updates:(id)a4 useNamedTitles:(BOOL)a5 avatarImages:(id)a6 contacts:(id)a7 customImage:(id)a8 titleString:(id)a9 subtitleString:(id)a10 actionButtonTitle:(id)a11 actionButtonHandler:(id)a12 actionButtonMenuItems:(id)a13 xButtonHandler:(id)a14;
- (NSArray)nicknameUpdates;
- (UIView)swiftBanner;
- (unint64_t)style;
- (void)layoutSubviews;
- (void)setNicknameUpdates:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSwiftBanner:(id)a3;
@end

@implementation CKNicknameBannerView

- (CKNicknameBannerView)initWithStyle:(unint64_t)a3 updates:(id)a4 useNamedTitles:(BOOL)a5 avatarImages:(id)a6 contacts:(id)a7 customImage:(id)a8 titleString:(id)a9 subtitleString:(id)a10 actionButtonTitle:(id)a11 actionButtonHandler:(id)a12 actionButtonMenuItems:(id)a13 xButtonHandler:(id)a14
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v39 = a4;
  id v34 = a6;
  id v35 = a7;
  id v36 = a8;
  id v37 = a9;
  id v38 = a10;
  id v18 = a11;
  id v19 = a12;
  id v33 = a13;
  id v20 = a14;
  v47.receiver = self;
  v47.super_class = (Class)CKNicknameBannerView;
  v21 = -[CKNicknameBannerView initWithFrame:](&v47, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v22 = v21;
  if (v21)
  {
    [(CKNicknameBannerView *)v21 setStyle:a3];
    [(CKNicknameBannerView *)v22 setNicknameUpdates:v39];
    id location = 0;
    objc_initWeak(&location, v22);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke;
    aBlock[3] = &unk_1E5621330;
    id v44 = v19;
    objc_copyWeak(&v45, &location);
    v23 = _Block_copy(aBlock);
    char IsEmpty = IMStringIsEmpty();
    if (v23) {
      char v25 = IsEmpty;
    }
    else {
      char v25 = 1;
    }
    if (v25)
    {
      v26 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v27 = [[CKBannerButtonObject alloc] initWithTitle:v18 handler:v23 menuItems:v33];
      v48[0] = v27;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke_2;
    v40[3] = &unk_1E5621358;
    id v41 = v20;
    objc_copyWeak(&v42, &location);
    LOBYTE(v31) = 1;
    uint64_t v28 = +[CKBannerViewFactory bannerWithTitle:v37 subtitleString:v38 avatarImages:v34 contacts:v35 customImage:v36 actionButtonObjects:v26 forceImageCentering:v31 xButtonHandler:v40];
    swiftBanner = v22->_swiftBanner;
    v22->_swiftBanner = (UIView *)v28;

    [(CKNicknameBannerView *)v22 addSubview:v22->_swiftBanner];
    objc_destroyWeak(&v42);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

  return v22;
}

void __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);
}

void __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_swiftBanner, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKNicknameBannerView;
  [(CKNicknameBannerView *)&v4 layoutSubviews];
  swiftBanner = self->_swiftBanner;
  [(CKNicknameBannerView *)self bounds];
  -[UIView setFrame:](swiftBanner, "setFrame:");
  [(UIView *)self->_swiftBanner sizeToFit];
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSArray)nicknameUpdates
{
  return self->_nicknameUpdates;
}

- (void)setNicknameUpdates:(id)a3
{
}

- (UIView)swiftBanner
{
  return self->_swiftBanner;
}

- (void)setSwiftBanner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftBanner, 0);

  objc_storeStrong((id *)&self->_nicknameUpdates, 0);
}

@end