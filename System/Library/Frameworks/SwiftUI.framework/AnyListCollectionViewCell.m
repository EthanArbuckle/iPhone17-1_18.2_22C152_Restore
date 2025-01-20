@interface AnyListCollectionViewCell
- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation AnyListCollectionViewCell

- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AnyListCollectionViewCell();
  return -[AnyListCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnyListCollectionViewCell();
  return [(AnyListCollectionViewCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate);
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate;

  outlined destroy of weak FallbackResponderProvider?((uint64_t)v3);
}

@end