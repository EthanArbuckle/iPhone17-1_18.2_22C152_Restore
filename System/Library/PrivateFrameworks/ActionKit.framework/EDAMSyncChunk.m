@interface EDAMSyncChunk
+ (id)structFields;
+ (id)structName;
- (EDAMPreferences)preferences;
- (NSArray)expungedLinkedAccounts;
- (NSArray)expungedLinkedNotebooks;
- (NSArray)expungedNotebooks;
- (NSArray)expungedNotes;
- (NSArray)expungedSearches;
- (NSArray)expungedTags;
- (NSArray)linkedAccounts;
- (NSArray)linkedNotebooks;
- (NSArray)notebooks;
- (NSArray)notes;
- (NSArray)notesNoLongerSharedWithMe;
- (NSArray)resources;
- (NSArray)searches;
- (NSArray)tags;
- (NSNumber)chunkHighUSN;
- (NSNumber)currentTime;
- (NSNumber)updateCount;
- (void)setChunkHighUSN:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setExpungedLinkedAccounts:(id)a3;
- (void)setExpungedLinkedNotebooks:(id)a3;
- (void)setExpungedNotebooks:(id)a3;
- (void)setExpungedNotes:(id)a3;
- (void)setExpungedSearches:(id)a3;
- (void)setExpungedTags:(id)a3;
- (void)setLinkedAccounts:(id)a3;
- (void)setLinkedNotebooks:(id)a3;
- (void)setNotebooks:(id)a3;
- (void)setNotes:(id)a3;
- (void)setNotesNoLongerSharedWithMe:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setResources:(id)a3;
- (void)setSearches:(id)a3;
- (void)setTags:(id)a3;
- (void)setUpdateCount:(id)a3;
@end

@implementation EDAMSyncChunk

+ (id)structFields
{
  v38[18] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_159;
  if (!structFields_structFields_159)
  {
    v37 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"currentTime"];
    v38[0] = v37;
    v36 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"chunkHighUSN"];
    v38[1] = v36;
    v35 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"updateCount"];
    v38[2] = v35;
    v34 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v33 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"notes" valueField:v34];
    v38[3] = v33;
    v32 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v31 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"notebooks" valueField:v32];
    v38[4] = v31;
    v30 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v29 = +[FATField fieldWithIndex:6 type:15 optional:1 name:@"tags" valueField:v30];
    v38[5] = v29;
    v28 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v27 = +[FATField fieldWithIndex:7 type:15 optional:1 name:@"searches" valueField:v28];
    v38[6] = v27;
    v26 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v25 = +[FATField fieldWithIndex:8 type:15 optional:1 name:@"resources" valueField:v26];
    v38[7] = v25;
    v24 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v23 = +[FATField fieldWithIndex:9 type:15 optional:1 name:@"expungedNotes" valueField:v24];
    v38[8] = v23;
    v22 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v21 = +[FATField fieldWithIndex:10 type:15 optional:1 name:@"expungedNotebooks" valueField:v22];
    v38[9] = v21;
    v20 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v19 = +[FATField fieldWithIndex:11 type:15 optional:1 name:@"expungedTags" valueField:v20];
    v38[10] = v19;
    v18 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v17 = +[FATField fieldWithIndex:12 type:15 optional:1 name:@"expungedSearches" valueField:v18];
    v38[11] = v17;
    v16 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v3 = +[FATField fieldWithIndex:13 type:15 optional:1 name:@"linkedNotebooks" valueField:v16];
    v38[12] = v3;
    v4 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v5 = +[FATField fieldWithIndex:14 type:15 optional:1 name:@"expungedLinkedNotebooks" valueField:v4];
    v38[13] = v5;
    v6 = +[FATField fieldWithIndex:15 type:12 optional:1 name:@"preferences" structClass:objc_opt_class()];
    v38[14] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:16 type:15 optional:1 name:@"notesNoLongerSharedWithMe" valueField:v7];
    v38[15] = v8;
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:17 type:15 optional:1 name:@"linkedAccounts" valueField:v9];
    v38[16] = v10;
    v11 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v12 = +[FATField fieldWithIndex:18 type:15 optional:1 name:@"expungedLinkedAccounts" valueField:v11];
    v38[17] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:18];
    v14 = (void *)structFields_structFields_159;
    structFields_structFields_159 = v13;

    v2 = (void *)structFields_structFields_159;
  }
  return v2;
}

+ (id)structName
{
  return @"SyncChunk";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expungedLinkedAccounts, 0);
  objc_storeStrong((id *)&self->_linkedAccounts, 0);
  objc_storeStrong((id *)&self->_notesNoLongerSharedWithMe, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_expungedLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_linkedNotebooks, 0);
  objc_storeStrong((id *)&self->_expungedSearches, 0);
  objc_storeStrong((id *)&self->_expungedTags, 0);
  objc_storeStrong((id *)&self->_expungedNotebooks, 0);
  objc_storeStrong((id *)&self->_expungedNotes, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_searches, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_notebooks, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_chunkHighUSN, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setExpungedLinkedAccounts:(id)a3
{
}

- (NSArray)expungedLinkedAccounts
{
  return self->_expungedLinkedAccounts;
}

- (void)setLinkedAccounts:(id)a3
{
}

- (NSArray)linkedAccounts
{
  return self->_linkedAccounts;
}

- (void)setNotesNoLongerSharedWithMe:(id)a3
{
}

- (NSArray)notesNoLongerSharedWithMe
{
  return self->_notesNoLongerSharedWithMe;
}

- (void)setPreferences:(id)a3
{
}

- (EDAMPreferences)preferences
{
  return self->_preferences;
}

- (void)setExpungedLinkedNotebooks:(id)a3
{
}

- (NSArray)expungedLinkedNotebooks
{
  return self->_expungedLinkedNotebooks;
}

- (void)setLinkedNotebooks:(id)a3
{
}

- (NSArray)linkedNotebooks
{
  return self->_linkedNotebooks;
}

- (void)setExpungedSearches:(id)a3
{
}

- (NSArray)expungedSearches
{
  return self->_expungedSearches;
}

- (void)setExpungedTags:(id)a3
{
}

- (NSArray)expungedTags
{
  return self->_expungedTags;
}

- (void)setExpungedNotebooks:(id)a3
{
}

- (NSArray)expungedNotebooks
{
  return self->_expungedNotebooks;
}

- (void)setExpungedNotes:(id)a3
{
}

- (NSArray)expungedNotes
{
  return self->_expungedNotes;
}

- (void)setResources:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setSearches:(id)a3
{
}

- (NSArray)searches
{
  return self->_searches;
}

- (void)setTags:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setNotebooks:(id)a3
{
}

- (NSArray)notebooks
{
  return self->_notebooks;
}

- (void)setNotes:(id)a3
{
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setUpdateCount:(id)a3
{
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setChunkHighUSN:(id)a3
{
}

- (NSNumber)chunkHighUSN
{
  return self->_chunkHighUSN;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

@end