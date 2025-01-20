@interface DUIngestableFiletypes
+ (BOOL)isFileURLSupported:(id)a3;
+ (NSArray)emlFileExtensions;
+ (NSArray)iWorkFileExtensions;
+ (NSArray)jsonFileExtensions;
+ (NSArray)officeFileExtensions;
+ (NSArray)pdfFileExtensions;
+ (NSArray)supportedFileExtensions;
+ (NSArray)supportedUTTypes;
+ (NSArray)txtFileExtensions;
+ (NSArray)wrappedSupportedUTTypes;
+ (NSString)icloudFileExtension;
- (_TtC27DocumentUnderstandingClient21DUIngestableFiletypes)init;
@end

@implementation DUIngestableFiletypes

+ (NSArray)supportedUTTypes
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.supportedUTTypes.getter);
}

+ (NSArray)wrappedSupportedUTTypes
{
  static DUIngestableFiletypes.wrappedSupportedUTTypes.getter();
  sub_24CF7EA28();
  v2 = (void *)sub_24CF7EA68();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (NSArray)supportedFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.supportedFileExtensions.getter);
}

+ (BOOL)isFileURLSupported:(id)a3
{
  uint64_t v3 = sub_24CF7E918();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CF7E908();
  char v7 = static DUIngestableFiletypes.isFileURLSupported(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (NSString)icloudFileExtension
{
  v2 = (void *)sub_24CF7EA48();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSArray)officeFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.officeFileExtensions.getter);
}

+ (NSArray)iWorkFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.iWorkFileExtensions.getter);
}

+ (NSArray)pdfFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.pdfFileExtensions.getter);
}

+ (NSArray)jsonFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.jsonFileExtensions.getter);
}

+ (NSArray)txtFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.txtFileExtensions.getter);
}

+ (NSArray)emlFileExtensions
{
  return (NSArray *)sub_24CF79A0C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static DUIngestableFiletypes.emlFileExtensions.getter);
}

- (_TtC27DocumentUnderstandingClient21DUIngestableFiletypes)init
{
  return (_TtC27DocumentUnderstandingClient21DUIngestableFiletypes *)DUIngestableFiletypes.init()();
}

@end