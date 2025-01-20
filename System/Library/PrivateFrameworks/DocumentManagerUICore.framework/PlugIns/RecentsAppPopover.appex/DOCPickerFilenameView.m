@interface DOCPickerFilenameView
- (NSArray)tags;
- (UIButton)tagButton;
- (_TtC17RecentsAppPopover16DOCPickerContext)pickerContext;
- (_TtC17RecentsAppPopover21DOCPickerFilenameView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover21DOCPickerFilenameView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPickerContext:(id)a3;
- (void)setTagButton:(id)a3;
- (void)setTags:(id)a3;
- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4;
- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation DOCPickerFilenameView

- (_TtC17RecentsAppPopover16DOCPickerContext)pickerContext
{
  return (_TtC17RecentsAppPopover16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_pickerContext);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_pickerContext) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100279F4C();
}

- (NSArray)tags
{
  swift_beginAccess();
  sub_1000338CC(0, (unint64_t *)&unk_1006181F0);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004BEDC0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setTags:(id)a3
{
  sub_1000338CC(0, (unint64_t *)&unk_1006181F0);
  uint64_t v4 = sub_1004BEDE0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_tags);
  swift_beginAccess();
  uint64_t *v5 = v4;
  id v6 = self;
  swift_bridgeObjectRelease();
  id v7 = sub_100278A00();
  [v7 setNeedsUpdateConfiguration];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100278424(v4);
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10027857C(v4);
}

- (UIButton)tagButton
{
  NSArray v2 = self;
  id v3 = sub_100278A00();

  return (UIButton *)v3;
}

- (void)setTagButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___tagButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___tagButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC17RecentsAppPopover21DOCPickerFilenameView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10027B9EC();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPickerFilenameView(0);
  id v2 = v4.receiver;
  [(DOCPickerFilenameView *)&v4 layoutSubviews];
  sub_1002786D8();
  id v3 = sub_100278A00();
  objc_msgSend(v3, "setNeedsUpdateConfiguration", v4.receiver, v4.super_class);
}

- (_TtC17RecentsAppPopover21DOCPickerFilenameView)initWithFrame:(CGRect)a3
{
  result = (_TtC17RecentsAppPopover21DOCPickerFilenameView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_pickerContext));
  swift_bridgeObjectRelease();
  sub_10027C15C((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_metrics);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___stackedThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___filenameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___filenameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___filenameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView____lazy_storage___tagButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_textStyle));
  swift_unknownObjectWeakDestroy();
}

- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4
{
  id v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1004BEDB0();
  if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1004BEE10();
  }
  sub_1004BEEF0();
  sub_1004BEE00();
  swift_endAccess();
  id v9 = sub_100278A00();
  [v9 setNeedsUpdateConfiguration];
  swift_unknownObjectRelease();
}

- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4
{
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  uint64_t v9 = sub_10027BC20(v6);
  uint64_t v10 = v9;
  if ((unint64_t)*v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1004C0690();
    swift_bridgeObjectRelease();
    if (v11 >= v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v9)
    {
LABEL_3:
      sub_10040AB64(v10, v11);
      swift_endAccess();
      id v12 = sub_100278A00();
      [v12 setNeedsUpdateConfiguration];
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

@end