@interface UICollectionViewListCoordinatorBaseBase
- (_TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase)init;
@end

@implementation UICollectionViewListCoordinatorBaseBase

- (_TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase_backgroundColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UICollectionViewListCoordinatorBaseBase();
  return [(PlatformViewCoordinator *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase_backgroundColor));
}

@end