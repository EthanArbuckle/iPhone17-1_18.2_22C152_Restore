@interface EDAMSyncChunkFilter
+ (id)structFields;
+ (id)structName;
- (NSNumber)inAccountUserId;
- (NSNumber)includeExpunged;
- (NSNumber)includeLinkedAccounts;
- (NSNumber)includeLinkedNotebooks;
- (NSNumber)includeNoteApplicationDataFullMap;
- (NSNumber)includeNoteAttributes;
- (NSNumber)includeNoteResourceApplicationDataFullMap;
- (NSNumber)includeNoteResources;
- (NSNumber)includeNotebooks;
- (NSNumber)includeNotes;
- (NSNumber)includeNotesSharedWithMe;
- (NSNumber)includePreferences;
- (NSNumber)includeResourceApplicationDataFullMap;
- (NSNumber)includeResources;
- (NSNumber)includeSearches;
- (NSNumber)includeSharedNotes;
- (NSNumber)includeTags;
- (NSNumber)omitSharedNotebooks;
- (NSSet)notebookGuids;
- (NSString)requireNoteContentClass;
- (void)setInAccountUserId:(id)a3;
- (void)setIncludeExpunged:(id)a3;
- (void)setIncludeLinkedAccounts:(id)a3;
- (void)setIncludeLinkedNotebooks:(id)a3;
- (void)setIncludeNoteApplicationDataFullMap:(id)a3;
- (void)setIncludeNoteAttributes:(id)a3;
- (void)setIncludeNoteResourceApplicationDataFullMap:(id)a3;
- (void)setIncludeNoteResources:(id)a3;
- (void)setIncludeNotebooks:(id)a3;
- (void)setIncludeNotes:(id)a3;
- (void)setIncludeNotesSharedWithMe:(id)a3;
- (void)setIncludePreferences:(id)a3;
- (void)setIncludeResourceApplicationDataFullMap:(id)a3;
- (void)setIncludeResources:(id)a3;
- (void)setIncludeSearches:(id)a3;
- (void)setIncludeSharedNotes:(id)a3;
- (void)setIncludeTags:(id)a3;
- (void)setNotebookGuids:(id)a3;
- (void)setOmitSharedNotebooks:(id)a3;
- (void)setRequireNoteContentClass:(id)a3;
@end

@implementation EDAMSyncChunkFilter

+ (id)structFields
{
  v27[20] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_299;
  if (!structFields_structFields_299)
  {
    v26 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"includeNotes"];
    v27[0] = v26;
    v25 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"includeNoteResources"];
    v27[1] = v25;
    v24 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"includeNoteAttributes"];
    v27[2] = v24;
    v23 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"includeNotebooks"];
    v27[3] = v23;
    v22 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"includeTags"];
    v27[4] = v22;
    v21 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"includeSearches"];
    v27[5] = v21;
    v20 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"includeResources"];
    v27[6] = v20;
    v19 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"includeLinkedNotebooks"];
    v27[7] = v19;
    v18 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"includeExpunged"];
    v27[8] = v18;
    v17 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"includeNoteApplicationDataFullMap"];
    v27[9] = v17;
    v16 = +[FATField fieldWithIndex:12 type:2 optional:1 name:@"includeResourceApplicationDataFullMap"];
    v27[10] = v16;
    v3 = +[FATField fieldWithIndex:13 type:2 optional:1 name:@"includeNoteResourceApplicationDataFullMap"];
    v27[11] = v3;
    v4 = +[FATField fieldWithIndex:14 type:2 optional:1 name:@"includePreferences"];
    v27[12] = v4;
    v5 = +[FATField fieldWithIndex:17 type:2 optional:1 name:@"includeSharedNotes"];
    v27[13] = v5;
    v6 = +[FATField fieldWithIndex:18 type:2 optional:1 name:@"includeNotesSharedWithMe"];
    v27[14] = v6;
    v7 = +[FATField fieldWithIndex:20 type:2 optional:1 name:@"includeLinkedAccounts"];
    v27[15] = v7;
    v8 = +[FATField fieldWithIndex:16 type:2 optional:1 name:@"omitSharedNotebooks"];
    v27[16] = v8;
    v9 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"requireNoteContentClass"];
    v27[17] = v9;
    v10 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v11 = +[FATField fieldWithIndex:15 type:14 optional:1 name:@"notebookGuids" valueField:v10];
    v27[18] = v11;
    v12 = +[FATField fieldWithIndex:19 type:8 optional:1 name:@"inAccountUserId"];
    v27[19] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:20];
    v14 = (void *)structFields_structFields_299;
    structFields_structFields_299 = v13;

    v2 = (void *)structFields_structFields_299;
  }
  return v2;
}

