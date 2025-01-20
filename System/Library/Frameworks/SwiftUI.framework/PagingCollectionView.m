@interface PagingCollectionView
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityShouldPreventOpaqueScrolling;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)layoutSubviews;
- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation PagingCollectionView

- (void)layoutSubviews
{
  v2 = self;
  PagingCollectionView.layoutSubviews()();
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  PagingCollectionView.scrollToItem(at:at:animated:)((uint64_t)v11, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (BOOL)_accessibilityShouldPreventOpaqueScrolling
{
  return 1;
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v10 = (char *)self
      + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath;
  uint64_t v11 = type metadata accessor for IndexPath();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, 1, 1, v11);
  uint64_t v13 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastLayoutSize;
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PagingCollectionView();
  return -[PagingCollectionView initWithFrame:collectionViewLayout:](&v15, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath;
  uint64_t v6 = type metadata accessor for IndexPath();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, 1, 1, v6);
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastLayoutSize;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PagingCollectionView();
  return [(PagingCollectionView *)&v10 initWithCoder:a3];
}

- (void).cxx_destruct
{
  uint64_t v3 = MEMORY[0x1E4F27DE8];
  uint64_t v4 = MEMORY[0x1E4FBB718];
  _s7SwiftUI7BindingVys11AnyHashableVGWOhTm_0((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath, (uint64_t)&lazy cache variable for type metadata for IndexPath?, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718], (uint64_t (*)(void))type metadata accessor for IndexPath?);
  _s7SwiftUI7BindingVys11AnyHashableVGWOhTm_0((uint64_t)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, (uint64_t)&lazy cache variable for type metadata for IndexPath?, v3, v4, (uint64_t (*)(void))type metadata accessor for IndexPath?);
}

@end