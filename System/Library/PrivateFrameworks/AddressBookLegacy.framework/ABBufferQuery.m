@interface ABBufferQuery
- (ABBufferQuery)initWithAddressBook:(void *)a3 predicate:(id)a4 requestedProperties:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 managedConfiguration:(id)a8 identifierAuditStyle:(int64_t)a9 authorizationContext:(id)a10;
- (ABSQLPredicate)predicate;
- (BOOL)fetchLinkedContacts;
- (BOOL)needsMultivalueEntryTable;
- (BOOL)needsMultivalueTable;
- (BOOL)needsPersonLinkTable;
- (BOOL)needsPersonTable;
- (BOOL)requestedHasImageData;
- (BOOL)requestedImageCropRect;
- (BOOL)requestedImageData;
- (BOOL)requestedImageFullscreenData;
- (BOOL)requestedImageThumbnail;
- (BOOL)requestedSyncImageData;
- (BOOL)requestedWallpaperData;
- (BOOL)requestedWallpaperMetadata;
- (BOOL)requestedWatchWallpaperImageData;
- (CNManagedConfiguration)managedConfiguration;
- (CPSqliteStatement)statement;
- (NSIndexSet)requestedMultivalueIdentifiers;
- (NSIndexSet)requestedPropertyIdentifiers;
- (NSIndexSet)scopedStoreIdentifiers;
- (__CFDictionary)propertyIndices;
- (id)limitedAccessBundleIdentifierForAuthorizationContext:(id)a3;
- (id)scopedStoresForManagedConfiguration:(id)a3;
- (int64_t)contactidentifierAuditMode;
- (unsigned)sortOrder;
- (void)_initSetupPropertySet:(__CFSet *)a3 includeLinkedContacts:(BOOL)a4 hasLimitedAccess:(BOOL)a5;
- (void)addressBook;
- (void)appendBindParameterMarkersToQueryString:(id)a3 count:(unint64_t)a4;
- (void)appendCustomPropertySelectsToQueryString:(id)a3;
- (void)appendFromClauseToQueryString:(id)a3;
- (void)appendOrderByClauseToQueryString:(id)a3;
- (void)appendWhereClauseToQueryString:(id)a3 hasLimitedAccess:(BOOL)a4;
- (void)bindWhereClause:(id)a3 limitedAccessBundleIdentifier:(id)a4;
- (void)bindWithClause:(id)a3;
- (void)dealloc;
- (void)prependWithClauseToQueryString:(id)a3 whereClause:(id)a4;
- (void)setAddressBook:(void *)a3;
- (void)setContactidentifierAuditMode:(int64_t)a3;
- (void)setFetchLinkedContacts:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setPropertyIndices:(__CFDictionary *)a3;
- (void)setSortOrder:(unsigned int)a3;
- (void)setStatement:(CPSqliteStatement *)a3;
@end

@implementation ABBufferQuery

