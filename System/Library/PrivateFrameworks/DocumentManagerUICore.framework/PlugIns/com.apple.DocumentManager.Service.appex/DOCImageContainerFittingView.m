@interface DOCImageContainerFittingView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView)initWithFrame:(CGRect)a3;
- (double)contentOffsetFromTop;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (void)fittingImageViewDidLayout:(id)a3;
- (void)layoutSubviews;
- (void)setContentOffsetFromTop:(double)a3;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCImageContainerFittingView

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _s33com_apple_DocumentManager_Service28DOCImageContainerFittingViewC15dragInteraction_17itemsForBeginningSaySo10UIDragItemCGSo0oK0C_So0O7Session_ptF_0(v5);

  swift_unknownObjectRelease();
  sub_10003AE74(0, (unint64_t *)&unk_10062D740);
  v7.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = _s33com_apple_DocumentManager_Service28DOCImageContainerFittingViewC15dragInteraction_17previewForLifting7sessionSo21UITargetedDragPreviewCSgSo06UIDragK0C_So0S4ItemCSo0S7Session_ptF_0(v7);

  swift_unknownObjectRelease();
  return v10;
}

- (double)contentOffsetFromTop
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  return *v2;
}

- (void)setContentOffsetFromTop:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  double *v4 = a3;
}

- (_TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView)initWithFrame:(CGRect)a3
{
  sub_10044F058(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service28DOCImageContainerFittingView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s33com_apple_DocumentManager_Service28DOCImageContainerFittingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = DOCImageContainerFittingView.systemLayoutSizeFitting(_:)(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  DOCImageContainerFittingView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCImageContainerFittingView();
  id v2 = v3.receiver;
  [(DOCImageContainerFittingView *)&v3 layoutSubviews];
  DOCImageContainerFittingView.updateContentFrame()();
  objc_msgSend(v2, "setContentOffsetFromTop:", 0.0, v3.receiver, v3.super_class);
}

- (void)thumbnailLoaded:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  double v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = sub_100451DEC(v6, a3);
  char v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0) {
    sub_100450F10(a3, v7);
  }
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fittingImageViewDidLayout:(id)a3
{
  id v4 = a3;
  double v5 = self;
  _s33com_apple_DocumentManager_Service28DOCImageContainerFittingViewC012fittingImageI9DidLayoutyySo010DOCFittingkI0CF_0();
}

@end