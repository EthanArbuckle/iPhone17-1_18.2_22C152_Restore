@interface NSCoder(LPExtras)
- (id)_lp_strictlyDecodeArrayOfLPARAssetsForKey:()LPExtras;
- (id)_lp_strictlyDecodeArrayOfLPImagesForKey:()LPExtras;
- (id)_lp_strictlyDecodeArrayOfObjectsOfClass:()LPExtras forKey:;
- (id)_lp_strictlyDecodeArrayOfObjectsOfClasses:()LPExtras forKey:;
- (id)_lp_strictlyDecodeColorForKey:()LPExtras;
- (id)_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()LPExtras andObjectsOfClass:forKey:;
- (id)_lp_strictlyDecodeLPARAssetForKey:()LPExtras;
- (id)_lp_strictlyDecodeLPImageForKey:()LPExtras;
- (id)_lp_strictlyDecodeLPVideoForKey:()LPExtras;
- (id)_lp_strictlyDecodeNSAttributedStringForKey:()LPExtras;
- (id)_lp_strictlyDecodeNSDataForKey:()LPExtras;
- (id)_lp_strictlyDecodeNSStringForKey:()LPExtras;
- (id)_lp_strictlyDecodeObjectOfClass:()LPExtras forKey:;
- (id)_lp_strictlyDecodeObjectOfClasses:()LPExtras forKey:;
- (id)_lp_strictlyDecodeTopLevelObjectOfClass:()LPExtras forKey:error:;
- (id)_lp_strictlyDecodeTopLevelObjectOfClasses:()LPExtras forKey:error:;
- (uint64_t)_lp_coderOptions;
- (uint64_t)_lp_coderType;
- (void)_lp_encodeArrayIfNotEmpty:()LPExtras forKey:;
- (void)_lp_encodeColorIfNotNil:()LPExtras forKey:;
- (void)_lp_encodeObjectIfNotNil:()LPExtras forKey:;
- (void)_lp_encodeStringIfNotNil:()LPExtras forKey:;
- (void)_lp_encodeURLIfNotNilOrLocalFile:()LPExtras forKey:;
- (void)_lp_setCoderOptions:()LPExtras;
- (void)_lp_setCoderType:()LPExtras;
@end

@implementation NSCoder(LPExtras)

- (id)_lp_strictlyDecodeNSDataForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeNSStringForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeNSAttributedStringForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeLPARAssetForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(&cfstr_Lparassetattac.isa), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeArrayOfLPARAssetsForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(&cfstr_Lparassetattac.isa), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeLPImageForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(&cfstr_Lpimageattachm.isa), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeArrayOfLPImagesForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(&cfstr_Lpimageattachm.isa), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeLPVideoForKey:()LPExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(&cfstr_Lpvideoattachm.isa), 0);
  v8 = objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);

  return v8;
}

- (id)_lp_strictlyDecodeObjectOfClass:()LPExtras forKey:
{
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", a3, objc_opt_class(), 0);
  v8 = [a1 decodeObjectOfClasses:v7 forKey:v6];

  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)_lp_strictlyDecodeObjectOfClasses:()LPExtras forKey:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 setByAddingObject:objc_opt_class()];
  id v9 = [a1 decodeObjectOfClasses:v8 forKey:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_opt_isKindOfClass())
        {
          id v14 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)_lp_strictlyDecodeTopLevelObjectOfClass:()LPExtras forKey:error:
{
  id v8 = a4;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", a3, objc_opt_class(), 0);
  id v10 = [a1 decodeTopLevelObjectOfClasses:v9 forKey:v8 error:a5];

  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)_lp_strictlyDecodeTopLevelObjectOfClasses:()LPExtras forKey:error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 setByAddingObject:objc_opt_class()];
  id v11 = [a1 decodeTopLevelObjectOfClasses:v10 forKey:v9 error:a5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        if (objc_opt_isKindOfClass())
        {
          id v16 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)_lp_strictlyDecodeArrayOfObjectsOfClass:()LPExtras forKey:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", a3, v8, v9, objc_opt_class(), 0);
  id v11 = [a1 decodeObjectOfClasses:v10 forKey:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v16 = v12;
  }
  else
  {
LABEL_13:
    id v16 = 0;
  }

  return v16;
}

