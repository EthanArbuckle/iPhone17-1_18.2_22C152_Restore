@interface DOCTransitionableProxy
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation DOCTransitionableProxy

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CAC10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1004CABC0();
  _Block_copy(v10);
  swift_retain();
  sub_1001D23A4((uint64_t)v9, (uint64_t)self, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain();
  sub_1001D3210((uint64_t)v9, a4, (uint64_t)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)getCellFor:(id)a3 :(id)a4
{
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  sub_1000333C8(0, (unint64_t *)&qword_100627EE0);
  uint64_t v7 = sub_1004CDE30();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  swift_retain();
  sub_1001D2070(v7, a4, (uint64_t)sub_10009FA28, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end