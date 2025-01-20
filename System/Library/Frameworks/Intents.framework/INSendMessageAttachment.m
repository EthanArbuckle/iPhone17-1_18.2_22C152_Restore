@interface INSendMessageAttachment
+ (BOOL)supportsSecureCoding;
+ (INSendMessageAttachment)attachmentWithAudioMessageFile:(INFile *)audioMessageFile;
+ (INSendMessageAttachment)attachmentWithCurrentLocation;
+ (INSendMessageAttachment)attachmentWithFile:(id)a3;
+ (INSendMessageAttachment)attachmentWithPHAsset:(id)a3;
+ (INSendMessageAttachment)attachmentWithPHAssetId:(id)a3;
+ (INSendMessageAttachment)attachmentWithSharedLink:(id)a3;
+ (INSendMessageAttachment)attachmentWithSpeechDataURL:(id)a3;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)currentLocation;
- (BOOL)isEqual:(id)a3;
- (INFile)audioMessageFile;
- (INFile)file;
- (INSendMessageAttachment)initWithCoder:(id)a3;
- (NSString)phAssetId;
- (NSURL)sharedLink;
- (NSURL)speechDataURL;
- (PHAsset)phAsset;
- (id)_dictionaryRepresentation;
- (id)_initWithCurrentLocation:(BOOL)a3 file:(id)a4 speechDataURL:(id)a5 audioMessageFile:(id)a6 sharedLink:(id)a7 phAssetId:(id)a8;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSendMessageAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phAssetId, 0);
  objc_storeStrong((id *)&self->_sharedLink, 0);
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_file, 0);

  objc_storeStrong((id *)&self->_audioMessageFile, 0);
}

- (NSString)phAssetId
{
  return self->_phAssetId;
}

- (NSURL)sharedLink
{
  return self->_sharedLink;
}

- (NSURL)speechDataURL
{
  return self->_speechDataURL;
}

- (INFile)file
{
  return self->_file;
}

- (BOOL)currentLocation
{
  return self->_currentLocation;
}