- (ABBufferQuery)initWithAddressBook:(void *)a3 predicate:(id)a4 requestedProperties:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 managedConfiguration:(id)a8 identifierAuditStyle:(int64_t)a9 authorizationContext:(id)a10
{
  BOOL v12 = a6;
  v47.receiver = self;
  v47.super_class = (Class)ABBufferQuery;
  v16 = [(ABBufferQuery *)&v47 init];
  if (v16)
  {
    if (a3 && (CPRecordStoreGetDatabase(), CPSqliteDatabaseConnectionForWriting()))
    {
      v16->_contactidentifierAuditMode = a9;
      v16->_managedConfiguration = (CNManagedConfiguration *)a8;
      v16->_predicate = (ABSQLPredicate *)a4;
      MutableCopy = CFSetCreateMutableCopy(0, 0, a5);
      CFSetRef v18 = MutableCopy;
      if (v12) {
        CFSetAddValue(MutableCopy, (const void *)kABPersonLinkProperty);
      }
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      int v46 = 1;
      v16->_sortOrder = a7;
      CFRetain(a3);
      v16->_addressBook = a3;
      id v19 = [(ABBufferQuery *)v16 limitedAccessBundleIdentifierForAuthorizationContext:a10];
      id v20 = v19;
      if (v19) {
        BOOL v21 = [v19 length] != 0;
      }
      else {
        BOOL v21 = 0;
      }
      [(ABBufferQuery *)v16 _initSetupPropertySet:v18 includeLinkedContacts:v12 hasLimitedAccess:v21];
      id v38 = v20;
      v16->_scopedStoreIdentifiers = (NSIndexSet *)[(ABBufferQuery *)v16 scopedStoresForManagedConfiguration:a8];
      uint64_t PersonRecordDescriptorForPrefetchQueries = ABCAddressBookGetPersonRecordDescriptorForPrefetchQueries((uint64_t)a3);
      v44 = 0;
      v23 = (char *)*(int *)(PersonRecordDescriptorForPrefetchQueries + 72);
      if (v23)
      {
        v24 = 0;
        v25 = (unsigned int *)(*(void *)(PersonRecordDescriptorForPrefetchQueries + 80) + 24);
        do
        {
          int v26 = *(v25 - 4);
          if (v25[2] == 5)
          {
            if (!v26) {
              *(v25 - 4) = 2;
            }
          }
          else if (!v26)
          {
            goto LABEL_25;
          }
          if (!CFSetContainsValue(v18, v24)
            || (v24 != (char *)kABCPersonWallpaperProperty
              ? (BOOL v27 = v24 == (char *)kABCPersonWatchWallpaperImageDataProperty)
              : (BOOL v27 = 1),
                !v27 ? (BOOL v28 = v24 == (char *)kABCPersonWallpaperMetadataProperty) : (BOOL v28 = 1),
                v28))
          {
LABEL_25:
            unsigned int v29 = *v25 | 1;
            goto LABEL_26;
          }
          unsigned int v29 = *v25 & 0xFFFFFFFE;
LABEL_26:
          unsigned int *v25 = v29;
          v25 += 10;
          ++v24;
        }
        while (v23 != v24);
      }
      ColumnListWithAliasAndExtraColumns = (const void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
      v16->_propertyIndices = v44;
      -[ABBufferQuery prependWithClauseToQueryString:whereClause:](v16, "prependWithClauseToQueryString:whereClause:", ColumnListWithAliasAndExtraColumns, [a4 query]);
      [(ABBufferQuery *)v16 appendCustomPropertySelectsToQueryString:ColumnListWithAliasAndExtraColumns];
      [(ABBufferQuery *)v16 appendFromClauseToQueryString:ColumnListWithAliasAndExtraColumns];
      if (v21) {
        +[ABLimitedAccess appendLimitedAccessLeftJoinToQueryString:ColumnListWithAliasAndExtraColumns];
      }
      [(ABBufferQuery *)v16 appendWhereClauseToQueryString:ColumnListWithAliasAndExtraColumns hasLimitedAccess:v21];
      [(ABBufferQuery *)v16 appendOrderByClauseToQueryString:ColumnListWithAliasAndExtraColumns];
      uint64_t v31 = CPSqliteConnectionStatementForSQL();
      v32 = (CPSqliteStatement *)v31;
      if (v31)
      {
        if (*(void *)(v31 + 8))
        {
          ABRegulatoryLogReadContactsData((uint64_t)a3);
          v16->_statement = v32;
          v33 = objc_opt_new();
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke;
          v43[3] = &unk_1E5989718;
          v43[4] = v45;
          v43[5] = v32;
          [v33 setIntBinder:v43];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_2;
          v42[3] = &unk_1E59890C0;
          v42[4] = v45;
          v42[5] = v32;
          [v33 setStringBinder:v42];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_3;
          v41[3] = &unk_1E5989740;
          v41[4] = v45;
          v41[5] = v32;
          [v33 setBlobBinder:v41];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_4;
          v40[3] = &unk_1E5989768;
          v40[4] = v45;
          v40[5] = v32;
          [v33 setPointerBinder:v40];
          if ([a4 bindBlock])
          {
            uint64_t v34 = [a4 bindBlock];
            (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v33);
          }
          [(ABBufferQuery *)v16 bindWithClause:v33];
          requestedMultivalueIdentifiers = v16->_requestedMultivalueIdentifiers;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_5;
          v39[3] = &unk_1E5989508;
          v39[4] = v33;
          [(NSIndexSet *)requestedMultivalueIdentifiers enumerateIndexesUsingBlock:v39];
          [(ABBufferQuery *)v16 bindWhereClause:v33 limitedAccessBundleIdentifier:v38];
        }
      }
      else
      {
        v36 = ABOSLogGeneral();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[ABBufferQuery initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:]((uint64_t)ColumnListWithAliasAndExtraColumns, v36);
        }
      }
      CFRelease(ColumnListWithAliasAndExtraColumns);
      CFRelease(v18);
      _Block_object_dispose(v45, 8);
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

- (void)_initSetupPropertySet:(__CFSet *)a3 includeLinkedContacts:(BOOL)a4 hasLimitedAccess:(BOOL)a5
{
  BOOL v5 = a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFSetGetCount(a3);
  v10 = (const void **)((char *)v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  CFSetGetValues(a3, v10);
  v11 = (NSIndexSet *)objc_opt_new();
  for (i = (NSIndexSet *)objc_opt_new(); Count; --Count)
  {
    [(NSIndexSet *)v11 addIndex:*v10];
    ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(*(_DWORD *)v10);
    if ((TypeOfProperty & 0x100) != 0)
    {
      [(NSIndexSet *)i addIndex:*v10];
      self->_needsMultivalueTable = 1;
    }
    if (TypeOfProperty == 261) {
      self->_needsMultivalueEntryTable = 1;
    }
    ++v10;
  }
  if (v5) {
    [(NSIndexSet *)v11 addIndex:kABCPersonLinkUUIDProperty];
  }
  if ([(NSIndexSet *)v11 containsIndex:kABCPersonLinkUUIDProperty]) {
    char v14 = 1;
  }
  else {
    char v14 = [(NSIndexSet *)v11 containsIndex:kABCPersonIsPreferredImageProperty];
  }
  self->_needsPersonLinkTable = v14;
  self->_requestedImageData = [(NSIndexSet *)v11 containsIndex:kABCPersonImageDataProperty];
  self->_requestedImageCropRect = [(NSIndexSet *)v11 containsIndex:kABCPersonImageCropRectProperty];
  self->_requestedImageThumbnail = [(NSIndexSet *)v11 containsIndex:kABCPersonThumbnailDataProperty];
  self->_requestedImageFullscreenData = [(NSIndexSet *)v11 containsIndex:kABCPersonFullscreenImageDataProperty];
  self->_requestedSyncImageData = [(NSIndexSet *)v11 containsIndex:kABCPersonSyncImageDataProperty];
  self->_requestedHasImageData = [(NSIndexSet *)v11 containsIndex:kABCPersonHasImageDataProperty];
  self->_requestedWallpaperData = [(NSIndexSet *)v11 containsIndex:kABCPersonWallpaperProperty];
  self->_requestedWatchWallpaperImageData = [(NSIndexSet *)v11 containsIndex:kABCPersonWatchWallpaperImageDataProperty];
  self->_requestedWallpaperMetadata = [(NSIndexSet *)v11 containsIndex:kABCPersonWallpaperMetadataProperty];
  self->_fetchLinkedContacts = a4;
  self->_requestedPropertyIdentifiers = v11;
  self->_requestedMultivalueIdentifiers = i;
}

- (id)scopedStoresForManagedConfiguration:(id)a3
{
  if (([a3 deviceHasManagementRestrictions] & 1) == 0
    && ![a3 hasContactProviderRestrictions])
  {
    return 0;
  }
  BOOL v5 = [(ABBufferQuery *)self addressBook];
  return ABAddressBookIndexSetOfAllowedSourceIdentifiersIncludingDisabledSources((uint64_t)v5, a3, 0);
}

- (id)limitedAccessBundleIdentifierForAuthorizationContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!+[ABLimitedAccess isLimitedAccessFF_Enabled]
    || ![a3 isLimitedAccessGranted])
  {
    return 0;
  }
  v4 = (void *)[a3 clientBundleIdentifier];
  BOOL v5 = ABOSLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_19DCDB000, v5, OS_LOG_TYPE_DEFAULT, "ABBufferQuery limited access for bundleIdentifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (void)bindWithClause:(id)a3
{
  if ([(ABBufferQuery *)self scopedStoreIdentifiers])
  {
    BOOL v5 = [(ABBufferQuery *)self scopedStoreIdentifiers];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__ABBufferQuery_bindWithClause___block_invoke;
    v7[3] = &unk_1E5989508;
    v7[4] = a3;
    [(NSIndexSet *)v5 enumerateIndexesUsingBlock:v7];
    if ([(ABBufferQuery *)self fetchLinkedContacts])
    {
      uint64_t v6 = [a3 blobBinder];
      (*(void (**)(uint64_t, NSIndexSet *, uint64_t))(v6 + 16))(v6, [(ABBufferQuery *)self scopedStoreIdentifiers], 8);
    }
  }
}

- (void)bindWhereClause:(id)a3 limitedAccessBundleIdentifier:(id)a4
{
  if (a4 && [a4 length])
  {
    uint64_t v7 = [a3 stringBinder];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, a4);
  }
  if ([(ABBufferQuery *)self scopedStoreIdentifiers])
  {
    v8 = [(ABBufferQuery *)self scopedStoreIdentifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__ABBufferQuery_bindWhereClause_limitedAccessBundleIdentifier___block_invoke;
    v9[3] = &unk_1E5989508;
    v9[4] = a3;
    [(NSIndexSet *)v8 enumerateIndexesUsingBlock:v9];
  }
}

- (void)appendWhereClauseToQueryString:(id)a3 hasLimitedAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v4) {
    objc_msgSend(v7, "addObject:", +[ABLimitedAccess limitedAccessLeftJoinWhereClause](ABLimitedAccess, "limitedAccessLeftJoinWhereClause"));
  }
  if ([(ABBufferQuery *)self scopedStoreIdentifiers])
  {
    uint64_t v8 = [MEMORY[0x1E4F28E78] stringWithString:@" abp.StoreID IN "];
    [(ABBufferQuery *)self appendBindParameterMarkersToQueryString:v8 count:[(NSIndexSet *)[(ABBufferQuery *)self scopedStoreIdentifiers] count]];
    [v7 addObject:v8];
  }
  if ([v7 count])
  {
    [a3 appendString:@" WHERE "];
    uint64_t v9 = [v7 componentsJoinedByString:@" AND "];
    [a3 appendString:v9];
  }
}

- (void)appendOrderByClauseToQueryString:(id)a3
{
  [a3 appendString:@" ORDER BY "];
  if (![(ABBufferQuery *)self sortOrder])
  {
    BOOL v5 = @"preferredmatched.FirstSortLanguageIndex, preferredmatched.FirstSortSection, preferredmatched.FirstSort ";
    goto LABEL_5;
  }
  if ([(ABBufferQuery *)self sortOrder] == 1)
  {
    BOOL v5 = @"preferredmatched.LastSortLanguageIndex, preferredmatched.LastSortSection, preferredmatched.LastSort ";
LABEL_5:
    [a3 appendString:v5];
    if (![(ABBufferQuery *)self fetchLinkedContacts])
    {
LABEL_11:
      [a3 appendFormat:@", "];
      goto LABEL_12;
    }
    [a3 appendFormat:@", "];
LABEL_10:
    [a3 appendString:@"abp.PersonLink "];
    goto LABEL_11;
  }
  if ([(ABBufferQuery *)self sortOrder] != -1) {
    [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"ABBufferQuery: unrecognized sorte order: %u", -[ABBufferQuery sortOrder](self, "sortOrder")), 0 reason userInfo];
  }
  if ([(ABBufferQuery *)self fetchLinkedContacts]) {
    goto LABEL_10;
  }
LABEL_12:
  [a3 appendString:@"abp.ROWID "];
  if ([(ABBufferQuery *)self needsMultivalueTable])
  {
    [a3 appendString:@", abmv.property, abmv.UID "];
  }
}

