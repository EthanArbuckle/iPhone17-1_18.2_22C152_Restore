@interface GEOPDClientRankingFeatureMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDClientRankingFeatureMetadata)init;
- (GEOPDClientRankingFeatureMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureTypeComposite;
- (id)featureTypeResult;
- (id)featureTypeSource;
- (id)functionTypeDiscrete;
- (id)functionTypeLinear;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)featureType;
- (uint64_t)functionType;
- (unint64_t)hash;
- (void)_readFeatureTypeComposite;
- (void)_readFeatureTypeResult;
- (void)_readFeatureTypeSource;
- (void)_readFunctionTypeDiscrete;
- (void)_readFunctionTypeLinear;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDClientRankingFeatureMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDClientRankingFeatureMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 0);
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_featureType;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  id v9 = [(GEOPDClientRankingFeatureTypeSource *)self->_featureTypeSource copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOPDClientRankingFeatureTypeResult *)self->_featureTypeResult copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_functionType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  id v13 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)self->_functionTypeLinear copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)self->_functionTypeDiscrete copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  id v17 = [(GEOPDClientRankingFeatureTypeComposite *)self->_featureTypeComposite copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_10:

  return (id)v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  v4 = [(GEOPDClientRankingFeatureMetadata *)&v8 description];
  uint64_t v5 = [(GEOPDClientRankingFeatureMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDClientRankingFeatureMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 84))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD950[v5];
      }
      if (a2) {
        v7 = @"featureType";
      }
      else {
        v7 = @"feature_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDClientRankingFeatureMetadata featureTypeSource]((id *)a1);
    id v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        id v11 = @"featureTypeSource";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        id v11 = @"feature_type_source";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = -[GEOPDClientRankingFeatureMetadata featureTypeResult]((id *)a1);
    id v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        id v15 = @"featureTypeResult";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        id v15 = @"feature_type_result";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if ((*(_WORD *)(a1 + 84) & 2) != 0)
    {
      uint64_t v16 = *(int *)(a1 + 80);
      if (v16 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
        id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = off_1E53DD970[v16];
      }
      if (a2) {
        v18 = @"functionType";
      }
      else {
        v18 = @"function_type";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = -[GEOPDClientRankingFeatureMetadata functionTypeLinear]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"functionTypeLinear";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"function_type_linear";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = -[GEOPDClientRankingFeatureMetadata functionTypeDiscrete]((id *)a1);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"functionTypeDiscrete";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"function_type_discrete";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDClientRankingFeatureMetadata featureTypeComposite]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"featureTypeComposite";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"feature_type_composite";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __63__GEOPDClientRankingFeatureMetadata__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v88 = a2;
  if (!a1 || (uint64_t v89 = [a1 init]) == 0)
  {
    uint64_t v89 = 0;
    objc_super v8 = v88;
    goto LABEL_153;
  }
  if (a3) {
    v4 = @"featureType";
  }
  else {
    v4 = @"feature_type";
  }
  v96 = v4;
  uint64_t v5 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([v6 isEqualToString:@"FEATURE_TYPE_UNKNOWN"])
    {
      int v7 = 0;
    }
    else if ([v6 isEqualToString:@"FEATURE_TYPE_SOURCE"])
    {
      int v7 = 1;
    }
    else if ([v6 isEqualToString:@"FEATURE_TYPE_RESULT"])
    {
      int v7 = 2;
    }
    else if ([v6 isEqualToString:@"FEATURE_TYPE_COMPOSITE"])
    {
      int v7 = 3;
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    int v7 = [v5 intValue];
  }
  *(_WORD *)(v89 + 84) |= 0x100u;
  *(_WORD *)(v89 + 84) |= 1u;
  *(_DWORD *)(v89 + 76) = v7;
LABEL_21:

  if (a3) {
    id v9 = @"featureTypeSource";
  }
  else {
    id v9 = @"feature_type_source";
  }
  objc_super v8 = v88;
  v95 = v9;
  v10 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [GEOPDClientRankingFeatureTypeSource alloc];
    if (v11) {
      v12 = (void *)-[GEOPDClientRankingFeatureTypeSource _initWithDictionary:isJSON:](v11, v10, a3);
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    *(_WORD *)(v89 + 84) |= 0x20u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 40), v12);
  }
  if (a3) {
    v14 = @"featureTypeResult";
  }
  else {
    v14 = @"feature_type_result";
  }
  v94 = v14;
  id v15 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [GEOPDClientRankingFeatureTypeResult alloc];
    if (v16) {
      id v17 = (void *)-[GEOPDClientRankingFeatureTypeResult _initWithDictionary:isJSON:](v16, v15, a3);
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    *(_WORD *)(v89 + 84) |= 0x10u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 32), v17);
  }
  if (a3) {
    v19 = @"functionType";
  }
  else {
    v19 = @"function_type";
  }
  v93 = v19;
  v20 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    if ([v21 isEqualToString:@"FUNCTION_TYPE_UNKNOWN"])
    {
      int v22 = 0;
    }
    else if ([v21 isEqualToString:@"FUNCTION_TYPE_LINEAR"])
    {
      int v22 = 1;
    }
    else if ([v21 isEqualToString:@"FUNCTION_TYPE_DISCRETE"])
    {
      int v22 = 2;
    }
    else
    {
      int v22 = 0;
    }

    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v22 = [v20 intValue];
