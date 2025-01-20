@interface CKAcknowledgmentBalloonView
- (CKTapbackViewProtocol)glyphView;
- (int64_t)coloredPart;
- (int64_t)stackCount;
- (void)configureForAggregateAcknowledgmentChatItem:(id)a3;
- (void)legacyAcknowledgementConfigurationForChatItem:(id)a3;
- (void)prepareForReuse;
- (void)setColoredPart:(int64_t)a3;
- (void)setGlyphView:(id)a3;
- (void)setStackCount:(int64_t)a3;
@end

@implementation CKAcknowledgmentBalloonView

- (void)configureForAggregateAcknowledgmentChatItem:(id)a3
{
  id v8 = a3;
  v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isEmojiTapbacksEnabled];

  if (!v5
    || (+[CKUIBehavior sharedBehaviors],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 usesFannedBubbleStyle],
        v6,
        (v7 & 1) == 0))
  {
    [(CKAcknowledgmentBalloonView *)self legacyAcknowledgementConfigurationForChatItem:v8];
  }
  -[CKBalloonView setOrientation:](self, "setOrientation:", [v8 balloonOrientation]);
}

- (void)legacyAcknowledgementConfigurationForChatItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isEmojiTapbacksEnabled];

  if (v6)
  {
    char v7 = [v4 latestTapback];
    if (v7)
    {
      id v8 = +[CKTapbackViewUtils viewFor:isSelected:](CKTapbackViewUtils, "viewFor:isSelected:", v7, [v4 latestIsFromMe]);
      [(CKAcknowledgmentBalloonView *)self setGlyphView:v8];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [v4 guid];
          int v22 = 138412290;
          v23 = v19;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Missing tapback. Unable to render transcript view. GUID: %@", (uint8_t *)&v22, 0xCu);
        }
      }
      [(CKAcknowledgmentBalloonView *)self setGlyphView:0];
    }
  }
  else
  {
    uint64_t v9 = [v4 latestAcknowledgmentType];
    v10 = [(CKAcknowledgmentBalloonView *)self glyphView];
    v11 = v10;
    if (!v10 || [v10 acknowledgmentType] != v9)
    {
      v12 = +[CKUIBehavior sharedBehaviors];
      v13 = [v12 theme];
      v14 = [v4 acknowledgmentImageColor];
      uint64_t v15 = [v13 ckAcknowledgementColorTypeForColor:v14];

      v16 = +[CKAcknowledgmentGlyphView glyphViewForAcknowledgmentType:v9 glyphColor:v15];
      [(CKAcknowledgmentBalloonView *)self setGlyphView:v16];
    }
    v17 = [v4 acknowledgmentImageColor];
    [v11 setGlyphColor:v17];
  }
  v20 = [v4 acknowledgments];
  -[CKAcknowledgmentBalloonView setStackCount:](self, "setStackCount:", [v20 count]);

  if ([v4 includesFromMe])
  {
    if ([v4 latestIsFromMe]) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  [(CKAcknowledgmentBalloonView *)self setColoredPart:v21];
}

- (int64_t)stackCount
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CKAcknowledgmentBalloonView_stackCount);
}

- (void)setStackCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_stackCount) = (Class)a3;
}

- (int64_t)coloredPart
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart);
}

- (void)setColoredPart:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart) = (Class)a3;
  if (v3 != a3) {
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (CKTapbackViewProtocol)glyphView
{
  return (CKTapbackViewProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView));
}

- (void)setGlyphView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView) = (Class)a3;
  id v6 = a3;
  int v5 = self;
  sub_18F553690(v4);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKAcknowledgmentBalloonView;
  v2 = self;
  [(CKBalloonView *)&v3 prepareForReuse];
  -[CKAcknowledgmentBalloonView setGlyphView:](v2, sel_setGlyphView_, 0, v3.receiver, v3.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView));
}

@end