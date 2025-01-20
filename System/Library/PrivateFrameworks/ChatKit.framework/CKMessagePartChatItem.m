@interface CKMessagePartChatItem
- (BOOL)_isSURFRelatedMessage;
- (BOOL)canAttachStickers;
- (BOOL)canCopy;
- (BOOL)canForward;
- (BOOL)canInlineReply;
- (BOOL)canSendAsTextMessage;
- (BOOL)canSendAsTextMessageOverSatellite;
- (BOOL)canSendTapbacks;
- (BOOL)failed;
- (BOOL)hasMessageAcknowledgment;
- (BOOL)hasStickers;
- (BOOL)hasVisibleAssociatedMessageItems;
- (BOOL)isBlackholed;
- (BOOL)isCorrupt;
- (BOOL)isFromMe;
- (BOOL)isReply;
- (BOOL)isReplyContextPreview;
- (BOOL)stickersSnapToPoint;
- (CKAggregateAcknowledgmentChatItem)tapbacksChatItem;
- (CKColor_t)strokeColor;
- (CKMessagePartChatItem)init;
- (CKMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKMessagePartHighlightChatItem)messageHighlightChatItem;
- (IMMessage)message;
- (IMMessageItem)messageItem;
- (IMMessageItem)threadOriginator;
- (NSArray)messageAcknowledgments;
- (NSArray)pasteboardItemProviders;
- (NSArray)suggestedActionsList;
- (NSArray)visibleAssociatedMessageChatItems;
- (NSItemProvider)dragItemProvider;
- (NSString)serviceName;
- (NSString)threadIdentifier;
- (_NSRange)messagePartRange;
- (_NSRange)originalMessagePartRange;
- (char)balloonStyle;
- (char)cachedColor;
- (char)color;
- (double)timeIntervalSinceMessageSent;
- (id)aggregateAcknowledgmentChatItem;
- (id)compositionWithContext:(id)a3;
- (id)description;
- (id)fileURLForAttachment;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)sender;
- (id)tapbackActionButtonImageName;
- (id)time;
- (id)votingCounts;
- (int64_t)index;
- (int64_t)selectedType;
- (int64_t)stewieConversationID;
- (unint64_t)scheduleState;
- (unint64_t)scheduleType;
- (void)_setVisibleAssociatedMessageChatItems:(id)a3;
- (void)configureBalloonView:(id)a3;
- (void)setCachedColor:(char)a3;
@end

@implementation CKMessagePartChatItem

- (NSArray)messageAcknowledgments
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CKMessagePartChatItem *)self visibleAssociatedMessageChatItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v5)
          {
            v5 = [MEMORY[0x1E4F1CA48] array];
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (int64_t)selectedType
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [(CKMessagePartChatItem *)self messageAcknowledgments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v9 = objc_msgSend(v8, "acknowledgments", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              if (([v14 isFromMe] & 1) != 0 || v6 < 0)
              {
                uint64_t v15 = [v14 tapback];
                int64_t v6 = [v15 associatedMessageType];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v6 <= 2000) {
    return 2000;
  }
  else {
    return v6;
  }
}

- (id)votingCounts
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(CKMessagePartChatItem *)self messageAcknowledgments];
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  uint64_t v2 = 0;
  if (v25)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v6;
        v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v8 = [v7 acknowledgments];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) tapback];
              uint64_t v14 = [v13 associatedMessageType];

              switch(v14)
              {
                case 2000:
                  ++v5;
                  break;
                case 2001:
                  ++v3;
                  break;
                case 2002:
                  ++v2;
                  break;
                case 2003:
                  ++v4;
                  break;
                case 2004:
                  ++v27;
                  break;
                case 2005:
                  ++v28;
                  break;
                default:
                  continue;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v39 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v25);
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }

  v37[0] = &unk_1EDF16A48;
  uint64_t v15 = [NSNumber numberWithInteger:v5];
  v38[0] = v15;
  v37[1] = &unk_1EDF16A60;
  v16 = [NSNumber numberWithInteger:v4];
  v38[1] = v16;
  v37[2] = &unk_1EDF16A78;
  long long v17 = [NSNumber numberWithInteger:v3];
  v38[2] = v17;
  v37[3] = &unk_1EDF16A90;
  long long v18 = [NSNumber numberWithInteger:v2];
  v38[3] = v18;
  v37[4] = &unk_1EDF16AA8;
  long long v19 = [NSNumber numberWithInteger:v27];
  v38[4] = v19;
  v37[5] = &unk_1EDF16AC0;
  long long v20 = [NSNumber numberWithInteger:v28];
  v38[5] = v20;
  long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];

  return v21;
}

- (id)aggregateAcknowledgmentChatItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(CKMessagePartChatItem *)self visibleAssociatedMessageChatItems];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKMessagePartChatItem;
  uint64_t v4 = [(CKBalloonChatItem *)&v11 description];
  int v5 = [(CKMessagePartChatItem *)self color];
  uint64_t v6 = [(CKMessagePartChatItem *)self messageHighlightChatItem];
  v7 = [(CKMessagePartChatItem *)self visibleAssociatedMessageChatItems];
  long long v8 = [v7 componentsJoinedByString:@","];
  long long v9 = [v3 stringWithFormat:@"[%@ color:%d, messageHighlightChatItem: %@, visible associated message items: [%@]]", v4, v5, v6, v8];

  return v9;
}

- (CKMessagePartChatItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessagePartChatItem;
  uint64_t v2 = [(CKMessagePartChatItem *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(CKMessagePartChatItem *)v2 setCachedColor:4294967294];
  }
  return v3;
}

- (BOOL)canCopy
{
  return 1;
}

- (BOOL)canForward
{
  return 1;
}

- (BOOL)canSendAsTextMessage
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v3 isScheduledMessagesCoreEnabled])
  {
    unint64_t v4 = [(CKMessagePartChatItem *)self scheduleType];

    if (v4 == 2) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F6BDB8];
  v7 = [(CKMessagePartChatItem *)self serviceName];
  long long v8 = [v6 serviceWithName:v7];
  char v9 = [v8 supportsCapability:*MEMORY[0x1E4F6E0F0]];

  return v9;
}

- (BOOL)canSendAsTextMessageOverSatellite
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v3 isScheduledMessagesCoreEnabled]) {
    BOOL v4 = [(CKMessagePartChatItem *)self scheduleType] != 2;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)canInlineReply
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 canReply];

  return v3;
}

- (BOOL)canAttachStickers
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  BOOL v5 = [(CKChatItem *)self isEditedMessageHistory];
  if (v4)
  {
    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = [(CKMessagePartChatItem *)self messageItem];
      if ([v7 scheduleType] == 2)
      {
        unint64_t v8 = [v7 scheduleState];
        if (v8 <= 5) {
          unsigned int v6 = (9u >> v8) & 1;
        }
        else {
          LOBYTE(v6) = 1;
        }
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v6) = !v5;
  }
  return v6;
}

- (BOOL)stickersSnapToPoint
{
  return 1;
}

- (BOOL)isFromMe
{
  char v3 = [(CKChatItem *)self notification];

  if (v3) {
    return 0;
  }
  if (CKIsRunningForDevelopmentOnSimulator()
    || CKIsRunningUITests()
    || CKIsRunningForDevelopmentOnSimulator()
    || ([(CKMessagePartChatItem *)self message],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    BOOL v5 = [(CKChatItem *)self IMChatItem];
  }
  else
  {
    BOOL v5 = [(CKMessagePartChatItem *)self message];
  }
  unsigned int v6 = v5;
  char v7 = [v5 isFromMe];

  return v7;
}

- (BOOL)failed
{
  BOOL v3 = [(CKMessagePartChatItem *)self isFromMe];
  if (v3)
  {
    int v4 = [(CKMessagePartChatItem *)self message];
    BOOL v5 = [v4 error];

    if (v5) {
      goto LABEL_3;
    }
    unsigned int v6 = [(CKMessagePartChatItem *)self messageItem];
    uint64_t v7 = [v6 scheduleType];

    if (v7 != 2) {
      goto LABEL_6;
    }
    unint64_t v8 = [(CKMessagePartChatItem *)self messageItem];
    uint64_t v9 = [v8 scheduleState];

    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
LABEL_3:
    }
      LOBYTE(v3) = 1;
    else {
LABEL_6:
    }
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)time
{
  BOOL v3 = [(CKChatItem *)self notification];

  if (v3)
  {
    int v4 = [(CKChatItem *)self notification];
    uint64_t v5 = [v4 date];
  }
  else
  {
    if (CKIsRunningForDevelopmentOnSimulator()
      || CKIsRunningUITests()
      || CKIsRunningForDevelopmentOnSimulator())
    {
      unsigned int v6 = [(CKChatItem *)self IMChatItem];
    }
    else
    {
      unsigned int v6 = [(CKMessagePartChatItem *)self message];
    }
    int v4 = v6;
    uint64_t v5 = [v6 time];
  }
  uint64_t v7 = (void *)v5;

  return v7;
}

- (id)sender
{
  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    BOOL v3 = [(CKChatItem *)self IMChatItem];
  }
  else
  {
    BOOL v3 = [(CKMessagePartChatItem *)self message];
  }
  int v4 = v3;
  uint64_t v5 = [v3 sender];

  return v5;
}