LABEL_49:
    *(_WORD *)(v89 + 84) |= 0x100u;
    *(_WORD *)(v89 + 84) |= 2u;
    *(_DWORD *)(v89 + 80) = v22;
  }

  if (a3) {
    v23 = @"functionTypeLinear";
  }
  else {
    v23 = @"function_type_linear";
  }
  v92 = v23;
  v24 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [GEOPDClientRankingFeatureFunctionTypeLinear alloc];
    if (v25) {
      v26 = (void *)-[GEOPDClientRankingFeatureFunctionTypeLinear _initWithDictionary:isJSON:](v25, v24, a3);
    }
    else {
      v26 = 0;
    }
    id v27 = v26;
    *(_WORD *)(v89 + 84) |= 0x80u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 56), v26);
  }
  if (a3) {
    v28 = @"functionTypeDiscrete";
  }
  else {
    v28 = @"function_type_discrete";
  }
  v91 = v28;
  v29 = objc_msgSend(v88, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDClientRankingFeatureFunctionTypeDiscrete alloc];
    if (v30) {
      v31 = (void *)-[GEOPDClientRankingFeatureFunctionTypeDiscrete _initWithDictionary:isJSON:](v30, v29, a3);
    }
    else {
      v31 = 0;
    }
    id v32 = v31;
    *(_WORD *)(v89 + 84) |= 0x40u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 48), v31);
  }
  if (a3) {
    v33 = @"featureTypeComposite";
  }
  else {
    v33 = @"feature_type_composite";
  }
  v34 = [v88 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [GEOPDClientRankingFeatureTypeComposite alloc];
    if (v35)
    {
      id v36 = v35;
      id v37 = v34;
      uint64_t v38 = [(GEOPDClientRankingFeatureTypeComposite *)v36 init];
      if (v38)
      {
        if (a3) {
          id v39 = @"variableExponentPair";
        }
        else {
          id v39 = @"variable_exponent_pair";
        }
        v40 = [v37 objectForKeyedSubscript:v39];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v86 = v37;
          v87 = v34;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          v85 = v40;
          id v41 = v40;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v100 objects:v104 count:16];
          if (!v42) {
            goto LABEL_143;
          }
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v101;
          uint64_t v90 = v38;
          id v97 = v41;
          uint64_t v99 = *(void *)v101;
          while (1)
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v101 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v100 + 1) + 8 * v45);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v47 = [GEOPDVariableExponentPair alloc];
                if (v47)
                {
                  v48 = v47;
                  id v49 = v46;
                  uint64_t v50 = [(GEOPDVariableExponentPair *)v48 init];
                  if (v50)
                  {
                    v51 = [v49 objectForKeyedSubscript:@"variable"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v52 = [GEOPDClientRankingFeatureUnit alloc];
                      if (v52)
                      {
                        id v53 = v51;
                        v52 = [(GEOPDClientRankingFeatureUnit *)v52 init];
                        if (v52)
                        {
                          v54 = [v53 objectForKeyedSubscript:v96];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v55 = v54;
                            if ([v55 isEqualToString:@"FEATURE_TYPE_UNKNOWN"])
                            {
                              int v56 = 0;
                            }
                            else if ([v55 isEqualToString:@"FEATURE_TYPE_SOURCE"])
                            {
                              int v56 = 1;
                            }
                            else if ([v55 isEqualToString:@"FEATURE_TYPE_RESULT"])
                            {
                              int v56 = 2;
                            }
                            else if ([v55 isEqualToString:@"FEATURE_TYPE_COMPOSITE"])
                            {
                              int v56 = 3;
                            }
                            else
                            {
                              int v56 = 0;
                            }

LABEL_98:
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            *(unsigned char *)&v52->_flags |= 1u;
                            v52->_featureType = v56;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v56 = [v54 intValue];
                              goto LABEL_98;
                            }
                          }

                          v57 = [v53 objectForKeyedSubscript:v95];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v58 = [GEOPDClientRankingFeatureTypeSource alloc];
                            if (v58) {
                              v59 = (void *)-[GEOPDClientRankingFeatureTypeSource _initWithDictionary:isJSON:](v58, v57, a3);
                            }
                            else {
                              v59 = 0;
                            }
                            id v60 = v59;
                            *(unsigned char *)&v52->_flags |= 0x10u;
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_featureTypeSource, v59);
                          }
                          v61 = [v53 objectForKeyedSubscript:v94];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v62 = [GEOPDClientRankingFeatureTypeResult alloc];
                            if (v62) {
                              v63 = (void *)-[GEOPDClientRankingFeatureTypeResult _initWithDictionary:isJSON:](v62, v61, a3);
                            }
                            else {
                              v63 = 0;
                            }
                            id v64 = v63;
                            *(unsigned char *)&v52->_flags |= 8u;
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_featureTypeResult, v63);
                          }
                          v65 = [v53 objectForKeyedSubscript:v93];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v66 = v65;
                            if ([v66 isEqualToString:@"FUNCTION_TYPE_UNKNOWN"])
                            {
                              int v67 = 0;
                            }
                            else if ([v66 isEqualToString:@"FUNCTION_TYPE_LINEAR"])
                            {
                              int v67 = 1;
                            }
                            else if ([v66 isEqualToString:@"FUNCTION_TYPE_DISCRETE"])
                            {
                              int v67 = 2;
                            }
                            else
                            {
                              int v67 = 0;
                            }

