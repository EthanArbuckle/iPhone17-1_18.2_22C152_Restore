@interface DOCItemCollectionCellContent
- (BOOL)accessibilityIsFolder;
- (BOOL)accessibilityShouldDim;
- (_TtC17RecentsAppPopover28DOCItemCollectionCellContent)init;
- (id)accessibilityItem;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCItemCollectionCellContent

- (void)dealloc
{
  v2 = self;
  sub_1003E2FF4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionCellContent();
  [(DOCItemCollectionCellContent *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1000319A8((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v3, (uint64_t *)&unk_100615F70);
  sub_1001A6AA8(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1001A6B1C);
  sub_1000319A8((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_listItemLayoutTraits, (uint64_t)v4, &qword_100628B50);
  sub_1001CB66C(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000F86F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_appearance));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__traitCollection));
  swift_unknownObjectRelease();
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_sortingDescriptor, (uint64_t *)&unk_10061B1D0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_loadingProgress));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_observedProgress));
  sub_100035EB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_thumbnailUpdateBlock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_thumbnailUpdateLock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__titleColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_trailingAttachmentcolor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__suffixColor));
  sub_1000319A8((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__titleWithTags, (uint64_t)v5, &qword_100615F80);
  sub_1003ED69C(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000515D8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__titleWithIconAndTags));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__sizeLock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent__tableTitle));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_delegate);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1004BEB10();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1004C0260();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1003ED644(&qword_100616750, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)sub_1004BE960();

LABEL_8:
  DOCItemCollectionCellContent.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000516C4((uint64_t)v18, (uint64_t *)&unk_100618730);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = a3;
  v9[4] = sub_1003EDD30;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100429F8C;
  v9[3] = &unk_1005C5698;
  v7 = _Block_copy(v9);
  swift_unknownObjectRetain_n();
  v8 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (id)accessibilityItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover28DOCItemCollectionCellContent_node);
  swift_beginAccess();
  id v3 = *v2;
  if (*v2) {
    id v3 = objc_msgSend(v3, "fpfs_fpItem");
  }
  return v3;
}

- (BOOL)accessibilityIsFolder
{
  v2 = self;
  unsigned __int8 v3 = sub_1003E9108();

  return v3 & 1;
}

- (BOOL)accessibilityShouldDim
{
  return sub_1003E711C() & 1;
}

- (_TtC17RecentsAppPopover28DOCItemCollectionCellContent)init
{
  return (_TtC17RecentsAppPopover28DOCItemCollectionCellContent *)DOCItemCollectionCellContent.init()();
}

@end