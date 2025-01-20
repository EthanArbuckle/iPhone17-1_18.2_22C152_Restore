@interface UIViewController
- (void)scheduleModalPresentationWithPriority:(int64_t)a3 animated:(BOOL)a4 presentationCompletion:(id)a5;
- (void)showOnTopWithAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation UIViewController

- (void)showOnTopWithAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_100045FC8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_10006FBEC(0, v4, (uint64_t)v6, v7);
  sub_10003B0B8((uint64_t)v6);
}

- (void)scheduleModalPresentationWithPriority:(int64_t)a3 animated:(BOOL)a4 presentationCompletion:(id)a5
{
  uint64_t v9 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  __chkstk_darwin(v9 - 8);
  v11 = (void **)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = _Block_copy(a5);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_1000DE154;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = qword_100182828;
  v15 = self;
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for ModalPresentationCoordinator(0);
  sub_10003C3B0(v16, (uint64_t)qword_10018A440);
  swift_beginAccess();
  v17 = v15;
  sub_10003AF68((uint64_t)v12);
  sub_1000D9114(v17, 0, a3, a4, 0, 1, (uint64_t)v12, v13, (uint64_t)v11);
  sub_1000D9BC8(v11);
  sub_10003C50C((uint64_t)v11);
  swift_endAccess();
  sub_10003B0B8((uint64_t)v12);
}

@end