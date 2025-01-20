@interface GEOPBOfflineDataBatchesResponse
+ (BOOL)isValid:(id)a3;
+ (Class)layerBatchType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineDataBatchesResponse)initWithDictionary:(id)a3;
- (GEOPBOfflineDataBatchesResponse)initWithJSON:(id)a3;
- (NSMutableArray)layerBatchs;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layerBatchAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)layerBatchsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addLayerBatch:(id)a3;
- (void)clearLayerBatchs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLayerBatchs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataBatchesResponse

- (NSMutableArray)layerBatchs
{
  return self->_layerBatchs;
}

- (void)setLayerBatchs:(id)a3
{
}

- (void)clearLayerBatchs
{
}

- (void)addLayerBatch:(id)a3
{
  id v4 = a3;
  layerBatchs = self->_layerBatchs;
  id v8 = v4;
  if (!layerBatchs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_layerBatchs;
    self->_layerBatchs = v6;

    id v4 = v8;
    layerBatchs = self->_layerBatchs;
  }
  [(NSMutableArray *)layerBatchs addObject:v4];
}

- (unint64_t)layerBatchsCount
{
  return [(NSMutableArray *)self->_layerBatchs count];
}

- (id)layerBatchAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_layerBatchs objectAtIndex:a3];
}

