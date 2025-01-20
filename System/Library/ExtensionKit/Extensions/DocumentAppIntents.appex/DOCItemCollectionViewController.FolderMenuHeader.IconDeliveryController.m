@interface DOCItemCollectionViewController.FolderMenuHeader.IconDeliveryController
- (_TtCCC18DocumentAppIntents31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController)init;
- (void)dealloc;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCItemCollectionViewController.FolderMenuHeader.IconDeliveryController

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCCC18DocumentAppIntents31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconThumbnail);
  v3 = self;
  [v2 removeListener:v3];
  v4.receiver = v3;
  v4.super_class = (Class)_s16FolderMenuHeaderC22IconDeliveryControllerCMa();
  [(DOCItemCollectionViewController.FolderMenuHeader.IconDeliveryController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCCC18DocumentAppIntents31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconProvidingDidLoadCompletion);

  sub_100037540(v3);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = self;
  v7[4] = sub_1000F0650;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1003C06E4;
  v7[3] = &unk_1005EDD70;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_unknownObjectRetain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v5);
  swift_unknownObjectRelease();
}

- (_TtCCC18DocumentAppIntents31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController)init
{
  result = (_TtCCC18DocumentAppIntents31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end