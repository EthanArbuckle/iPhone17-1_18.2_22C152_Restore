@interface NSCoder(_BlastDoorLPExtras)
- (_BlastDoorLPPlatformColor)_bd_lp_strictlyDecodeColorForKey:()_BlastDoorLPExtras;
- (char)_bd_lp_strictlyDecodeObjectOfClasses:()_BlastDoorLPExtras forKey:;
- (char)_bd_lp_strictlyDecodeTopLevelObjectOfClasses:()_BlastDoorLPExtras forKey:error:;
- (id)_bd_lp_strictlyDecodeArrayOfLPARAssetsForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeArrayOfLPImagesForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClass:()_BlastDoorLPExtras forKey:;
- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:()_BlastDoorLPExtras forKey:;
- (id)_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()_BlastDoorLPExtras andObjectsOfClass:forKey:;
- (id)_bd_lp_strictlyDecodeLPARAssetForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeLPImageForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeLPVideoForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeNSAttributedStringForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeNSDataForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeNSStringForKey:()_BlastDoorLPExtras;
- (id)_bd_lp_strictlyDecodeObjectOfClass:()_BlastDoorLPExtras forKey:;
- (id)_bd_lp_strictlyDecodeTopLevelObjectOfClass:()_BlastDoorLPExtras forKey:error:;
- (void)_bd_lp_encodeArrayIfNotEmpty:()_BlastDoorLPExtras forKey:;
- (void)_bd_lp_encodeColorIfNotNil:()_BlastDoorLPExtras forKey:;
- (void)_bd_lp_encodeObjectIfNotNil:()_BlastDoorLPExtras forKey:;
- (void)_bd_lp_encodeURLIfNotNilOrLocalFile:()_BlastDoorLPExtras forKey:;
@end

@implementation NSCoder(_BlastDoorLPExtras)

- (id)_bd_lp_strictlyDecodeNSDataForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeNSStringForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeNSAttributedStringForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPARAssetForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(&cfstr_Blastdoorlpara.isa), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeArrayOfLPARAssetsForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(&cfstr_Blastdoorlpara.isa), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPImageForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(&cfstr_Blastdoorlpima.isa), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeArrayOfLPImagesForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(&cfstr_Blastdoorlpima.isa), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPVideoForKey:()_BlastDoorLPExtras
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(&cfstr_Blastdoorlpvid.isa), 0);
  v8 = objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);

  return v8;
}

- (id)_bd_lp_strictlyDecodeObjectOfClass:()_BlastDoorLPExtras forKey:
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  v8 = objc_msgSend(v6, "setWithObjects:", a3, objc_opt_class(), 0);
  v9 = [a1 decodeObjectOfClasses:v8 forKey:v7];

  id v10 = 0;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }

  return v10;
}

- (char)_bd_lp_strictlyDecodeObjectOfClasses:()_BlastDoorLPExtras forKey:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 setByAddingObject:objc_opt_class()];
  v9 = [a1 decodeObjectOfClasses:v8 forKey:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v6;
  v11 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_opt_isKindOfClass())
        {
          v11 = v9;
          goto LABEL_11;
        }
      }
      v11 = (char *)[v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)_bd_lp_strictlyDecodeTopLevelObjectOfClass:()_BlastDoorLPExtras forKey:error:
{
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a4;
  id v10 = objc_msgSend(v8, "setWithObjects:", a3, objc_opt_class(), 0);
  v11 = [a1 decodeTopLevelObjectOfClasses:v10 forKey:v9 error:a5];

  id v12 = 0;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }

  return v12;
}

