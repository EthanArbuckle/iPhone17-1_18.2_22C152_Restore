@interface CNContactPhotoView
+ (BOOL)requiresConstraintBasedLayout;
+ (CGSize)defaultSize;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3;
+ (id)supportedPasteboardTypes;
- (BOOL)_isUsingCuratedPhoto;
- (BOOL)_isUsingSilhouette;
- (BOOL)acceptsImageDrop;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hasPhoto;
- (BOOL)isAnimatingBounce;
- (BOOL)isEditing;
- (BOOL)isMeContact;
- (BOOL)isPresentingModalViewController;
- (BOOL)modified;
- (BOOL)prohibitsPersonaFetch;
- (BOOL)shouldAllowTakePhotoAction;
- (BOOL)showEditingLabel;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (CNAvatarView)avatarView;
- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8;
- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8 allowStaleRendering:(BOOL)a9;
- (CNContactPhotoViewDelegate)delegate;
- (CNMutableContact)mutableContact;
- (CNMutableContact)pendingEditContact;
- (CNPhotoPickerViewController)photoPicker;
- (CNPresenterDelegate)presenterDelegate;
- (NSArray)contacts;
- (NSArray)variableConstraints;
- (PRLikeness)currentLikeness;
- (PRLikeness)originalLikeness;
- (UIButton)editPhotoButton;
- (UIDropInteraction)dropInteraction;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)labelAlpha;
- (id)contact;
- (id)currentImageData;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)newPendingContactPreservingChangesFrom:(id)a3;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5;
- (id)previewPath;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_bounceSmallPhoto;
- (void)_presentFullScreenPhoto:(id)a3;
- (void)_presentPhotoPicker;
- (void)_zoomContactPhoto;
- (void)avatarTapped:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)didUpdateContentForAvatarView:(id)a3;
- (void)disablePhotoTapGesture;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)longPressGesture:(id)a3;
- (void)menuWillHide:(id)a3;
- (void)paste:(id)a3;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)presentPhotoPickerWithImageData:(id)a3;
- (void)previewControllerDidDismiss:(id)a3;
- (void)reloadData;
- (void)resetPhoto;
- (void)saveChangesFromPendingContact:(id)a3 toContact:(id)a4;
- (void)saveEdits;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setAcceptsImageDrop:(BOOL)a3;
- (void)setAvatarView:(id)a3;
- (void)setContacts:(id)a3;
- (void)setCurrentLikeness:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setEditPhotoButton:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 preservingChanges:(BOOL)a4;
- (void)setHighlightedFrame:(BOOL)a3;
- (void)setIsAnimatingBounce:(BOOL)a3;
- (void)setLabelAlpha:(double)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setModified:(BOOL)a3;
- (void)setOriginalLikeness:(id)a3;
- (void)setPendingEditContact:(id)a3;
- (void)setPhotoPicker:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setProhibitsPersonaFetch:(BOOL)a3;
- (void)setShowEditingLabel:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setVariableConstraints:(id)a3;
- (void)updateEditPhotoButton;
- (void)updateFontSizes;
- (void)updatePendingContactWithEditedContact:(id)a3;
- (void)updatePendingContactWithEditedPropertyItem:(id)a3;
- (void)updatePhoto;
- (void)updateViewsAndNotifyDelegate:(BOOL)a3;
- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4;
- (void)willBeginPreviewInteractionForAvatarView:(id)a3;
@end

