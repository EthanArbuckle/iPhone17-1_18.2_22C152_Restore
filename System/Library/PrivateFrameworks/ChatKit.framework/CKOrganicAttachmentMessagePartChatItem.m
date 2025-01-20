@interface CKOrganicAttachmentMessagePartChatItem
- (BOOL)supportsInlineReplyTransition;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKOrganicAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKOrganicImageLayoutRecipe)layoutRecipe;
- (Class)balloonViewClass;
- (Class)cellClass;
- (Class)customLayoutGroupProviderClass;
- (unint64_t)balloonCorners;
- (unint64_t)layoutType;
- (void)setLayoutRecipe:(id)a3;
@end

@implementation CKOrganicAttachmentMessagePartChatItem

- (unint64_t)layoutType
{
  if ([(CKChatItem *)self itemIsReply]) {
    return 12;
  }
  else {
    return 18;
  }
}

- (CKOrganicAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CKOrganicAttachmentMessagePartChatItem;
  v4 = [(CKAttachmentMessagePartChatItem *)&v18 initWithIMChatItem:a3 maxWidth:a4];
  v5 = [(CKMessagePartChatItem *)v4 visibleAssociatedMessageChatItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = [(CKMessagePartChatItem *)v4 visibleAssociatedMessageChatItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 setParentIsOrganicLayout:1];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

- (Class)customLayoutGroupProviderClass
{
  return (Class)objc_opt_class();
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsInlineReplyTransition
{
  return 0;
}

- (Class)balloonViewClass
{
  v3 = objc_opt_class();
  v4 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (unint64_t)balloonCorners
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CKOrganicAttachmentMessagePartChatItem;
  -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v14, sel_loadSizeThatFits_textAlignmentInsets_, a4);
  double v8 = width * dbl_18F81D190[v6 < v7];
  if (height < v8)
  {
    double v9 = width / width;
    double v10 = 0.0;
    if (width == 0.0) {
      double v9 = 0.0;
    }
    if (v8 != 0.0) {
      double v10 = height / v8;
    }
    double v11 = fmin(v9, v10);
    double width = width * v11;
    double v8 = v8 * v11;
  }
  double v12 = ceil(width);
  double v13 = ceil(v8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
}

- (void).cxx_destruct
{
}

@end