@interface HKFHIRAttachmentContentExtractor
- (HKFHIRAttachmentContentExtractor)init;
- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4;
@end

@implementation HKFHIRAttachmentContentExtractor

- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_233044104(v5);

  return v7;
}

- (HKFHIRAttachmentContentExtractor)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKFHIRAttachmentContentExtractor____lazy_storage___decoder) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FHIRAttachmentContentExtractor();
  return [(HKFHIRAttachmentContentExtractor *)&v3 init];
}

- (void).cxx_destruct
{
}

@end