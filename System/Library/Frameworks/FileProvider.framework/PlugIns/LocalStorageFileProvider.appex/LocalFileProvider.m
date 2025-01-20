@interface LocalFileProvider
- (_TtC24LocalStorageFileProvider17LocalFileProvider)init;
- (_TtC24LocalStorageFileProvider17LocalFileProvider)initWithDomain:(id)a3;
- (id)URLForItemWithPersistentIdentifier:(id)a3;
- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 completionHandler:(id)a5;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerDataURLWithMetadata:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithMetadata:(id)a5 completionHandler:(id)a6;
- (id)itemForIdentifier:(id)a3 error:(id *)a4;
- (id)persistentIdentifierForItemAtURL:(id)a3;
- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4;
- (uint64_t)providePlaceholderAtURL:(uint64_t)a3 completionHandler:(const void *)a4;
- (void)_dumpInternalStateToTermDumper:(id)a3 completionHandler:(id)a4;
- (void)_removeTrashedItemsOlderThanDate:(id)a3 completionHandler:(id)a4;
- (void)_trashItemAtURLWithoutCoordination:(id)a3 completionHandler:(id)a4;
- (void)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)itemChangedAtURL:(id)a3;
- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5;
- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6;
- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)stopProvidingItemAtURL:(id)a3;
- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)waitForStabilizationWithCompletionHandler:(id)a3;
@end

@implementation LocalFileProvider

- (_TtC24LocalStorageFileProvider17LocalFileProvider)initWithDomain:(id)a3
{
  id v4 = a3;
  return (_TtC24LocalStorageFileProvider17LocalFileProvider *)sub_10000F674(a3);
}

- (id)itemForIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000173C4(self, (uint64_t)a2, a3, (uint64_t)a4, 18, 0xD000000000000010, 0x80000001009938B0, (void (*)(void *__return_ptr, uint64_t))sub_10000B878);
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000173C4(self, (uint64_t)a2, a3, (uint64_t)a4, 27, 0xD000000000000019, 0x8000000100993AB0, (void (*)(void *__return_ptr, uint64_t))sub_10000DF2C);
}

- (_TtC24LocalStorageFileProvider17LocalFileProvider)init
{
  return (_TtC24LocalStorageFileProvider17LocalFileProvider *)sub_1000475D0();
}

