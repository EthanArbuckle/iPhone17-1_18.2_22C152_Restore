@interface FPXEnumeratorAlternateContentsItem
- (BOOL)fp_isLastModifiedByCurrentUser;
- (BOOL)isCollaborationInvitation;
- (BOOL)isContainer;
- (BOOL)isContainerPristine;
- (BOOL)isContentZoneRoot;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isMostRecentVersionDownloaded;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (FPXEnumeratorAlternateContentsItem)initWithOriginalDocumentItem:(id)a3 alternateContentsURL:(id)a4;
- (NSArray)decorations;
- (NSData)tagData;
- (NSData)versionIdentifier;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)userInfo;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSFileProviderItemVersion)itemVersion;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSNumber)hasUnresolvedConflicts;
- (NSNumber)isDownloadRequested;
- (NSPersonNameComponents)mostRecentEditorNameComponents;
- (NSPersonNameComponents)ownerNameComponents;
- (NSString)containerDisplayName;
- (NSString)displayName;
- (NSString)filename;
- (NSString)fp_domainIdentifier;
- (NSString)fp_spotlightDomainIdentifier;
- (NSString)fp_spotlightSubDomainIdentifier;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)sharingPermissions;
- (NSString)typeIdentifier;
- (UTType)contentType;
- (id)cloudContainerIdentifier;
- (id)collaborationIdentifier;
- (id)providerID;
- (unint64_t)capabilities;
@end

@implementation FPXEnumeratorAlternateContentsItem

- (FPXEnumeratorAlternateContentsItem)initWithOriginalDocumentItem:(id)a3 alternateContentsURL:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FPXEnumeratorAlternateContentsItem;
  v9 = [(FPXEnumeratorAlternateContentsItem *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentItem, a3);
    uint64_t v11 = *MEMORY[0x1E4F1C530];
    v21[0] = *MEMORY[0x1E4F1C5F8];
    v21[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    int v13 = [v8 startAccessingSecurityScopedResource];
    id v19 = 0;
    v14 = [v8 resourceValuesForKeys:v12 error:&v19];
    id v15 = v19;
    if (v13) {
      [v8 stopAccessingSecurityScopedResource];
    }
    if (v14)
    {
      v16 = v14;
      p_super = &v10->_resourceValues->super;
      v10->_resourceValues = v16;
    }
    else
    {
      p_super = fp_current_or_default_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[FPXEnumeratorAlternateContentsItem initWithOriginalDocumentItem:alternateContentsURL:]((uint64_t)v8, v15, p_super);
      }
    }
  }
  return v10;
}

- (NSString)itemIdentifier
{
  return [(FPItem *)self->_documentItem itemIdentifier];
}

- (NSString)parentItemIdentifier
{
  return [(FPItem *)self->_documentItem parentItemIdentifier];
}

- (NSString)filename
{
  return [(FPItem *)self->_documentItem filename];
}

- (NSString)typeIdentifier
{
  return [(FPItem *)self->_documentItem typeIdentifier];
}

- (UTType)contentType
{
  return [(FPItem *)self->_documentItem contentType];
}

- (unint64_t)capabilities
{
  return [(FPItem *)self->_documentItem capabilities];
}

- (NSString)displayName
{
  return [(FPItem *)self->_documentItem displayName];
}

- (NSNumber)childItemCount
{
  return [(FPItem *)self->_documentItem childItemCount];
}

- (NSDate)creationDate
{
  return [(FPItem *)self->_documentItem creationDate];
}

- (NSDate)lastUsedDate
{
  return [(FPItem *)self->_documentItem lastUsedDate];
}

- (NSData)tagData
{
  return [(FPItem *)self->_documentItem tagData];
}

- (NSNumber)favoriteRank
{
  return [(FPItem *)self->_documentItem favoriteRank];
}

- (BOOL)isTrashed
{
  return [(FPItem *)self->_documentItem isTrashed];
}

- (BOOL)isUploaded
{
  return [(FPItem *)self->_documentItem isUploaded];
}

- (BOOL)isUploading
{
  return [(FPItem *)self->_documentItem isUploading];
}

- (NSError)uploadingError
{
  return [(FPItem *)self->_documentItem uploadingError];
}

