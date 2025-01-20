@interface GEOMapQueryCollectionRequest
+ (BOOL)isValid:(id)a3;
+ (Class)requestElementsType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOMapQueryCollectionRequest)initWithDictionary:(id)a3;
- (GEOMapQueryCollectionRequest)initWithJSON:(id)a3;
- (NSMutableArray)requestElements;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestElementsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)requestElementsCount;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addRequestElements:(id)a3;
- (void)clearRequestElements;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequestElements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapQueryCollectionRequest

- (NSMutableArray)requestElements
{
  return self->_requestElements;
}

- (void)setRequestElements:(id)a3
{
}

- (void)clearRequestElements
{
}

- (void)addRequestElements:(id)a3
{
  id v4 = a3;
  requestElements = self->_requestElements;
  id v8 = v4;
  if (!requestElements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_requestElements;
    self->_requestElements = v6;

    id v4 = v8;
    requestElements = self->_requestElements;
  }
  [(NSMutableArray *)requestElements addObject:v4];
}

- (unint64_t)requestElementsCount
{
  return [(NSMutableArray *)self->_requestElements count];
}

- (id)requestElementsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requestElements objectAtIndex:a3];
}

+ (Class)requestElementsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapQueryCollectionRequest;
  id v4 = [(GEOMapQueryCollectionRequest *)&v8 description];
  v5 = [(GEOMapQueryCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapQueryCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = a1[1];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v14);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v14);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"requestElements"];
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
  return -[GEOMapQueryCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEOMapQueryCollectionRequest)initWithDictionary:(id)a3
{
  return (GEOMapQueryCollectionRequest *)-[GEOMapQueryCollectionRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1 || (v60 = (void *)[a1 init]) == 0)
  {
    v60 = 0;
    goto LABEL_81;
  }
  v5 = [v4 objectForKeyedSubscript:@"requestElements"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_79;
  }
  v58 = v5;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v6) {
    goto LABEL_78;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v63;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v63 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v62 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOMapQuery alloc];
        if (v11)
        {
          v12 = v11;
          id v13 = v10;
          uint64_t v14 = [(GEOMapQuery *)v12 init];
          if (v14)
          {
            long long v15 = [v13 objectForKeyedSubscript:@"query"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v16 = (void *)[v15 copy];
              id v17 = v16;
              *(_DWORD *)(v14 + 120) |= 0x4000u;
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              objc_storeStrong((id *)(v14 + 48), v16);
            }
            v18 = [v13 objectForKeyedSubscript:@"requestType"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              if ([v19 isEqualToString:@"SEARCH_REQUEST_TYPE"])
              {
                int v20 = 1;
              }
              else if ([v19 isEqualToString:@"GEOCODE_REQUEST_TYPE"])
              {
                int v20 = 2;
              }
              else
              {
                int v20 = 1;
              }

LABEL_23:
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x100u;
              *(_DWORD *)(v14 + 104) = v20;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v20 = [v18 intValue];
                goto LABEL_23;
              }
            }

            v21 = [v13 objectForKeyedSubscript:@"mapCenterX"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v22 = [v21 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x10u;
              *(_DWORD *)(v14 + 88) = v22;
            }

            v23 = [v13 objectForKeyedSubscript:@"mapCenterY"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v24 = [v23 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x20u;
              *(_DWORD *)(v14 + 92) = v24;
            }

            v25 = [v13 objectForKeyedSubscript:@"mapSpanX"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v26 = [v25 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x40u;
              *(_DWORD *)(v14 + 96) = v26;
            }

            v27 = [v13 objectForKeyedSubscript:@"mapSpanY"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v28 = [v27 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x80u;
              *(_DWORD *)(v14 + 100) = v28;
            }

            v29 = [v13 objectForKeyedSubscript:@"zoomlevel"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v30 = [v29 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x800u;
              *(_DWORD *)(v14 + 116) = v30;
            }

            v31 = [v13 objectForKeyedSubscript:@"clientImgFmt"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v31;
              if ([v32 isEqualToString:@"PNG"])
              {
                int v33 = 0;
              }
              else if ([v32 isEqualToString:@"GIF"])
              {
                int v33 = 1;
              }
              else if ([v32 isEqualToString:@"JPEG"])
              {
                int v33 = 2;
              }
              else
              {
                int v33 = 0;
              }

LABEL_45:
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 2u;
              *(_DWORD *)(v14 + 76) = v33;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v33 = [v31 intValue];
                goto LABEL_45;
              }
            }

            v34 = [v13 objectForKeyedSubscript:@"tilesizeX"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v35 = [v34 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x200u;
              *(_DWORD *)(v14 + 108) = v35;
            }

            v36 = [v13 objectForKeyedSubscript:@"tilesizeY"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v37 = [v36 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x400u;
              *(_DWORD *)(v14 + 112) = v37;
            }

            v38 = [v13 objectForKeyedSubscript:@"clientImgMaxWidth"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v39 = [v38 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 8u;
              *(_DWORD *)(v14 + 84) = v39;
            }

            v40 = [v13 objectForKeyedSubscript:@"clientImgMaxHeight"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v41 = [v40 intValue];
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 4u;
              *(_DWORD *)(v14 + 80) = v41;
            }

            v42 = [v13 objectForKeyedSubscript:@"mapRegion"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v43 = [GEOMapRegion alloc];
              if (a3) {
                v44 = [(GEOMapRegion *)v43 initWithJSON:v42];
              }
              else {
                v44 = [(GEOMapRegion *)v43 initWithDictionary:v42];
              }
              v45 = v44;
              v46 = v44;
              *(_DWORD *)(v14 + 120) |= 0x1000u;
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              objc_storeStrong((id *)(v14 + 32), v45);
            }
            v47 = [v13 objectForKeyedSubscript:@"userLocation"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v48 = [GEOLocation alloc];
              if (a3) {
                v49 = [(GEOLocation *)v48 initWithJSON:v47];
              }
              else {
                v49 = [(GEOLocation *)v48 initWithDictionary:v47];
              }
              v50 = v49;
              -[GEOMapQuery setUserLocation:](v14, v49);
            }
            v51 = [v13 objectForKeyedSubscript:@"sessionID"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v66 = 0uLL;
              _GEOSessionIDFromDictionaryRepresentation(v51, &v66);
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 1u;
              *(_OWORD *)(v14 + 16) = v66;
            }

            v52 = [v13 objectForKeyedSubscript:@"placeSearchRequest"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v53 = [GEOPlaceSearchRequest alloc];
              if (a3) {
                v54 = [(GEOPlaceSearchRequest *)v53 initWithJSON:v52];
              }
              else {
                v54 = [(GEOPlaceSearchRequest *)v53 initWithDictionary:v52];
              }
              v55 = v54;
              -[GEOMapQuery setPlaceSearchRequest:](v14, v54);
            }
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
        [v60 addRequestElements:v14];
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v56 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    uint64_t v7 = v56;
  }
  while (v56);
LABEL_78:

  v5 = v58;
LABEL_79:

LABEL_81:
  return v60;
}

- (GEOMapQueryCollectionRequest)initWithJSON:(id)a3
{
  return (GEOMapQueryCollectionRequest *)-[GEOMapQueryCollectionRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
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
      if (v15 || v16 == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        if (v16 != 2 || !PBReaderPlaceMark()) {
          goto LABEL_154;
        }
        objc_msgSend(a3, "position", 0, 0);
        [a3 length];
LABEL_22:
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
          switch((v20 >> 3))
          {
            case 1u:
              if (v25 != 2) {
                goto LABEL_153;
              }
              goto LABEL_40;
            case 2u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v27 = 0;
              while (1)
              {
                uint64_t v28 = *v4;
                unint64_t v29 = *(void *)((char *)a3 + v28);
                if (v29 == -1 || v29 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v30 = v29 + 1;
                int v31 = *(char *)(*(void *)((char *)a3 + *v7) + v29);
                *(void *)((char *)a3 + v28) = v30;
                if (v31 < 0)
                {
                  BOOL v32 = v27++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 3u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v33 = 0;
              while (1)
              {
                uint64_t v34 = *v4;
                unint64_t v35 = *(void *)((char *)a3 + v34);
                if (v35 == -1 || v35 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v36 = v35 + 1;
                int v37 = *(char *)(*(void *)((char *)a3 + *v7) + v35);
                *(void *)((char *)a3 + v34) = v36;
                if (v37 < 0)
                {
                  BOOL v32 = v33++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 4u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v38 = 0;
              while (1)
              {
                uint64_t v39 = *v4;
                unint64_t v40 = *(void *)((char *)a3 + v39);
                if (v40 == -1 || v40 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v41 = v40 + 1;
                int v42 = *(char *)(*(void *)((char *)a3 + *v7) + v40);
                *(void *)((char *)a3 + v39) = v41;
                if (v42 < 0)
                {
                  BOOL v32 = v38++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 5u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v43 = 0;
              while (1)
              {
                uint64_t v44 = *v4;
                unint64_t v45 = *(void *)((char *)a3 + v44);
                if (v45 == -1 || v45 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v46 = v45 + 1;
                int v47 = *(char *)(*(void *)((char *)a3 + *v7) + v45);
                *(void *)((char *)a3 + v44) = v46;
                if (v47 < 0)
                {
                  BOOL v32 = v43++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 6u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v48 = 0;
              while (1)
              {
                uint64_t v49 = *v4;
                unint64_t v50 = *(void *)((char *)a3 + v49);
                if (v50 == -1 || v50 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v51 = v50 + 1;
                int v52 = *(char *)(*(void *)((char *)a3 + *v7) + v50);
                *(void *)((char *)a3 + v49) = v51;
                if (v52 < 0)
                {
                  BOOL v32 = v48++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 7u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v53 = 0;
              while (1)
              {
                uint64_t v54 = *v4;
                unint64_t v55 = *(void *)((char *)a3 + v54);
                if (v55 == -1 || v55 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v56 = v55 + 1;
                int v57 = *(char *)(*(void *)((char *)a3 + *v7) + v55);
                *(void *)((char *)a3 + v54) = v56;
                if (v57 < 0)
                {
                  BOOL v32 = v53++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 8u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v58 = 0;
              while (1)
              {
                uint64_t v59 = *v4;
                unint64_t v60 = *(void *)((char *)a3 + v59);
                if (v60 == -1 || v60 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v61 = v60 + 1;
                int v62 = *(char *)(*(void *)((char *)a3 + *v7) + v60);
                *(void *)((char *)a3 + v59) = v61;
                if (v62 < 0)
                {
                  BOOL v32 = v58++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 9u:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v63 = 0;
              while (1)
              {
                uint64_t v64 = *v4;
                unint64_t v65 = *(void *)((char *)a3 + v64);
                if (v65 == -1 || v65 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v66 = v65 + 1;
                int v67 = *(char *)(*(void *)((char *)a3 + *v7) + v65);
                *(void *)((char *)a3 + v64) = v66;
                if (v67 < 0)
                {
                  BOOL v32 = v63++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 0xAu:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v68 = 0;
              while (1)
              {
                uint64_t v69 = *v4;
                unint64_t v70 = *(void *)((char *)a3 + v69);
                if (v70 == -1 || v70 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v71 = v70 + 1;
                int v72 = *(char *)(*(void *)((char *)a3 + *v7) + v70);
                *(void *)((char *)a3 + v69) = v71;
                if (v72 < 0)
                {
                  BOOL v32 = v68++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 0xBu:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v73 = 0;
              while (1)
              {
                uint64_t v74 = *v4;
                unint64_t v75 = *(void *)((char *)a3 + v74);
                if (v75 == -1 || v75 >= *(void *)((char *)a3 + *v5)) {
                  goto LABEL_130;
                }
                unint64_t v76 = v75 + 1;
                int v77 = *(char *)(*(void *)((char *)a3 + *v7) + v75);
                *(void *)((char *)a3 + v74) = v76;
                if (v77 < 0)
                {
                  BOOL v32 = v73++ > 8;
                  if (!v32) {
                    continue;
                  }
                }
                goto LABEL_22;
              }
            case 0xCu:
              if ((v20 & 7) != 0) {
                goto LABEL_153;
              }
              unsigned int v78 = 0;
              break;
            case 0xDu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOMapRegionIsValid((char *)a3)) {
                goto LABEL_153;
              }
              goto LABEL_146;
            case 0xEu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOLocationIsValid((char *)a3)) {
                goto LABEL_153;
              }
              goto LABEL_146;
            case 0xFu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOSessionIDIsValid(a3)) {
                goto LABEL_153;
              }
              goto LABEL_146;
            case 0x10u:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOPlaceSearchRequestIsValid((char *)a3)) {
                goto LABEL_153;
              }
LABEL_146:
              PBReaderRecallMark();
              continue;
            default:
LABEL_40:
              if (PBReaderSkipValueWithTag()) {
                continue;
              }
LABEL_153:
              PBReaderRecallMark();
              goto LABEL_154;
          }
          while (1)
          {
            uint64_t v79 = *v4;
            unint64_t v80 = *(void *)((char *)a3 + v79);
            if (v80 == -1 || v80 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            unint64_t v81 = v80 + 1;
            int v82 = *(char *)(*(void *)((char *)a3 + *v7) + v80);
            *(void *)((char *)a3 + v79) = v81;
            if (v82 < 0)
            {
              BOOL v32 = v78++ > 8;
              if (!v32) {
                continue;
              }
            }
            goto LABEL_22;
          }
LABEL_130:
          *((unsigned char *)a3 + *v6) = 1;
        }
        int v83 = *((unsigned __int8 *)a3 + *v6);
        PBReaderRecallMark();
        if (v83)
        {
LABEL_154:
          PBReaderRecallMark();
          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_154;
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v84 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v84;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E4F940E8];
    uint64_t v6 = (int *)MEMORY[0x1E4F940E0];
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
        if ((v11 >> 3) == 2)
        {
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_27;
          }
          char v18 = objc_alloc_init(GEOMapQuery);
          if (!GEOMapQueryReadAllFrom((uint64_t)v18, v4))
          {

            goto LABEL_27;
          }
          PBReaderRecallMark();
          -[GEOMapQueryCollectionRequest addRequestElements:](self, "addRequestElements:", v18, 0, 0);
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
  v5 = self->_requestElements;
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

- (void)clearSensitiveFields:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_requestElements count])
  {
    for (unint64_t i = 0; i < [(NSMutableArray *)self->_requestElements count]; ++i)
    {
      uint64_t v6 = [(NSMutableArray *)self->_requestElements objectAtIndexedSubscript:i];
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = -[GEOMapQuery userLocation](v6);
        if (GEOLocationHasSensitiveFields((uint64_t)v8))
        {
        }
        else
        {
          uint64_t v9 = -[GEOMapQuery placeSearchRequest](v7);
          unsigned int v10 = GEOPlaceSearchRequestHasSensitiveFields(v9);

          if (!v10)
          {
            GEOMapQueryClearSensitiveFields((uint64_t)v7, a3, 1);
            goto LABEL_9;
          }
        }
        long long v11 = (void *)[v7 copy];
        GEOMapQueryClearSensitiveFields((uint64_t)v11, a3, 0);
        [(NSMutableArray *)self->_requestElements replaceObjectAtIndex:i withObject:v11];
      }
LABEL_9:
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_requestElements;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(id **)(*((void *)&v12 + 1) + 8 * i);
        if (v9)
        {
          -[GEOMapQuery _readMapRegion](*(void *)(*((void *)&v12 + 1) + 8 * i));
          if ((objc_msgSend(v9[4], "hasGreenTeaWithValue:", v3, (void)v12) & 1) != 0
            || (-[GEOMapQuery _readPlaceSearchRequest]((uint64_t)v9),
                ([v9[5] hasGreenTeaWithValue:v3] & 1) != 0)
            || (-[GEOMapQuery _readUserLocation]((uint64_t)v9),
                ([v9[7] hasGreenTeaWithValue:v3] & 1) != 0))
          {
            BOOL v10 = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1001;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOMapQueryCollectionRequest *)self readAll:0];
  if ([(GEOMapQueryCollectionRequest *)self requestElementsCount])
  {
    [v8 clearRequestElements];
    unint64_t v4 = [(GEOMapQueryCollectionRequest *)self requestElementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOMapQueryCollectionRequest *)self requestElementsAtIndex:i];
        [v8 addRequestElements:v7];
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
  uint64_t v6 = self->_requestElements;
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
        [v5 addRequestElements:v11];

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
    [(GEOMapQueryCollectionRequest *)self readAll:1];
    [v4 readAll:1];
    requestElements = self->_requestElements;
    if ((unint64_t)requestElements | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](requestElements, "isEqual:");
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
  [(GEOMapQueryCollectionRequest *)self readAll:1];
  requestElements = self->_requestElements;

  return [(NSMutableArray *)requestElements hash];
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
        -[GEOMapQueryCollectionRequest addRequestElements:](self, "addRequestElements:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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