- (id)URLForItemWithPersistentIdentifier:(id)a3
{
  uint64_t v5 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_100047D80((uint64_t)v8, v7);

  uint64_t v10 = sub_10096AE50();
  uint64_t v11 = *(void *)(v10 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    sub_10096AD20(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return v13;
}

- (id)persistentIdentifierForItemAtURL:(id)a3
{
  uint64_t v4 = sub_10096AE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  id v8 = self;
  v9 = (void *)sub_1000485C0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (uint64_t)providePlaceholderAtURL:(uint64_t)a3 completionHandler:(const void *)a4
{
  uint64_t v6 = sub_10096AE50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_10096ADD0();
  uint64_t v11 = (void (*)(void *, void))v10[2];
  id v12 = a1;
  v11(v10, 0);
  _Block_release(v10);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stopProvidingItemAtURL:(id)a3
{
  uint64_t v3 = sub_10096AE50();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)itemChangedAtURL:(id)a3
{
  uint64_t v4 = sub_10096AE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10096ADD0();
  uint64_t v8 = self;
  v9 = self;
  id v10 = [v8 defaultManager];
  aBlock[4] = Filename.init(rawValue:);
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000072D0;
  aBlock[3] = &unk_100A691C0;
  uint64_t v11 = _Block_copy(aBlock);
  [v10 signalEnumeratorForContainerItemIdentifier:NSFileProviderWorkingSetContainerItemIdentifier completionHandler:v11];
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 completionHandler:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v10 = _Block_copy(a5);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  aBlock[4] = sub_100071AFC;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000491EC;
  aBlock[3] = &unk_100A69198;
  id v12 = _Block_copy(aBlock);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  swift_retain();
  swift_release();
  v18.receiver = v15;
  v18.super_class = ObjectType;
  id v16 = [(LocalFileProvider *)&v18 fetchContentsForItemWithIdentifier:v13 version:v14 completionHandler:v12];
  _Block_release(v12);

  swift_release();

  return v16;
}

- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_10096AE50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  sub_10096ADD0();
  _Block_copy(v12);
  id v13 = a4;
  id v14 = self;
  sub_1000640B0((uint64_t)v11, v13, (char *)v14, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  id v12 = self;
  sub_100064420(v8, v10, (uint64_t)v11, (char *)v12, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  id v12 = self;
  sub_100064750(v11, v8, v10, (char *)v12, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  if (a5)
  {
    uint64_t v11 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
    a5 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v10);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_100064A84((uint64_t)v13, (uint64_t)v14, v11, (uint64_t)a5, (char *)v15, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)_trashItemAtURLWithoutCoordination:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_10096AE50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_10096ADD0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = self;
  sub_1000659E4((uint64_t)v9, 0, (uint64_t)v12, (uint64_t)sub_1000717BC, v11, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))sub_10004BBC0);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_100066078(v9, (uint64_t)a4, (char *)v11, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10002B7CC((uint64_t *)&unk_100ACB5E0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  if (a3)
  {
    sub_10096B0A0();
    uint64_t v13 = sub_10096B0E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_10096B0E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  id v15 = a4;
  id v16 = self;
  sub_100066614((uint64_t)v11, (uint64_t)v15, (uint64_t)v16, v12);
  _Block_release(v12);
  _Block_release(v12);

  sub_10002B770((uint64_t)v11, (uint64_t *)&unk_100ACB5E0);
}

- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  id v8 = a4;
  uint64_t v9 = self;
  if (a3)
  {
    id v10 = a3;
    a3 = (id)sub_10096AF60();
    unint64_t v12 = v11;
  }
  else
  {
    unint64_t v12 = 0xF000000000000000;
  }
  _Block_copy(v7);
  sub_100066A58((uint64_t)a3, v12, (uint64_t)a4, (uint64_t)self, v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_10001E9AC((uint64_t)a3, v12);
}

- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = self;
  sub_100066E14(a3, (uint64_t)v10, (uint64_t)v11, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4
{
  sub_10002B7CC(&qword_100ACAF70);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100974D40;
  id v7 = objc_allocWithZone((Class)FileProviderValidationServiceSource);
  id v8 = a3;
  id v9 = self;
  id result = [v7 initWithFileProviderExtension:v9 itemIdentifier:v8];
  if (result)
  {
    *(void *)(v6 + 32) = result;
    sub_10096C0C0();

    sub_10002B7CC(&qword_100ACB720);
    v11.super.isa = sub_10096C080().super.isa;
    swift_bridgeObjectRelease();
    return v11.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_removeTrashedItemsOlderThanDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_10096B0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (void (**)(char *, uint64_t))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v10 = _Block_copy(a4);
  sub_10096B0A0();
  _Block_copy(v10);
  NSArray v11 = self;
  sub_1000671CC(v9, (char *)v11, (void (**)(void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(void, uint64_t))(v7 + 8))(v9, v6);
}

- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v8 = v7;
  _Block_copy(v5);
  id v9 = self;
  id v10 = (void *)sub_10006753C(v6, v8, (uint64_t)v9, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)_dumpInternalStateToTermDumper:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_100067824(v7, (char *)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v14 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a8);
  if (a6)
  {
    sub_10096ADD0();
    uint64_t v18 = sub_10096AE50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_10096AE50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  swift_unknownObjectRetain();
  id v21 = a4;
  v22 = self;
  sub_10006EF90((uint64_t)a3, v21, a5, (uint64_t)v16, (uint64_t)sub_1000703C8, v20);
  swift_unknownObjectRelease();

  swift_release();
  sub_10002B770((uint64_t)v16, &qword_100ACA8C0);
}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10006F348(v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider17LocalFileProvider_queue));
  sub_100028858((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider17LocalFileProvider_localDomain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  sub_10002B7CC(&qword_100ACB5B8);
  sub_10002D780((unint64_t *)&unk_100ACA8E0, type metadata accessor for NSFileProviderItemIdentifier);
  uint64_t v10 = sub_10096B9C0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  uint64_t v13 = self;
  uint64_t v14 = (void *)sub_10006F614(v10, (void (*)(void *, id, void, unint64_t, void))sub_1000703C0, v11, (void (*)(id))sub_100071B10, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v14;
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithMetadata:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  sub_10002B7CC(&qword_100ACB5B8);
  sub_10002D780((unint64_t *)&unk_100ACA8E0, type metadata accessor for NSFileProviderItemIdentifier);
  uint64_t v10 = sub_10096B9C0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  uint64_t v13 = self;
  uint64_t v14 = (void *)sub_10006FA3C(v10, (void (*)(void *, id, void, unint64_t, void, unint64_t, void))sub_1000703B8, v11, (void (*)(id))sub_100071B10, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v14;
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerDataURLWithMetadata:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  sub_10002B7CC(&qword_100ACB5B8);
  sub_10002D780((unint64_t *)&unk_100ACA8E0, type metadata accessor for NSFileProviderItemIdentifier);
  uint64_t v10 = sub_10096B9C0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  uint64_t v13 = self;
  uint64_t v14 = (void *)sub_10006FEA8(v10, (void (*)(void *, void *, char *, void, unint64_t, void))sub_1000640A0, v11, (void (*)(id))sub_1000640A8, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v14;
}

@end