@interface CKTypingPluginChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKTypingPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (Class)cellClass;
- (NSData)typingIndicatorData;
- (NSString)plugInBundleID;
- (id)indicatorLayer;
- (void)setPlugInBundleID:(id)a3;
@end

@implementation CKTypingPluginChatItem

- (CKTypingPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKTypingPluginChatItem;
  v7 = [(CKChatItem *)&v14 initWithIMChatItem:v6 maxWidth:a4];
  if (v7)
  {
    v8 = [v6 type];
    uint64_t v9 = [v8 copy];
    plugInBundleID = v7->_plugInBundleID;
    v7->_plugInBundleID = (NSString *)v9;

    uint64_t v11 = [v6 typingIndicatorIcon];
    typingIndicatorData = v7->_typingIndicatorData;
    v7->_typingIndicatorData = (NSData *)v11;
  }
  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E4F437F8];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  +[CKTypingIndicatorLayer largeBubbleFrame];
  double v5 = v4;
  double v7 = v6;
  double v8 = fmax(*MEMORY[0x1E4F1DB30], v4);
  double v9 = fmax(*(double *)(MEMORY[0x1E4F1DB30] + 8), v6);
  +[CKTypingIndicatorLayer defaultSize];
  double v12 = v8 + v10 - v5;
  double v13 = v9 + v11 - v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)indicatorLayer
{
  v3 = [MEMORY[0x1E4F6BC18] sharedInstance];
  double v4 = [(CKTypingPluginChatItem *)self plugInBundleID];
  double v5 = [v3 balloonPluginForBundleID:v4];

  double v6 = (objc_class *)[v5 customTypingIndicatorLayerClass];
  if (v6)
  {
    double v7 = (CKTypingIndicatorLayer *)objc_alloc_init(v6);
  }
  else
  {
    double v7 = objc_alloc_init(CKTypingIndicatorLayer);
    double v8 = [(CKChatItem *)self IMChatItem];
    double v9 = [v8 type];

    double v10 = [MEMORY[0x1E4F6BC18] sharedInstance];
    double v11 = [v10 balloonPluginForBundleID:v9];

    double v12 = [v11 identifier];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F6CBA0]];

    if (v13)
    {
      objc_super v14 = (void *)MEMORY[0x1E4F42A80];
      v15 = [(CKTypingPluginChatItem *)self typingIndicatorData];
      v16 = [v14 imageWithData:v15];

      id v17 = v16;
      -[CKTypingIndicatorLayer setIconImage:](v7, "setIconImage:", [v17 CGImage]);
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __40__CKTypingPluginChatItem_indicatorLayer__block_invoke;
      v19[3] = &unk_1E5621C18;
      objc_copyWeak(&v22, &location);
      id v20 = v9;
      v21 = v7;
      objc_msgSend(v11, "__ck_generateStatusImage:", v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

void __40__CKTypingPluginChatItem_indicatorLayer__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = [WeakRetained IMChatItem];
    double v6 = [v5 type];
    char v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "setIconImage:", objc_msgSend(v13, "CGImage"));
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F42A80];
      double v9 = [v4 typingIndicatorData];
      double v10 = [v8 imageWithData:v9];

      double v11 = *(void **)(a1 + 40);
      id v12 = v10;
      objc_msgSend(v11, "setIconImage:", objc_msgSend(v12, "CGImage"));
    }
  }
}

- (NSString)plugInBundleID
{
  return self->_plugInBundleID;
}

- (void)setPlugInBundleID:(id)a3
{
}

- (NSData)typingIndicatorData
{
  return self->_typingIndicatorData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingIndicatorData, 0);

  objc_storeStrong((id *)&self->_plugInBundleID, 0);
}

@end