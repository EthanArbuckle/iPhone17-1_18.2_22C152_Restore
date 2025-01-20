@interface UpdateCoalescingTableView
+ (BOOL)_isFromSwiftUI;
+ (BOOL)_isInternalTableView;
- (BOOL)_sectionContentInsetFollowsLayoutMargins;
- (CGRect)bounds;
- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithCoder:(id)a3;
- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (double)_alignedContentMarginGivenMargin:(double)result;
- (double)_rowSpacing;
- (void)_setSectionContentInsetFollowsLayoutMargins:(BOOL)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)safeAreaInsetsDidChange;
- (void)setBounds:(CGRect)a3;
@end

@implementation UpdateCoalescingTableView

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  return [(UpdateCoalescingTableView *)&v3 _sectionContentInsetFollowsLayoutMargins];
}

- (void)_setSectionContentInsetFollowsLayoutMargins:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  if ([(UpdateCoalescingTableView *)v4 _sectionContentInsetFollowsLayoutMargins] == v3)
  {
  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
    [(UpdateCoalescingTableView *)&v5 _setSectionContentInsetFollowsLayoutMargins:v3];
  }
}

- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return (_TtC7SwiftUI25UpdateCoalescingTableView *)UpdateCoalescingTableView.init(frame:style:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7SwiftUI25UpdateCoalescingTableView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized UpdateCoalescingTableView.init(coder:)();
}

+ (BOOL)_isInternalTableView
{
  return 1;
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  [(UpdateCoalescingTableView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  UpdateCoalescingTableView.bounds.setter(x, y, width, height);
}

- (void)layoutMarginsDidChange
{
  double v2 = self;
  UpdateCoalescingTableView.layoutMarginsDidChange()((SEL *)&selRef_layoutMarginsDidChange);
}

- (void)safeAreaInsetsDidChange
{
  double v2 = self;
  UpdateCoalescingTableView.layoutMarginsDidChange()((SEL *)&selRef_safeAreaInsetsDidChange);
}

- (double)_alignedContentMarginGivenMargin:(double)result
{
  if (*((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_isSidebarStyle))
    return result + 8.0;
  return result;
}

- (double)_rowSpacing
{
  if ((*((unsigned char *)&self->super.super.super.super._responderFlags
        + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_rowSpacing) & 1) == 0)
    return *(double *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_rowSpacing);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpdateCoalescingTableView();
  [(UpdateCoalescingTableView *)&v3 _rowSpacing];
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  UpdateCoalescingTableView.layoutSubviews()();
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    objc_super v6 = _sIeyB_Ieg_TRTA_0;
    if (v8)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v8;
      v11 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Bool) -> ();
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
  UpdateCoalescingTableView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v11);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  outlined destroy of BridgedListState.ScrollTarget?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UpdateCoalescingTableView_pendingScrollTarget, &lazy cache variable for type metadata for BridgedListState.ScrollTarget?, (void (*)(uint64_t))type metadata accessor for BridgedListState.ScrollTarget);

  swift_release();
}

@end