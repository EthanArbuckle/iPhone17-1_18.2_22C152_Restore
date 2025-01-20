@interface KMMapper_SASyncSiriKitAppVocabulary
+ (Class)externalObjectClass;
- (KMMapper_SASyncSiriKitAppVocabulary)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_SASyncSiriKitAppVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_ontologyNodeToFieldTypeMap, 0);
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [v6 propertyForKey:*MEMORY[0x263F65CC0]];
  v9 = objc_msgSend(v8, "_sa_mappedDictionaryWithBlock:", &__block_literal_global);

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v10 = [v9 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (!v11) {
    goto LABEL_24;
  }
  uint64_t v12 = v11;
  uint64_t v49 = 0;
  uint64_t v13 = *(void *)v61;
  id v41 = v6;
  v42 = v10;
  v43 = v9;
  uint64_t v39 = *(void *)v61;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v61 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v45 = v14;
      uint64_t v15 = *(void *)(*((void *)&v60 + 1) + 8 * v14);
      v16 = self;
      v17 = [(NSDictionary *)self->_ontologyNodeToFieldTypeMap objectForKey:v15];
      uint64_t v18 = KVFieldTypeFromNumber();

      uint64_t v50 = v18;
      if (!v18)
      {
        self = v16;
        goto LABEL_22;
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = [v9 objectForKey:v15];
      uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (!v47)
      {
        self = v16;
        goto LABEL_21;
      }
      uint64_t v40 = v12;
      id v19 = 0;
      uint64_t v48 = *(void *)v57;
      self = v16;
      while (2)
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v57 != v48) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v22 = objc_msgSend(NSString, "stringWithFormat:", @"%u#%u", (unsigned __int16)v50, v49 + i);
          builder = self->_builder;
          id v55 = v19;
          v24 = [(KVItemBuilder *)builder setItemType:1 itemId:v22 error:&v55];
          id v25 = v55;

          if (!v24)
          {
            id v19 = v25;
            goto LABEL_27;
          }
          v26 = self;
          v27 = self->_builder;
          v28 = [v21 intentSlotValue];
          id v54 = v25;
          v29 = [(KVItemBuilder *)v27 addFieldWithType:v50 value:v28 error:&v54];
          id v19 = v54;

          if (!v29)
          {

LABEL_27:
            id v6 = v41;
LABEL_31:
            KMMapperSetBuilderError((uint64_t)a5, v19);

            id v37 = 0;
            v9 = v43;
            goto LABEL_32;
          }
          v51 = v22;
          v30 = v7;
          v31 = v26->_builder;
          v32 = [v21 vocabularyIdentifier];
          id v53 = v19;
          v33 = [(KVItemBuilder *)v31 addFieldWithType:20 value:v32 error:&v53];
          id v34 = v53;

          if (!v33)
          {
            id v19 = v34;
            id v6 = v41;
            id v7 = v30;
LABEL_30:
            v22 = v51;
            goto LABEL_31;
          }
          v35 = v26->_builder;
          id v52 = v34;
          v36 = [(KVItemBuilder *)v35 buildItemWithError:&v52];
          id v19 = v52;

          id v7 = v30;
          if (!v36)
          {
            id v6 = v41;
            goto LABEL_30;
          }
          self = v26;
          [v30 addObject:v36];
        }
        uint64_t v49 = (v49 + i);
        uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v47) {
          continue;
        }
        break;
      }

      id v6 = v41;
      v10 = v42;
      v9 = v43;
      uint64_t v13 = v39;
      uint64_t v12 = v40;
LABEL_21:

LABEL_22:
      uint64_t v14 = v45 + 1;
    }
    while (v45 + 1 != v12);
    uint64_t v12 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
  }
  while (v12);
LABEL_24:

  id v37 = v7;
LABEL_32:

  return v37;
}

- (int64_t)targetItemType
{
  return 1;
}

- (KMMapper_SASyncSiriKitAppVocabulary)init
{
  v28[18] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)KMMapper_SASyncSiriKitAppVocabulary;
  v2 = [(KMMapper_SASyncSiriKitAppVocabulary *)&v26 init];
  if (v2)
  {
    v27[0] = @"personFullName";
    id v25 = KVFieldTypeToNumber();
    v28[0] = v25;
    v27[1] = @"smsGroupName";
    v24 = KVFieldTypeToNumber();
    v28[1] = v24;
    v27[2] = @"photoTags";
    v23 = KVFieldTypeToNumber();
    v28[2] = v23;
    v27[3] = @"photoAlbumName";
    v22 = KVFieldTypeToNumber();
    v28[3] = v22;
    v27[4] = @"healthActivity";
    v21 = KVFieldTypeToNumber();
    v28[4] = v21;
    v27[5] = @"carProfileName";
    v20 = KVFieldTypeToNumber();
    v28[5] = v20;
    v27[6] = @"carName";
    id v19 = KVFieldTypeToNumber();
    v28[6] = v19;
    v27[7] = @"paymentsOrganizationName";
    uint64_t v18 = KVFieldTypeToNumber();
    v28[7] = v18;
    v27[8] = @"paymentsAccountName";
    v17 = KVFieldTypeToNumber();
    v28[8] = v17;
    v27[9] = @"notebookTitle";
    v3 = KVFieldTypeToNumber();
    v28[9] = v3;
    v27[10] = @"notebookFolderTitle";
    v4 = KVFieldTypeToNumber();
    v28[10] = v4;
    v27[11] = @"appPlaylistTitle";
    v5 = KVFieldTypeToNumber();
    v28[11] = v5;
    v27[12] = @"appMusicArtistName";
    id v6 = KVFieldTypeToNumber();
    v28[12] = v6;
    v27[13] = @"appAudiobookTitle";
    id v7 = KVFieldTypeToNumber();
    v28[13] = v7;
    v27[14] = @"appAudiobookAuthor";
    v8 = KVFieldTypeToNumber();
    v28[14] = v8;
    v27[15] = @"appShowTitle";
    v9 = KVFieldTypeToNumber();
    v28[15] = v9;
    v27[16] = @"voiceCommandName";
    v10 = KVFieldTypeToNumber();
    v28[16] = v10;
    v27[17] = @"photoMemoryName";
    uint64_t v11 = KVFieldTypeToNumber();
    v28[17] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:18];
    ontologyNodeToFieldTypeMap = v2->_ontologyNodeToFieldTypeMap;
    v2->_ontologyNodeToFieldTypeMap = (NSDictionary *)v12;

    uint64_t v14 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v14;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end