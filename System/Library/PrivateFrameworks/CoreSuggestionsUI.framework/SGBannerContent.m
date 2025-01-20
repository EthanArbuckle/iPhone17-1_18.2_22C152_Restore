@interface SGBannerContent
- (BOOL)prominentActionButton;
- (BOOL)suggestionCategorySupportsBatchDismissal;
- (NSArray)iconSFSymbols;
- (NSArray)imageSGViews;
- (NSArray)images;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSString)actionTitle;
- (NSString)listTitle;
- (NSString)subtitle;
- (NSString)title;
- (SGBannerDividerParameter)bannerDivider;
- (SGSuggestion)suggestion;
- (SGSuggestionAction)dismissAction;
- (SGSuggestionAction)primaryAction;
- (SGSuggestionDelegate)delegate;
- (UIColor)backgroundColor;
- (UIVisualEffectView)backgroundVisualEffectView;
- (_TtC17CoreSuggestionsUI15SGBannerContent)init;
- (double)closeButtonWidth;
- (double)closeButtonXAnchorOffset;
- (double)primaryActionButtonWidth;
- (int64_t)accessoryType;
- (int64_t)actionButtonType;
- (void)setAccessoryType:(int64_t)a3;
- (void)setActionButtonType:(int64_t)a3;
- (void)setActionTitle:(id)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setBannerDivider:(id)a3;
- (void)setCloseButtonWidth:(double)a3;
- (void)setCloseButtonXAnchorOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setIconSFSymbols:(id)a3;
- (void)setImageSGViews:(id)a3;
- (void)setImages:(id)a3;
- (void)setListTitle:(id)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setPrimaryActionButtonWidth:(double)a3;
- (void)setProminentActionButton:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SGBannerContent

- (_TtC17CoreSuggestionsUI15SGBannerContent)init
{
  return (_TtC17CoreSuggestionsUI15SGBannerContent *)SGBannerContent.init()();
}

- (NSString)title
{
  return (NSString *)sub_1B5B7F7E8(self, (uint64_t)a2, (void (*)(void))sub_1B5B7EBB4);
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)attributedTitle
{
  v2 = sub_1B5B7ED44();
  return (NSAttributedString *)v2;
}

- (void)setAttributedTitle:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B7EDC8(v5);
}

- (NSString)subtitle
{
  return (NSString *)sub_1B5B80770(self, (uint64_t)a2, (void (*)(void))sub_1B5B7EF4C);
}

- (void)setSubtitle:(id)a3
{
}

- (NSAttributedString)attributedSubtitle
{
  v2 = sub_1B5B7F0DC();
  return (NSAttributedString *)v2;
}

- (void)setAttributedSubtitle:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B7F160(v5);
}

- (int64_t)accessoryType
{
  return sub_1B5B7F488();
}

- (void)setAccessoryType:(int64_t)a3
{
}

- (NSArray)images
{
  return (NSArray *)sub_1B5B804D0(self, (uint64_t)a2, sub_1B5B7F650, &qword_1EB840B10);
}

- (void)setImages:(id)a3
{
}

- (NSString)actionTitle
{
  return (NSString *)sub_1B5B7F7E8(self, (uint64_t)a2, (void (*)(void))sub_1B5B7F830);
}

- (void)setActionTitle:(id)a3
{
}

- (SGSuggestion)suggestion
{
  v2 = (void *)sub_1B5B7FAB0();
  return (SGSuggestion *)v2;
}

- (void)setSuggestion:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_4();
  sub_1B5B7FB24(v5);
}

- (SGSuggestionDelegate)delegate
{
  v2 = (void *)sub_1B5B7FC94();
  return (SGSuggestionDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  OUTLINED_FUNCTION_4();
  sub_1B5B7FD20();
}

- (double)primaryActionButtonWidth
{
  return sub_1B5B7FF60();
}

- (void)setPrimaryActionButtonWidth:(double)a3
{
}

- (double)closeButtonWidth
{
  return sub_1B5B80134();
}

- (void)setCloseButtonWidth:(double)a3
{
}

- (int64_t)actionButtonType
{
  return sub_1B5B80308();
}

- (void)setActionButtonType:(int64_t)a3
{
}

- (NSArray)imageSGViews
{
  return (NSArray *)sub_1B5B804D0(self, (uint64_t)a2, sub_1B5B8054C, &qword_1E9D94388);
}

- (void)setImageSGViews:(id)a3
{
}

- (NSString)listTitle
{
  return (NSString *)sub_1B5B80770(self, (uint64_t)a2, (void (*)(void))sub_1B5B807C4);
}

- (void)setListTitle:(id)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  v2 = sub_1B5B809CC();
  return (UIVisualEffectView *)v2;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B80A50(v5);
}

- (UIColor)backgroundColor
{
  v2 = sub_1B5B80BAC();
  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B80C30(v5);
}

- (SGBannerDividerParameter)bannerDivider
{
  v2 = sub_1B5B80D8C();
  return (SGBannerDividerParameter *)v2;
}

- (void)setBannerDivider:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B80E10(v5);
}

- (BOOL)suggestionCategorySupportsBatchDismissal
{
  return sub_1B5B80F60() & 1;
}

- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3
{
}

- (SGSuggestionAction)primaryAction
{
  v2 = sub_1B5B81138();
  return (SGSuggestionAction *)v2;
}

- (void)setPrimaryAction:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B811BC(v5);
}

- (SGSuggestionAction)dismissAction
{
  v2 = sub_1B5B81318();
  return (SGSuggestionAction *)v2;
}

- (void)setDismissAction:(id)a3
{
  OUTLINED_FUNCTION_6_1((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_4();
  sub_1B5B8139C(v5);
}

- (double)closeButtonXAnchorOffset
{
  return sub_1B5B81524();
}

- (void)setCloseButtonXAnchorOffset:(double)a3
{
}

- (BOOL)prominentActionButton
{
  return sub_1B5B816FC() & 1;
}

- (void)setProminentActionButton:(BOOL)a3
{
}

- (NSArray)iconSFSymbols
{
  if (sub_1B5B818F8())
  {
    sub_1B5BC9FC0();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    self = 0;
  }
  return (NSArray *)self;
}

- (void)setIconSFSymbols:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B5BC9FE0();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = self;
  sub_1B5B819DC(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5B81CF4((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundVisualEffectView));

  swift_bridgeObjectRelease();
}

@end