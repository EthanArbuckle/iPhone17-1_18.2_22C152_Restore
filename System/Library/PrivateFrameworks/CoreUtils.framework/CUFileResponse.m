@interface CUFileResponse
- (CUFileResponse)initWithDictionary:(id)a3 error:(id *)a4;
- (NSArray)fileItems;
- (id)description;
- (unsigned)flags;
- (void)encodeWithDictionary:(id)a3;
- (void)setFileItems:(id)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation CUFileResponse

- (void).cxx_destruct
{
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFileItems:(id)a3
{
}

- (NSArray)fileItems
{
  return self->_fileItems;
}

- (id)description
{
  return NSPrintF((uint64_t)"CUFileResponse", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)encodeWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_fileItems;
  if ([(NSArray *)v5 count])
  {
    v15 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = v5;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v12 encodeWithDictionary:v13];
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v4 = v15;
    [v15 setObject:v6 forKeyedSubscript:@"fIts"];
  }
  if (self->_flags)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v4 setObject:v14 forKeyedSubscript:&unk_1EDD44098];
  }
}

- (CUFileResponse)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  v12 = [(CUFileResponse *)self init];
  if (!v12)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v35);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    goto LABEL_17;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  v14 = CFDictionaryGetTypedValue(v6, @"fIts", TypeID, 0);
  if (!v14) {
    goto LABEL_13;
  }
  v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v36 = v14;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v17) {
    goto LABEL_12;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v40 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = v36;
        if (a4)
        {
          NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960540, (uint64_t)"Non-dict file item", v22, v23, v24, v25, v26, v35);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      v27 = [CUFileItem alloc];
      id v38 = 0;
      v28 = [(CUFileItem *)v27 initWithDictionary:v21 error:&v38];
      id v29 = v38;
      v30 = v29;
      if (!v28)
      {
        v14 = v36;
        if (a4) {
          *a4 = v29;
        }

LABEL_23:
        v33 = 0;
        goto LABEL_16;
      }
      [(NSArray *)v15 addObject:v28];
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_12:

  fileItems = v12->_fileItems;
  v12->_fileItems = v15;

  v14 = v36;
LABEL_13:
  int v37 = 0;
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v6, &unk_1EDD44098, 0, 0xFFFFFFFFLL, &v37);
  if (!v37) {
    v12->_flags = Int64Ranged;
  }
  v33 = v12;
LABEL_16:

LABEL_17:
  return v33;
}

@end