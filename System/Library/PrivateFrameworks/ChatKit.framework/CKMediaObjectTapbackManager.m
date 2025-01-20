@interface CKMediaObjectTapbackManager
- (BOOL)hasTapbacksForAsset:(id)a3;
- (BOOL)invertTapbackTailDirection;
- (BOOL)originatedFromGridView;
- (CKAggregateAttachmentMessagePartChatItem)chatItem;
- (CKGradientReferenceView)gradientReferenceView;
- (CKPhotoGridTapbackPileDelegate)photoGridTapbackPileDelegate;
- (Class)decorationViewClass;
- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4;
- (void)setChatItem:(id)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setInvertTapbackTailDirection:(BOOL)a3;
- (void)setOriginatedFromGridView:(BOOL)a3;
- (void)setPhotoGridTapbackPileDelegate:(id)a3;
@end

@implementation CKMediaObjectTapbackManager

- (Class)decorationViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTapbacksForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMediaObjectTapbackManager *)self chatItem];
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [(CKMediaObjectTapbackManager *)self chatItem];
      v9 = _MediaObjectBackedAssetForPhotoKitAsset(v4, v8);

      if (v9)
      {
        id v10 = v9;

        id v4 = v10;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v4 acknowledgmentChatItem];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  uint64_t v9 = [(CKMediaObjectTapbackManager *)self chatItem];
  if (v9)
  {
    id v10 = (void *)v9;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v12 = [(CKMediaObjectTapbackManager *)self chatItem];
      v13 = _MediaObjectBackedAssetForPhotoKitAsset(v6, v12);

      if (v13)
      {
        id v14 = v13;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [(CKMediaObjectTapbackManager *)self chatItem];
          uint64_t v16 = _MediaObjectBackedAssetForPhotoKitAsset(v7, v15);

          id v7 = (id)v16;
        }
      }
      else
      {
        id v14 = v6;
      }

      id v6 = v14;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v6;
    [v8 setAsset:v17];
    v18 = [v17 acknowledgmentChatItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [v7 acknowledgmentChatItem];
      if (!v18) {
        goto LABEL_15;
      }
    }
    else
    {
      v19 = 0;
      if (!v18) {
        goto LABEL_15;
      }
    }
    if (!v19)
    {
      BOOL v20 = 1;
      goto LABEL_17;
    }
LABEL_15:
    if (!v18)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v21 = [v18 latestAcknowledgmentType];
    BOOL v20 = v21 != [v19 latestAcknowledgmentType];
LABEL_17:
    [v8 setShouldAnimate:v20];
    goto LABEL_18;
  }
LABEL_19:
  v22 = [(CKMediaObjectTapbackManager *)self gradientReferenceView];
  [v8 setGradientReferenceView:v22];

  objc_msgSend(v8, "setInvertTailDirection:", -[CKMediaObjectTapbackManager invertTapbackTailDirection](self, "invertTapbackTailDirection"));
  objc_msgSend(v8, "setDisplayedInGridView:", -[CKMediaObjectTapbackManager originatedFromGridView](self, "originatedFromGridView"));
  v23 = [(CKMediaObjectTapbackManager *)self photoGridTapbackPileDelegate];
  [v8 setPhotoGridTapbackPileDelegate:v23];

  return v8;
}

- (CKGradientReferenceView)gradientReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gradientReferenceView);

  return (CKGradientReferenceView *)WeakRetained;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (BOOL)invertTapbackTailDirection
{
  return self->_invertTapbackTailDirection;
}

- (void)setInvertTapbackTailDirection:(BOOL)a3
{
  self->_invertTapbackTailDirection = a3;
}

- (BOOL)originatedFromGridView
{
  return self->_originatedFromGridView;
}

- (void)setOriginatedFromGridView:(BOOL)a3
{
  self->_originatedFromGridView = a3;
}

- (CKAggregateAttachmentMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
}

- (CKPhotoGridTapbackPileDelegate)photoGridTapbackPileDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoGridTapbackPileDelegate);

  return (CKPhotoGridTapbackPileDelegate *)WeakRetained;
}

- (void)setPhotoGridTapbackPileDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoGridTapbackPileDelegate);
  objc_storeStrong((id *)&self->_chatItem, 0);

  objc_destroyWeak((id *)&self->_gradientReferenceView);
}

@end