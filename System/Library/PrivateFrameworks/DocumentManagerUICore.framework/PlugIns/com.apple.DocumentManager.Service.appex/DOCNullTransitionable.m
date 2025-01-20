@interface DOCNullTransitionable
- (_TtC33com_apple_DocumentManager_Service21DOCNullTransitionable)init;
- (void)getTransitionControllerForItem:(void *)a3 completionBlock:(void *)aBlock;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation DOCNullTransitionable

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CA420();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1004CA3D0();
  v11 = (void (*)(void *, void))v10[2];
  v12 = self;
  v11(v10, 0);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = (void (*)(void *, void, void))v7[2];
  id v9 = a3;
  v10 = self;
  v8(v7, 0, 0);
  _Block_release(v7);
}

- (void)getTransitionControllerForItem:(void *)a3 completionBlock:(void *)aBlock
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = (void (*)(void *, void))v6[2];
  id v8 = a3;
  id v9 = a1;
  v7(v6, 0);
  _Block_release(v6);
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a5);
  uint64_t v7 = self;
  sub_1000A95AC(0xD000000000000028, 0x800000010053DF80);
  v6[2](v6, 0);
  _Block_release(v6);
}

- (_TtC33com_apple_DocumentManager_Service21DOCNullTransitionable)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCNullTransitionable();
  return [(DOCNullTransitionable *)&v3 init];
}

@end