- (void)prependWithClauseToQueryString:(id)a3 whereClause:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] string];
  if ([(ABBufferQuery *)self sortOrder])
  {
    if ([(ABBufferQuery *)self sortOrder] == 1)
    {
      uint64_t v8 = @", LastSortLanguageIndex, LastSortSection, LastSort ";
    }
    else
    {
      if ([(ABBufferQuery *)self sortOrder] != -1) {
        [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"ABBufferQuery: unrecognized sort order: %u", -[ABBufferQuery sortOrder](self, "sortOrder")), 0 reason userInfo];
      }
      uint64_t v8 = &stru_1EF03E278;
    }
  }
  else
  {
    uint64_t v8 = @", FirstSortLanguageIndex, FirstSortSection, FirstSort ";
  }
  objc_msgSend(v7, "appendFormat:", @"WITH preferredmatched(rowid %@) as("), v8;
  if ([(ABBufferQuery *)self fetchLinkedContacts])
  {
    objc_msgSend(v7, "appendString:", @"WITH matched(rowid, personlink) as(SELECT rowid, personlink from ABPerson ");
    if ([a4 length])
    {
      [v7 appendFormat:@"WHERE rowid in(%@) ", a4];
      uint64_t v9 = @"AND ";
    }
    else
    {
      uint64_t v9 = @"WHERE ";
    }
    if ([(ABBufferQuery *)self scopedStoreIdentifiers])
    {
      [v7 appendFormat:@"%@ StoreID IN", v9];
      [(ABBufferQuery *)self appendBindParameterMarkersToQueryString:v7 count:[(NSIndexSet *)[(ABBufferQuery *)self scopedStoreIdentifiers] count]];
    }
    [v7 appendString:@" "]);
    objc_msgSend(v7, "appendFormat:", @"SELECT rowid %@ FROM ABPerson abp WHERE abp.rowid IN (SELECT rowid FROM matched WHERE matched.personlink = -1 UNION "), v8;
    if ([(ABBufferQuery *)self scopedStoreIdentifiers]) {
      v11 = @"SELECT ab_allowed_preferred_contact(abp.rowid, abp.StoreID, abp.IsPreferredName, ?) FROM ABPerson abp JOIN ABPersonLink abpl on abpl.rowid = abp.PersonLink WHERE abpl.rowid in (select personlink from matched) GROUP BY abpl.rowid ");
    }
    else {
      v11 = @"SELECT PreferredNamePersonID FROM ABPersonLink abpl WHERE abpl.rowid IN (SELECT personlink FROM matched) ");
    }
    [v7 appendFormat:v11];
  }
  else
  {
    objc_msgSend(v7, "appendFormat:", @"SELECT rowid %@ FROM ABPerson where rowid in("), v8;
    if ([a4 length]) {
      v10 = (__CFString *)a4;
    }
    else {
      v10 = @"SELECT rowid FROM ABPerson ";
    }
    [v7 appendString:v10];
    [v7 appendString:@" "]);
    if ([(ABBufferQuery *)self scopedStoreIdentifiers])
    {
      [v7 appendString:@"AND StoreID IN"];
      [(ABBufferQuery *)self appendBindParameterMarkersToQueryString:v7 count:[(NSIndexSet *)[(ABBufferQuery *)self scopedStoreIdentifiers] count]];
    }
  }
  [v7 appendString:@" "]);
  [a3 insertString:v7 atIndex:0];
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (NSIndexSet)scopedStoreIdentifiers
{
  return self->_scopedStoreIdentifiers;
}

