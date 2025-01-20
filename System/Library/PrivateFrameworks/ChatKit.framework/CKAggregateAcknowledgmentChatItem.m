@interface CKAggregateAcknowledgmentChatItem
- (BOOL)containsTransferGUID:(id)a3;
- (BOOL)includesFromMe;
- (BOOL)includesMultiple;
- (BOOL)isCommSafetySensitiveNotViewable;
- (BOOL)isEqual:(id)a3;
- (BOOL)latestIsFromMe;
- (BOOL)overrideBalloonOrientationForPhotoGrid;
- (BOOL)parentIsOrganicLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAggregateAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
- (Class)cellClass;
- (IMMessageAcknowledgmentChatItem)sentTapbackChatItem;
- (IMTapback)latestTapback;
- (NSArray)acknowledgments;
- (NSArray)mediaObjects;
- (NSString)acknowledgmentImageName;
- (NSString)serviceName;
- (UIColor)acknowledgmentImageColor;
- (UIEdgeInsets)contentInsets;
- (char)balloonOrientation;
- (char)transcriptOrientation;
- (id)associatedChatItemGUID;
- (int64_t)fromMeAcknowledgmentType;
- (int64_t)latestAcknowledgmentType;
- (void)setMediaObjects:(id)a3;
- (void)setOverrideBalloonOrientationForPhotoGrid:(BOOL)a3;
- (void)setParentIsOrganicLayout:(BOOL)a3;
@end

@implementation CKAggregateAcknowledgmentChatItem

- (CKAggregateAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKAggregateAcknowledgmentChatItem;
  v7 = [(CKChatItem *)&v34 initWithIMChatItem:v6 maxWidth:a4];
  if (v7)
  {
    v8 = [v6 latestTapback];
    v7->_latestAcknowledgmentType = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType([v8 associatedMessageType]);

    id v28 = v6;
    uint64_t v9 = [v6 latestTapback];
    latestTapback = v7->_latestTapback;
    v7->_latestTapback = (IMTapback *)v9;

    v29 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = [(CKAggregateAcknowledgmentChatItem *)v7 acknowledgments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v17 = [v16 tapback];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v19 = [v16 tapback];
            v20 = [v19 transferGUID];

            if (v20)
            {
              v21 = [v16 chatContext];
              v22 = [v16 message];
              v23 = +[CKMediaObjectManager sharedInstance];
              v24 = [v23 mediaObjectWithTransferGUID:v20 imMessage:v22 chatContext:v21];

              if (v24) {
                [v29 addObject:v24];
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    uint64_t v25 = [v29 copy];
    mediaObjects = v7->_mediaObjects;
    v7->_mediaObjects = (NSArray *)v25;

    id v6 = v28;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKChatItem *)self IMChatItem];
    v7 = [v5 IMChatItem];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)balloonViewClass
{
  [(CKChatItem *)self isFromMe];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (id)associatedChatItemGUID
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  v3 = [v2 associatedMessageGUID];
  id v4 = IMAssociatedMessageDecodeGUID();

  return v4;
}

- (NSString)serviceName
{
  id v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 serviceName];

  return (NSString *)v3;
}

- (BOOL)includesFromMe
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  char v3 = [v2 includesFromMe];

  return v3;
}

- (BOOL)latestIsFromMe
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  char v3 = [v2 latestIsFromMe];

  return v3;
}

- (BOOL)includesMultiple
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  char v3 = [v2 includesMultiple];

  return v3;
}

- (IMMessageAcknowledgmentChatItem)sentTapbackChatItem
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  char v3 = [v2 fromMeAcknowledgement];

  return (IMMessageAcknowledgmentChatItem *)v3;
}

- (int64_t)fromMeAcknowledgmentType
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self sentTapbackChatItem];
  int64_t v3 = [v2 associatedMessageType];

  return v3;
}

- (NSArray)acknowledgments
{
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self _imAggregateAcknowledgmentChatItem];
  int64_t v3 = [v2 acknowledgments];

  return (NSArray *)v3;
}