@implementation CNContactPhotoView

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v3 = +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:a3];
  v4 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v5 = *MEMORY[0x1E4F1AF70];
  v11[1] = v4;
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v7 = (void *)MEMORY[0x1E4F1B8F8];
  v8 = [NSString stringWithUTF8String:"+[CNContactPhotoView descriptorForRequiredKeysWithThreeDTouchEnabled:]"];
  v9 = [v7 descriptorWithKeyDescriptors:v6 description:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);
  objc_storeStrong((id *)&self->_editPhotoButton, 0);
  objc_storeStrong((id *)&self->_currentLikeness, 0);
  objc_storeStrong((id *)&self->_originalLikeness, 0);
  objc_storeStrong((id *)&self->_pendingEditContact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setPhotoPicker:(id)a3
{
}

- (CNPhotoPickerViewController)photoPicker
{
  return self->_photoPicker;
}

- (void)setAcceptsImageDrop:(BOOL)a3
{
  self->_acceptsImageDrop = a3;
}

- (BOOL)acceptsImageDrop
{
  return self->_acceptsImageDrop;
}

- (void)setDropInteraction:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setVariableConstraints:(id)a3
{
}

- (NSArray)variableConstraints
{
  return self->_variableConstraints;
}

- (void)setIsAnimatingBounce:(BOOL)a3
{
  self->_isAnimatingBounce = a3;
}

- (BOOL)isAnimatingBounce
{
  return self->_isAnimatingBounce;
}

- (void)setEditPhotoButton:(id)a3
{
}

- (UIButton)editPhotoButton
{
  return self->_editPhotoButton;
}

- (void)setProhibitsPersonaFetch:(BOOL)a3
{
  self->_prohibitsPersonaFetch = a3;
}

- (BOOL)prohibitsPersonaFetch
{
  return self->_prohibitsPersonaFetch;
}

- (void)setCurrentLikeness:(id)a3
{
}

- (PRLikeness)currentLikeness
{
  return self->_currentLikeness;
}

- (void)setOriginalLikeness:(id)a3
{
}

- (PRLikeness)originalLikeness
{
  return self->_originalLikeness;
}

- (void)setPendingEditContact:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNContactPhotoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactPhotoViewDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (CNPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (BOOL)shouldAllowTakePhotoAction
{
  return self->_shouldAllowTakePhotoAction;
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (BOOL)modified
{
  return self->_modified;
}

- (void)setShowEditingLabel:(BOOL)a3
{
  self->_showEditingLabel = a3;
}

- (BOOL)showEditingLabel
{
  return self->_showEditingLabel;
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  v6 = [v5 items];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v5 items];
    v9 = [v8 objectAtIndexedSubscript:0];

    uint64_t v10 = *MEMORY[0x1E4F225F8];
    v11 = [v9 itemProvider];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke;
    v13[3] = &unk_1E549AC68;
    v13[4] = self;
    id v12 = (id)[v11 loadDataRepresentationForTypeIdentifier:v10 completionHandler:v13];
  }
}

void __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    uint64_t v7 = [a3 localizedDescription];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPhotoView.m", 959, 3, @"Unable to copy data for avatar photo drop operation: %@", v8, v9, v10, v11, (uint64_t)v7);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke_2;
    block[3] = &unk_1E549BF80;
    block[4] = *(void *)(a1 + 32);
    id v13 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoView:*(void *)(a1 + 32) didAcceptDropOfImageData:*(void *)(a1 + 40)];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  if ([(CNContactPhotoView *)self acceptsImageDrop])
  {
    v6 = [v5 items];
    BOOL v7 = [v6 count] == 1;

    uint64_t v8 = 2 * v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v8];

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v4 = (void (__cdecl *)())getkUTTypePNG[0];
  id v5 = a4;
  v6 = v4();
  v12[0] = v6;
  BOOL v7 = getkUTTypeJPEG[0]();
  uint64_t v8 = *MEMORY[0x1E4F22618];
  v12[1] = v7;
  v12[2] = v8;
  uint64_t v9 = *MEMORY[0x1E4F225F8];
  v12[3] = *MEMORY[0x1E4F22550];
  v12[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  LOBYTE(v4) = [v5 hasItemsConformingToTypeIdentifiers:v10];

  return (char)v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5 = objc_alloc_init(CNContactPhotoPreviewItem);
  v6 = (void *)MEMORY[0x1E4F1B910];
  BOOL v7 = [(CNContactPhotoView *)self contact];
  uint64_t v8 = [v6 stringFromContact:v7 style:0];
  [(CNContactPhotoPreviewItem *)v5 setPreviewItemTitle:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v10 = NSString;
  uint64_t v11 = [(CNContactPhotoView *)self previewPath];
  id v12 = [v10 stringWithFormat:@"file://%@", v11];
  id v13 = [v9 URLWithString:v12];
  [(CNContactPhotoPreviewItem *)v5 setPreviewItemURL:v13];

  return v5;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (void)previewControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(CNContactPhotoView *)self previewPath];
  [v5 removeItemAtPath:v4 error:0];
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  if (a5) {
    *a5 = self;
  }
  v6 = [(CNContactPhotoView *)self avatarView];
  BOOL v7 = [(CNContactPhotoView *)self avatarView];
  [v7 bounds];
  objc_msgSend(v6, "convertRect:toView:", self);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  if (a5)
  {
    BOOL v7 = [(CNContactPhotoView *)self avatarView];
    [v7 frame];
    a5->origin.x = v8;
    a5->origin.y = v9;
    a5->size.width = v10;
    a5->size.height = v11;
  }
  double v12 = [(CNContactPhotoView *)self avatarView];
  double v13 = [v12 backgroundColor];

  double v14 = [MEMORY[0x1E4FB1618] clearColor];
  double v15 = [(CNContactPhotoView *)self avatarView];
  [v15 setBackgroundColor:v14];

  double v16 = [(CNContactPhotoView *)self avatarView];
  [v16 bounds];
  v25.width = v17;
  v25.height = v18;
  UIGraphicsBeginImageContext(v25);

  double v19 = [(CNContactPhotoView *)self avatarView];
  v20 = [v19 layer];
  [v20 renderInContext:UIGraphicsGetCurrentContext()];

  v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v22 = [(CNContactPhotoView *)self avatarView];
  [v22 setBackgroundColor:v13];

  return v21;
}

- (void)didUpdateContentForAvatarView:(id)a3
{
  id v4 = +[CNUIContactsEnvironment currentEnvironment];
  v3 = [v4 launchCheckinRegistrar];
  [v3 checkInLaunchTasks:4];
}

- (void)willBeginPreviewInteractionForAvatarView:(id)a3
{
  id v4 = [(CNContactPhotoView *)self longPressGestureRecognizer];
  [v4 setEnabled:0];

  id v5 = [(CNContactPhotoView *)self longPressGestureRecognizer];
  [v5 setEnabled:1];

  id v6 = [(CNContactPhotoView *)self window];
  [v6 endEditing:1];
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  id v4 = [(CNContactPhotoView *)self delegate];
  id v5 = [v4 viewControllerForPhotoView:self];

  return v5;
}

- (void)_bounceSmallPhoto
{
  if (![(CNContactPhotoView *)self isAnimatingBounce])
  {
    v3 = [(CNContactPhotoView *)self avatarView];
    [v3 frame];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;

    double v12 = [(CNContactPhotoView *)self avatarView];
    [v12 frame];
    CGRect v20 = CGRectInset(v19, -5.0, -5.0);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;

    [(CNContactPhotoView *)self setIsAnimatingBounce:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke;
    v18[3] = &unk_1E549A080;
    v18[4] = self;
    *(CGFloat *)&v18[5] = x;
    *(CGFloat *)&v18[6] = y;
    *(CGFloat *)&v18[7] = width;
    *(CGFloat *)&v18[8] = height;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_2;
    v17[3] = &unk_1E5497678;
    v17[4] = self;
    v17[5] = v5;
    v17[6] = v7;
    v17[7] = v9;
    v17[8] = v11;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:v17 completion:0.15];
  }
}

