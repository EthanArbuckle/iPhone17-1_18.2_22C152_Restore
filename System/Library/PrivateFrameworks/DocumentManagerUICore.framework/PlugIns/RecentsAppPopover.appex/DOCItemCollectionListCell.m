@interface DOCItemCollectionListCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (id)accessibilityDateLabel;
- (id)accessibilitySizeLabel;
- (id)accessibilityStatusView;
- (id)accessibilitySubtitleLabel;
- (id)accessibilityTagView;
- (id)accessiblityStopDownloadView;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)tintColorDidChange;
@end

@implementation DOCItemCollectionListCell

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionListCell(0);
  id v2 = v3.receiver;
  [(DOCItemCollectionListCell *)&v3 tintColorDidChange];
  objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1004BDB00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BDAC0();
  v8 = self;
  sub_1000ED02C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionListCell(0);
  id v2 = v3.receiver;
  [(DOCItemCollectionListCell *)&v3 didMoveToWindow];
  sub_1000EEE28();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F3370(v4);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC17RecentsAppPopover21DOCItemCollectionCell_cellContent);
  swift_beginAccess();
  if (*v7) {
    CGFloat height = *(double *)(*v7 + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_minimumRowHeight);
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (id)accessibilitySubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_subtitleLabel));
}

- (id)accessibilityTagView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_tagView));
}

- (id)accessibilityDateLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_dateLabel));
}

- (id)accessibilityStatusView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_statusView));
}

- (id)accessibilitySizeLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_sizeLabel));
}

- (id)accessiblityStopDownloadView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17RecentsAppPopover21DOCItemCollectionCell_horizontalStopButton));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1004BEB10();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1004C0260();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1000F9670(&qword_100616750, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)sub_1004BE960();

LABEL_8:
  sub_1000F5CB0(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000516C4((uint64_t)v18, (uint64_t *)&unk_100618730);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_tagView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_listTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalProgress));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_sizeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_thumbnailCellHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalStackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalStackViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_horizontalStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_dateConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_sizeConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_kindConstraint));
  swift_bridgeObjectRelease();
  memcpy(v3, (char *)self + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_cellLayoutMetrics, sizeof(v3));
  sub_1000F8744(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000F86F0);
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_statusViewAccessory, (uint64_t *)&unk_10061A170);
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_progressStopButtonAccessory, (uint64_t *)&unk_10061A170);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_renameTextViewHeightConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionListCell_renameTextViewObserver));
}

@end