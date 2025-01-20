@interface NPKRemotePassActionCompanionBubbleContentViewModel
- (BOOL)shouldDimPass;
- (BOOL)showsActionButton;
- (NPKRemotePassActionCompanionBubbleContentViewModel)initWithCardArtImage:(id)a3 shouldDimPass:(BOOL)a4 titleText:(id)a5 detailText:(id)a6 actionButtonText:(id)a7 showsActionButton:(BOOL)a8;
- (NSString)actionButtonText;
- (NSString)detailText;
- (NSString)titleText;
- (UIImage)cardArtImage;
@end

@implementation NPKRemotePassActionCompanionBubbleContentViewModel

- (NPKRemotePassActionCompanionBubbleContentViewModel)initWithCardArtImage:(id)a3 shouldDimPass:(BOOL)a4 titleText:(id)a5 detailText:(id)a6 actionButtonText:(id)a7 showsActionButton:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)NPKRemotePassActionCompanionBubbleContentViewModel;
  v18 = [(NPKRemotePassActionCompanionBubbleContentViewModel *)&v28 init];
  if (v18)
  {
    v19 = (UIImage *)[v14 copy];
    cardArtImage = v18->_cardArtImage;
    v18->_cardArtImage = v19;

    v18->_shouldDimPass = a4;
    v21 = (NSString *)[v15 copy];
    titleText = v18->_titleText;
    v18->_titleText = v21;

    v23 = (NSString *)[v16 copy];
    detailText = v18->_detailText;
    v18->_detailText = v23;

    v25 = (NSString *)[v17 copy];
    actionButtonText = v18->_actionButtonText;
    v18->_actionButtonText = v25;

    v18->_showsActionButton = a8;
  }

  return v18;
}

- (UIImage)cardArtImage
{
  return self->_cardArtImage;
}

- (BOOL)shouldDimPass
{
  return self->_shouldDimPass;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_cardArtImage, 0);
}

@end