@interface BlastDoorLargeImage
- (BlastDoorLargeImage)init;
- (BlastDoorMachImage)image;
- (BlastDoorMediaMetadata)metadata;
- (NSString)description;
@end

@implementation BlastDoorLargeImage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for LargeImage, &OBJC_IVAR___BlastDoorLargeImage_largeImage, type metadata accessor for LargeImage);
}

- (BlastDoorMachImage)image
{
  uint64_t v3 = type metadata accessor for LargeImage(0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorLargeImage_largeImage, (uint64_t)v5, type metadata accessor for LargeImage);
  uint64_t v6 = *v5;
  v7 = self;
  swift_retain();
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for LargeImage);
  v8 = (objc_class *)type metadata accessor for _ObjCMachImageWrapper();
  v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR___BlastDoorMachImage_image] = v6;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = [(BlastDoorLargeImage *)&v12 init];

  return (BlastDoorMachImage *)v10;
}

- (BlastDoorMediaMetadata)metadata
{
  uint64_t v3 = type metadata accessor for MediaMetadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___BlastDoorLargeImage_largeImage;
  uint64_t v7 = type metadata accessor for LargeImage(0);
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
  v8 = (objc_class *)type metadata accessor for _ObjCMediaMetadataWrapper(0);
  id v9 = objc_allocWithZone(v8);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = [(BlastDoorLargeImage *)&v13 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MediaMetadata);

  return (BlastDoorMediaMetadata *)v11;
}

- (BlastDoorLargeImage)init
{
  result = (BlastDoorLargeImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end