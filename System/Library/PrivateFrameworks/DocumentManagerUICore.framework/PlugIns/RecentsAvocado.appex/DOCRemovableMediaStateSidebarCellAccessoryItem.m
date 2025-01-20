@interface DOCRemovableMediaStateSidebarCellAccessoryItem
- (_TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation DOCRemovableMediaStateSidebarCellAccessoryItem

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCRemovableMediaStateSidebarCellAccessoryItem();
  v2 = (char *)v3.receiver;
  [(DOCRemovableMediaStateSidebarCellAccessoryItem *)&v3 didMoveToSuperview];
  sub_100474028((uint64_t)objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation], "operationState", v3.receiver, v3.super_class));
}

- (_TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem)initWithFrame:(CGRect)a3
{
  result = (_TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingStateObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem_formattingOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem_preferredIconColor));
  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem_imageProperties, &qword_10062A788);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___progressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___errorImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___finishedImageView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado46DOCRemovableMediaStateSidebarCellAccessoryItem____lazy_storage___mainContainer);
}

@end