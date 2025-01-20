@interface DOCItemCollectionCellContent
- (BOOL)accessibilityIsFolder;
- (BOOL)accessibilityShouldDim;
- (_TtC11SaveToFiles28DOCItemCollectionCellContent)init;
- (id)accessibilityItem;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCItemCollectionCellContent

- (void)dealloc
{
  v2 = self;
  sub_1003F3330();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionCellContent();
  [(DOCItemCollectionCellContent *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1000342C0((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v3, (uint64_t *)&unk_100634830);
  sub_1000DAD28(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000C363C);
  sub_1000342C0((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_listItemLayoutTraits, (uint64_t)v4, (uint64_t *)&unk_10062ADD0);
  sub_1000DA290(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000C3784);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent__traitCollection));
  swift_unknownObjectRelease();
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_sortingDescriptor, (uint64_t *)&unk_100630E00);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_loadingProgress));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_observedProgress));
  sub_10003B980(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_thumbnailUpdateBlock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_thumbnailUpdateLock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_trailingAttachmentcolor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent__suffixColor));
  sub_1000342C0((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent__titleWithTags, (uint64_t)v5, (uint64_t *)&unk_100634850);
  sub_1003FDCCC(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1001F0C98);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent__titleWithIconAndTags));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_delegate);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1004D1240();
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
  sub_1004D29A0();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1003FDC74(&qword_10062B888, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)sub_1004D1090();

LABEL_8:
  DOCItemCollectionCellContent.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003D810((uint64_t)v18, &qword_10062D740);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = a3;
  v9[4] = sub_1003FE044;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100053418;
  v9[3] = &unk_1005D9D68;
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
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles28DOCItemCollectionCellContent_node);
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
  unsigned __int8 v3 = sub_1003F9398();

  return v3 & 1;
}

- (BOOL)accessibilityShouldDim
{
  return sub_1003F7458() & 1;
}

- (_TtC11SaveToFiles28DOCItemCollectionCellContent)init
{
  return (_TtC11SaveToFiles28DOCItemCollectionCellContent *)DOCItemCollectionCellContent.init()();
}

@end