@interface DOCRemovableMediaStateSidebarCellAccessoryItem
- (_TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation DOCRemovableMediaStateSidebarCellAccessoryItem

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCRemovableMediaStateSidebarCellAccessoryItem();
  v2 = (char *)v3.receiver;
  [(DOCRemovableMediaStateSidebarCellAccessoryItem *)&v3 didMoveToSuperview];
  sub_10031D1F8((uint64_t)objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation], "operationState", v3.receiver, v3.super_class));
}

- (_TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem)initWithFrame:(CGRect)a3
{
  result = (_TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingStateObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem_preferredIconColor));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem_imageProperties, &qword_100635C28);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___progressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___errorImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___finishedImageView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___mainContainer);
}

@end