+ (Class)layerBatchType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataBatchesResponse;
  id v4 = [(GEOPBOfflineDataBatchesResponse *)&v8 description];
  v5 = [(GEOPBOfflineDataBatchesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesResponse _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = a1[1];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v15);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"layerBatch";
      }
      else {
        v13 = @"layer_batch";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v15);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineDataBatchesResponse _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOPBOfflineDataBatchesResponse)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesResponse *)-[GEOPBOfflineDataBatchesResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v52 = a2;
  if (a1)
  {
    v5 = (void *)[a1 init];
    if (v5)
    {
      if (a3) {
        id v6 = @"layerBatch";
      }
      else {
        id v6 = @"layer_batch";
      }
      uint64_t v7 = [v52 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v51 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v66;
          if (a3) {
            v12 = @"layerVersion";
          }
          else {
            v12 = @"layer_version";
          }
          if (a3) {
            v13 = @"batchReference";
          }
          else {
            v13 = @"batch_reference";
          }
          if (a3) {
            v14 = @"batchIdentifier";
          }
          else {
            v14 = @"batch_identifier";
          }
          long long v15 = @"batchSizeBytes";
          if (!a3) {
            long long v15 = @"batch_size_bytes";
          }
          v62 = v15;
          v63 = v14;
          long long v16 = @"batch_compressed_size_bytes";
          if (a3) {
            long long v16 = @"batchCompressedSizeBytes";
          }
          v61 = v16;
          id v56 = v8;
          v57 = v5;
          v54 = v12;
          uint64_t v55 = *(void *)v66;
          v53 = v13;
          do
          {
            uint64_t v17 = 0;
            uint64_t v58 = v10;
            do
            {
              if (*(void *)v66 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v18 = *(void **)(*((void *)&v65 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v60 = v17;
                v19 = [GEOPBOfflineDataLayerBatches alloc];
                if (v19)
                {
                  uint64_t v20 = v19;
                  id v21 = v18;
                  v22 = v20;
                  v23 = v21;
                  uint64_t v24 = [(GEOPBOfflineDataLayerBatches *)v22 init];
                  if (v24)
                  {
                    v59 = v23;
                    v25 = [v23 objectForKeyedSubscript:v12];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v74 = 0uLL;
                      uint64_t v75 = 0;
                      _GEOPBOfflineDataLayerVersionFromDictionaryRepresentation(v25, (uint64_t)&v74);
                      *(unsigned char *)(v24 + 40) |= 1u;
                      *(_OWORD *)(v24 + 8) = v74;
                      *(void *)(v24 + 24) = v75;
                    }

                    v23 = v59;
                    v26 = [v59 objectForKeyedSubscript:v13];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v71 = 0u;
                      long long v72 = 0u;
                      long long v69 = 0u;
                      long long v70 = 0u;
                      id v27 = v26;
                      uint64_t v28 = [v27 countByEnumeratingWithState:&v69 objects:&v74 count:16];
                      v29 = v26;
                      if (v28)
                      {
                        uint64_t v30 = v28;
                        uint64_t v31 = *(void *)v70;
                        v64 = v26;
                        do
                        {
                          uint64_t v32 = 0;
                          do
                          {
                            if (*(void *)v70 != v31) {
                              objc_enumerationMutation(v27);
                            }
                            v33 = *(void **)(*((void *)&v69 + 1) + 8 * v32);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v34 = [GEOPBOfflineDataBatchReference alloc];
                              if (v34)
                              {
                                v35 = v34;
                                id v36 = v33;
                                uint64_t v37 = [(GEOPBOfflineDataBatchReference *)v35 init];
                                if (v37)
                                {
                                  v38 = [v36 objectForKeyedSubscript:v63];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v38 options:0];
                                    id v40 = v39;
                                    *(unsigned char *)(v37 + 60) |= 4u;
                                    *(unsigned char *)(v37 + 60) |= 0x10u;
                                    objc_storeStrong((id *)(v37 + 24), v39);

                                    v29 = v64;
                                  }

                                  v41 = [v36 objectForKeyedSubscript:@"url"];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v42 = (void *)[v41 copy];
                                    id v43 = v42;
                                    *(unsigned char *)(v37 + 60) |= 8u;
                                    *(unsigned char *)(v37 + 60) |= 0x10u;
                                    objc_storeStrong((id *)(v37 + 40), v42);

                                    v29 = v64;
                                  }

                                  v44 = [v36 objectForKeyedSubscript:v62];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v45 = [v44 unsignedLongLongValue];
                                    *(unsigned char *)(v37 + 60) |= 0x10u;
                                    *(unsigned char *)(v37 + 60) |= 2u;
                                    *(void *)(v37 + 32) = v45;
                                  }

                                  v46 = [v36 objectForKeyedSubscript:v61];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v47 = [v46 unsignedLongLongValue];
                                    *(unsigned char *)(v37 + 60) |= 0x10u;
                                    *(unsigned char *)(v37 + 60) |= 1u;
                                    *(void *)(v37 + 16) = v47;
                                  }
                                }
                              }
                              else
                              {
                                uint64_t v37 = 0;
                              }
                              -[GEOPBOfflineDataLayerBatches addBatchReference:](v24, (void *)v37);
                            }
                            ++v32;
                          }
                          while (v30 != v32);
                          uint64_t v48 = [v27 countByEnumeratingWithState:&v69 objects:&v74 count:16];
                          uint64_t v30 = v48;
                        }
                        while (v48);
                      }

                      id v8 = v56;
                      v5 = v57;
                      v12 = v54;
                      uint64_t v11 = v55;
                      v26 = v29;
                      uint64_t v10 = v58;
                      v23 = v59;
                      v13 = v53;
                    }
                  }
                }
                else
                {
                  uint64_t v24 = 0;
                }
                uint64_t v17 = v60;
                objc_msgSend(v5, "addLayerBatch:", v24, v51);
              }
              ++v17;
            }
            while (v17 != v10);
            uint64_t v49 = [v8 countByEnumeratingWithState:&v65 objects:v73 count:16];
            uint64_t v10 = v49;
          }
          while (v49);
        }

        uint64_t v7 = v51;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOPBOfflineDataBatchesResponse)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesResponse *)-[GEOPBOfflineDataBatchesResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0])) {
    goto LABEL_95;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  do
  {
    if (*((unsigned char *)a3 + *v6)) {
      break;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v4;
      unint64_t v12 = *(void *)((char *)a3 + v11);
      if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
      *(void *)((char *)a3 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v15 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v16 = v10 & 7;
    if (v15) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v16 == 4;
    }
    if (v17) {
      break;
    }
    if ((v10 >> 3) != 1)
    {
      if (PBReaderSkipValueWithTag()) {
        continue;
      }
LABEL_98:
      PBReaderRecallMark();
      return 0;
    }
    if (v16 != 2 || !PBReaderPlaceMark()) {
      goto LABEL_98;
    }
    objc_msgSend(a3, "position", 0, 0);
    [a3 length];
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5) && !*((unsigned char *)a3 + *v6))
    {
      char v18 = 0;
      unsigned int v19 = 0;
      unint64_t v20 = 0;
      while (1)
      {
        uint64_t v21 = *v4;
        unint64_t v22 = *(void *)((char *)a3 + v21);
        if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v22);
        *(void *)((char *)a3 + v21) = v22 + 1;
        v20 |= (unint64_t)(v23 & 0x7F) << v18;
        if ((v23 & 0x80) == 0) {
          goto LABEL_32;
        }
        v18 += 7;
        BOOL v14 = v19++ >= 9;
        if (v14)
        {
          unint64_t v20 = 0;
          int v24 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_34;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_32:
      int v24 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v20 = 0;
      }
LABEL_34:
      int v25 = v20 & 7;
      if (v24 || v25 == 4) {
        break;
      }
      if ((v20 >> 3) == 2)
      {
        if (v25 != 2 || !PBReaderPlaceMark()) {
          goto LABEL_97;
        }
        [a3 position];
        [a3 length];
LABEL_47:
        while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5) && !*((unsigned char *)a3 + *v6))
        {
          char v27 = 0;
          unsigned int v28 = 0;
          unint64_t v29 = 0;
          while (1)
          {
            uint64_t v30 = *v4;
            unint64_t v31 = *(void *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v31);
            *(void *)((char *)a3 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if ((v32 & 0x80) == 0) {
              goto LABEL_57;
            }
            v27 += 7;
            BOOL v14 = v28++ >= 9;
            if (v14)
            {
              unint64_t v29 = 0;
              int v33 = *((unsigned __int8 *)a3 + *v6);
              goto LABEL_59;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_57:
          int v33 = *((unsigned __int8 *)a3 + *v6);
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v29 = 0;
          }
LABEL_59:
          int v34 = v29 & 7;
          if (v33 || v34 == 4) {
            break;
          }
          switch((v29 >> 3))
          {
            case 1u:
              if (v34 != 2) {
                goto LABEL_96;
              }
              goto LABEL_67;
            case 2u:
              if (v34 == 2) {
                goto LABEL_67;
              }
              goto LABEL_96;
            case 3u:
              if ((v29 & 7) != 0) {
                goto LABEL_96;
              }
              unsigned int v36 = 0;
              while (1)
              {
                uint64_t v37 = *v4;
                unint64_t v38 = *(void *)((char *)a3 + v37);
                if (v38 == -1 || v38 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_85;
                }
                unint64_t v39 = v38 + 1;
                int v40 = *(char *)(*(void *)((char *)a3 + *v7) + v38);
                *(void *)((char *)a3 + v37) = v39;
                if (v40 < 0)
                {
                  BOOL v41 = v36++ > 8;
                  if (!v41) {
                    continue;
                  }
                }
                goto LABEL_47;
              }
            case 4u:
              if ((v29 & 7) != 0) {
                goto LABEL_96;
              }
              unsigned int v42 = 0;
              break;
            default:
LABEL_67:
              if (PBReaderSkipValueWithTag()) {
                continue;
              }
LABEL_96:
              PBReaderRecallMark();
              goto LABEL_97;
          }
          while (1)
          {
            uint64_t v43 = *v4;
            unint64_t v44 = *(void *)((char *)a3 + v43);
            if (v44 == -1 || v44 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            unint64_t v45 = v44 + 1;
            int v46 = *(char *)(*(void *)((char *)a3 + *v7) + v44);
            *(void *)((char *)a3 + v43) = v45;
            if (v46 < 0)
            {
              BOOL v41 = v42++ > 8;
              if (!v41) {
                continue;
              }
            }
            goto LABEL_47;
          }
LABEL_85:
          *((unsigned char *)a3 + *v6) = 1;
        }
        int v47 = *((unsigned __int8 *)a3 + *v6);
        PBReaderRecallMark();
        if (v47)
        {
LABEL_97:
          PBReaderRecallMark();
          goto LABEL_98;
        }
LABEL_89:
        PBReaderRecallMark();
      }
      else
      {
        if ((v20 >> 3) == 1)
        {
          if (v25 != 2 || !PBReaderPlaceMark() || !GEOPBOfflineDataLayerVersionIsValid(a3)) {
            goto LABEL_97;
          }
          goto LABEL_89;
        }
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_97;
        }
      }
    }
    int v48 = *((unsigned __int8 *)a3 + *v6);
    PBReaderRecallMark();
    if (v48) {
      goto LABEL_98;
    }
    PBReaderRecallMark();
  }
  while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