LABEL_118:
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            *(unsigned char *)&v52->_flags |= 2u;
                            v52->_functionType = v67;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v67 = [v65 intValue];
                              goto LABEL_118;
                            }
                          }

                          v68 = [v53 objectForKeyedSubscript:v92];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v69 = [GEOPDClientRankingFeatureFunctionTypeLinear alloc];
                            if (v69) {
                              v70 = (void *)-[GEOPDClientRankingFeatureFunctionTypeLinear _initWithDictionary:isJSON:](v69, v68, a3);
                            }
                            else {
                              v70 = 0;
                            }
                            id v71 = v70;
                            *(unsigned char *)&v52->_flags |= 0x40u;
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_functionTypeLinear, v70);
                          }
                          v72 = [v53 objectForKeyedSubscript:v91];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v73 = [GEOPDClientRankingFeatureFunctionTypeDiscrete alloc];
                            if (v73) {
                              v74 = (void *)-[GEOPDClientRankingFeatureFunctionTypeDiscrete _initWithDictionary:isJSON:](v73, v72, a3);
                            }
                            else {
                              v74 = 0;
                            }
                            id v75 = v74;
                            *(unsigned char *)&v52->_flags |= 0x20u;
                            *(unsigned char *)&v52->_flags |= 0x80u;
                            objc_storeStrong((id *)&v52->_functionTypeDiscrete, v74);
                          }
                          uint64_t v38 = v90;
                        }
                      }
                      v76 = v52;
                      objc_storeStrong((id *)(v50 + 16), v52);

                      id v41 = v97;
                    }

                    v77 = [v49 objectForKeyedSubscript:@"exponent"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v78 = [v77 unsignedIntValue];
                      *(unsigned char *)(v50 + 28) |= 1u;
                      *(_DWORD *)(v50 + 24) = v78;
                    }

                    uint64_t v44 = v99;
                  }
                }
                else
                {
                  uint64_t v50 = 0;
                }
                -[GEOPDClientRankingFeatureTypeComposite addVariableExponentPair:](v38, (void *)v50);
              }
              ++v45;
            }
            while (v43 != v45);
            uint64_t v79 = [v41 countByEnumeratingWithState:&v100 objects:v104 count:16];
            uint64_t v43 = v79;
            if (!v79)
            {
LABEL_143:

              id v37 = v86;
              v34 = v87;
              v40 = v85;
              break;
            }
          }
        }

        if (a3) {
          v80 = @"featureWeight";
        }
        else {
          v80 = @"feature_weight";
        }
        v81 = [v37 objectForKeyedSubscript:v80];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v81 floatValue];
          *(unsigned char *)(v38 + 28) |= 1u;
          *(_DWORD *)(v38 + 24) = v82;
        }
      }
    }
    else
    {
      uint64_t v38 = 0;
    }
    id v83 = (id)v38;
    *(_WORD *)(v89 + 84) |= 8u;
    *(_WORD *)(v89 + 84) |= 0x100u;
    objc_storeStrong((id *)(v89 + 24), (id)v38);

    objc_super v8 = v88;
  }