- (NSString)acknowledgmentImageName
{
  int64_t v3 = +[CKUIBehavior sharedBehaviors];
  id v4 = [v3 messageAcknowledgmentImageNameForType:self->_latestAcknowledgmentType];

  return (NSString *)v4;
}

- (UIColor)acknowledgmentImageColor
{
  BOOL v3 = [(CKAggregateAcknowledgmentChatItem *)self latestIsFromMe];
  if (self->_latestAcknowledgmentType == 2000)
  {
    if ([(CKAggregateAcknowledgmentChatItem *)self latestIsFromMe])
    {
      id v4 = [(CKAggregateAcknowledgmentChatItem *)self serviceName];
      uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F6E1B0]];
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 theme];
  char v8 = [v7 messageAcknowledgment:v3 acknowledgmentImageColor:v5];

  return (UIColor *)v8;
}

- (char)balloonOrientation
{
  return ![(CKAggregateAcknowledgmentChatItem *)self overrideBalloonOrientationForPhotoGrid]&& [(CKAssociatedMessageChatItem *)self parentMessageIsFromMe];
}

- (char)transcriptOrientation
{
  if ([(CKAssociatedMessageChatItem *)self parentMessageIsFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a4, a3.width, a3.height);
  int v6 = [v5 isEmojiTapbacksEnabled];

  v7 = +[CKUIBehavior sharedBehaviors];
  char v8 = v7;
  if (!v6) {
    goto LABEL_5;
  }
  int v9 = [(CKTapbackPileViewModel *)v7 usesFannedBubbleStyle];

  if (!v9)
  {
    v7 = +[CKUIBehavior sharedBehaviors];
    char v8 = v7;
LABEL_5:
    [(CKTapbackPileViewModel *)v7 aggregateAcknowledgmentTranscriptBalloonSize];
    double v13 = v16;
    double v15 = v17;
    goto LABEL_6;
  }
  char v8 = [[CKTapbackPileViewModel alloc] initWithAggregateAcknowledgmentChatItem:self];
  v10 = [CKTapbackPileLayout alloc];
  v11 = -[CKTapbackPileLayout initWithSourcePoint:viewModel:](v10, "initWithSourcePoint:viewModel:", v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(CKTapbackPileLayout *)v11 pilePositioningSize];
  double v13 = v12;
  double v15 = v14;

LABEL_6:
  double v18 = v13;
  double v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonTranscriptInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isCommSafetySensitiveNotViewable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CKAggregateAcknowledgmentChatItem *)self acknowledgments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = [*(id *)(*((void *)&v11 + 1) + 8 * i) commSafetyTransferGUID];
        if (v6)
        {
          double v7 = [MEMORY[0x1E4F6BCC8] sharedInstance];
          double v8 = [v7 transferForGUID:v6];

          uint64_t v9 = [v8 commSafetySensitive];
          if (v9 == 1)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)containsTransferGUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(CKAggregateAcknowledgmentChatItem *)self acknowledgments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsTransferGUID:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)latestAcknowledgmentType
{
  return self->_latestAcknowledgmentType;
}

- (IMTapback)latestTapback
{
  return self->_latestTapback;
}

- (BOOL)overrideBalloonOrientationForPhotoGrid
{
  return self->_overrideBalloonOrientationForPhotoGrid;
}

- (void)setOverrideBalloonOrientationForPhotoGrid:(BOOL)a3
{
  self->_overrideBalloonOrientationForPhotoGrid = a3;
}

- (BOOL)parentIsOrganicLayout
{
  return self->_parentIsOrganicLayout;
}

- (void)setParentIsOrganicLayout:(BOOL)a3
{
  self->_parentIsOrganicLayout = a3;
}

- (NSArray)mediaObjects
{
  return self->_mediaObjects;
}

- (void)setMediaObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObjects, 0);

  objc_storeStrong((id *)&self->_latestTapback, 0);
}

@end