- (BOOL)fetchLinkedContacts
{
  return self->_fetchLinkedContacts;
}

- (void)appendFromClauseToQueryString:(id)a3
{
  [a3 appendString:@" FROM preferredmatched "];
  if ([(ABBufferQuery *)self fetchLinkedContacts])
  {
    [a3 appendString:@" LEFT JOIN ABPerson abp2 on (abp2.rowid = preferredmatched.rowid) "];
    BOOL v5 = @" JOIN ABPerson abp on (abp2.personlink != -1 and abp2.personlink = abp.personlink) OR (abp.rowid = abp2.rowid) ";
  }
  else
  {
    BOOL v5 = @" JOIN ABPerson abp on (abp.rowid = preferredmatched.rowid) ";
  }
  [a3 appendString:v5];
  if ([(ABBufferQuery *)self needsPersonLinkTable]) {
    [a3 appendString:@" LEFT JOIN ABPersonLink abplink on abp.PersonLink = abplink.ROWID "];
  }
  if ([(ABBufferQuery *)self needsMultivalueTable])
  {
    [a3 appendString:@" LEFT JOIN ABMultivalue abmv ON abp.ROWID = abmv.record_id  AND +abmv.property IN "];
    [(ABBufferQuery *)self appendBindParameterMarkersToQueryString:a3 count:[(NSIndexSet *)[(ABBufferQuery *)self requestedMultivalueIdentifiers] count]];
    [a3 appendString:@" LEFT JOIN ABMultivalueLabel abmvlabel on abmv.label = abmvlabel.ROWID "];
    if ([(ABBufferQuery *)self needsMultivalueEntryTable])
    {
      [a3 appendString:@" LEFT JOIN ABMultiValueEntry abmve on abmve.parent_id = abmv.UID LEFT JOIN ABMultiValueEntryKey abmvekey on abmve.key = abmvekey.rowid "];
    }
  }
}

