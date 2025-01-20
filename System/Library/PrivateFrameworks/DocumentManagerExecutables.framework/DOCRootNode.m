@interface DOCRootNode
- (BOOL)isActionable;
- (BOOL)isCloudItem;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isExternalDownloadPlaceholder;
- (BOOL)isPending;
- (BOOL)isReadable;
- (BOOL)isRootItem;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (BOOL)isWritable;
- (FPItem)fpfs_fpItem;
- (FPProviderDomain)fpDomain;
- (NSDate)dateForSortingByRecents;
- (NSDate)doc_lastUsedDate;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSNumber)fileSize;
- (NSProgress)copyingProgress;
- (NSProgress)downloadingProgress;
- (NSProgress)uploadingProgress;
- (NSString)filename;
- (NSString)providerDomainID;
- (NSString)providerID;
- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithCoder:(id)a3;
- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithSubject:(id)a3;
- (id)identifier;
- (int64_t)_doc_fileTypeCompare:(id)a3;
- (int64_t)localizedStandardTagsCompareNode:(id)a3;
@end

@implementation DOCRootNode

- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithSubject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain) = 0;
  id v4 = a3;

  result = (_TtC26DocumentManagerExecutables11DOCRootNode *)sub_22BE93778();
  __break(1u);
  return result;
}

- (_TtC26DocumentManagerExecutables11DOCRootNode)initWithCoder:(id)a3
{
  return (_TtC26DocumentManagerExecutables11DOCRootNode *)sub_22BDFABA4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain, (void (*)(void))type metadata accessor for DOCRootNode);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain));
}

- (id)identifier
{
  v2 = self;
  id v3 = [(FIProxyNode *)v2 source];
  id v4 = objc_msgSend(v3, sel_identifier);

  sub_22BE934B8();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  v5 = (void *)sub_22BE938B8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);

  return v5;
}

- (FPItem)fpfs_fpItem
{
  return (FPItem *)sub_22BDFB708(self, (uint64_t)a2, (SEL *)&selRef_fpfs_fpItem);
}

- (NSNumber)fileSize
{
  return (NSNumber *)sub_22BDFB708(self, (uint64_t)a2, (SEL *)&selRef_fileSize);
}

- (FPProviderDomain)fpDomain
{
  return (FPProviderDomain *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC26DocumentManagerExecutables11DOCRootNode_domain));
}

- (NSString)providerDomainID
{
  return (NSString *)sub_22BDFAF04((char *)self, (uint64_t)a2, (SEL *)&selRef_identifier);
}

- (NSString)providerID
{
  return (NSString *)sub_22BDFAF04((char *)self, (uint64_t)a2, (SEL *)&selRef_providerID);
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)sub_22BDFB038(self, (uint64_t)a2, (SEL *)&selRef_doc_lastUsedDate);
}

- (NSDate)dateForSortingByRecents
{
  return (NSDate *)sub_22BDFB038(self, (uint64_t)a2, (SEL *)&selRef_dateForSortingByRecents);
}

- (NSString)filename
{
  v2 = self;
  id v3 = [(FIProxyNode *)v2 source];
  id v4 = objc_msgSend(v3, sel_filename);

  sub_22BE92CD8();
  v5 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (BOOL)isActionable
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isActionable);
}

- (BOOL)isReadable
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isReadable);
}

- (BOOL)isWritable
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isWritable);
}

- (BOOL)isPending
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isPending);
}

- (BOOL)isExternalDownloadPlaceholder
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isExternalDownloadPlaceholder);
}

- (BOOL)isCloudItem
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isCloudItem);
}

- (BOOL)isRootItem
{
  return 1;
}

- (BOOL)isDownloading
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isDownloading);
}

- (BOOL)isDownloaded
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isDownloaded);
}

- (NSProgress)downloadingProgress
{
  return (NSProgress *)sub_22BDFB708(self, (uint64_t)a2, (SEL *)&selRef_downloadingProgress);
}

- (NSError)downloadingError
{
  return (NSError *)sub_22BDFB65C(self, (uint64_t)a2, (SEL *)&selRef_downloadingError);
}

- (BOOL)isUploading
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isUploading);
}

- (BOOL)isUploaded
{
  return sub_22BDFB57C(self, (uint64_t)a2, (SEL *)&selRef_isUploaded);
}

- (NSProgress)uploadingProgress
{
  return (NSProgress *)sub_22BDFB708(self, (uint64_t)a2, (SEL *)&selRef_uploadingProgress);
}

- (NSError)uploadingError
{
  return (NSError *)sub_22BDFB65C(self, (uint64_t)a2, (SEL *)&selRef_uploadingError);
}

- (NSProgress)copyingProgress
{
  return (NSProgress *)sub_22BDFB708(self, (uint64_t)a2, (SEL *)&selRef_copyingProgress);
}

- (int64_t)localizedStandardTagsCompareNode:(id)a3
{
  return (int64_t)sub_22BDFB874(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

- (int64_t)_doc_fileTypeCompare:(id)a3
{
  return (int64_t)sub_22BDFB874(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef__doc_fileTypeCompare_);
}

@end