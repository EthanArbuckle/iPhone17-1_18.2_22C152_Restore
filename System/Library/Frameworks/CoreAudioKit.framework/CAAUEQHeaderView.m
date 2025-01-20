@interface CAAUEQHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithFrame:(CGRect)a3;
- (void)beginTouchWithNotification:(id)a3;
- (void)didMoveToSuperview;
- (void)endTouchWithNotification:(id)a3;
- (void)removeFromSuperview;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)textFieldEditingDidChange:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CAAUEQHeaderView

- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16CAAUEQHeaderView *)sub_21E558A98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16CAAUEQHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E561B0C();
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQHeaderView();
  v2 = v4.receiver;
  [(CAAUEQHeaderView *)&v4 didMoveToSuperview];
  uint64_t v3 = OBJC_IVAR____TtC12CoreAudioKit16CAAUEQHeaderView_viewSetup;
  if ((v2[OBJC_IVAR____TtC12CoreAudioKit16CAAUEQHeaderView_viewSetup] & 1) == 0)
  {
    sub_21E55CBB0();
    v2[v3] = 1;
  }
}

- (void)removeFromSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQHeaderView();
  id v2 = v4.receiver;
  [(CAAUEQHeaderView *)&v4 removeFromSuperview];
  id v3 = objc_msgSend(self, sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_removeObserver_, v2);
}

- (void)tintColorDidChange
{
  id v2 = self;
  sub_21E558E48();
}

- (void)textFieldEditingDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E55945C(v4);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_selectAll_, v5);
  id v6 = objc_msgSend(v4, sel_textColor);
  if (v6)
  {
    v7 = v6;
    id v8 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.2);
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(v4, sel_setBackgroundColor_, v8);
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6 = self;
  id v7 = a3;
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v9);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = sub_21E5B6368();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  v15 = (char *)&v21 - v14;
  sub_21E5B65F8();
  id v16 = a3;
  v17 = self;
  sub_21E5B6358();
  sub_21E5B6358();
  char v18 = sub_21E5B6348();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v12, v7);
  v19(v15, v7);

  swift_bridgeObjectRelease();
  return v18 & 1;
}

- (void)beginTouchWithNotification:(id)a3
{
}

- (void)endTouchWithNotification:(id)a3
{
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end