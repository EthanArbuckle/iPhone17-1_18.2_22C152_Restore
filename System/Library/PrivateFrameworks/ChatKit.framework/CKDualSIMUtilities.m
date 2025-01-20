@interface CKDualSIMUtilities
+ (CKDualSIMUtilities)sharedUtilities;
+ (id)_imageForLastUsedSIMForConversation:(id)a3;
+ (id)_textAttachmentForLastUsedSIMForConversation:(id)a3;
+ (id)makeSummaryAttributedStringWithSIMImageUsingAttributedString:(id)a3 forConversation:(id)a4;
- (CKDualSIMUtilities)init;
- (NSDictionary)conversationListSIMLabelImagesDictionary;
- (id)_conversationListSIMLabelImageForSIMID:(id)a3;
- (id)_conversationListSIMLabels;
- (void)_createConversationListSIMLabelImagesDictionary;
- (void)_resizeSIMLabel:(id)a3;
- (void)setConversationListSIMLabelImagesDictionary:(id)a3;
- (void)updateConversationListSIMLabelImagesDictionary;
@end

@implementation CKDualSIMUtilities

void __37__CKDualSIMUtilities_sharedUtilities__block_invoke()
{
  v0 = objc_alloc_init(CKDualSIMUtilities);
  v1 = (void *)sharedUtilities_sharedUtilitiesInstance;
  sharedUtilities_sharedUtilitiesInstance = (uint64_t)v0;
}

- (CKDualSIMUtilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKDualSIMUtilities;
  v2 = [(CKDualSIMUtilities *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleSIMSubscriptionsUpdate_ name:*MEMORY[0x1E4F6DF70] object:0];
  }
  return v2;
}

- (void)_createConversationListSIMLabelImagesDictionary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(CKDualSIMUtilities *)self _conversationListSIMLabels];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v4 objectForKey:v10];
        [v11 bounds];
        v23.width = v12;
        v23.height = v13;
        UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
        v14 = [v11 layer];
        [v14 renderInContext:UIGraphicsGetCurrentContext()];

        v15 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [(NSDictionary *)v3 setObject:v15 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  conversationListSIMLabelImagesDictionary = self->_conversationListSIMLabelImagesDictionary;
  self->_conversationListSIMLabelImagesDictionary = v3;
}

- (id)_conversationListSIMLabels
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = [MEMORY[0x1E4F6E758] sharedManager];
  v3 = [v2 activeSIMIDs];

  v4 = [MEMORY[0x1E4F42A40] defaultMetrics];
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  [v5 conversationListSIMLabelBaseRadius];
  objc_msgSend(v4, "scaledValueForValue:");
  double v7 = v6;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v40 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        CGFloat v12 = [MEMORY[0x1E4F6E758] sharedManager];
        CGFloat v13 = [v12 shortNameForSIMLabel:v11];

        id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
        v15 = +[CKUIBehavior sharedBehaviors];
        v16 = [v15 conversationListSummaryFont];
        [v16 capHeight];
        double v18 = floor(v17 + 0.5);
        long long v19 = +[CKUIBehavior sharedBehaviors];
        long long v20 = [v19 conversationListSummaryFont];
        [v20 capHeight];
        uint64_t v22 = objc_msgSend(v14, "initWithFrame:", 0.0, 0.0, v18, floor(v21 + 0.5));

        CGSize v23 = (void *)MEMORY[0x1E4FB08E0];
        v24 = +[CKUIBehavior sharedBehaviors];
        v25 = [v24 conversationListSummaryFont];
        [v25 capHeight];
        double v27 = floor(v26);
        v28 = +[CKUIBehavior sharedBehaviors];
        [v28 conversationListSIMLabelHeightTextSizeRatio];
        v30 = [v23 boldSystemFontOfSize:v27 / v29];
        [v22 setFont:v30];

        [v22 setText:v13];
        v31 = +[CKUIBehavior sharedBehaviors];
        v32 = [v31 conversationListSIMLabelTextColor];
        [v22 setTextColor:v32];

        [v22 setTextAlignment:1];
        v33 = +[CKUIBehavior sharedBehaviors];
        v34 = [v33 conversationListSIMLabelBackgroundColor];
        [v22 setBackgroundColor:v34];

        v35 = [v22 layer];
        [v35 setMasksToBounds:1];

        v36 = [v22 layer];
        [v36 setCornerRadius:v7];

        [(CKDualSIMUtilities *)self _resizeSIMLabel:v22];
        [v42 setValue:v22 forKey:v11];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v9);
  }

  v37 = (void *)[v42 copy];

  return v37;
}