- (char)_bd_lp_strictlyDecodeTopLevelObjectOfClasses:()_BlastDoorLPExtras forKey:error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 setByAddingObject:objc_opt_class()];
  v11 = [a1 decodeTopLevelObjectOfClasses:v10 forKey:v9 error:a5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  v13 = (char *)[v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        if (objc_opt_isKindOfClass())
        {
          v13 = v11;
          goto LABEL_11;
        }
      }
      v13 = (char *)[v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClass:()_BlastDoorLPExtras forKey:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", a3, v8, v9, objc_opt_class(), 0);
  v11 = [a1 decodeObjectOfClasses:v10 forKey:v6];

  objc_opt_class();
  id v12 = 0;
  if (objc_opt_isKindOfClass())
  {
    if ([v11 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v19 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v19 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v12 = v13;
    }
    else
    {
LABEL_13:
      id v12 = 0;
    }
  }

  return v12;
}

- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:()_BlastDoorLPExtras forKey:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v12 = [v11 setByAddingObjectsFromSet:v6];
  id v13 = [a1 decodeObjectOfClasses:v12 forKey:v7];

  objc_opt_class();
  id v14 = 0;
  if (objc_opt_isKindOfClass())
  {
    if ([v13 count])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = v13;
      uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        id v25 = v7;
        while (1)
        {
          uint64_t v18 = 0;
LABEL_6:
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v19 = v6;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v27 count:16];
          if (!v20) {
            break;
          }
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v29;
LABEL_10:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v19);
            }
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v27 count:16];
              if (v21) {
                goto LABEL_10;
              }
              goto LABEL_20;
            }
          }

          if (++v18 != v16) {
            goto LABEL_6;
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
          id v7 = v25;
          if (!v16) {
            goto LABEL_19;
          }
        }
LABEL_20:

        id v14 = 0;
        id v7 = v25;
      }
      else
      {
LABEL_19:

        id v14 = obj;
      }
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (id)_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()_BlastDoorLPExtras andObjectsOfClass:forKey:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v9, "setWithObjects:", a3, a4, v10, v11, objc_opt_class(), 0);
  id v13 = [a1 decodeObjectOfClasses:v12 forKey:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112__NSCoder__BlastDoorLPExtras___bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass_andObjectsOfClass_forKey___block_invoke;
    v16[3] = &unk_1E5FF69D8;
    v16[5] = a3;
    v16[6] = a4;
    v16[4] = &v17;
    [v13 enumerateKeysAndObjectsUsingBlock:v16];
    if (*((unsigned char *)v18 + 24)) {
      id v14 = 0;
    }
    else {
      id v14 = v13;
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_bd_lp_encodeObjectIfNotNil:()_BlastDoorLPExtras forKey:
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NSCoder(_BlastDoorLPExtras) _bd_lp_encodeObjectIfNotNil:forKey:]();
    }
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_bd_lp_encodeArrayIfNotEmpty:()_BlastDoorLPExtras forKey:
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 count]) {
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_bd_lp_encodeURLIfNotNilOrLocalFile:()_BlastDoorLPExtras forKey:
{
  id v7 = a3;
  id v6 = a4;
  if (v7 && ([v7 isFileURL] & 1) == 0) {
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_bd_lp_encodeColorIfNotNil:()_BlastDoorLPExtras forKey:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    [a1 encodeBool:1 forKey:v6];
    [v7 r];
    double v9 = v8;
    uint64_t v10 = [v6 stringByAppendingString:@".red"];
    [a1 encodeDouble:v10 forKey:v9];

    [v7 g];
    double v12 = v11;
    id v13 = [v6 stringByAppendingString:@".green"];
    [a1 encodeDouble:v13 forKey:v12];

    [v7 b];
    double v15 = v14;
    uint64_t v16 = [v6 stringByAppendingString:@".blue"];
    [a1 encodeDouble:v16 forKey:v15];

    [v7 a];
    double v18 = v17;

    id v19 = [v6 stringByAppendingString:@".alpha"];

    [a1 encodeDouble:v19 forKey:v18];
  }
}

- (_BlastDoorLPPlatformColor)_bd_lp_strictlyDecodeColorForKey:()_BlastDoorLPExtras
{
  id v4 = a3;
  if ([a1 decodeBoolForKey:v4])
  {
    id v5 = [v4 stringByAppendingString:@".red"];
    [a1 decodeDoubleForKey:v5];
    double v7 = v6;

    double v8 = [v4 stringByAppendingString:@".green"];
    [a1 decodeDoubleForKey:v8];
    double v10 = v9;

    double v11 = [v4 stringByAppendingString:@".blue"];
    [a1 decodeDoubleForKey:v11];
    double v13 = v12;

    double v14 = [v4 stringByAppendingString:@".alpha"];
    [a1 decodeDoubleForKey:v14];
    double v16 = v15;

    double v17 = objc_alloc_init(_BlastDoorLPPlatformColor);
    [(_BlastDoorLPPlatformColor *)v17 setR:v7];
    [(_BlastDoorLPPlatformColor *)v17 setG:v10];
    [(_BlastDoorLPPlatformColor *)v17 setB:v13];
    [(_BlastDoorLPPlatformColor *)v17 setA:v16];
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)_bd_lp_encodeObjectIfNotNil:()_BlastDoorLPExtras forKey:.cold.1()
{
}

@end