- (id)_lp_strictlyDecodeArrayOfObjectsOfClasses:()LPExtras forKey:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  id v11 = [v10 setByAddingObjectsFromSet:v6];
  id v12 = [a1 decodeObjectOfClasses:v11 forKey:v23];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (!v13)
    {
LABEL_19:

      id v20 = obj;
      goto LABEL_22;
    }
    uint64_t v14 = *(void *)v29;
    while (1)
    {
      uint64_t v15 = 0;
LABEL_6:
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(obj);
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (!v17) {
        break;
      }
      uint64_t v18 = *(void *)v25;
LABEL_10:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17) {
            goto LABEL_10;
          }
          goto LABEL_20;
        }
      }

      if (++v15 != v13) {
        goto LABEL_6;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (!v13) {
        goto LABEL_19;
      }
    }
LABEL_20:
  }
  id v20 = 0;
LABEL_22:

  return v20;
}

- (id)_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()LPExtras andObjectsOfClass:forKey:
{
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v9, "setWithObjects:", a3, a4, v10, v11, objc_opt_class(), 0);
  uint64_t v13 = [a1 decodeObjectOfClasses:v12 forKey:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__NSCoder_LPExtras___lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass_andObjectsOfClass_forKey___block_invoke;
    v16[3] = &unk_1E5B06938;
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

- (void)_lp_encodeObjectIfNotNil:()LPExtras forKey:
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_lp_encodeStringIfNotNil:()LPExtras forKey:
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v8, "classForCoder"), "isEqual:", objc_opt_class()) & 1) == 0)
    {
      uint64_t v7 = [[NSString alloc] initWithString:v8];

      id v8 = (id)v7;
    }
    [a1 encodeObject:v8 forKey:v6];
  }
  else
  {
    id v8 = 0;
  }
}

- (void)_lp_encodeArrayIfNotEmpty:()LPExtras forKey:
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 count]) {
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_lp_encodeURLIfNotNilOrLocalFile:()LPExtras forKey:
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && (![v8 isFileURL] || objc_msgSend(a1, "_lp_coderType") == 1))
  {
    id v7 = urlByRemovingTrackingInformation(v8);
    [a1 encodeObject:v7 forKey:v6];
  }
}

- (void)_lp_encodeColorIfNotNil:()LPExtras forKey:
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    if ([v6 getRed:&v19 green:&v18 blue:&v17 alpha:&v16])
    {
      [a1 encodeBool:1 forKey:v7];
      double v8 = v19;
      uint64_t v9 = [v7 stringByAppendingString:@".red"];
      [a1 encodeDouble:v9 forKey:v8];

      double v10 = v18;
      uint64_t v11 = [v7 stringByAppendingString:@".green"];
      [a1 encodeDouble:v11 forKey:v10];

      double v12 = v17;
      uint64_t v13 = [v7 stringByAppendingString:@".blue"];
      [a1 encodeDouble:v13 forKey:v12];

      double v14 = v16;
      uint64_t v15 = [v7 stringByAppendingString:@".alpha"];
      [a1 encodeDouble:v15 forKey:v14];
    }
  }
}

- (id)_lp_strictlyDecodeColorForKey:()LPExtras
{
  id v4 = a3;
  if ([a1 decodeBoolForKey:v4])
  {
    v5 = [v4 stringByAppendingString:@".red"];
    [a1 decodeDoubleForKey:v5];
    double v7 = v6;

    double v8 = [v4 stringByAppendingString:@".green"];
    [a1 decodeDoubleForKey:v8];
    double v10 = v9;

    uint64_t v11 = [v4 stringByAppendingString:@".blue"];
    [a1 decodeDoubleForKey:v11];
    double v13 = v12;

    double v14 = [v4 stringByAppendingString:@".alpha"];
    [a1 decodeDoubleForKey:v14];
    double v16 = v15;

    double v17 = [MEMORY[0x1E4FB1618] colorWithRed:v7 green:v10 blue:v13 alpha:v16];
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (uint64_t)_lp_coderType
{
  v2 = objc_getAssociatedObject(a1, a2);
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_lp_setCoderType:()LPExtras
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_coderType, v2, (void *)1);
}

- (uint64_t)_lp_coderOptions
{
  id v2 = objc_getAssociatedObject(a1, a2);
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_lp_setCoderOptions:()LPExtras
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_coderOptions, v2, (void *)1);
}

@end