void __39__CNContactPhotoView__bounceSmallPhoto__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) avatarView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_3;
  v4[3] = &unk_1E549A080;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v1 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_4;
  v3[3] = &unk_1E549B1C0;
  v3[4] = v5;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.15];
}

void __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) avatarView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingBounce:0];
}

- (void)_presentFullScreenPhoto:(id)a3
{
  UIImageJPEGRepresentation((UIImage *)a3, 0.0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(CNContactPhotoView *)self previewPath];
  int v5 = [v8 writeToFile:v4 atomically:0];

  if (v5)
  {
    long long v6 = (void *)[objc_alloc((Class)getQLPreviewControllerClass[0]()) initWithNibName:0 bundle:0];
    [v6 setDelegate:self];
    [v6 setDataSource:self];
    [v6 setModalPresentationStyle:0];
    long long v7 = [(CNContactPhotoView *)self presenterDelegate];
    [v7 sender:self presentViewController:v6];
  }
}

- (void)_zoomContactPhoto
{
  double v3 = [(CNContactPhotoView *)self avatarView];
  id v18 = [v3 imageForTransitioningToFullScreen];

  double v4 = v18;
  if (v18) {
    goto LABEL_2;
  }
  uint64_t v9 = [(CNContactPhotoView *)self contact];
  int v10 = [v9 isKeyAvailable:*MEMORY[0x1E4F1ADE8]];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
    double v12 = [(CNContactPhotoView *)self contact];
    double v13 = [v12 fullscreenImageData];
    id v20 = [v11 imageWithData:v13];

    double v4 = v20;
    if (v20) {
      goto LABEL_2;
    }
  }
  double v14 = [(CNContactPhotoView *)self contact];
  int v15 = [v14 isKeyAvailable:*MEMORY[0x1E4F1AE28]];

  if (!v15) {
    goto LABEL_9;
  }
  double v16 = [(CNContactPhotoView *)self contact];
  CGFloat v17 = [v16 imageData];

  if (!v17) {
    goto LABEL_9;
  }
  id v21 = [MEMORY[0x1E4FB1818] imageWithData:v17];

  double v4 = v21;
  if (v21)
  {
LABEL_2:
    id v19 = v4;
    [v4 size];
    double v6 = v5;
    long long v7 = [(CNContactPhotoView *)self window];
    [v7 bounds];
    CGFloat v8 = CGRectGetWidth(v23) * 0.75;

    if (v6 >= v8)
    {
      [(CNContactPhotoView *)self _presentFullScreenPhoto:v19];
      goto LABEL_11;
    }
  }
  else
  {
LABEL_9:
    id v19 = 0;
  }
  [(CNContactPhotoView *)self _bounceSmallPhoto];
LABEL_11:
}

- (id)previewPath
{
  double v2 = NSTemporaryDirectory();
  double v3 = [v2 stringByAppendingPathComponent:@"ABContactPhotoView_FullscreenPhoto.jpg"];

  return v3;
}

- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  long long v7 = [(CNContactPhotoView *)self presenterDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CNContactPhotoView *)self presenterDelegate];
    int v10 = [v11 navigationController];
    [v9 viewController:v10 presentationControllerWillDismiss:v6];
  }
}

- (void)updatePendingContactWithEditedContact:(id)a3
{
  id v4 = a3;
  double v5 = [v4 wallpaper];
  id v6 = [(CNContactPhotoView *)self pendingEditContact];
  [v6 setWallpaper:v5];

  long long v7 = [v4 watchWallpaperImageData];
  char v8 = [(CNContactPhotoView *)self pendingEditContact];
  [v8 setWatchWallpaperImageData:v7];

  uint64_t v9 = [v4 imageData];
  int v10 = [(CNContactPhotoView *)self pendingEditContact];
  [v10 setImageData:v9];

  id v11 = [v4 imageType];
  double v12 = [(CNContactPhotoView *)self pendingEditContact];
  [v12 setImageType:v11];

  double v13 = [v4 imageHash];
  double v14 = [(CNContactPhotoView *)self pendingEditContact];
  [v14 setImageHash:v13];

  [v4 cropRect];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  CGRect v23 = [(CNContactPhotoView *)self pendingEditContact];
  objc_msgSend(v23, "setCropRect:", v16, v18, v20, v22);

  v24 = [v4 thumbnailImageData];
  CGSize v25 = [(CNContactPhotoView *)self pendingEditContact];
  [v25 setThumbnailImageData:v24];

  v26 = [v4 fullscreenImageData];
  v27 = [(CNContactPhotoView *)self pendingEditContact];
  [v27 setFullscreenImageData:v26];

  v28 = [v4 preferredLikenessSource];
  v29 = [(CNContactPhotoView *)self pendingEditContact];
  [v29 setPreferredLikenessSource:v28];

  v30 = [v4 memojiMetadata];

  v31 = [(CNContactPhotoView *)self pendingEditContact];
  [v31 setMemojiMetadata:v30];

  v32 = [(CNContactPhotoView *)self pendingEditContact];
  [v32 setSharedPhotoDisplayPreference:2];

  [(CNContactPhotoView *)self setModified:1];

  [(CNContactPhotoView *)self reloadData];
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8 = a3;
  if (a4) {
    [(CNContactPhotoView *)self updatePendingContactWithEditedContact:a4];
  }
  long long v7 = [(CNContactPhotoView *)self presenterDelegate];
  [v7 sender:0 dismissViewController:v8];

  [(CNContactPhotoView *)self setPhotoPicker:0];
}

