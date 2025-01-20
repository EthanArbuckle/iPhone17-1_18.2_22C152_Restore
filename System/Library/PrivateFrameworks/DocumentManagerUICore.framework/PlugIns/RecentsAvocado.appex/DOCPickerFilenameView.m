@interface DOCPickerFilenameView
- (NSArray)tags;
- (UIButton)tagButton;
- (_TtC14RecentsAvocado16DOCPickerContext)pickerContext;
- (_TtC14RecentsAvocado21DOCPickerFilenameView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado21DOCPickerFilenameView)initWithFrame:(CGRect)a3;
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

- (_TtC14RecentsAvocado16DOCPickerContext)pickerContext
{
  return (_TtC14RecentsAvocado16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_pickerContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_pickerContext) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100322630();
}

- (NSArray)tags
{
  swift_beginAccess();
  sub_1000333C8(0, (unint64_t *)&unk_100628880);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setTags:(id)a3
{
  sub_1000333C8(0, (unint64_t *)&unk_100628880);
  uint64_t v4 = sub_1004CDE30();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_tags);
  swift_beginAccess();
  uint64_t *v5 = v4;
  id v6 = self;
  swift_bridgeObjectRelease();
  id v7 = sub_1003210E4();
  [v7 setNeedsUpdateConfiguration];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100320B08(v4);
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100320C60(v4);
}

- (UIButton)tagButton
{
  NSArray v2 = self;
  id v3 = sub_1003210E4();

  return (UIButton *)v3;
}

- (void)setTagButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___tagButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___tagButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC14RecentsAvocado21DOCPickerFilenameView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003240D0();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPickerFilenameView(0);
  id v2 = v4.receiver;
  [(DOCPickerFilenameView *)&v4 layoutSubviews];
  sub_100320DBC();
  id v3 = sub_1003210E4();
  objc_msgSend(v3, "setNeedsUpdateConfiguration", v4.receiver, v4.super_class);
}

- (_TtC14RecentsAvocado21DOCPickerFilenameView)initWithFrame:(CGRect)a3
{
  result = (_TtC14RecentsAvocado21DOCPickerFilenameView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_pickerContext));
  swift_bridgeObjectRelease();
  sub_100324840((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_metrics);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___stackedThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___filenameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___filenameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___filenameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView____lazy_storage___tagButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_textStyle));
  swift_unknownObjectWeakDestroy();
}

- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4
{
  id v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1004CDE00();
  if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1004CDE60();
  }
  sub_1004CDF40();
  sub_1004CDE50();
  swift_endAccess();
  id v9 = sub_1003210E4();
  [v9 setNeedsUpdateConfiguration];
  swift_unknownObjectRelease();
}

- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4
{
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado21DOCPickerFilenameView_tags);
  swift_beginAccess();
  id v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  uint64_t v9 = sub_100324304(v6);
  uint64_t v10 = v9;
  if ((unint64_t)*v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1004CF6D0();
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
      sub_1002D5C0C(v10, v11);
      swift_endAccess();
      id v12 = sub_1003210E4();
      [v12 setNeedsUpdateConfiguration];
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

@end