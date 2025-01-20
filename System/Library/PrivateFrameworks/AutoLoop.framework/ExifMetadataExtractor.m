@interface ExifMetadataExtractor
- (BOOL)CopyFromMakerMediaDict:(id)a3 toDict:(id)a4;
- (BOOL)copyKeysFromDictionary:(id)a3;
- (BOOL)hadAllRequestedKeys;
- (BOOL)keyIsDesired:(id)a3;
- (BOOL)saveAllMetadata;
- (ExifMetadataExtractor)init;
- (NSDictionary)allMetadata;
- (NSMutableArray)desiredExifKeysArray;
- (NSMutableArray)facesArray;
- (NSMutableDictionary)metadataDictionary;
- (NSURL)inFileURL;
- (signed)processFile;
- (void)CopyFacesDataFromAuxDictionary:(id)a3 toArray:(id)a4;
- (void)performCorrectionsOnDictionary:(id)a3;
- (void)setDesiredExifKeysArray:(id)a3;
- (void)setInFileURL:(id)a3;
- (void)setSaveAllMetadata:(BOOL)a3;
@end

@implementation ExifMetadataExtractor

- (ExifMetadataExtractor)init
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)ExifMetadataExtractor;
  v2 = [(ExifMetadataExtractor *)&v12 init];
  v14[0] = @"AEAverage";
  v14[1] = @"AESTable";
  v15[0] = @"6";
  v15[1] = @"4";
  v14[2] = @"AFStable";
  v15[2] = @"7";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  desiredAppleMakerKeyPairs = v2->desiredAppleMakerKeyPairs;
  v2->desiredAppleMakerKeyPairs = (NSDictionary *)v3;

  uint64_t v5 = *MEMORY[0x1E4F2F7B0];
  v13[0] = *MEMORY[0x1E4F2F878];
  v13[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F2F808];
  v13[2] = *MEMORY[0x1E4F2F828];
  v13[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F2F890];
  v13[4] = *MEMORY[0x1E4F2F838];
  v13[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
  uint64_t v9 = [v8 mutableCopy];
  desiredExifKeysArray = v2->desiredExifKeysArray;
  v2->desiredExifKeysArray = (NSMutableArray *)v9;

  return v2;
}

- (BOOL)keyIsDesired:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->desiredExifKeysArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "isEqualToString:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)performCorrectionsOnDictionary:(id)a3
{
  id v7 = a3;
  uint64_t v4 = *MEMORY[0x1E4F2F808];
  if ([(ExifMetadataExtractor *)self keyIsDesired:*MEMORY[0x1E4F2F808]])
  {
    uint64_t v5 = [v7 objectForKeyedSubscript:v4];
    if (!v5)
    {
      LODWORD(v6) = 1.0;
      uint64_t v5 = [NSNumber numberWithFloat:v6];
    }
    [v7 setObject:v5 forKeyedSubscript:v4];
  }
}

- (BOOL)CopyFromMakerMediaDict:(id)a3 toDict:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->desiredAppleMakerKeyPairs;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [(NSDictionary *)self->desiredAppleMakerKeyPairs objectForKeyedSubscript:v13];
        uint64_t v15 = [v6 objectForKeyedSubscript:v14];

        if (v15) {
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
        else {
          char v17 = 0;
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  else
  {
    char v17 = 1;
  }

  return v17 & 1;
}

- (void)CopyFacesDataFromAuxDictionary:(id)a3 toArray:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"Regions"];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"RegionList"];
    uint64_t v9 = v8;
    if (v8)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v15 = [v14 objectForKeyedSubscript:@"Type"];
            if ([v15 isEqualToString:@"Face"]) {
              [v5 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }
}

- (BOOL)copyKeysFromDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->desiredExifKeysArray;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v16);
        if (v13) {
          [(NSMutableDictionary *)v5 setObject:v13 forKeyedSubscript:v12];
        }
        else {
          char v10 = 0;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  metadataDictionary = self->metadataDictionary;
  self->metadataDictionary = v5;

  return v10 & 1;
}

- (signed)processFile
{
  self->hadAllRequestedKeys = 0;
  inFileURL = self->inFileURL;
  if (inFileURL)
  {
    id v4 = CGImageSourceCreateWithURL((CFURLRef)inFileURL, 0);
    if (v4)
    {
      id v5 = v4;
      CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
      if (self->saveAllMetadata) {
        objc_storeStrong((id *)&self->allMetadata, v6);
      }
      if (v6)
      {
        uint64_t v7 = [(__CFDictionary *)v6 objectForKey:*MEMORY[0x1E4F2F800]];
        if (v7) {
          self->hadAllRequestedKeys = [(ExifMetadataExtractor *)self copyKeysFromDictionary:v7];
        }
        uint64_t v8 = [(__CFDictionary *)v6 objectForKey:*MEMORY[0x1E4F2FC20]];
        if (v8)
        {
          BOOL v9 = [(ExifMetadataExtractor *)self CopyFromMakerMediaDict:v8 toDict:self->metadataDictionary];
          BOOL v10 = self->hadAllRequestedKeys && v9;
          self->hadAllRequestedKeys = v10;
        }
        uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        facesArray = self->facesArray;
        self->facesArray = v11;

        uint64_t v13 = [(__CFDictionary *)v6 objectForKey:*MEMORY[0x1E4F2F6D8]];
        if (v13) {
          [(ExifMetadataExtractor *)self CopyFacesDataFromAuxDictionary:v13 toArray:self->facesArray];
        }

        signed __int16 v14 = 0;
      }
      else
      {
        signed __int16 v14 = -5003;
      }
      CFRelease(v5);
    }
    else
    {
      signed __int16 v14 = -5002;
    }
  }
  else
  {
    signed __int16 v14 = -5001;
  }
  if (self->metadataDictionary) {
    -[ExifMetadataExtractor performCorrectionsOnDictionary:](self, "performCorrectionsOnDictionary:");
  }
  return v14;
}

- (NSURL)inFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInFileURL:(id)a3
{
}

- (NSMutableDictionary)metadataDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)desiredExifKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDesiredExifKeysArray:(id)a3
{
}

- (BOOL)hadAllRequestedKeys
{
  return self->hadAllRequestedKeys;
}

- (NSMutableArray)facesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)saveAllMetadata
{
  return self->saveAllMetadata;
}

- (void)setSaveAllMetadata:(BOOL)a3
{
  self->saveAllMetadata = a3;
}

- (NSDictionary)allMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allMetadata, 0);
  objc_storeStrong((id *)&self->facesArray, 0);
  objc_storeStrong((id *)&self->desiredExifKeysArray, 0);
  objc_storeStrong((id *)&self->metadataDictionary, 0);
  objc_storeStrong((id *)&self->inFileURL, 0);

  objc_storeStrong((id *)&self->desiredAppleMakerKeyPairs, 0);
}

@end