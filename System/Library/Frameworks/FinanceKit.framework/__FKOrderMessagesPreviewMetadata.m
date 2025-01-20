@interface __FKOrderMessagesPreviewMetadata
+ (id)createWalletDeepLinkForExistingOrderAt:(id)a3;
- (CGColor)backgroundColor;
- (__FKOrderMessagesPreviewMetadata)init;
- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 error:(id *)a4;
- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5;
- (__FKOrderMessagesPreviewMetadataImage)image;
- (__FKOrderMessagesPreviewMetadataText)primaryText;
- (__FKOrderMessagesPreviewMetadataText)secondaryText;
- (__FKOrderMessagesPreviewMetadataText)tertiaryText;
@end

@implementation __FKOrderMessagesPreviewMetadata

- (__FKOrderMessagesPreviewMetadataImage)image
{
  return (__FKOrderMessagesPreviewMetadataImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_image));
}

- (CGColor)backgroundColor
{
  return (CGColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_backgroundColor));
}

- (__FKOrderMessagesPreviewMetadataText)primaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_primaryText));
}

- (__FKOrderMessagesPreviewMetadataText)secondaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_secondaryText));
}

- (__FKOrderMessagesPreviewMetadataText)tertiaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_tertiaryText));
}

- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_2439570C0();
  unint64_t v7 = v6;

  v8 = (__FKOrderMessagesPreviewMetadata *)sub_2434E8E30();
  sub_2433807F0(v5, v7);
  return v8;
}

- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_243957010();
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = sub_2439570C0();
  unint64_t v14 = v13;

  sub_243956F90();
  return (__FKOrderMessagesPreviewMetadata *)OrderMessagesPreviewMetadata.init(orderData:workingDirectory:)(v12, v14, (uint64_t)v9);
}

+ (id)createWalletDeepLinkForExistingOrderAt:(id)a3
{
  uint64_t v3 = sub_243957010();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C98A0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243956F90();
  if (qword_26B0C5770 != -1) {
    swift_once();
  }
  sub_2434E8180((uint64_t)v6, (uint64_t)off_26B0C5E08, (uint64_t)&type metadata for DeviceInfo, (uint64_t)&protocol witness table for DeviceInfo, (uint64_t)v9);
  id v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = (void *)sub_243956F00();
    v10(v9, v3);
  }

  return v11;
}

- (__FKOrderMessagesPreviewMetadata)init
{
  result = (__FKOrderMessagesPreviewMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_tertiaryText);
}

@end