- (BOOL)needsMultivalueTable
{
  return self->_needsMultivalueTable;
}

- (BOOL)needsMultivalueEntryTable
{
  return self->_needsMultivalueEntryTable;
}

- (BOOL)needsPersonLinkTable
{
  return self->_needsPersonLinkTable;
}

- (void)appendCustomPropertySelectsToQueryString:(id)a3
{
  BOOL v5 = [(ABBufferQuery *)self requestedPropertyIdentifiers];
  if ([(NSIndexSet *)v5 containsIndex:kABCPersonLinkUUIDProperty]) {
    [a3 appendString:@", abplink.guid"];
  }
  uint64_t v6 = [(ABBufferQuery *)self requestedPropertyIdentifiers];
  if ([(NSIndexSet *)v6 containsIndex:kABCPersonIsPreferredImageProperty]) {
    [a3 appendString:@", (abplink.PreferredImagePersonID = abp.rowid)"];
  }
  if ([(NSIndexSet *)[(ABBufferQuery *)self requestedMultivalueIdentifiers] count])
  {
    [a3 appendString:@", abmv.property, abmv.identifier, abmv.guid, abmv.value, abmvlabel.value"];
    if ([(ABBufferQuery *)self needsMultivalueEntryTable])
    {
      [a3 appendString:@", abmvekey.value, abmve.value"];
    }
  }
}

