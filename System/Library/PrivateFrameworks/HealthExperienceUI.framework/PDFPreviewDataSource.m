@interface PDFPreviewDataSource
- (_TtC18HealthExperienceUI20PDFPreviewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
@end

@implementation PDFPreviewDataSource

- (_TtC18HealthExperienceUI20PDFPreviewDataSource)init
{
  return (_TtC18HealthExperienceUI20PDFPreviewDataSource *)PDFPreviewDataSource.init()();
}

- (void).cxx_destruct
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result = (*(void **)((char *)&self->super.isa
                       + OBJC_IVAR____TtC18HealthExperienceUI20PDFPreviewDataSource_previewImages))[3];
  if (result) {
    return (int64_t)objc_msgSend((id)result, sel_pageCount, a3, a4);
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)PDFPreviewDataSource.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end