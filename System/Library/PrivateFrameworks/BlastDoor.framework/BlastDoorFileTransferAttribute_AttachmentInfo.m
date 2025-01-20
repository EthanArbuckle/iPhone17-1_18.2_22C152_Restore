@interface BlastDoorFileTransferAttribute_AttachmentInfo
- (BlastDoorFileTransferAttribute_AttachmentInfo)init;
- (NSString)description;
- (NSString)encryptionKey;
- (NSString)ownerID;
- (NSString)signature;
- (NSURL)attachmentURL;
- (unint64_t)expectedFileSize;
@end

@implementation BlastDoorFileTransferAttribute_AttachmentInfo

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for FileTransferAttribute.AttachmentInfo, &OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (NSURL)attachmentURL
{
  return (NSURL *)sub_1B17A61FC(self, (uint64_t)a2, (void (*)(void))sub_1B17A62FC);
}

- (NSString)signature
{
  return (NSString *)sub_1B17A6550((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, (void (*)(void))type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (NSString)ownerID
{
  return (NSString *)sub_1B17A664C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, (void (*)(void))type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (unint64_t)expectedFileSize
{
  return sub_1B17A6748((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorFileTransferAttribute_AttachmentInfo_fileTransferAttribute_AttachmentInfo, type metadata accessor for FileTransferAttribute.AttachmentInfo);
}

- (NSString)encryptionKey
{
  type metadata accessor for FileTransferAttribute.AttachmentInfo(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorFileTransferAttribute_AttachmentInfo)init
{
  result = (BlastDoorFileTransferAttribute_AttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end