- (void)photoPickerDidCancel:(id)a3
{
  id v4 = a3;
  double v5 = [(CNContactPhotoView *)self presenterDelegate];
  [v5 sender:0 dismissViewController:v4];

  [(CNContactPhotoView *)self setPhotoPicker:0];
}

- (BOOL)isPresentingModalViewController
{
  double v2 = [(CNContactPhotoView *)self presenterDelegate];
  char v3 = [v2 isPresentingModalViewController];

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CNContactPhotoView *)self presenterDelegate];
  [v11 sender:v10 dismissViewController:v9 completionHandler:v8];
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  long long v7 = (CNContactPhotoView *)a3;
  id v8 = [(CNContactPhotoView *)self presenterDelegate];
  id v10 = v8;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = self;
  }
  [v8 sender:v9 presentViewController:v6];
}

- (void)presentPhotoPickerWithImageData:(id)a3
{
  id v14 = a3;
  id v4 = [CNPhotoPickerViewController alloc];
  double v5 = [(CNContactPhotoView *)self pendingEditContact];
  id v6 = +[CNContactStyle currentStyle];
  long long v7 = +[CNPhotoPickerConfiguration contactsConfiguration];
  id v8 = objc_msgSend(v7, "configurationBySettingAllowsPhotoCapture:", -[CNContactPhotoView shouldAllowTakePhotoAction](self, "shouldAllowTakePhotoAction"));
  id v9 = [(CNPhotoPickerViewController *)v4 initWithContact:v5 style:v6 configuration:v8];

  [(CNPhotoPickerViewController *)v9 setDelegate:self];
  [(CNVisualIdentityPickerViewController *)v9 setPresenterDelegate:self];
  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNPhotoPickerViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  if (v14) {
    [(CNVisualIdentityPickerViewController *)v9 setProposedImageData:v14];
  }
  [(CNContactPhotoView *)self setPhotoPicker:v9];
  id v10 = [(CNContactPhotoView *)self window];
  [v10 endEditing:1];

  id v11 = [(CNContactPhotoView *)self photoPicker];
  double v12 = +[CNPhotoPickerViewController navigationControllerForPicker:v11];

  double v13 = [(CNContactPhotoView *)self presenterDelegate];
  [v13 sender:self presentViewController:v12];
}

- (void)_presentPhotoPicker
{
}

- (BOOL)_isUsingSilhouette
{
  if (self->_pendingEditContact) {
    [(CNContactPhotoView *)self pendingEditContact];
  }
  else {
  char v3 = [(CNContactPhotoView *)self contact];
  }
  if ([(CNContactPhotoView *)self hasPhoto])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F5A298];
    id v6 = [v3 givenName];
    if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v6))
    {
      long long v7 = [v3 familyName];
      char v4 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

- (BOOL)_isUsingCuratedPhoto
{
  if (self->_pendingEditContact) {
    [(CNContactPhotoView *)self pendingEditContact];
  }
  else {
  char v3 = [(CNContactPhotoView *)self contact];
  }
  char v4 = [v3 preferredLikenessSource];
  if ([(CNContactPhotoView *)self hasPhoto])
  {
    if (v4) {
      char v5 = [v4 isEqualToString:*MEMORY[0x1E4F1AE80]];
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updatePendingContactWithEditedPropertyItem:(id)a3
{
  id v16 = a3;
  char v4 = [v16 property];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1ADF0]])
  {
  }
  else
  {
    char v5 = [v16 property];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1ADE0]];

    if (!v6) {
      goto LABEL_8;
    }
  }
  long long v7 = (void *)MEMORY[0x1E4F1B910];
  id v8 = [(CNContactPhotoView *)self pendingEditContact];
  id v9 = [v7 abbreviatedStringFromContact:v8 trimmingWhitespace:1];

  id v10 = [v16 editingStringValue];
  id v11 = [(CNContactPhotoView *)self pendingEditContact];
  double v12 = [v16 property];
  [v11 setValue:v10 forKey:v12];

  double v13 = (void *)MEMORY[0x1E4F1B910];
  id v14 = [(CNContactPhotoView *)self pendingEditContact];
  double v15 = [v13 stringFromContact:v14 style:1002];

  if (!-[CNContactPhotoView hasPhoto](self, "hasPhoto") && ([v15 isEqualToString:v9] & 1) == 0) {
    [(CNContactPhotoView *)self updateViewsAndNotifyDelegate:0];
  }

LABEL_8:
}

