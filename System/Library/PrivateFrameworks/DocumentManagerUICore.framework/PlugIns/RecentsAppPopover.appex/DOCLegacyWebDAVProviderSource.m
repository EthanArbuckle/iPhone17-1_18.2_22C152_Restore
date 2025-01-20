@interface DOCLegacyWebDAVProviderSource
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)dealloc;
@end

@implementation DOCLegacyWebDAVProviderSource

- (void)dealloc
{
  v3 = *(void **)&self->super.DOCDocumentSource_opaque[OBJC_IVAR____TtC17RecentsAppPopover29DOCLegacyWebDAVProviderSource_rootItemCollection];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  aBlock[4] = sub_10025242C;
  aBlock[5] = v4;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100429F8C;
  aBlock[3] = &unk_1005B55E0;
  v5 = _Block_copy(aBlock);
  id v6 = v3;
  v7 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v5);

  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for DOCLegacyWebDAVProviderSource();
  [(DOCLegacyWebDAVProviderSource *)&v8 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.DOCDocumentSource_opaque[OBJC_IVAR____TtC17RecentsAppPopover29DOCLegacyWebDAVProviderSource_fileManager];
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100252188("WebDAV collection was reloaded. Setting is ejectable to true");
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  objc_super v8 = self;
  sub_100252188("WebDAV collection was updated. Setting is ejectable to true");
  _Block_release(v6);
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1002522F0();
}

@end