+ (CKDualSIMUtilities)sharedUtilities
{
  if (sharedUtilities_onceToken != -1) {
    dispatch_once(&sharedUtilities_onceToken, &__block_literal_global_139);
  }
  v2 = (void *)sharedUtilities_sharedUtilitiesInstance;

  return (CKDualSIMUtilities *)v2;
}

- (void)updateConversationListSIMLabelImagesDictionary
{
  [(CKDualSIMUtilities *)self _createConversationListSIMLabelImagesDictionary];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v2, "__mainThreadPostNotificationName:object:", @"__kCKSIMLabelImagesChanged", 0);
}

- (void)_resizeSIMLabel:(id)a3
{
  id v3 = a3;
  v4 = +[CKUIBehavior sharedBehaviors];
  objc_super v5 = [v4 conversationListSummaryFont];
  [v5 capHeight];
  double v7 = floor(v6 + 0.5);

  uint64_t v8 = [MEMORY[0x1E4F42A40] defaultMetrics];
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  [v9 conversationListSIMLabelBaseBuffer];
  objc_msgSend(v8, "scaledValueForValue:");
  double v11 = v10;

  [v3 intrinsicContentSize];
  double v13 = floor(v11 + v12 + 0.5);
  if (v13 >= v7) {
    double v14 = v13;
  }
  else {
    double v14 = v7;
  }
  id v17 = +[CKUIBehavior sharedBehaviors];
  v15 = [v17 conversationListSummaryFont];
  [v15 capHeight];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v14, floor(v16 + 0.5));
}

- (id)_conversationListSIMLabelImageForSIMID:(id)a3
{
  return [(NSDictionary *)self->_conversationListSIMLabelImagesDictionary objectForKey:a3];
}

+ (id)makeSummaryAttributedStringWithSIMImageUsingAttributedString:(id)a3 forConversation:(id)a4
{
  id v5 = a3;
  double v6 = +[CKDualSIMUtilities _textAttachmentForLastUsedSIMForConversation:a4];
  if (v6)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v5];
    uint64_t v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];
    [v7 insertAttributedString:v8 atIndex:0];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v7 insertAttributedString:v9 atIndex:1];

    id v10 = (id)[v7 copy];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (id)_textAttachmentForLastUsedSIMForConversation:(id)a3
{
  id v3 = [a1 _imageForLastUsedSIMForConversation:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    id v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 conversationListSummaryFont];
    [v6 capHeight];
    double v8 = v7;
    [v3 size];
    double v10 = (v8 - v9) * 0.5;
    [v3 size];
    double v12 = v11;
    [v3 size];
    objc_msgSend(v4, "setBounds:", 0.0, v10, v12, v13);

    [v4 setImage:v3];
    [v4 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_imageForLastUsedSIMForConversation:(id)a3
{
  id v3 = [a3 chat];
  id v4 = [v3 lastAddressedSIMID];

  if (v4)
  {
    id v5 = +[CKDualSIMUtilities sharedUtilities];
    double v6 = [v5 _conversationListSIMLabelImageForSIMID:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (NSDictionary)conversationListSIMLabelImagesDictionary
{
  return self->_conversationListSIMLabelImagesDictionary;
}

- (void)setConversationListSIMLabelImagesDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end