@interface UpdateCoalescingCollectionView
+ (BOOL)_isFromSwiftUI;
- (BOOL)_wantsConstraintBasedLayout;
- (BOOL)canBecomeFirstResponder;
- (CGRect)bounds;
- (CGSize)contentSize;
- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithCoder:(id)a3;
- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)safeAreaInsetsDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setContentSize:(CGSize)a3;
@end

@implementation UpdateCoalescingCollectionView

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    v6 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
    if (v8)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v8;
      v11 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = 0;
  uint64_t v10 = 0;
LABEL_6:
  v12 = self;
  UpdateCoalescingCollectionView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v11);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);
}

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UpdateCoalescingCollectionView(0);
  [(UpdateCoalescingCollectionView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  updated = (objc_class *)type metadata accessor for UpdateCoalescingCollectionView(0);
  v13.receiver = self;
  v13.super_class = updated;
  v7 = self;
  [(UpdateCoalescingCollectionView *)&v13 contentSize];
  double v9 = v8;
  double v11 = v10;
  v12.receiver = v7;
  v12.super_class = updated;
  -[UpdateCoalescingCollectionView setContentSize:](&v12, sel_setContentSize_, width, height);
  UpdateCoalescingCollectionView.contentSize.didset(v9, v11);
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdateCoalescingCollectionView(0);
  [(UpdateCoalescingCollectionView *)&v6 bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_wantsConstraintBasedLayout
{
  return 0;
}

- (void)safeAreaInsetsDidChange
{
  double v2 = self;
  UpdateCoalescingCollectionView.safeAreaInsetsDidChange()();
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  UpdateCoalescingCollectionView.bounds.setter(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  UpdateCoalescingCollectionView.layoutSubviews()();
}

- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC7SwiftUI30UpdateCoalescingCollectionView *)UpdateCoalescingCollectionView.init(frame:collectionViewLayout:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)canBecomeFirstResponder
{
  double v2 = self;
  unsigned __int8 updated = UpdateCoalescingCollectionView.canBecomeFirstResponder.getter();

  return updated & 1;
}

- (void)didMoveToWindow
{
  double v2 = self;
  UpdateCoalescingCollectionView.didMoveToWindow()();
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI30UpdateCoalescingCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized UpdateCoalescingCollectionView.init(coder:)();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI30UpdateCoalescingCollectionView_helper));
  swift_bridgeObjectRelease();
  _s10Foundation9IndexPathVSgWOhTm_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUI30UpdateCoalescingCollectionView_pendingDeselectedItem, &lazy cache variable for type metadata for IndexPath?, MEMORY[0x1E4F27DE8]);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI30UpdateCoalescingCollectionView__layoutContainer;

  outlined destroy of weak FallbackResponderProvider?((uint64_t)v3);
}

@end