- (BOOL)isDownloaded
{
  return [(FPItem *)self->_documentItem isDownloaded];
}

- (BOOL)isDownloading
{
  return [(FPItem *)self->_documentItem isDownloading];
}

- (NSError)downloadingError
{
  return [(FPItem *)self->_documentItem downloadingError];
}

- (BOOL)isMostRecentVersionDownloaded
{
  return [(FPItem *)self->_documentItem isMostRecentVersionDownloaded];
}

- (BOOL)isShared
{
  return [(FPItem *)self->_documentItem isShared];
}

- (BOOL)isSharedByCurrentUser
{
  return [(FPItem *)self->_documentItem isSharedByCurrentUser];
}

- (id)collaborationIdentifier
{
  return [(FPItem *)self->_documentItem collaborationIdentifier];
}

- (BOOL)isCollaborationInvitation
{
  return [(FPItem *)self->_documentItem isCollaborationInvitation];
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  return [(FPItem *)self->_documentItem fp_isLastModifiedByCurrentUser];
}

- (NSPersonNameComponents)ownerNameComponents
{
  return [(FPItem *)self->_documentItem ownerNameComponents];
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  return [(FPItem *)self->_documentItem mostRecentEditorNameComponents];
}

- (NSDictionary)userInfo
{
  return [(FPItem *)self->_documentItem userInfo];
}

- (NSArray)decorations
{
  return [(FPItem *)self->_documentItem decorations];
}

- (BOOL)isTopLevelSharedItem
{
  return [(FPItem *)self->_documentItem isTopLevelSharedItem];
}

- (NSData)versionIdentifier
{
  return [(FPItem *)self->_documentItem versionIdentifier];
}

- (NSFileProviderItemVersion)itemVersion
{
  return [(FPItem *)self->_documentItem itemVersion];
}

- (NSNumber)hasUnresolvedConflicts
{
  return [(FPItem *)self->_documentItem hasUnresolvedConflicts];
}

- (NSString)containerDisplayName
{
  return [(FPItem *)self->_documentItem containerDisplayName];
}

- (NSNumber)isDownloadRequested
{
  return [(FPItem *)self->_documentItem isDownloadRequested];
}

- (id)providerID
{
  return [(FPItem *)self->_documentItem providerID];
}

- (NSString)sharingPermissions
{
  return [(FPItem *)self->_documentItem sharingPermissions];
}

- (NSString)fp_spotlightDomainIdentifier
{
  return (NSString *)[(FPItem *)self->_documentItem fp_spotlightDomainIdentifier];
}

- (NSString)fp_spotlightSubDomainIdentifier
{
  return [(FPItem *)self->_documentItem fp_spotlightSubDomainIdentifier];
}

- (NSString)fp_domainIdentifier
{
  return [(FPItem *)self->_documentItem fp_domainIdentifier];
}

- (BOOL)isContainer
{
  return [(FPItem *)self->_documentItem isContainer];
}

- (BOOL)isContainerPristine
{
  return [(FPItem *)self->_documentItem isContainerPristine];
}

- (id)cloudContainerIdentifier
{
  return [(FPItem *)self->_documentItem cloudContainerIdentifier];
}

- (BOOL)isContentZoneRoot
{
  return [(FPItem *)self->_documentItem isContentZoneRoot];
}

- (NSNumber)documentSize
{
  resourceValues = self->_resourceValues;
  if (resourceValues) {
    [(NSDictionary *)resourceValues objectForKeyedSubscript:*MEMORY[0x1E4F1C5F8]];
  }
  else {
  v4 = [(FPItem *)self->_documentItem documentSize];
  }

  return (NSNumber *)v4;
}

- (NSDate)contentModificationDate
{
  resourceValues = self->_resourceValues;
  if (resourceValues) {
    [(NSDictionary *)resourceValues objectForKeyedSubscript:*MEMORY[0x1E4F1C530]];
  }
  else {
  v4 = [(FPItem *)self->_documentItem contentModificationDate];
  }

  return (NSDate *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceValues, 0);

  objc_storeStrong((id *)&self->_documentItem, 0);
}

- (void)initWithOriginalDocumentItem:(NSObject *)a3 alternateContentsURL:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] failed to get resource values for alternate contents URL %@: %@", (uint8_t *)&v6, 0x16u);
}

@end