- (NSString)serviceName
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  BOOL v3 = [v2 serviceName];

  return (NSString *)v3;
}

- (void)configureBalloonView:(id)a3
{
}

- (BOOL)_isSURFRelatedMessage
{
  BOOL v3 = [(CKMessagePartChatItem *)self message];
  int v4 = [v3 balloonBundleID];
  uint64_t v5 = *MEMORY[0x1E4F6CC30];
  if ([v4 containsString:*MEMORY[0x1E4F6CC30]])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(CKMessagePartChatItem *)self message];
    unint64_t v8 = [v7 balloonBundleID];
    uint64_t v9 = *MEMORY[0x1E4F6CC38];
    if ([v8 containsString:*MEMORY[0x1E4F6CC38]])
    {
      char v6 = 1;
    }
    else
    {
      long long v10 = [(CKMessagePartChatItem *)self message];
      objc_super v11 = [v10 associatedBalloonBundleID];
      if ([v11 containsString:v5])
      {
        char v6 = 1;
      }
      else
      {
        uint64_t v12 = [(CKMessagePartChatItem *)self message];
        uint64_t v13 = [v12 associatedBalloonBundleID];
        char v6 = [v13 containsString:v9];
      }
    }
  }
  return v6;
}

- (IMMessage)message
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  BOOL v3 = [v2 message];

  return (IMMessage *)v3;
}

- (IMMessageItem)messageItem
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  BOOL v3 = [v2 messageItem];

  return (IMMessageItem *)v3;
}

- (int64_t)index
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 index];

  return v3;
}

- (char)balloonStyle
{
  int64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isDashedBalloonsEnabled];

  if (v4)
  {
    uint64_t v5 = [(CKMessagePartChatItem *)self messageItem];
    char v6 = [v5 isPendingSatelliteSend];

    if (v6) {
      return 4;
    }
  }
  unint64_t v8 = [(CKMessagePartChatItem *)self messageItem];
  uint64_t v9 = [v8 scheduleType];

  if (v9 != 2) {
    return 0;
  }
  long long v10 = [(CKMessagePartChatItem *)self messageItem];
  unint64_t v11 = [v10 scheduleState];

  char result = 0;
  if (v11 <= 5 && ((1 << v11) & 0x36) != 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v13 = [v12 isDashedBalloonsEnabled];

    if (v13) {
      return 4;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (CKColor_t)strokeColor
{
  uint64_t v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isDashedBalloonsEnabled];

  if (v8)
  {
    uint64_t v9 = [(CKMessagePartChatItem *)self messageItem];
    int v10 = [v9 isPendingSatelliteSend];

    if (v10) {
      goto LABEL_8;
    }
  }
  unint64_t v11 = [(CKMessagePartChatItem *)self messageItem];
  unint64_t v12 = [v11 scheduleType];

  if (v12 < 2)
  {
LABEL_4:
    double v2 = 0.0;
    double v3 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
    goto LABEL_9;
  }
  if (v12 == 2)
  {
    int v13 = [(CKMessagePartChatItem *)self messageItem];
    unint64_t v14 = [v13 scheduleState];

    if (v14 <= 5)
    {
      if (((1 << v14) & 0x36) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v15 = +[CKUIBehavior sharedBehaviors];
      v16 = [v15 theme];
      long long v17 = [v16 unfilledBalloonColorForColorType:15];
      [v17 ckColor];
      double v2 = v18;
      double v3 = v19;
      double v4 = v20;
      double v5 = v21;
    }
  }
LABEL_9:
  double v22 = v2;
  double v23 = v3;
  double v24 = v4;
  double v25 = v5;
  result.alpha = v25;
  result.blue = v24;
  result.green = v23;
  result.red = v22;
  return result;
}

- (char)color
{
  if (+[CKApplicationState isResizing]
    && [(CKMessagePartChatItem *)self cachedColor] != -2)
  {
    return [(CKMessagePartChatItem *)self cachedColor];
  }
  else
  {
    if ([(CKMessagePartChatItem *)self _isSURFRelatedMessage])
    {
      LOBYTE(v3) = 5;
      [(CKMessagePartChatItem *)self setCachedColor:5];
    }
    else if ([(CKMessagePartChatItem *)self isFromMe])
    {
      double v4 = [(CKMessagePartChatItem *)self message];
      double v5 = [(CKChatItem *)self IMChatItem];
      char v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v7 = [v6 isScheduledMessagesCoreEnabled];

      if (v7
        && [v5 scheduleType] == 2
        && (unint64_t v8 = [v5 scheduleState] - 1, v8 < 5)
        && ((0x1Bu >> v8) & 1) != 0
        || ([MEMORY[0x1E4F6E778] sharedFeatureFlags],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 isDashedBalloonsEnabled],
            v9,
            v10)
        && ([v4 isPendingSatelliteSend] & 1) != 0)
      {
        uint64_t v3 = 15;
      }
      else
      {
        unint64_t v12 = +[CKUIBehavior sharedBehaviors];
        char v13 = [v12 isRunningInStoreDemoMode];

        if (v13)
        {
          uint64_t v3 = 1;
        }
        else if ([v5 isStewie])
        {
          uint64_t v3 = 12;
        }
        else if ([v5 isBusiness])
        {
          uint64_t v3 = 6;
        }
        else if ([v4 wasDowngraded])
        {
          uint64_t v3 = 0;
        }
        else
        {
          unint64_t v14 = (void *)MEMORY[0x1E4F6BDB8];
          uint64_t v15 = [(CKMessagePartChatItem *)self serviceName];
          v16 = [v14 serviceWithName:v15];
          uint64_t v3 = objc_msgSend(v16, "__ck_displayColor");
        }
      }
      [(CKMessagePartChatItem *)self setCachedColor:v3];
    }
    else
    {
      [(CKMessagePartChatItem *)self setCachedColor:0xFFFFFFFFLL];
      LOBYTE(v3) = -1;
    }
    return v3;
  }
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  return 0;
}

- (NSArray)pasteboardItemProviders
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CKMessagePartChatItem *)self dragItemProvider];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    double v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSItemProvider)dragItemProvider
{
  return 0;
}