LABEL_153:
  return v89;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 0);
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_featureTypeSource)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_featureTypeResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_functionTypeLinear)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_functionTypeDiscrete)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_featureTypeComposite)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (GEOPDClientRankingFeatureMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  v2 = [(GEOPDClientRankingFeatureMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDClientRankingFeatureMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientRankingFeatureMetadata;
  v3 = [(GEOPDClientRankingFeatureMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)featureType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readFeatureTypeSource
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureTypeSource_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeSource
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeSource]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFeatureTypeResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureTypeResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeResult
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeResult]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)functionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 80);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readFunctionTypeLinear
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFunctionTypeLinear_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)functionTypeLinear
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFunctionTypeLinear]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFunctionTypeDiscrete
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFunctionTypeDiscrete_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)functionTypeDiscrete
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFunctionTypeDiscrete]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFeatureTypeComposite
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureTypeComposite_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)featureTypeComposite
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDClientRankingFeatureMetadata _readFeatureTypeComposite]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_970;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_971;
      }
      GEOPDClientRankingFeatureMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __63__GEOPDClientRankingFeatureMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 42);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 19)) {
      goto LABEL_22;
    }
  }
  else if (v5)
  {
LABEL_22:
    char v12 = 0;
    goto LABEL_23;
  }
  featureTypeSource = self->_featureTypeSource;
  if ((unint64_t)featureTypeSource | *((void *)v4 + 5)
    && !-[GEOPDClientRankingFeatureTypeSource isEqual:](featureTypeSource, "isEqual:"))
  {
    goto LABEL_22;
  }
  featureTypeResult = self->_featureTypeResult;
  if ((unint64_t)featureTypeResult | *((void *)v4 + 4))
  {
    if (!-[GEOPDClientRankingFeatureTypeResult isEqual:](featureTypeResult, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 v8 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_functionType != *((_DWORD *)v4 + 20)) {
      goto LABEL_22;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_22;
  }
  functionTypeLinear = self->_functionTypeLinear;
  if ((unint64_t)functionTypeLinear | *((void *)v4 + 7)
    && !-[GEOPDClientRankingFeatureFunctionTypeLinear isEqual:](functionTypeLinear, "isEqual:"))
  {
    goto LABEL_22;
  }
  functionTypeDiscrete = self->_functionTypeDiscrete;
  if ((unint64_t)functionTypeDiscrete | *((void *)v4 + 6))
  {
    if (!-[GEOPDClientRankingFeatureFunctionTypeDiscrete isEqual:](functionTypeDiscrete, "isEqual:")) {
      goto LABEL_22;
    }
  }
  featureTypeComposite = self->_featureTypeComposite;
  if ((unint64_t)featureTypeComposite | *((void *)v4 + 3)) {
    char v12 = -[GEOPDClientRankingFeatureTypeComposite isEqual:](featureTypeComposite, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDClientRankingFeatureMetadata readAll:]((uint64_t)self, 1);
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_featureType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDClientRankingFeatureTypeSource *)self->_featureTypeSource hash];
  unint64_t v5 = [(GEOPDClientRankingFeatureTypeResult *)self->_featureTypeResult hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_functionType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)self->_functionTypeLinear hash];
  unint64_t v9 = v8 ^ [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)self->_functionTypeDiscrete hash];
  return v7 ^ v9 ^ [(GEOPDClientRankingFeatureTypeComposite *)self->_featureTypeComposite hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDClientRankingFeatureMetadata readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7)
      {
        unint64_t v8 = *(void **)(v7 + 8);
        *(void *)(v7 + 8) = 0;
      }
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9)
      {
        id v10 = *(void **)(v9 + 8);
        *(void *)(v9 + 8) = 0;
      }
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11)
      {
        char v12 = *(void **)(v11 + 8);
        *(void *)(v11 + 8) = 0;
      }
      uint64_t v13 = *(void *)(a1 + 24);
      -[GEOPDClientRankingFeatureTypeComposite clearUnknownFields:](v13, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionTypeLinear, 0);
  objc_storeStrong((id *)&self->_functionTypeDiscrete, 0);
  objc_storeStrong((id *)&self->_featureTypeSource, 0);
  objc_storeStrong((id *)&self->_featureTypeResult, 0);
  objc_storeStrong((id *)&self->_featureTypeComposite, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end