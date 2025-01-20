@interface CAMSystemOverlayStateMachine
- (BOOL)halfPressEnabled;
- (BOOL)isVisible;
- (BOOL)wantsOverlayHint;
- (BOOL)wantsOverlayVisible;
- (CAMSystemOverlayStateMachine)init;
- (CAMSystemOverlayVisibilityDelegate)delegate;
- (NSString)name;
- (double)delayedHideDuration;
- (unint64_t)currentStage;
- (void)addReason:(int64_t)a3;
- (void)endAllStages;
- (void)handleStage:(unint64_t)a3 phase:(unint64_t)a4;
- (void)hideImmediately;
- (void)removeReason:(int64_t)a3;
- (void)setDelayedHideDuration:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHalfPressEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setWantsOverlayHint:(BOOL)a3;
- (void)showTransiently;
- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4;
- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3;
- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3;
@end

@implementation CAMSystemOverlayStateMachine

- (CAMSystemOverlayStateMachine)init
{
  return (CAMSystemOverlayStateMachine *)sub_209C269CC();
}

- (CAMSystemOverlayVisibilityDelegate)delegate
{
  v2 = (void *)MEMORY[0x21050C5A0]((char *)self + OBJC_IVAR___CAMSystemOverlayStateMachine_delegate, a2);
  return (CAMSystemOverlayVisibilityDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (double)delayedHideDuration
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_delayedHideDuration);
  return result;
}

- (void)setDelayedHideDuration:(double)a3
{
}

- (NSString)name
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_name);
  sub_209C4D218();

  v5 = (void *)sub_209C4D208();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setName:(id)a3
{
  sub_209C4D218();
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v5 = self;
  id v6 = (id)sub_209C4D208();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setName_, v6);
}

- (BOOL)wantsOverlayHint
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint);
}

- (void)setWantsOverlayHint:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint) = a3;
}

- (BOOL)halfPressEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled);
}

- (void)setHalfPressEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled) = a3;
}

- (void)hideImmediately
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v3 = self;
  objc_msgSend(v2, sel_hideImmediately);
  *((unsigned char *)&v3->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible) = 0;
}

- (void)showTransiently
{
}

- (BOOL)isVisible
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_isVisible);
}

- (void)addReason:(int64_t)a3
{
}

- (void)removeReason:(int64_t)a3
{
}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_209C26E6C(a3, a4);
  swift_unknownObjectRelease();
}

- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3
{
}

- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3
{
}

- (BOOL)wantsOverlayVisible
{
  v2 = self;
  char v3 = sub_209C27060();

  return v3 & 1;
}

- (unint64_t)currentStage
{
  v2 = (char *)self + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (v3) {
    return *(void *)(*(void *)v2 + 8 * v3 + 24);
  }
  else {
    return 0;
  }
}

- (void)endAllStages
{
  v2 = self;
  sub_209C27154();
}

- (void)handleStage:(unint64_t)a3 phase:(unint64_t)a4
{
  id v6 = self;
  sub_209C27204(a3, a4);
}

- (void).cxx_destruct
{
  sub_209C1A1F0((uint64_t)self + OBJC_IVAR___CAMSystemOverlayStateMachine_delegate);
  swift_bridgeObjectRelease();
}

@end