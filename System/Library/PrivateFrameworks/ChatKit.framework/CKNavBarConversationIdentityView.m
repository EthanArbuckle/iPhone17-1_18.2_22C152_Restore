@interface CKNavBarConversationIdentityView
- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4;
- (BOOL)chevronHidden;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)subtitleHidden;
- (CGSize)intrinsicContentSize;
- (CKConversation)conversation;
- (CKNavBarConversationIdentityView)initWithCoder:(id)a3;
- (CKNavBarConversationIdentityView)initWithConversation:(id)a3;
- (CKNavBarConversationIdentityView)initWithFrame:(CGRect)a3;
- (CKNavBarConversationIdentityViewDelegate)delegate;
- (NSString)subtitle;
- (int64_t)style;
- (void)addressBookChangedWithNotification:(id)a3;
- (void)chatDisplayNameChangedWithNotification:(id)a3;
- (void)chatIsFilteredChangedWithNotification:(id)a3;
- (void)chatItemsChangedWithNotification:(id)a3;
- (void)chatKeyTransparencyChangedWithNotification:(id)a3;
- (void)chatPropertiesChangedWithNotification:(id)a3;
- (void)conversationJoinStateChangedWithNotification:(id)a3;
- (void)conversationParticipantsChangedWithNotification:(id)a3;
- (void)didMoveToWindow;
- (void)groupPhotoChangedWithNotification:(id)a3;
- (void)handleTapWithRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)nicknameStoreChangedWithNotification:(id)a3;
- (void)performAnimationForPhotoUpdate;
- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
- (void)setChevronHidden:(BOOL)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleHidden:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateAvatarViewVisualIdentity;
@end

@implementation CKNavBarConversationIdentityView

- (CKNavBarConversationIdentityViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___CKNavBarConversationIdentityView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKNavBarConversationIdentityViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  v4 = self;
  sub_18F741FA8();

  swift_unknownObjectRelease();
}

- (CKConversation)conversation
{
  return (CKConversation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR___CKNavBarConversationIdentityView_conversation));
}

- (void)setConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F742218(v4);
}

- (NSString)subtitle
{
  swift_beginAccess();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  v7 = self;
  CKNavBarConversationIdentityView.subtitle.setter(v4, v6);
}

- (BOOL)subtitleHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___CKNavBarConversationIdentityView_subtitleHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  uint64_t v4 = self;
  CKNavBarConversationIdentityView.subtitleHidden.setter(a3);
}

- (BOOL)chevronHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___CKNavBarConversationIdentityView_chevronHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setChevronHidden:(BOOL)a3
{
  uint64_t v4 = self;
  CKNavBarConversationIdentityView.chevronHidden.setter(a3);
}

- (int64_t)style
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKNavBarConversationIdentityView_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v4 = self;
  CKNavBarConversationIdentityView.style.setter((void *)a3);
}

- (CKNavBarConversationIdentityView)initWithConversation:(id)a3
{
  return (CKNavBarConversationIdentityView *)CKNavBarConversationIdentityView.init(conversation:)(a3);
}

- (CKNavBarConversationIdentityView)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo32CKNavBarConversationIdentityViewC7ChatKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToWindow
{
  v2 = self;
  CKNavBarConversationIdentityView.didMoveToWindow()();
}

- (void)layoutSubviews
{
  v2 = self;
  CKNavBarConversationIdentityView.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = CKNavBarConversationIdentityView.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_18F743EB0(v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C120);
  id v9 = a3;
  id v7 = a4;
  v8 = self;
  if (sub_18F7B9FF0())
  {
    [(CKNavBarConversationIdentityView *)v8 invalidateIntrinsicContentSize];
    [(CKNavBarConversationIdentityView *)v8 setNeedsLayout];
  }
}

- (void)updateAvatarViewVisualIdentity
{
  v2 = self;
  CKNavBarConversationIdentityView.updateAvatarViewVisualIdentity()();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UIGestureRecognizer *)a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = CKNavBarConversationIdentityView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = (UIView *)a4;
  v8 = self;
  LOBYTE(self) = CKNavBarConversationIdentityView.avatarWantsTap(at:from:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v7);

  return self & 1;
}

- (void)performAnimationForPhotoUpdate
{
  v2 = self;
  CKNavBarConversationIdentityView.performAnimationForPhotoUpdate()();
}

- (CKNavBarConversationIdentityView)initWithFrame:(CGRect)a3
{
  CGSize result = (CKNavBarConversationIdentityView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKNavBarConversationIdentityView_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKNavBarConversationIdentityView_avatarViewController));

  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKNavBarConversationIdentityView_sharedProfileStateOracle);
}

- (void)conversationParticipantsChangedWithNotification:(id)a3
{
}

- (void)conversationJoinStateChangedWithNotification:(id)a3
{
}

- (void)chatDisplayNameChangedWithNotification:(id)a3
{
}

- (void)groupPhotoChangedWithNotification:(id)a3
{
}

- (void)addressBookChangedWithNotification:(id)a3
{
}

- (void)chatPropertiesChangedWithNotification:(id)a3
{
}

- (void)chatIsFilteredChangedWithNotification:(id)a3
{
}

- (void)chatItemsChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  v8 = self;
  sub_18F745F2C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)nicknameStoreChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  [(CKNavBarConversationIdentityView *)self performAnimationForPhotoUpdate];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)chatKeyTransparencyChangedWithNotification:(id)a3
{
}

@end