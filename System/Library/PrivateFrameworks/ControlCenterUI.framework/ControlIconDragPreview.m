@interface ControlIconDragPreview
- (BOOL)iconAllowsAccessory;
- (BOOL)iconAllowsLabelArea;
- (BOOL)iconCanShowCloseBox;
- (BOOL)iconCanShowResizeHandle;
- (BOOL)iconIsEditing;
- (BOOL)isFlocked;
- (SBIcon)icon;
- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithCoder:(id)a3;
- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithFrame:(CGRect)a3;
- (double)iconContentScale;
- (id)cleanUpHandler;
- (id)delayCleanUpForReason:(id)a3;
- (id)setIconViewDelegate:(uint64_t)a3;
- (unint64_t)dragState;
- (void)draggingSourceDroppedWithOperation:(unint64_t)a3;
- (void)dropDestinationAnimationCompleted;
- (void)layoutSubviews;
- (void)setCleanUpHandler:(id)a3;
- (void)setDragState:(unint64_t)a3;
- (void)setFlocked:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconAllowsAccessory:(BOOL)a3;
- (void)setIconAllowsLabelArea:(BOOL)a3;
- (void)setIconCanShowCloseBox:(BOOL)a3;
- (void)setIconCanShowResizeHandle:(BOOL)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconIsEditing:(BOOL)a3;
- (void)setIconViewCustomIconImageViewController:(id)a3;
- (void)setIconViewListLayoutProvider:(id)a3;
@end

@implementation ControlIconDragPreview

- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D7B65CB8();
}

- (BOOL)isFlocked
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked);
}

- (void)setFlocked:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked) = a3;
}

- (BOOL)iconAllowsLabelArea
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea);
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea) = a3;
}

- (BOOL)iconAllowsAccessory
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory);
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory) = a3;
}

- (BOOL)iconIsEditing
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing);
}

- (void)setIconIsEditing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing) = a3;
}

- (BOOL)iconCanShowCloseBox
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox);
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
}

- (BOOL)iconCanShowResizeHandle
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle);
}

- (void)setIconCanShowResizeHandle:(BOOL)a3
{
}

- (double)iconContentScale
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale);
}

- (void)setIconContentScale:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_setIconContentScale_);
}

- (id)cleanUpHandler
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler))
  {
    uint64_t v2 = *(void *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
    v5[4] = *(Class *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1D7B64850;
    v5[3] = &block_descriptor_88;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setCleanUpHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1D7B66058;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1D7B65FA0(v8);
}

- (unint64_t)dragState
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState);
}

- (void)setDragState:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_1D7B6499C(a3);
}

- (SBIcon)icon
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_icon);

  return (SBIcon *)v2;
}

- (void)setIcon:(id)a3
{
}

- (void)setIconViewListLayoutProvider:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView);
  if (v3) {
    objc_msgSend(v3, sel_setListLayoutProvider_, a3);
  }
}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1D7B64CF8(a3);
}

- (id)setIconViewDelegate:(uint64_t)a3
{
  swift_unknownObjectWeakAssign();
  id v5 = *(void **)(a1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView);

  return objc_msgSend(v5, sel_setDelegate_, a3);
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  id v3 = self;
  sub_1D7B65E04();
}

- (void)dropDestinationAnimationCompleted
{
  id v2 = self;
  sub_1D7B64F04();
}

- (id)delayCleanUpForReason:(id)a3
{
  uint64_t v4 = sub_1D7BB7258();
  uint64_t v6 = v5;
  v7 = (objc_class *)type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion();
  uint64_t v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_dragPreview] = self;
  v9 = (uint64_t *)&v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_reason];
  uint64_t *v9 = v4;
  v9[1] = v6;
  v14.receiver = v8;
  v14.super_class = v7;
  v10 = self;
  swift_bridgeObjectRetain();
  v11 = [(ControlIconDragPreview *)&v14 init];
  id v12 = sub_1D7B65228();
  objc_msgSend(v12, sel_addObject_, v11, v14.receiver, v14.super_class);

  swift_bridgeObjectRelease();

  return v11;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1D7B65098();
}

- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithFrame:(CGRect)a3
{
  result = (_TtC15ControlCenterUI22ControlIconDragPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView));
  sub_1D7B65FA0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController));
  sub_1D7B63530((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconViewDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions);
}

@end