- (void)updateEditPhotoButton
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactPhotoView *)self isEditing]
    && [(CNContactPhotoView *)self showEditingLabel])
  {
    char v3 = [(CNContactPhotoView *)self editPhotoButton];
    [v3 setHidden:0];

    if ([(CNContactPhotoView *)self _isUsingSilhouette]) {
      [(CNContactPhotoView *)self tintColor];
    }
    else {
    char v4 = +[CNUIColorRepository contactCardPhotoEditButtonColor];
    }
    char v5 = [(CNContactPhotoView *)self editPhotoButton];
    [v5 setTintColor:v4];

    [(CNContactPhotoView *)self labelAlpha];
    double v7 = v6;
    id v8 = [(CNContactPhotoView *)self editPhotoButton];
    [v8 setAlpha:v7];

    LODWORD(v8) = [(CNContactPhotoView *)self _isUsingCuratedPhoto];
    id v9 = CNContactsUIBundle();
    id v10 = v9;
    if (v8) {
      id v11 = @"PHOTO_EDIT_LABEL";
    }
    else {
      id v11 = @"PHOTO_ADD_LABEL";
    }
    double v12 = [v9 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized"];

    double v13 = [v12 componentsSeparatedByString:@"\n"];
    unint64_t v14 = [v13 count];

    if (v14 > 2)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4FB0848]);
      [v15 setAlignment:1];
      [v15 setMaximumLineHeight:14.0];
      [v15 setMinimumLineHeight:14.0];
      uint64_t v17 = *MEMORY[0x1E4FB06C8];
      v20[0] = *MEMORY[0x1E4FB0738];
      v20[1] = v17;
      v21[0] = v15;
      v21[1] = &unk_1ED9155A0;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v16];
      [(UIButton *)self->_editPhotoButton setAttributedTitle:v18 forState:0];
    }
    else
    {
      uint64_t v22 = *MEMORY[0x1E4FB06C8];
      v23[0] = &unk_1ED9155A0;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v15];
      [(UIButton *)self->_editPhotoButton setAttributedTitle:v16 forState:0];
    }
  }
  else
  {
    id v19 = [(CNContactPhotoView *)self editPhotoButton];
    [v19 setHidden:1];
  }
}

- (void)updateViewsAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_pendingEditContact)
  {
    v15[0] = self->_pendingEditContact;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
LABEL_5:
    double v7 = (void *)v5;
    goto LABEL_6;
  }
  double v6 = [(CNContactPhotoView *)self contacts];

  if (v6)
  {
    uint64_t v5 = [(CNContactPhotoView *)self contacts];
    goto LABEL_5;
  }
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:
  [(CNContactPhotoView *)self setProhibitsPersonaFetch:0];
  id v8 = [(CNContactPhotoView *)self avatarView];
  id v9 = [v8 contacts];
  int v10 = [v9 isEqualToArray:v7];

  id v11 = [(CNContactPhotoView *)self avatarView];
  double v12 = v11;
  if (v10)
  {
    [v11 contactDidChange];
  }
  else
  {
    [v11 setContacts:v7];

    uint64_t v13 = objc_msgSend(v7, "_cn_any:", &__block_literal_global_130);
    double v12 = [(CNContactPhotoView *)self avatarView];
    [v12 setShouldFetchSharedMeContactPhoto:v13];
  }

  [(CNContactPhotoView *)self setNeedsUpdateConstraints];
  [(CNContactPhotoView *)self updateEditPhotoButton];
  if (v3)
  {
    unint64_t v14 = [(CNContactPhotoView *)self delegate];
    [v14 photoViewDidUpdate:self];
  }
}

uint64_t __51__CNContactPhotoView_updateViewsAndNotifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F5A6D8];
  id v3 = a2;
  char v4 = [v2 unifiedMeContactMonitor];
  uint64_t v5 = [v4 isMeContact:v3];

  return v5;
}

- (void)reloadData
{
}

- (void)updatePhoto
{
  if ([(CNContactPhotoView *)self isEditing] && self->_pendingEditContact)
  {
    id v3 = [(CNContactPhotoView *)self pendingEditContact];
    id v4 = [(CNContactPhotoView *)self newPendingContactPreservingChangesFrom:v3];
    [(CNContactPhotoView *)self setPendingEditContact:v4];
  }

  [(CNContactPhotoView *)self reloadData];
}

- (void)resetPhoto
{
  [(CNContactPhotoView *)self setPendingEditContact:0];
  [(CNContactPhotoView *)self setModified:0];
  [(CNContactPhotoView *)self setCurrentLikeness:0];
  [(CNContactPhotoView *)self setOriginalLikeness:0];

  [(CNContactPhotoView *)self reloadData];
}

- (void)paste:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
      id v11 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      double v12 = [v11 dataForPasteboardType:v10];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"CNContactPhotoView.m" lineNumber:515 description:@"We are supposed to have an image in the pasteboard when we get here."];
    double v12 = 0;
  }

  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v17 = [(CNContactPhotoView *)self pendingEditContact];
  objc_msgSend(v17, "setCropRect:", v13, v14, v15, v16);

  double v18 = [(CNContactPhotoView *)self pendingEditContact];
  [v18 setThumbnailImageData:0];

  id v19 = [(CNContactPhotoView *)self pendingEditContact];
  [v19 setFullscreenImageData:0];

  double v20 = [(CNContactPhotoView *)self pendingEditContact];
  [v20 setImageData:v12];

  [(CNContactPhotoView *)self setModified:1];
  [(CNContactPhotoView *)self reloadData];
}

- (void)copy:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactPhotoView *)self currentImageData];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    uint64_t v5 = getkUTTypeJPEG[0]();
    uint64_t v8 = v5;
    uint64_t v9 = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v4 setItems:v7];
  }
}

- (void)menuWillHide:(id)a3
{
  if ([(CNContactPhotoView *)self isFirstResponder])
  {
    [(CNContactPhotoView *)self setHighlightedFrame:0];
  }
}

