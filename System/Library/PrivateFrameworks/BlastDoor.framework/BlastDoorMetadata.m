@interface BlastDoorMetadata
- (BOOL)has_timestamp;
- (BOOL)wantsCheckpointing;
- (BOOL)wantsDeliveryReceipt;
- (BlastDoorMetadata)init;
- (BlastDoorMetadata_StorageContext)storageContext;
- (NSString)description;
- (NSUUID)messageGUID;
- (unint64_t)timestamp;
@end

@implementation BlastDoorMetadata

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
}

- (NSUUID)messageGUID
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B1969EE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v10 = (void *)sub_1B1969EB0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (NSUUID *)v10;
}

- (BOOL)has_timestamp
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  return (v2[*(int *)(type metadata accessor for Metadata() + 20) + 8] & 1) == 0;
}

- (unint64_t)timestamp
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for Metadata() + 20)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)wantsDeliveryReceipt
{
  return sub_1B178E198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
}

- (BOOL)wantsCheckpointing
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  return v2[*(int *)(type metadata accessor for Metadata() + 28)];
}

- (BlastDoorMetadata_StorageContext)storageContext
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for Metadata() + 32)];
  char v4 = *v3;
  char v5 = v3[1];
  uint64_t v6 = (objc_class *)type metadata accessor for _ObjCMetadata_StorageContextWrapper();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext];
  *uint64_t v8 = v4;
  v8[1] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  v9 = [(BlastDoorMetadata *)&v11 init];
  return (BlastDoorMetadata_StorageContext *)v9;
}

- (BlastDoorMetadata)init
{
  result = (BlastDoorMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end