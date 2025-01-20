@interface DOCICloudRootNode
- (BOOL)isActionable;
- (BOOL)isCloudItem;
- (BOOL)isContainer;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isExternalDownloadPlaceholder;
- (BOOL)isFolder;
- (BOOL)isPending;
- (BOOL)isReadable;
- (BOOL)isRootItem;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (BOOL)isWritable;
- (FPItem)fpfs_fpItem;
- (NSArray)itemDecorations;
- (NSArray)tags;
- (NSDate)creationDate;
- (NSDate)dateForSortingByRecents;
- (NSDate)doc_creationDate;
- (NSDate)doc_lastUsedDate;
- (NSDate)modificationDate;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSNumber)childItemCount;
- (NSNumber)fileSize;
- (NSPersonNameComponents)ownerNameComponents;
- (NSProgress)copyingProgress;
- (NSProgress)downloadingProgress;
- (NSProgress)uploadingProgress;
- (NSString)displayName;
- (NSString)filename;
- (NSString)providerDomainID;
- (NSString)providerID;
- (NSString)typeIdentifier;
- (NSURL)fileURL;
- (UTType)contentType;
- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)init;
- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)initWithCoder:(id)a3;
- (id)identifier;
- (int64_t)_doc_fileTypeCompare:(id)a3;
- (int64_t)localizedStandardTagsCompareNode:(id)a3;
@end

@implementation DOCICloudRootNode

- (NSString)providerDomainID
{
  return (NSString *)sub_22BDCFD78((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_providerDomainID, (SEL *)&selRef_identifier);
}

- (BOOL)isRootItem
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode));
  sub_22BDE0E58(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain);
}

- (NSString)displayName
{
  v2 = self;
  DOCICloudRootNode.displayName.getter();

  v3 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (FPItem)fpfs_fpItem
{
  return (FPItem *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_fpfs_fpItem);
}

- (BOOL)isFolder
{
  return sub_22BDE21CC((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isFolder);
}

- (NSURL)fileURL
{
  return (NSURL *)sub_22BDC94B8(self, (uint64_t)a2, (uint64_t *)&unk_26AEFFB10, (void (*)(void))DOCICloudRootNode.fileURL.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (BOOL)isContainer
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isContainer);
}

- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC26DocumentManagerExecutables17DOCICloudRootNode)init
{
  result = (_TtC26DocumentManagerExecutables17DOCICloudRootNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)identifier
{
  v2 = self;
  DOCICloudRootNode.identifier.getter((uint64_t)v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_22BE938B8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);

  return v3;
}

- (UTType)contentType
{
  return (UTType *)sub_22BE8D258(self, (uint64_t)a2, MEMORY[0x263F8F3A0], (void (*)(void))DOCICloudRootNode.contentType.getter, MEMORY[0x263F8F378]);
}

- (NSString)typeIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    id v4 = objc_msgSend(v2, sel_typeIdentifier);
    sub_22BE92CD8();
  }
  v5 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSNumber)fileSize
{
  return (NSNumber *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_fileSize);
}

- (NSNumber)childItemCount
{
  return (NSNumber *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_childItemCount);
}

- (NSString)providerID
{
  return (NSString *)sub_22BDCFD78((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_providerID, (SEL *)&selRef_providerID);
}

- (NSDate)creationDate
{
  return (NSDate *)sub_22BE8D258(self, (uint64_t)a2, MEMORY[0x263F07490], (void (*)(void))DOCICloudRootNode.creationDate.getter, MEMORY[0x263F073A8]);
}

- (NSDate)doc_creationDate
{
  return (NSDate *)sub_22BDC94B8(self, (uint64_t)a2, &qword_26AEFFB20, (void (*)(void))DOCICloudRootNode.doc_creationDate.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (NSDate)modificationDate
{
  return (NSDate *)sub_22BDC94B8(self, (uint64_t)a2, &qword_26AEFFB20, (void (*)(void))DOCICloudRootNode.modificationDate.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)sub_22BDC94B8(self, (uint64_t)a2, &qword_26AEFFB20, (void (*)(void))DOCICloudRootNode.doc_lastUsedDate.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (NSDate)dateForSortingByRecents
{
  return (NSDate *)sub_22BDC94B8(self, (uint64_t)a2, &qword_26AEFFB20, (void (*)(void))DOCICloudRootNode.dateForSortingByRecents.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (NSString)filename
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    id v4 = objc_msgSend(v2, sel_filename);
    sub_22BE92CD8();
  }
  v5 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (BOOL)isActionable
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isActionable);
}

- (BOOL)isReadable
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isReadable);
}

- (BOOL)isWritable
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isWritable);
}

- (BOOL)isPending
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isPending);
}

- (BOOL)isExternalDownloadPlaceholder
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isExternalDownloadPlaceholder);
}

- (BOOL)isCloudItem
{
  return sub_22BDE21CC((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isCloudItem);
}

- (BOOL)isTrashed
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isTrashed);
}

- (BOOL)isDownloading
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isDownloading);
}

- (BOOL)isDownloaded
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isDownloaded);
}

- (NSProgress)downloadingProgress
{
  return (NSProgress *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_downloadingProgress);
}

- (NSError)downloadingError
{
  return (NSError *)sub_22BE8DA50((char *)self, (uint64_t)a2, (SEL *)&selRef_downloadingError);
}

- (BOOL)isUploading
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isUploading);
}

- (BOOL)isUploaded
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isUploaded);
}

- (NSProgress)uploadingProgress
{
  return (NSProgress *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_uploadingProgress);
}

- (NSError)uploadingError
{
  return (NSError *)sub_22BE8DA50((char *)self, (uint64_t)a2, (SEL *)&selRef_uploadingError);
}

- (NSProgress)copyingProgress
{
  return (NSProgress *)sub_22BDCE908((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_copyingProgress);
}

- (BOOL)isShared
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isShared);
}

- (BOOL)isSharedByCurrentUser
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isSharedByCurrentUser);
}

- (BOOL)isTopLevelSharedItem
{
  return sub_22BDE227C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_isTopLevelSharedItem);
}

- (NSPersonNameComponents)ownerNameComponents
{
  return (NSPersonNameComponents *)sub_22BDC94B8(self, (uint64_t)a2, &qword_26AEFFB08, (void (*)(void))DOCICloudRootNode.ownerNameComponents.getter, MEMORY[0x263F06A30], MEMORY[0x263F06A20]);
}

- (NSArray)itemDecorations
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    id v4 = (_TtC26DocumentManagerExecutables17DOCICloudRootNode *)objc_msgSend(v2, sel_itemDecorations);
    if (v4)
    {
      v5 = v4;
      sub_22BDD9D50(0, &qword_268487118);
      sub_22BE92EB8();

      v3 = v5;
    }
  }
  else
  {
    v3 = self;
  }

  sub_22BDD9D50(0, &qword_268487118);
  v6 = (void *)sub_22BE92EA8();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (NSArray)tags
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v2)
  {
    v3 = self;
    id v4 = objc_msgSend(v2, sel_tags);
    if (v4)
    {
      v5 = v4;
      sub_22BDD9D50(0, (unint64_t *)&unk_2684880C0);
      sub_22BE92EB8();

      v6 = (void *)sub_22BE92EA8();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:

  return (NSArray *)v6;
}

- (int64_t)localizedStandardTagsCompareNode:(id)a3
{
  return (int64_t)sub_22BE8DF90((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

- (int64_t)_doc_fileTypeCompare:(id)a3
{
  return (int64_t)sub_22BE8DF90((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef__doc_fileTypeCompare_);
}

@end