LABEL_95:
  BOOL v49 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v49;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E4F940E8];
    id v6 = (int *)MEMORY[0x1E4F940E0];
    uint64_t v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          unint64_t v13 = *(void *)&v4[v12];
          if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          if (v10++ >= 9)
          {
            unint64_t v11 = 0;
            int v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v16 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        if ((v11 >> 3) == 1)
        {
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_27;
          }
          char v18 = objc_alloc_init(GEOPBOfflineDataLayerBatches);
          if (!GEOPBOfflineDataLayerBatchesReadAllFrom((uint64_t)v18, v4))
          {

            goto LABEL_27;
          }
          PBReaderRecallMark();
          -[GEOPBOfflineDataBatchesResponse addLayerBatch:](self, "addLayerBatch:", v18, 0, 0);
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_27;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v19 = v4[*v7] == 0;
  }
  else
  {
LABEL_27:
    BOOL v19 = 0;
  }
  objc_sync_exit(v4);

  return v19;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_layerBatchs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOPBOfflineDataBatchesResponse *)self readAll:0];
  if ([(GEOPBOfflineDataBatchesResponse *)self layerBatchsCount])
  {
    [v8 clearLayerBatchs];
    unint64_t v4 = [(GEOPBOfflineDataBatchesResponse *)self layerBatchsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPBOfflineDataBatchesResponse *)self layerBatchAtIndex:i];
        [v8 addLayerBatch:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_layerBatchs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addLayerBatch:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPBOfflineDataBatchesResponse *)self readAll:1];
    [v4 readAll:1];
    layerBatchs = self->_layerBatchs;
    if ((unint64_t)layerBatchs | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](layerBatchs, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOPBOfflineDataBatchesResponse *)self readAll:1];
  layerBatchs = self->_layerBatchs;

  return [(NSMutableArray *)layerBatchs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPBOfflineDataBatchesResponse addLayerBatch:](self, "addLayerBatch:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end