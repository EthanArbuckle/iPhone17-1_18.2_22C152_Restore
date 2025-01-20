@interface DOCServiceTransitionController
- (_TtC14RecentsAvocado30DOCServiceTransitionController)init;
- (void)endTransition;
- (void)getDisplayInformation:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)setHasProgress:(BOOL)a3 loadingFractionCompleted:(double)a4 setIsIndeterminate:(BOOL)a5;
- (void)startTransition;
@end

@implementation DOCServiceTransitionController

- (void)setHasProgress:(BOOL)a3 loadingFractionCompleted:(double)a4 setIsIndeterminate:(BOOL)a5
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = self;
  *(unsigned char *)(v9 + 24) = a3;
  *(unsigned char *)(v9 + 25) = a5;
  *(double *)(v9 + 32) = a4;
  v12[4] = sub_100066370;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1003A422C;
  v12[3] = &unk_1005B80F8;
  v10 = _Block_copy(v12);
  v11 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v10);
}

- (void)getDisplayInformation:(BOOL)a3 withCompletionBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(void *)(v8 + 24) = sub_100066308;
  *(void *)(v8 + 32) = v7;
  *(unsigned char *)(v8 + 40) = a3;
  v11[4] = sub_100066328;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1003A422C;
  v11[3] = &unk_1005B80A8;
  uint64_t v9 = _Block_copy(v11);
  v10 = self;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (void)startTransition
{
}

- (void)endTransition
{
}

- (_TtC14RecentsAvocado30DOCServiceTransitionController)init
{
  result = (_TtC14RecentsAvocado30DOCServiceTransitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end