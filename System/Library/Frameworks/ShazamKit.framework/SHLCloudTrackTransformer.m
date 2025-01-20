@interface SHLCloudTrackTransformer
+ (id)baseCloudRecordFromTrack:(id)a3 usingEncryption:(BOOL)a4;
+ (id)cloudBackedItemFromLibraryTrack:(id)a3 usingEncryption:(BOOL)a4;
+ (id)libraryTrackFromCloudBackedItem:(id)a3 usingEncryption:(BOOL)a4;
@end

@implementation SHLCloudTrackTransformer

+ (id)libraryTrackFromCloudBackedItem:(id)a3 usingEncryption:(BOOL)a4
{
  v5 = [a3 record];
  v6 = [v5 recordType];
  unsigned int v7 = [v6 isEqualToString:@"Track"];

  if (!v7)
  {
    id v12 = 0;
    goto LABEL_26;
  }
  if (a4)
  {
    v8 = [v5 encryptedValues];
    v9 = [v8 objectForKeyedSubscript:@"RecognitionIdentifier"];

    v10 = [v5 encryptedValues];
    v11 = [v10 objectForKeyedSubscript:@"ShazamKey"];
  }
  else
  {
    v9 = [v5 objectForKeyedSubscript:@"RecognitionIdentifier"];
    v11 = [v5 objectForKeyedSubscript:@"ShazamKey"];
  }
  id v13 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 encodeSystemFieldsWithCoder:v13];
  v14 = [SHLLibraryItemMetadata alloc];
  v15 = [v13 encodedData];
  v16 = [(SHLLibraryItemMetadata *)v14 initWithEncodedSystemData:v15];

  if (a4)
  {
    v17 = [SHLMutableLibraryTrack alloc];
    v18 = [v5 recordID];
    v19 = [v18 recordName];
    v20 = [(SHLLibraryTrack *)v17 initWithIdentifier:v19 metadata:v16];

    [(SHLLibraryTrack *)v20 setRecognitionIdentifier:v9];
    v21 = [[SHLShazamKey alloc] initWithKey:v11];
    [(SHLLibraryTrack *)v20 setShazamKey:v21];

    v22 = [v5 encryptedValues];
    v23 = [v22 objectForKeyedSubscript:@"Date"];
    [(SHLLibraryTrack *)v20 setDate:v23];

    v24 = [v5 encryptedValues];
    v25 = [v24 objectForKeyedSubscript:@"Title"];
    [(SHLLibraryTrack *)v20 setTitle:v25];

    v26 = [v5 encryptedValues];
    v27 = [v26 objectForKeyedSubscript:@"Subtitle"];
    [(SHLLibraryTrack *)v20 setSubtitle:v27];

    v28 = [v5 encryptedValues];
    v29 = [v28 objectForKeyedSubscript:@"ProviderIdentifier"];
    [(SHLLibraryTrack *)v20 setProviderIdentifier:v29];

    v30 = [v5 encryptedValues];
    v31 = [v30 objectForKeyedSubscript:@"ProviderName"];
    [(SHLLibraryTrack *)v20 setProviderName:v31];

LABEL_12:
    v38 = [v5 encryptedValues];
    v39 = [v38 objectForKeyedSubscript:@"Location"];
    [(SHLLibraryTrack *)v20 setLocation:v39];

    v40 = [v5 objectForKeyedSubscript:@"AssociatedGroupIdentifier"];
    v41 = [v40 recordID];
    v42 = [v41 recordName];
    [(SHLLibraryTrack *)v20 setAssociatedGroupIdentifier:v42];

    v53 = v11;
    v52 = v16;
    if (a4)
    {
      v43 = [v5 encryptedValues];
      v44 = [v43 objectForKeyedSubscript:@"Labels"];
    }
    else
    {
      v44 = [v5 objectForKeyedSubscript:@"Labels"];
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v45 = v44;
    id v46 = [v45 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v55;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v55 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [[SHLLibraryLabel alloc] initWithName:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if ([(SHLLibraryLabel *)v50 type]) {
            [(SHLLibraryTrack *)v20 addLabel:v50];
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v47);
    }

    id v12 = [(SHLMutableLibraryTrack *)v20 copy];
    v11 = v53;
    v16 = v52;
    goto LABEL_25;
  }
  id v12 = 0;
  if (v9 && v11)
  {
    v32 = [[SHLShazamKey alloc] initWithKey:v11];
    if (v32)
    {
      v33 = v32;
      v20 = [(SHLLibraryTrack *)[SHLMutableLibraryTrack alloc] initWithRecognitionIdentifier:v9 shazamKey:v32 metadata:v16];

      v34 = [v5 objectForKeyedSubscript:@"Date"];
      [(SHLLibraryTrack *)v20 setDate:v34];

      v35 = [v5 objectForKeyedSubscript:@"Title"];
      [(SHLLibraryTrack *)v20 setTitle:v35];

      v36 = [v5 objectForKeyedSubscript:@"Subtitle"];
      [(SHLLibraryTrack *)v20 setSubtitle:v36];

      v37 = [v5 objectForKeyedSubscript:@"ProviderIdentifier"];
      [(SHLLibraryTrack *)v20 setProviderIdentifier:v37];

      v30 = [v5 objectForKeyedSubscript:@"ProviderName"];
      [(SHLLibraryTrack *)v20 setProviderName:v30];
      goto LABEL_12;
    }
    id v12 = 0;
  }
LABEL_25:

LABEL_26:

  return v12;
}

+ (id)cloudBackedItemFromLibraryTrack:(id)a3 usingEncryption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [a1 baseCloudRecordFromTrack:v6 usingEncryption:v4];
  if (v7)
  {
    if (v4)
    {
      v8 = [v6 recognitionIdentifier];
      v9 = [v6 shazamKey];
      v10 = [v9 validatedKey];

      v11 = [v7 encryptedValues];
      [v11 setObject:v8 forKeyedSubscript:@"RecognitionIdentifier"];

      id v12 = [v7 encryptedValues];
      [v12 setObject:v10 forKeyedSubscript:@"ShazamKey"];

      id v13 = [v6 date];
      v14 = [v7 encryptedValues];
      [v14 setObject:v13 forKeyedSubscript:@"Date"];

      v15 = [v6 providerIdentifier];
      v16 = [v7 encryptedValues];
      [v16 setObject:v15 forKeyedSubscript:@"ProviderIdentifier"];

      v17 = [v6 providerName];
      v18 = [v7 encryptedValues];
      [v18 setObject:v17 forKeyedSubscript:@"ProviderName"];

      v19 = [v6 title];
      v20 = [v7 encryptedValues];
      [v20 setObject:v19 forKeyedSubscript:@"Title"];

      v21 = [v6 subtitle];
      v22 = [v7 encryptedValues];
      [v22 setObject:v21 forKeyedSubscript:@"Subtitle"];
    }
    else
    {
      v24 = [v6 compoundIdentifier];
      v8 = [v24 recognitionIdentifier];

      v25 = [v6 compoundIdentifier];
      v26 = [v25 shazamKey];
      v10 = [v26 validatedKey];

      [v7 setObject:v8 forKeyedSubscript:@"RecognitionIdentifier"];
      [v7 setObject:v10 forKeyedSubscript:@"ShazamKey"];
      v27 = [v6 date];
      [v7 setObject:v27 forKeyedSubscript:@"Date"];

      v28 = [v6 providerIdentifier];
      [v7 setObject:v28 forKeyedSubscript:@"ProviderIdentifier"];

      v29 = [v6 providerName];
      [v7 setObject:v29 forKeyedSubscript:@"ProviderName"];

      v30 = [v6 title];
      [v7 setObject:v30 forKeyedSubscript:@"Title"];

      v21 = [v6 subtitle];
      [v7 setObject:v21 forKeyedSubscript:@"Subtitle"];
    }

    v31 = [v6 labels];
    id v32 = [v31 count];

    if (v32)
    {
      v62 = v10;
      v33 = v8;
      v34 = [v6 labels];
      v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v34 count]);

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v36 = [v6 labels];
      id v37 = [v36 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v64;
        do
        {
          for (i = 0; i != v38; i = (char *)i + 1)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = [*(id *)(*((void *)&v63 + 1) + 8 * i) name];
            [v35 addObject:v41];
          }
          id v38 = [v36 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v38);
      }

      id v42 = [v35 copy];
      if (v4)
      {
        v43 = [v7 encryptedValues];
        [v43 setObject:v42 forKeyedSubscript:@"Labels"];
      }
      else
      {
        [v7 setObject:v42 forKeyedSubscript:@"Labels"];
      }
      v8 = v33;

      v10 = v62;
    }
    v44 = [v6 location];
    [v44 coordinate];
    BOOL v45 = CLLocationCoordinate2DIsValid(v69);

    if (v45)
    {
      id v46 = [v6 location];
      id v47 = v46;
      if (!v4)
      {
        [v46 coordinate];
        double v49 = round(v48 * 100.0) / 100.0;

        v50 = [v6 location];
        [v50 coordinate];
        double v52 = round(v51 * 100.0) / 100.0;

        id v47 = [objc_alloc((Class)CLLocation) initWithLatitude:v49 longitude:v52];
      }
      v53 = [v7 encryptedValues];
      [v53 setObject:v47 forKeyedSubscript:@"Location"];
    }
    long long v54 = [v6 associatedGroupIdentifier];

    if (v54)
    {
      id v55 = objc_alloc((Class)CKRecordID);
      long long v56 = [v6 associatedGroupIdentifier];
      long long v57 = [v7 recordID];
      v58 = [v57 zoneID];
      id v59 = [v55 initWithRecordName:v56 zoneID:v58];

      id v60 = [objc_alloc((Class)CKReference) initWithRecordID:v59 action:1];
      [v7 setObject:v60 forKeyedSubscript:@"AssociatedGroupIdentifier"];
    }
    v23 = [[SHLCloudBackedItem alloc] initWithRecord:v7];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)baseCloudRecordFromTrack:(id)a3 usingEncryption:(BOOL)a4
{
  id v4 = a3;
  v5 = [v4 metadata];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSKeyedUnarchiver);
    unsigned int v7 = [v4 metadata];

    v8 = [v7 encodedSystemData];
    uint64_t v17 = 0;
    id v9 = [v6 initForReadingFromData:v8 error:&v17];

    id v10 = [objc_alloc((Class)CKRecord) initWithCoder:v9];
    [v9 finishDecoding];
  }
  else
  {
    id v11 = objc_alloc((Class)CKRecordID);
    id v12 = [v4 identifier];

    id v13 = +[SHLCloudContext sharedContext];
    v14 = [v13 shazamLibraryZone];
    v15 = [v14 zoneID];
    id v9 = [v11 initWithRecordName:v12 zoneID:v15];

    id v10 = [objc_alloc((Class)CKRecord) initWithRecordType:@"Track" recordID:v9];
  }

  return v10;
}

@end