- (INFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (id)_dictionaryRepresentation
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"currentLocation";
  v3 = [NSNumber numberWithBool:self->_currentLocation];
  v15[0] = v3;
  v14[1] = @"file";
  file = self->_file;
  v5 = file;
  if (!file)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v5;
  v14[2] = @"speechDataURL";
  speechDataURL = self->_speechDataURL;
  v7 = speechDataURL;
  if (!speechDataURL)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v7;
  v14[3] = @"audioMessageFile";
  audioMessageFile = self->_audioMessageFile;
  v9 = audioMessageFile;
  if (!audioMessageFile)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"sharedLink";
  sharedLink = self->_sharedLink;
  v11 = sharedLink;
  if (!sharedLink)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (sharedLink)
  {
    if (audioMessageFile) {
      goto LABEL_11;
    }
  }
  else
  {

    if (audioMessageFile)
    {
LABEL_11:
      if (speechDataURL) {
        goto LABEL_12;
      }
LABEL_18:

      if (file) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!speechDataURL) {
    goto LABEL_18;
  }
LABEL_12:
  if (file) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL currentLocation = self->_currentLocation;
  id v5 = a3;
  [v5 encodeBool:currentLocation forKey:@"currentLocation"];
  [v5 encodeObject:self->_file forKey:@"file"];
  [v5 encodeObject:self->_speechDataURL forKey:@"speechDataURL"];
  [v5 encodeObject:self->_audioMessageFile forKey:@"audioMessageFile"];
  [v5 encodeObject:self->_sharedLink forKey:@"sharedLink"];
  [v5 encodeObject:self->_phAssetId forKey:@"phAssetId"];
}

- (INSendMessageAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"currentLocation"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechDataURL"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioMessageFile"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedLink"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phAssetId"];

  v11 = (INSendMessageAttachment *)[objc_alloc((Class)objc_opt_class()) _initWithCurrentLocation:v5 file:v6 speechDataURL:v7 audioMessageFile:v8 sharedLink:v9 phAssetId:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (NSString **)v4;
    BOOL v11 = 0;
    if (self->_currentLocation == *((unsigned __int8 *)v5 + 8))
    {
      file = self->_file;
      if (file == (INFile *)v5[3] || -[INFile isEqual:](file, "isEqual:"))
      {
        speechDataURL = self->_speechDataURL;
        if (speechDataURL == (NSURL *)v5[4] || -[NSURL isEqual:](speechDataURL, "isEqual:"))
        {
          audioMessageFile = self->_audioMessageFile;
          if (audioMessageFile == (INFile *)v5[2] || -[INFile isEqual:](audioMessageFile, "isEqual:"))
          {
            sharedLink = self->_sharedLink;
            if (sharedLink == (NSURL *)v5[5] || -[NSURL isEqual:](sharedLink, "isEqual:"))
            {
              phAssetId = self->_phAssetId;
              if (phAssetId == v5[6] || -[NSString isEqual:](phAssetId, "isEqual:")) {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithBool:self->_currentLocation];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(INFile *)self->_file hash];
  uint64_t v6 = v5 ^ [(NSURL *)self->_speechDataURL hash];
  unint64_t v7 = v6 ^ [(INFile *)self->_audioMessageFile hash] ^ v4;
  unint64_t v8 = v7 ^ [(NSURL *)self->_sharedLink hash];

  return v8;
}

- (PHAsset)phAsset
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_phAssetId)
  {
    uint64_t v10 = 0;
    BOOL v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getPHAssetClass_softClass;
    uint64_t v13 = getPHAssetClass_softClass;
    if (!getPHAssetClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPHAssetClass_block_invoke;
      v9[3] = &unk_1E5520EB8;
      v9[4] = &v10;
      __getPHAssetClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    v14[0] = self->_phAssetId;
    unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v6 = [v4 fetchAssetsWithLocalIdentifiers:v5 options:0];
    unint64_t v7 = [v6 firstObject];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return (PHAsset *)v7;
}

- (id)_initWithCurrentLocation:(BOOL)a3 file:(id)a4 speechDataURL:(id)a5 audioMessageFile:(id)a6 sharedLink:(id)a7 phAssetId:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)INSendMessageAttachment;
  v19 = [(INSendMessageAttachment *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_BOOL currentLocation = a3;
    uint64_t v21 = [v14 copy];
    file = v20->_file;
    v20->_file = (INFile *)v21;

    uint64_t v23 = [v15 copy];
    speechDataURL = v20->_speechDataURL;
    v20->_speechDataURL = (NSURL *)v23;

    uint64_t v25 = [v16 copy];
    audioMessageFile = v20->_audioMessageFile;
    v20->_audioMessageFile = (INFile *)v25;

    uint64_t v27 = [v17 copy];
    sharedLink = v20->_sharedLink;
    v20->_sharedLink = (NSURL *)v27;

    uint64_t v29 = [v18 copy];
    phAssetId = v20->_phAssetId;
    v20->_phAssetId = (NSString *)v29;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INSendMessageAttachment)attachmentWithPHAssetId:(id)a3
{
  id v3 = a3;
  id v4 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:0 file:0 speechDataURL:0 audioMessageFile:0 sharedLink:0 phAssetId:v3];

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithPHAsset:(id)a3
{
  id v3 = a3;
  id v4 = [INSendMessageAttachment alloc];
  unint64_t v5 = [v3 localIdentifier];

  id v6 = [(INSendMessageAttachment *)v4 _initWithCurrentLocation:0 file:0 speechDataURL:0 audioMessageFile:0 sharedLink:0 phAssetId:v5];

  return (INSendMessageAttachment *)v6;
}

+ (INSendMessageAttachment)attachmentWithSharedLink:(id)a3
{
  id v3 = a3;
  id v4 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:0 file:0 speechDataURL:0 audioMessageFile:0 sharedLink:v3 phAssetId:0];

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithAudioMessageFile:(INFile *)audioMessageFile
{
  id v3 = audioMessageFile;
  id v4 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:0 file:0 speechDataURL:0 audioMessageFile:v3 sharedLink:0 phAssetId:0];

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithSpeechDataURL:(id)a3
{
  id v3 = a3;
  id v4 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:0 file:0 speechDataURL:v3 audioMessageFile:0 sharedLink:0 phAssetId:0];

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithFile:(id)a3
{
  id v3 = a3;
  id v4 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:0 file:v3 speechDataURL:0 audioMessageFile:0 sharedLink:0 phAssetId:0];

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithCurrentLocation
{
  id v2 = [[INSendMessageAttachment alloc] _initWithCurrentLocation:1 file:0 speechDataURL:0 audioMessageFile:0 sharedLink:0 phAssetId:0];

  return (INSendMessageAttachment *)v2;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v7 = [(INSendMessageAttachment *)self speechDataURL];

  if (v7)
  {
    unint64_t v8 = [(INSendMessageAttachment *)self speechDataURL];
    v9 = [v5 encodeObject:v8];
    uint64_t v10 = @"speechDataURL";
LABEL_5:
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, v10);
LABEL_6:

    goto LABEL_7;
  }
  BOOL v11 = [(INSendMessageAttachment *)self sharedLink];

  if (v11)
  {
    unint64_t v8 = [(INSendMessageAttachment *)self sharedLink];
    v9 = [v5 encodeObject:v8];
    uint64_t v10 = @"sharedLink";
    goto LABEL_5;
  }
  if (![(INSendMessageAttachment *)self currentLocation])
  {
    uint64_t v13 = [(INSendMessageAttachment *)self audioMessageFile];

    if (v13)
    {
      unint64_t v8 = [(INSendMessageAttachment *)self audioMessageFile];
      if (![v8 _isFileURLBased])
      {
        v24[0] = @"data";
        v9 = [v8 data];
        id v14 = [v5 encodeObject:v9];
        v24[1] = @"filename";
        v25[0] = v14;
        id v15 = [v8 filename];
        id v16 = [v5 encodeObject:v15];
        v25[1] = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
        id v18 = @"audioMessageFile";
LABEL_20:
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v17, v18);

        goto LABEL_21;
      }
    }
    else
    {
      unint64_t v8 = [(INSendMessageAttachment *)self file];
      v19 = [v8 typeIdentifier];

      if (v19)
      {
        v20 = [v8 typeIdentifier];
        uint64_t v21 = [v5 encodeObject:v20];
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v21, @"typeIdentifier");
      }
      if (![v8 _isFileURLBased])
      {
        v22[0] = @"data";
        v9 = [v8 data];
        id v14 = [v5 encodeObject:v9];
        v22[1] = @"filename";
        v23[0] = v14;
        id v15 = [v8 filename];
        id v16 = [v5 encodeObject:v15];
        v23[1] = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        id v18 = @"file";
        goto LABEL_20;
      }
    }
    v9 = [v8 fileURL];
    id v14 = [v5 encodeObject:v9];
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, @"fileURL");
LABEL_21:

    goto LABEL_6;
  }
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", MEMORY[0x1E4F1CC38], @"currentLocation");
LABEL_7:

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v16 = 0;
    goto LABEL_9;
  }
  BOOL v11 = [v10 objectForKeyedSubscript:@"speechDataURL"];

  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v10 objectForKeyedSubscript:@"speechDataURL"];
    id v14 = [v8 decodeObjectOfClass:v12 from:v13];
    uint64_t v15 = [a1 attachmentWithSpeechDataURL:v14];