- (BOOL)canBecomeFirstResponder
{
  if ([(CNContactPhotoView *)self hasPhoto])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(CNContactPhotoView *)self isEditing];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      uint64_t v5 = [(id)objc_opt_class() supportedPasteboardTypes];
      char v6 = [v4 containsPasteboardTypes:v5];

      LOBYTE(v3) = v6;
    }
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_copy_ == a3)
  {
    char v9 = [(CNContactPhotoView *)self hasPhoto];
  }
  else if (sel_paste_ == a3 && [(CNContactPhotoView *)self isEditing])
  {
    uint64_t v7 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    uint64_t v8 = [(id)objc_opt_class() supportedPasteboardTypes];
    char v9 = [v7 containsPasteboardTypes:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)longPressGesture:(id)a3
{
  if ([a3 state] == 1
    && [(CNContactPhotoView *)self becomeFirstResponder])
  {
    id v4 = [MEMORY[0x1E4FB1978] sharedMenuController];
    [(CNContactPhotoView *)self bounds];
    objc_msgSend(v4, "showMenuFromView:rect:", self);
    [(CNContactPhotoView *)self setHighlightedFrame:1];
  }
}

- (void)avatarTapped:(id)a3
{
  id v4 = [(CNContactPhotoView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactPhotoView *)self delegate];
    objc_msgSend(v6, "didTapPhotoViewWhileEditing:", -[CNContactPhotoView isEditing](self, "isEditing"));
LABEL_8:

    return;
  }
  if (![(CNContactPhotoView *)self isEditing])
  {
    id v6 = [MEMORY[0x1E4FB1978] sharedMenuController];
    [v6 hideMenu];
    goto LABEL_8;
  }

  [(CNContactPhotoView *)self _presentPhotoPicker];
}

- (void)disablePhotoTapGesture
{
  id v2 = [(CNContactPhotoView *)self tapGestureRecognizer];
  [v2 setEnabled:0];
}

- (void)setHighlightedFrame:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CNContactPhotoView *)self tintColor];
    uint64_t v5 = [v4 CGColor];
    id v6 = [(CNContactPhotoView *)self avatarView];
    uint64_t v7 = [v6 layer];
    [v7 setBorderColor:v5];

    uint64_t v8 = [(CNContactPhotoView *)self avatarView];
    char v9 = [v8 layer];
    [v9 setBorderWidth:1.0];

    id v13 = [(CNContactPhotoView *)self avatarView];
    [v13 frame];
    CGFloat v10 = CGRectGetWidth(v15) * 0.5;
    id v11 = [(CNContactPhotoView *)self avatarView];
    double v12 = [v11 layer];
    [v12 setCornerRadius:v10];
  }
  else
  {
    id v13 = [(CNContactPhotoView *)self avatarView];
    id v11 = [v13 layer];
    [v11 setBorderWidth:0.0];
  }
}

- (void)setEditing:(BOOL)a3 preservingChanges:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a4) {
      [(CNContactPhotoView *)self reloadData];
    }
    else {
      [(CNContactPhotoView *)self resetPhoto];
    }
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (BOOL)hasPhoto
{
  pendingEditContact = self->_pendingEditContact;
  if (!pendingEditContact)
  {
    uint64_t v5 = [(CNContactPhotoView *)self contact];
    uint64_t v7 = [v5 thumbnailImageData];
    if (v7)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v8 = [(CNContactPhotoView *)self contact];
      if ([v8 isKeyAvailable:*MEMORY[0x1E4F1AE28]])
      {
        char v9 = [(CNContactPhotoView *)self contact];
        CGFloat v10 = [v9 imageData];
        BOOL v6 = v10 != 0;
      }
      else
      {
        BOOL v6 = 0;
      }

      uint64_t v7 = 0;
    }
    goto LABEL_13;
  }
  uint64_t v4 = [(CNMutableContact *)pendingEditContact thumbnailImageData];
  if (!v4)
  {
    if (![(CNMutableContact *)self->_pendingEditContact isKeyAvailable:*MEMORY[0x1E4F1AE28]])
    {
      uint64_t v5 = 0;
      BOOL v6 = 0;
      goto LABEL_14;
    }
    uint64_t v7 = [(CNMutableContact *)self->_pendingEditContact imageData];
    uint64_t v5 = 0;
    BOOL v6 = v7 != 0;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v5 = (void *)v4;
  BOOL v6 = 1;
LABEL_14:

  return v6;
}

- (void)saveEdits
{
  id v4 = [(CNContactPhotoView *)self pendingEditContact];
  BOOL v3 = [(CNContactPhotoView *)self mutableContact];
  [(CNContactPhotoView *)self saveChangesFromPendingContact:v4 toContact:v3];
}

- (void)saveChangesFromPendingContact:(id)a3 toContact:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNContactPhotoView *)self mutableContact];
  if (v8)
  {
    char v9 = (void *)v8;
    CGFloat v10 = [(CNContactPhotoView *)self mutableContact];
    if (([v10 isKeyAvailable:*MEMORY[0x1E4F1AE28]] & 1) == 0)
    {

LABEL_9:
      goto LABEL_10;
    }
    id v11 = [(CNContactPhotoView *)self mutableContact];
    int v12 = [v11 isKeyAvailable:*MEMORY[0x1E4F1ADA8]];

    if (v6 && v12)
    {
      id v13 = [v6 imageData];
      [v7 setImageData:v13];

      double v14 = [v6 imageType];
      [v7 setImageType:v14];

      CGRect v15 = [v6 imageHash];
      [v7 setImageHash:v15];

      double v16 = [v6 fullscreenImageData];
      [v7 setFullscreenImageData:v16];

      uint64_t v17 = [v6 thumbnailImageData];
      [v7 setThumbnailImageData:v17];

      [v6 cropRect];
      objc_msgSend(v7, "setCropRect:");
      double v18 = [v6 preferredLikenessSource];
      [v7 setPreferredLikenessSource:v18];

      id v19 = CNUILogContactCard();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v7 imageData];
        uint64_t v35 = [v36 length];
        double v20 = [v7 fullscreenImageData];
        uint64_t v21 = [v20 length];
        long long v22 = [v7 thumbnailImageData];
        uint64_t v23 = [v22 length];
        [v7 cropRect];
        uint64_t v25 = v24;
        [v7 cropRect];
        uint64_t v27 = v26;
        [v7 cropRect];
        uint64_t v29 = v28;
        [v7 cropRect];
        uint64_t v31 = v30;
        v32 = [v7 imageType];
        v33 = [v7 imageHash];
        v34 = objc_msgSend(v33, "_cn_hexString");
        *(_DWORD *)buf = 134220034;
        uint64_t v38 = v35;
        __int16 v39 = 2048;
        uint64_t v40 = v21;
        __int16 v41 = 2048;
        uint64_t v42 = v23;
        __int16 v43 = 2048;
        uint64_t v44 = v25;
        __int16 v45 = 2048;
        uint64_t v46 = v27;
        __int16 v47 = 2048;
        uint64_t v48 = v29;
        __int16 v49 = 2048;
        uint64_t v50 = v31;
        __int16 v51 = 2114;
        v52 = v32;
        __int16 v53 = 2114;
        v54 = v34;
        _os_log_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Saving contact image - bytes: imageData %ld, fullscreen %ld, thumbnail %ld, cropRect {%.2f, %.2f, %.2f, %.2f}, imageType %{public}@ imageHash %{public}@", buf, 0x5Cu);
      }
      char v9 = [v6 memojiMetadata];
      [v7 setMemojiMetadata:v9];
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (id)currentImageData
{
  pendingEditContact = self->_pendingEditContact;
  if (pendingEditContact)
  {
    BOOL v3 = pendingEditContact;
  }
  else
  {
    BOOL v3 = [(CNContactPhotoView *)self contact];
  }
  id v4 = v3;
  uint64_t v5 = [(CNMutableContact *)v3 imageData];

  return v5;
}