- (id)fileURLForAttachment
{
  return 0;
}

- (CKMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)CKMessagePartChatItem;
  double v5 = -[CKChatItem initWithIMChatItem:maxWidth:](&v31, sel_initWithIMChatItem_maxWidth_, a3);
  char v6 = v5;
  if (v5)
  {
    int v7 = [(CKChatItem *)v5 IMChatItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [(CKChatItem *)v6 IMChatItem];
      int v10 = [v9 visibleAssociatedMessageChatItems];
      unint64_t v11 = v10;
      if (v10)
      {
        unint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              double v18 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "__ck_chatItemClass", (void)v27)), "initWithIMChatItem:maxWidth:", *(void *)(*((void *)&v27 + 1) + 8 * i), a4);
              if (v18) {
                [v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v15);
        }
      }
      else
      {
        unint64_t v12 = 0;
      }
      objc_storeStrong((id *)&v6->_visibleAssociatedMessageChatItems, v12);
      double v19 = [v9 messageHighlightChatItem];

      if (v19)
      {
        double v20 = [CKMessagePartHighlightChatItem alloc];
        double v21 = [v9 messageHighlightChatItem];
        uint64_t v22 = [(CKMessagePartHighlightChatItem *)v20 initWithIMChatItem:v21 maxWidth:a4];
        messageHighlightChatItem = v6->_messageHighlightChatItem;
        v6->_messageHighlightChatItem = (CKMessagePartHighlightChatItem *)v22;
      }
      uint64_t v24 = objc_msgSend(v9, "suggestedActionsList", (void)v27);
      suggestedActionsList = v6->_suggestedActionsList;
      v6->_suggestedActionsList = (NSArray *)v24;
    }
    [(CKMessagePartChatItem *)v6 setCachedColor:4294967294];
  }
  return v6;
}

- (id)tapbackActionButtonImageName
{
  if ([(CKMessagePartChatItem *)self hasMessageAcknowledgment])
  {
    uint64_t v3 = [(NSArray *)self->_visibleAssociatedMessageChatItems lastObject];
    objc_opt_class();
    double v4 = &stru_1EDE4CA38;
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      if ([v5 includesMultiple]) {
        char v6 = @".2";
      }
      else {
        char v6 = &stru_1EDE4CA38;
      }
      uint64_t v7 = [v5 latestAcknowledgmentType];
      if ([v5 fromMeAcknowledgmentType])
      {
        uint64_t v7 = [v5 fromMeAcknowledgmentType];
        double v4 = @".fill";
      }
      if ((unint64_t)(v7 - 2000) > 5) {
        unint64_t v8 = @"plus";
      }
      else {
        unint64_t v8 = off_1E562A678[v7 - 2000];
      }
    }
    else
    {
      unint64_t v8 = @"plus";
      char v6 = &stru_1EDE4CA38;
    }
  }
  else
  {
    char v6 = &stru_1EDE4CA38;
    unint64_t v8 = @"plus";
    double v4 = &stru_1EDE4CA38;
  }
  return (id)[NSString stringWithFormat:@"%@.%@%@%@", v8, @"bubble.tapback", v6, v4];
}

