@interface VisionPrescriptionViewAttachmentItem
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
@end

@implementation VisionPrescriptionViewAttachmentItem

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21VisionHealthAppPlugin36VisionPrescriptionViewAttachmentItem_attachments);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v5 = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  int64_t v6 = sub_241DAB0A0();

  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5 = a3;
  swift_retain();
  id v6 = sub_241D418E8(a4);

  swift_release();

  return v6;
}

@end