+ (id)structName
{
  return @"SyncChunkFilter";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inAccountUserId, 0);
  objc_storeStrong((id *)&self->_notebookGuids, 0);
  objc_storeStrong((id *)&self->_requireNoteContentClass, 0);
  objc_storeStrong((id *)&self->_omitSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeLinkedAccounts, 0);
  objc_storeStrong((id *)&self->_includeNotesSharedWithMe, 0);
  objc_storeStrong((id *)&self->_includeSharedNotes, 0);
  objc_storeStrong((id *)&self->_includePreferences, 0);
  objc_storeStrong((id *)&self->_includeNoteResourceApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeResourceApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeNoteApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeExpunged, 0);
  objc_storeStrong((id *)&self->_includeLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeResources, 0);
  objc_storeStrong((id *)&self->_includeSearches, 0);
  objc_storeStrong((id *)&self->_includeTags, 0);
  objc_storeStrong((id *)&self->_includeNotebooks, 0);
  objc_storeStrong((id *)&self->_includeNoteAttributes, 0);
  objc_storeStrong((id *)&self->_includeNoteResources, 0);
  objc_storeStrong((id *)&self->_includeNotes, 0);
}

- (void)setInAccountUserId:(id)a3
{
}

- (NSNumber)inAccountUserId
{
  return self->_inAccountUserId;
}

- (void)setNotebookGuids:(id)a3
{
}

- (NSSet)notebookGuids
{
  return self->_notebookGuids;
}

- (void)setRequireNoteContentClass:(id)a3
{
}

- (NSString)requireNoteContentClass
{
  return self->_requireNoteContentClass;
}

- (void)setOmitSharedNotebooks:(id)a3
{
}

- (NSNumber)omitSharedNotebooks
{
  return self->_omitSharedNotebooks;
}

- (void)setIncludeLinkedAccounts:(id)a3
{
}

- (NSNumber)includeLinkedAccounts
{
  return self->_includeLinkedAccounts;
}

- (void)setIncludeNotesSharedWithMe:(id)a3
{
}

- (NSNumber)includeNotesSharedWithMe
{
  return self->_includeNotesSharedWithMe;
}

- (void)setIncludeSharedNotes:(id)a3
{
}

- (NSNumber)includeSharedNotes
{
  return self->_includeSharedNotes;
}

- (void)setIncludePreferences:(id)a3
{
}

- (NSNumber)includePreferences
{
  return self->_includePreferences;
}

- (void)setIncludeNoteResourceApplicationDataFullMap:(id)a3
{
}

- (NSNumber)includeNoteResourceApplicationDataFullMap
{
  return self->_includeNoteResourceApplicationDataFullMap;
}

- (void)setIncludeResourceApplicationDataFullMap:(id)a3
{
}

- (NSNumber)includeResourceApplicationDataFullMap
{
  return self->_includeResourceApplicationDataFullMap;
}

- (void)setIncludeNoteApplicationDataFullMap:(id)a3
{
}

- (NSNumber)includeNoteApplicationDataFullMap
{
  return self->_includeNoteApplicationDataFullMap;
}

- (void)setIncludeExpunged:(id)a3
{
}

- (NSNumber)includeExpunged
{
  return self->_includeExpunged;
}

- (void)setIncludeLinkedNotebooks:(id)a3
{
}

- (NSNumber)includeLinkedNotebooks
{
  return self->_includeLinkedNotebooks;
}

- (void)setIncludeResources:(id)a3
{
}

- (NSNumber)includeResources
{
  return self->_includeResources;
}

- (void)setIncludeSearches:(id)a3
{
}

- (NSNumber)includeSearches
{
  return self->_includeSearches;
}

- (void)setIncludeTags:(id)a3
{
}

- (NSNumber)includeTags
{
  return self->_includeTags;
}

- (void)setIncludeNotebooks:(id)a3
{
}

- (NSNumber)includeNotebooks
{
  return self->_includeNotebooks;
}

- (void)setIncludeNoteAttributes:(id)a3
{
}

- (NSNumber)includeNoteAttributes
{
  return self->_includeNoteAttributes;
}

- (void)setIncludeNoteResources:(id)a3
{
}

- (NSNumber)includeNoteResources
{
  return self->_includeNoteResources;
}

- (void)setIncludeNotes:(id)a3
{
}

- (NSNumber)includeNotes
{
  return self->_includeNotes;
}

@end