- (CKAggregateAcknowledgmentChatItem)tapbacksChatItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(CKMessagePartChatItem *)self visibleAssociatedMessageChatItems];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (CKAggregateAcknowledgmentChatItem *)v3;
}

- (BOOL)canSendTapbacks
{
  if ([(CKChatItem *)self isEditedMessageHistory]
    || [(CKChatItem *)self itemIsReplyContextPreview])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v6 = [v5 isScheduledMessagesCoreEnabled];

    if (v6)
    {
      uint64_t v7 = [(CKMessagePartChatItem *)self messageItem];
      if ([v7 scheduleType] == 2)
      {
        unint64_t v8 = [v7 scheduleState];
        if (v8 <= 5) {
          unsigned int v3 = (9u >> v8) & 1;
        }
        else {
          LOBYTE(v3) = 1;
        }
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (_NSRange)messagePartRange
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 messagePartRange];
    NSUInteger v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    NSUInteger v5 = 0;
  }

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)originalMessagePartRange
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  uint64_t v3 = [v2 originalMessagePartRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)hasMessageAcknowledgment
{
  uint64_t v2 = [(CKMessagePartChatItem *)self tapbacksChatItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasStickers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_visibleAssociatedMessageChatItems;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isCorrupt
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isCorrupt];

  return v3;
}

- (int64_t)stewieConversationID
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 stewieConversationID];

  return v3;
}

- (BOOL)isBlackholed
{
  int64_t v3 = [(CKMessagePartChatItem *)self message];
  uint64_t v4 = [v3 error];
  uint64_t v5 = [v4 code];

  BOOL result = [(CKMessagePartChatItem *)self isFromMe];
  if (v5 != 43) {
    return 0;
  }
  return result;
}

- (BOOL)isReply
{
  int64_t v3 = [(CKMessagePartChatItem *)self threadIdentifier];
  if ([v3 length]) {
    BOOL v4 = ![(CKChatItem *)self wantsOverlayLayout];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isReplyContextPreview
{
  return 0;
}

- (NSString)threadIdentifier
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 threadIdentifier];

  return (NSString *)v3;
}

- (IMMessageItem)threadOriginator
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 threadOriginator];

  return (IMMessageItem *)v3;
}

- (unint64_t)scheduleType
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 scheduleType];

  return v3;
}

- (unint64_t)scheduleState
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 scheduleState];

  return v3;
}

- (double)timeIntervalSinceMessageSent
{
  uint64_t v2 = [(CKMessagePartChatItem *)self time];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
  [v3 timeIntervalSinceDate:v2];
  double v5 = v4;

  return v5;
}

- (void)_setVisibleAssociatedMessageChatItems:(id)a3
{
  double v5 = (NSArray *)a3;
  p_visibleAssociatedMessageChatItems = &self->_visibleAssociatedMessageChatItems;
  if (*p_visibleAssociatedMessageChatItems != v5)
  {
    long long v8 = v5;
    BOOL v7 = [(NSArray *)*p_visibleAssociatedMessageChatItems isEqualToArray:v5];
    double v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)p_visibleAssociatedMessageChatItems, a3);
      double v5 = v8;
    }
  }
}

- (BOOL)hasVisibleAssociatedMessageItems
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(CKMessagePartChatItem *)self visibleAssociatedMessageChatItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return self->_visibleAssociatedMessageChatItems;
}

- (NSArray)suggestedActionsList
{
  return self->_suggestedActionsList;
}

- (CKMessagePartHighlightChatItem)messageHighlightChatItem
{
  return self->_messageHighlightChatItem;
}

- (char)cachedColor
{
  return self->_cachedColor;
}

- (void)setCachedColor:(char)a3
{
  self->_cachedColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHighlightChatItem, 0);
  objc_storeStrong((id *)&self->_suggestedActionsList, 0);

  objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, 0);
}

- (id)compositionWithContext:(id)a3
{
  return 0;
}

@end