- (void)appendBindParameterMarkersToQueryString:(id)a3 count:(unint64_t)a4
{
  objc_msgSend(a3, "appendString:", @" (");
  if (a4)
  {
    uint64_t v6 = 0;
    do
    {
      if (v6) {
        uint64_t v7 = @", ?";
      }
      else {
        uint64_t v7 = @" ?";
      }
      [a3 appendString:v7];
      ++v6;
    }
    while (a4 != v6);
  }
  [a3 appendString:@""]);
}

- (NSIndexSet)requestedPropertyIdentifiers
{
  return self->_requestedPropertyIdentifiers;
}

- (int64_t)contactidentifierAuditMode
{
  return self->_contactidentifierAuditMode;
}

- (NSIndexSet)requestedMultivalueIdentifiers
{
  return self->_requestedMultivalueIdentifiers;
}

- (ABSQLPredicate)predicate
{
  return self->_predicate;
}

- (__CFDictionary)propertyIndices
{
  return self->_propertyIndices;
}

- (BOOL)requestedImageCropRect
{
  return self->_requestedImageCropRect;
}

- (BOOL)requestedImageData
{
  return self->_requestedImageData;
}

- (BOOL)requestedImageThumbnail
{
  return self->_requestedImageThumbnail;
}

- (BOOL)requestedImageFullscreenData
{
  return self->_requestedImageFullscreenData;
}

