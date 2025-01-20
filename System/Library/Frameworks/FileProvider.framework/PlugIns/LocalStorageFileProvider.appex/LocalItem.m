@interface LocalItem
- (BOOL)fp_isContainer;
- (BOOL)fp_isUbiquitous;
- (BOOL)isDownloadedTestingImpl;
- (BOOL)isExcludedFromSync;
- (BOOL)isTrashed;
- (BOOL)isUploadedTestingImpl;
- (NSArray)conflictingVersions;
- (NSData)originatorInfo;
- (NSData)tagData;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)extendedAttributes;
- (NSFileProviderItemVersion)itemVersion;
- (NSFileProviderTypeAndCreator)typeAndCreator;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSNumber)hasUnresolvedConflicts;
- (NSPersonNameComponents)mostRecentEditorNameComponents;
- (NSString)description;
- (NSString)filename;
- (NSString)fp_appContainerBundleIdentifier;
- (NSString)fp_spotlightSubDomainIdentifier;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)symlinkTargetPath;
- (NSURL)fileURL;
- (UTType)contentType;
- (_TtC24LocalStorageFileProvider9LocalItem)init;
- (unint64_t)capabilities;
- (unint64_t)fileID;
- (unint64_t)fileSystemFlags;
- (void)setFileID:(unint64_t)a3;
- (void)setFileURL:(id)a3;
@end

@implementation LocalItem

- (NSArray)conflictingVersions
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_conflictingVersions))
  {
    sub_100011348(0, &qword_100ACBC40);
    swift_bridgeObjectRetain();
    v2.super.isa = sub_10096C080().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (NSDictionary)extendedAttributes
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10096B9A0().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (NSString)filename
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UTType)contentType
{
  v2.super.isa = sub_10096B2C0().super.isa;

  return (UTType *)v2.super.isa;
}

- (NSString)description
{
  UTType v2 = self;
  sub_100006AA8();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSNumber)hasUnresolvedConflicts
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_conflictingVersions)) {
    unint64_t v3 = *(unint64_t *)((char *)&self->super.isa
  }
                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_conflictingVersions);
  else {
    unint64_t v3 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  if (v3 >> 62)
  {
    v8 = self;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Swift::Int v4 = sub_10096CE70();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v5 = self;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  sub_100011348(0, (unint64_t *)&qword_100ACB6E0);
  v6.super.super.isa = sub_10096C810(v4).super.super.isa;

  return (NSNumber *)v6.super.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_parentItemIdentifier));
  swift_bridgeObjectRelease();
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_contentType;
  uint64_t v4 = sub_10096B370();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_creationDate, (uint64_t *)&unk_100ACB5E0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_contentModificationDate, (uint64_t *)&unk_100ACB5E0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_lastUsedDate, (uint64_t *)&unk_100ACB5E0);
  sub_10001E9AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_tagData), *(void *)&self->fileID[OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_tagData]);

  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_mostRecentEditorNameComponents, &qword_100ACB908);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileURL, &qword_100ACA8C0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001E9AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_originatorInfo), *(void *)&self->fileID[OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_originatorInfo]);
  sub_1000288B8((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_domain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem____lazy_storage___containerItem);

  sub_10002D240(v5);
}

- (NSFileProviderTypeAndCreator)typeAndCreator
{
  return *(NSFileProviderTypeAndCreator *)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_typeAndCreator);
}

- (BOOL)isTrashed
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_isTrashed);
}

- (NSData)tagData
{
  return (NSData *)sub_10002B94C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_tagData);
}

- (NSURL)fileURL
{
  return (NSURL *)sub_1000089FC((uint64_t)self, (uint64_t)a2, &qword_100ACA8C0, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileURL, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (unint64_t)fileID
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileID);
}

- (NSString)fp_spotlightSubDomainIdentifier
{
  return (NSString *)sub_10002B9D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fp_spotlightSubDomainIdentifier);
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  return (NSPersonNameComponents *)sub_1000089FC((uint64_t)self, (uint64_t)a2, &qword_100ACB908, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_mostRecentEditorNameComponents, (uint64_t (*)(void))&type metadata accessor for PersonNameComponents, (uint64_t (*)(void))&PersonNameComponents._bridgeToObjectiveC());
}

- (NSDate)contentModificationDate
{
  return (NSDate *)sub_1000089FC((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_100ACB5E0, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_contentModificationDate, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (BOOL)isExcludedFromSync
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_isExcludedFromSync);
}

- (NSString)symlinkTargetPath
{
  return (NSString *)sub_10002B9D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_symlinkTargetPath);
}

- (BOOL)fp_isUbiquitous
{
  return 0;
}

- (unint64_t)fileSystemFlags
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileSystemFlags);
}

- (NSData)originatorInfo
{
  return (NSData *)sub_10002B94C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_originatorInfo);
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_itemIdentifier));
}

- (BOOL)fp_isContainer
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fp_isContainer);
}

- (NSDate)lastUsedDate
{
  return (NSDate *)sub_1000089FC((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_100ACB5E0, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_lastUsedDate, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (NSNumber)favoriteRank
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_favoriteRank));
}

- (NSNumber)documentSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_documentSize));
}

- (NSDate)creationDate
{
  return (NSDate *)sub_1000089FC((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_100ACB5E0, &OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_creationDate, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (unint64_t)capabilities
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_capabilities);
}

- (NSFileProviderItemVersion)itemVersion
{
  return (NSFileProviderItemVersion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_itemVersion));
}

- (NSString)parentItemIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_parentItemIdentifier));
}

- (NSNumber)childItemCount
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_childItemCount));
}

- (void)setFileID:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileID) = (Class)a3;
}

- (BOOL)isUploadedTestingImpl
{
  return 1;
}

- (BOOL)isDownloadedTestingImpl
{
  return 1;
}

- (void)setFileURL:(id)a3
{
  uint64_t v5 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_10096ADD0();
    uint64_t v8 = sub_10096AE50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_10096AE50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_1000148B8((uint64_t)v7, (uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fileURL, &qword_100ACA8C0);
}

- (NSString)fp_appContainerBundleIdentifier
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fp_isContainer) == 1
    && *(void *)&self->fileID[OBJC_IVAR____TtC24LocalStorageFileProvider9LocalItem_fp_spotlightSubDomainIdentifier])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_10096BC00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (_TtC24LocalStorageFileProvider9LocalItem)init
{
  result = (_TtC24LocalStorageFileProvider9LocalItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end