LABEL_8:
    id v16 = (void *)v15;

    goto LABEL_9;
  }
  id v17 = [v10 objectForKeyedSubscript:@"sharedLink"];

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v13 = [v10 objectForKeyedSubscript:@"sharedLink"];
    id v14 = [v8 decodeObjectOfClass:v18 from:v13];
    uint64_t v15 = [a1 attachmentWithSharedLink:v14];
    goto LABEL_8;
  }
  v20 = [v10 objectForKeyedSubscript:@"currentLocation"];

  if (v20)
  {
    id v16 = [a1 attachmentWithCurrentLocation];
    goto LABEL_9;
  }
  uint64_t v21 = [v10 objectForKeyedSubscript:@"audioMessageFile"];

  if (v21)
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = [v10 objectForKeyedSubscript:@"audioMessageFile"];
    v24 = [v23 objectForKeyedSubscript:@"data"];
    uint64_t v25 = [v8 decodeObjectOfClass:v22 from:v24];

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = [v10 objectForKeyedSubscript:@"audioMessageFile"];
    v28 = [v27 objectForKeyedSubscript:@"filename"];
    uint64_t v29 = [v8 decodeObjectOfClass:v26 from:v28];

    v30 = +[INFile fileWithData:v25 filename:v29 typeIdentifier:0];
    if (v30)
    {
      id v16 = [a1 attachmentWithAudioMessageFile:v30];
    }
    else
    {
      id v16 = 0;
    }

    goto LABEL_26;
  }
  uint64_t v31 = objc_opt_class();
  objc_super v32 = [v10 objectForKeyedSubscript:@"typeIdentifier"];
  uint64_t v25 = [v8 decodeObjectOfClass:v31 from:v32];

  v33 = [v10 objectForKeyedSubscript:@"fileURL"];

  if (v33)
  {
    uint64_t v34 = objc_opt_class();
    v35 = [v10 objectForKeyedSubscript:@"fileURL"];
    v36 = [v8 decodeObjectOfClass:v34 from:v35];
    uint64_t v37 = +[INFile fileWithFileURL:v36 filename:0 typeIdentifier:v25];
  }
  else
  {
    v38 = [v10 objectForKeyedSubscript:@"file"];

    if (!v38)
    {
LABEL_25:
      id v16 = 0;
      goto LABEL_26;
    }
    uint64_t v39 = objc_opt_class();
    v40 = [v10 objectForKeyedSubscript:@"file"];
    v41 = [v40 objectForKeyedSubscript:@"data"];
    v35 = [v8 decodeObjectOfClass:v39 from:v41];

    uint64_t v42 = objc_opt_class();
    v43 = [v10 objectForKeyedSubscript:@"file"];
    v44 = [v43 objectForKeyedSubscript:@"filename"];
    v36 = [v8 decodeObjectOfClass:v42 from:v44];

    uint64_t v37 = +[INFile fileWithData:v35 filename:v36 typeIdentifier:v25];
  }
  v45 = (void *)v37;

  if (!v45) {
    goto LABEL_25;
  }
  id v16 = [a1 attachmentWithFile:v45];

LABEL_26:
LABEL_9:

  return v16;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(INSendMessageAttachment *)self audioMessageFile];
  char v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if ((v8 & 1) != 0
    || ([(INSendMessageAttachment *)self file],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6),
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INSendMessageAttachment;
    BOOL v11 = [&v13 _intents_enumerateObjectsOfClass:a3 withBlock:v6];
  }

  return v11;
}

@end