- (BOOL)requestedWatchWallpaperImageData
{
  return self->_requestedWatchWallpaperImageData;
}

- (BOOL)requestedWallpaperMetadata
{
  return self->_requestedWallpaperMetadata;
}

- (BOOL)requestedWallpaperData
{
  return self->_requestedWallpaperData;
}

- (BOOL)requestedSyncImageData
{
  return self->_requestedSyncImageData;
}

- (BOOL)requestedHasImageData
{
  return self->_requestedHasImageData;
}

- (void)addressBook
{
  return self->_addressBook;
}

- (CPSqliteStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(CPSqliteStatement *)a3
{
  self->_statement = a3;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), &v4, 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(_DWORD *)(v4 + 24);
  if (a2)
  {
    uint64_t v6 = (const char *)_CPCreateUTF8StringFromCFString();
    uint64_t result = sqlite3_bind_text(v3, v5, v6, -1, MEMORY[0x1E4F14838]);
  }
  else
  {
    uint64_t result = sqlite3_bind_null(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(v4 + 24));
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_3(uint64_t a1, void *a2, int n)
{
  uint64_t result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, n, 0);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 8), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_5(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) intBinder] + 16);
  return v1();
}

- (void)dealloc
{
  propertyIndices = self->_propertyIndices;
  if (propertyIndices) {
    CFRelease(propertyIndices);
  }
  if (self->_statement) {
    CPSqliteStatementReset();
  }
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v5.receiver = self;
  v5.super_class = (Class)ABBufferQuery;
  [(ABBufferQuery *)&v5 dealloc];
}

- (void)setPropertyIndices:(__CFDictionary *)a3
{
  propertyIndices = self->_propertyIndices;
  if (propertyIndices != a3)
  {
    if (propertyIndices) {
      CFRelease(propertyIndices);
    }
    if (a3) {
      CFRelease(a3);
    }
    self->_propertyIndices = a3;
  }
}

uint64_t __32__ABBufferQuery_bindWithClause___block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) intBinder] + 16);
  return v1();
}

uint64_t __63__ABBufferQuery_bindWhereClause_limitedAccessBundleIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) intBinder] + 16);
  return v1();
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setContactidentifierAuditMode:(int64_t)a3
{
  self->_contactidentifierAuditMode = a3;
}

- (void)setPredicate:(id)a3
{
}

- (void)setSortOrder:(unsigned int)a3
{
  self->_sortOrder = a3;
}

- (void)setFetchLinkedContacts:(BOOL)a3
{
  self->_fetchLinkedContacts = a3;
}

- (BOOL)needsPersonTable
{
  return self->_needsPersonTable;
}

- (void)initWithAddressBook:(uint64_t)a1 predicate:(NSObject *)a2 requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19DCDB000, a2, OS_LOG_TYPE_ERROR, "error in SQL preparation of statement: %@", (uint8_t *)&v2, 0xCu);
}

@end