- (void)updateFontSizes
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB28F0]);
  id v4 = [(UIButton *)self->_editPhotoButton titleLabel];
  [v4 setFont:v3];

  [(UIButton *)self->_editPhotoButton sizeToFit];

  [(CNContactPhotoView *)self setNeedsLayout];
}

- (id)newPendingContactPreservingChangesFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactPhotoView *)self mutableContact];
  id v6 = (void *)[v5 mutableCopy];

  if (v4) {
    [(CNContactPhotoView *)self saveChangesFromPendingContact:v4 toContact:v6];
  }

  return v6;
}

- (CNMutableContact)pendingEditContact
{
  if ([(CNContactPhotoView *)self isEditing] && !self->_pendingEditContact)
  {
    BOOL v3 = [(CNContactPhotoView *)self newPendingContactPreservingChangesFrom:0];
    pendingEditContact = self->_pendingEditContact;
    self->_pendingEditContact = v3;
  }
  uint64_t v5 = self->_pendingEditContact;

  return v5;
}

- (CNMutableContact)mutableContact
{
  BOOL v3 = [(CNContactPhotoView *)self contact];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(CNContactPhotoView *)self contact];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (CNMutableContact *)v5;
}

- (id)contact
{
  BOOL v3 = [(CNContactPhotoView *)self contacts];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [(CNContactPhotoView *)self contacts];
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isMeContact
{
  return 0;
}

- (void)setLabelAlpha:(double)a3
{
  if (self->_labelAlpha != a3)
  {
    self->_labelAlpha = a3;
    uint64_t v5 = [(CNContactPhotoView *)self editPhotoButton];
    char v6 = [v5 isHidden];

    if ((v6 & 1) == 0)
    {
      id v7 = [(CNContactPhotoView *)self editPhotoButton];
      [v7 setAlpha:a3];
    }
  }
}

- (void)setContacts:(id)a3
{
  id v10 = a3;
  if ((-[NSArray count](self->_contacts, "count") || [v10 count])
    && (objc_msgSend(v10, "_cn_isIdenticalToArray:", self->_contacts) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contacts, a3);
    uint64_t v5 = [(CNContactPhotoView *)self dropInteraction];

    if (v5)
    {
      if ([v10 count] == 1)
      {
        char v6 = [(CNContactPhotoView *)self delegate];
        id v7 = [v6 contactViewCache];

        uint64_t v8 = [(CNContactPhotoView *)self contact];
        char v9 = [v7 policyForContact:v8];

        -[CNContactPhotoView setAcceptsImageDrop:](self, "setAcceptsImageDrop:", [v9 isReadonly] ^ 1);
      }
      else
      {
        [(CNContactPhotoView *)self setAcceptsImageDrop:0];
      }
    }
    [(CNContactPhotoView *)self resetPhoto];
  }
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_presenterDelegate, 0);
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactPhotoView;
  [(CNContactPhotoView *)&v4 dealloc];
}

- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8 allowStaleRendering:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  BOOL v12 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v66[2] = *MEMORY[0x1E4F143B8];
  id v19 = a6;
  id v20 = a8;
  v64.receiver = self;
  v64.super_class = (Class)CNContactPhotoView;
  uint64_t v21 = -[CNContactPhotoView initWithFrame:](&v64, sel_initWithFrame_, x, y, width, height);
  if (v21)
  {
    v67.origin.double x = x;
    v67.origin.double y = y;
    v67.size.double width = width;
    v67.size.double height = height;
    BOOL v62 = v11;
    BOOL v63 = a4;
    if (CGRectIsEmpty(v67))
    {
      [(id)objc_opt_class() defaultSize];
      double width = v22;
      double height = v23;
      double x = 0.0;
      double y = 0.0;
    }
    uint64_t v24 = [[CNAvatarView alloc] initWithImageRenderer:v20 threeDTouchEnabled:v12 contactStore:v19];
    avatarView = v21->_avatarView;
    v21->_avatarView = v24;

    -[CNAvatarView setFrame:](v21->_avatarView, "setFrame:", x, y, width, height);
    [(CNAvatarView *)v21->_avatarView setAutoUpdateContact:0];
    [(CNAvatarView *)v21->_avatarView setAllowStaleRendering:v9];
    [(CNAvatarView *)v21->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNAvatarView *)v21->_avatarView setDelegate:v21];
    [(CNContactPhotoView *)v21 addSubview:v21->_avatarView];
    uint64_t v26 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    editPhotoButton = v21->_editPhotoButton;
    v21->_editPhotoButton = (UIButton *)v26;

    uint64_t v28 = +[CNUIColorRepository contactCardPhotoEditButtonColor];
    [(UIButton *)v21->_editPhotoButton setTintColor:v28];

    [(UIButton *)v21->_editPhotoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v21->_editPhotoButton addTarget:v21 action:sel__presentPhotoPicker forControlEvents:64];
    uint64_t v29 = [(UIButton *)v21->_editPhotoButton titleLabel];
    [v29 setTextAlignment:1];

    [(UIButton *)v21->_editPhotoButton setContentVerticalAlignment:0];
    uint64_t v30 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    uint64_t v31 = [v30 fontWithSize:12.0];
    v32 = [(UIButton *)v21->_editPhotoButton titleLabel];
    [v32 setFont:v31];

    v33 = [(UIButton *)v21->_editPhotoButton titleLabel];
    [v33 setNumberOfLines:3];

    v34 = v21->_editPhotoButton;
    uint64_t v35 = CNContactsUIBundle();
    v36 = [v35 localizedStringForKey:@"PHOTO_EDIT_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
    [(UIButton *)v34 setTitle:v36 forState:0];

    [(UIButton *)v21->_editPhotoButton setHidden:1];
    [(CNContactPhotoView *)v21 addSubview:v21->_editPhotoButton];
    v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v21 action:sel_avatarTapped_];
    [(CNContactPhotoView *)v21 setTapGestureRecognizer:v37];

    uint64_t v38 = v21->_avatarView;
    __int16 v39 = [(CNContactPhotoView *)v21 tapGestureRecognizer];
    [(CNAvatarView *)v38 addGestureRecognizer:v39];

    uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v21 action:sel_longPressGesture_];
    [(CNContactPhotoView *)v21 addGestureRecognizer:v40];
    [(CNContactPhotoView *)v21 setLongPressGestureRecognizer:v40];
    __int16 v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v21 selector:sel_menuWillHide_ name:*MEMORY[0x1E4FB2CB8] object:0];

    uint64_t v42 = [MEMORY[0x1E4F1CA48] array];
    v65[0] = @"avatar";
    __int16 v43 = v21->_avatarView;
    v65[1] = @"editButton";
    v66[0] = v43;
    v66[1] = v21->_editPhotoButton;
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    __int16 v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:v21->_avatarView attribute:9 relatedBy:0 toItem:v21 attribute:9 multiplier:1.0 constant:0.0];
    [v42 addObject:v45];

    uint64_t v46 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[avatar]|" options:0 metrics:0 views:v44];
    [v42 addObjectsFromArray:v46];

    __int16 v47 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[avatar]|" options:0 metrics:0 views:v44];
    [v42 addObjectsFromArray:v47];

    uint64_t v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[avatar]" options:0 metrics:0 views:v44];
    [v42 addObjectsFromArray:v48];

    __int16 v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:v21->_avatarView attribute:8 relatedBy:0 toItem:v21->_avatarView attribute:7 multiplier:1.0 constant:0.0];
    [v42 addObject:v49];

    uint64_t v50 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[editButton]|" options:0 metrics:0 views:v44];
    [v42 addObjectsFromArray:v50];

    __int16 v51 = [(CNContactPhotoView *)v21 editPhotoButton];
    v52 = [v51 bottomAnchor];
    __int16 v53 = [(CNContactPhotoView *)v21 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v42 addObject:v54];

    uint64_t v55 = [(CNContactPhotoView *)v21 editPhotoButton];
    v56 = [v55 heightAnchor];
    v57 = [(CNContactPhotoView *)v21 heightAnchor];
    v58 = [v56 constraintGreaterThanOrEqualToAnchor:v57 multiplier:0.35];
    [v42 addObject:v58];

    [MEMORY[0x1E4F28DC8] activateConstraints:v42];
    [(CNContactPhotoView *)v21 resetPhoto];
    [(CNContactPhotoView *)v21 updateFontSizes];
    if (v62)
    {
      uint64_t v59 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v21];
      dropInteraction = v21->_dropInteraction;
      v21->_dropInteraction = (UIDropInteraction *)v59;

      [(CNContactPhotoView *)v21 addInteraction:v21->_dropInteraction];
    }
    v21->_shouldAllowTakePhotoAction = v63;
  }
  return v21;
}

- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8
{
  return -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:](self, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:", a4, a5, a6, a7, a8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_5[0] != -1) {
    dispatch_once(supportedPasteboardTypes_cn_once_token_5, &__block_literal_global_12278);
  }
  id v2 = (void *)supportedPasteboardTypes_cn_once_object_5;

  return v2;
}

void __46__CNContactPhotoView_supportedPasteboardTypes__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = getkUTTypePNG[0]();
  v4[0] = v0;
  double v1 = getkUTTypeJPEG[0]();
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  BOOL v3 = (void *)supportedPasteboardTypes_cn_once_object_5;
  supportedPasteboardTypes_cn_once_object_5 = v2;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  return (id)[a1 descriptorForRequiredKeysWithThreeDTouchEnabled:1];
}

+ (CGSize)defaultSize
{
  double v2 = 60.0;
  double v3 = 60.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end