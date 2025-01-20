@interface GEOPDSearchSectionList
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sections;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addSection:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSectionList

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[GEOPDSearchSection hasGreenTeaWithValue:](*(void *)(*((void *)&v10 + 1) + 8 * v7), a2))
        {
          uint64_t v8 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a2 + 16);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPDSearchSectionList addSection:](a1, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 16);
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
            -[GEOPDSearchSection clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (id)sections
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      uint64_t v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSectionList;
  uint64_t v4 = [(GEOPDSearchSectionList *)&v8 description];
  id v5 = [(GEOPDSearchSectionList *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSectionList _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"section"];
    }
    long long v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      uint64_t v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __52__GEOPDSearchSectionList__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        uint64_t v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSectionList _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDSearchSectionList__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v6 = 0;
    goto LABEL_122;
  }
  uint64_t v6 = [a1 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"section"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_121;
    }
    v69 = v7;
    id v70 = v5;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v91 objects:v99 count:16];
    if (!v9) {
      goto LABEL_120;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v92;
    if (a3) {
      long long v12 = @"sectionType";
    }
    else {
      long long v12 = @"section_type";
    }
    long long v13 = @"section_place";
    if (a3) {
      long long v13 = @"sectionPlace";
    }
    v85 = v13;
    v86 = v12;
    v14 = @"placeId";
    if (!a3) {
      v14 = @"place_id";
    }
    v76 = v14;
    uint64_t v15 = @"section_guide";
    if (a3) {
      uint64_t v15 = @"sectionGuide";
    }
    v84 = v15;
    if (a3) {
      v16 = @"guideId";
    }
    else {
      v16 = @"guide_id";
    }
    v75 = v16;
    if (a3) {
      id v17 = @"sectionIdentifier";
    }
    else {
      id v17 = @"section_identifier";
    }
    id v18 = @"section_rank";
    if (a3) {
      id v18 = @"sectionRank";
    }
    v82 = v18;
    v83 = v17;
    v19 = @"content_type";
    if (a3) {
      v19 = @"contentType";
    }
    v81 = v19;
    id v77 = v8;
    uint64_t v78 = v6;
    uint64_t v87 = *(void *)v92;
    while (1)
    {
      uint64_t v20 = 0;
      uint64_t v88 = v10;
      do
      {
        if (*(void *)v92 != v11) {
          objc_enumerationMutation(v8);
        }
        id v21 = *(void **)(*((void *)&v91 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v90 = v20;
          long long v22 = [GEOPDSearchSection alloc];
          if (v22)
          {
            long long v23 = v22;
            id v24 = v21;
            uint64_t v25 = [(GEOPDSearchSection *)v23 init];
            if (v25)
            {
              v26 = [v24 objectForKeyedSubscript:@"name"];
              objc_opt_class();
              id v89 = v24;
              if (objc_opt_isKindOfClass())
              {
                uint64_t v27 = (void *)[v26 copy];
                id v28 = v27;
                *(_WORD *)(v25 + 76) |= 0x20u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 24), v27);

                id v24 = v89;
              }

              v29 = [v24 objectForKeyedSubscript:v86];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v30 = v29;
                if ([v30 isEqualToString:@"SEARCH_SECTION_TYPE_UNKNOWN"])
                {
                  int v31 = 0;
                }
                else if ([v30 isEqualToString:@"SEARCH_SECTION_TYPE_PLACE"])
                {
                  int v31 = 1;
                }
                else if ([v30 isEqualToString:@"SEARCH_SECTION_TYPE_GUIDE"])
                {
                  int v31 = 2;
                }
                else
                {
                  int v31 = 0;
                }

LABEL_44:
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 8u;
                *(_DWORD *)(v25 + 72) = v31;
                id v24 = v89;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v31 = [v29 intValue];
                  goto LABEL_44;
                }
              }

              v32 = [v24 objectForKeyedSubscript:v85];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEOPDSearchSectionPlace alloc];
                v79 = v32;
                if (v33)
                {
                  id v34 = v32;
                  v33 = [(GEOPDSearchSectionPlace *)v33 init];
                  if (v33)
                  {
                    v35 = [v34 objectForKeyedSubscript:v76];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v71 = v35;
                      id v73 = v34;
                      long long v97 = 0u;
                      long long v98 = 0u;
                      long long v95 = 0u;
                      long long v96 = 0u;
                      id v36 = v35;
                      uint64_t v37 = [v36 countByEnumeratingWithState:&v95 objects:v100 count:16];
                      if (v37)
                      {
                        uint64_t v38 = v37;
                        uint64_t v39 = *(void *)v96;
                        do
                        {
                          for (uint64_t i = 0; i != v38; ++i)
                          {
                            if (*(void *)v96 != v39) {
                              objc_enumerationMutation(v36);
                            }
                            uint64_t v41 = *(void *)(*((void *)&v95 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v42 = [GEOPDMapsIdentifier alloc];
                              if (a3) {
                                v43 = [(GEOPDMapsIdentifier *)v42 initWithJSON:v41];
                              }
                              else {
                                v43 = [(GEOPDMapsIdentifier *)v42 initWithDictionary:v41];
                              }
                              v44 = v43;
                              -[GEOPDSearchSectionPlace addPlaceId:]((uint64_t)v33, v43);
                            }
                          }
                          uint64_t v38 = [v36 countByEnumeratingWithState:&v95 objects:v100 count:16];
                        }
                        while (v38);
                      }

                      id v8 = v77;
                      uint64_t v6 = v78;
                      id v24 = v89;
                      v35 = v71;
                      id v34 = v73;
                    }
                  }
                }
                v45 = v33;
                *(_WORD *)(v25 + 76) |= 0x80u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 40), v33);

                v32 = v79;
              }

              v46 = [v24 objectForKeyedSubscript:v84];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v47 = [GEOPDSearchSectionGuide alloc];
                v80 = v46;
                if (v47)
                {
                  id v48 = v46;
                  v47 = [(GEOPDSearchSectionGuide *)v47 init];
                  if (v47)
                  {
                    v49 = [v48 objectForKeyedSubscript:v75];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v72 = v49;
                      id v74 = v48;
                      long long v97 = 0u;
                      long long v98 = 0u;
                      long long v95 = 0u;
                      long long v96 = 0u;
                      id v50 = v49;
                      uint64_t v51 = [v50 countByEnumeratingWithState:&v95 objects:v100 count:16];
                      if (v51)
                      {
                        uint64_t v52 = v51;
                        uint64_t v53 = *(void *)v96;
                        do
                        {
                          for (uint64_t j = 0; j != v52; ++j)
                          {
                            if (*(void *)v96 != v53) {
                              objc_enumerationMutation(v50);
                            }
                            uint64_t v55 = *(void *)(*((void *)&v95 + 1) + 8 * j);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v56 = [GEOPDMapsIdentifier alloc];
                              if (a3) {
                                v57 = [(GEOPDMapsIdentifier *)v56 initWithJSON:v55];
                              }
                              else {
                                v57 = [(GEOPDMapsIdentifier *)v56 initWithDictionary:v55];
                              }
                              v58 = v57;
                              -[GEOPDSearchSectionGuide addGuideId:]((uint64_t)v47, v57);
                            }
                          }
                          uint64_t v52 = [v50 countByEnumeratingWithState:&v95 objects:v100 count:16];
                        }
                        while (v52);
                      }

                      id v8 = v77;
                      uint64_t v6 = v78;
                      id v24 = v89;
                      v49 = v72;
                      id v48 = v74;
                    }
                  }
                }
                v59 = v47;
                *(_WORD *)(v25 + 76) |= 0x40u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 32), v47);

                v46 = v80;
              }

              v60 = [v24 objectForKeyedSubscript:v83];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v61 = [v60 unsignedIntValue];
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 2u;
                *(_DWORD *)(v25 + 64) = v61;
              }

              v62 = [v24 objectForKeyedSubscript:v82];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v63 = [v62 unsignedIntValue];
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 4u;
                *(_DWORD *)(v25 + 68) = v63;
              }

              v64 = [v24 objectForKeyedSubscript:v81];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v65 = v64;
                if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_UNKNOWN"])
                {
                  int v66 = 0;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_PRIMARY"])
                {
                  int v66 = 1;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_ALTERNATE"])
                {
                  int v66 = 2;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_PARTIAL_MATCHES"])
                {
                  int v66 = 3;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_NONE_MATCHES"])
                {
                  int v66 = 4;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_KEYWORD_MATCHES"])
                {
                  int v66 = 5;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_DYM"])
                {
                  int v66 = 6;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_NAME_FALLBACK"])
                {
                  int v66 = 7;
                }
                else if ([v65 isEqualToString:@"SEARCH_SECTION_CONTENT_TYPE_CATEGORY_FALLBACK"])
                {
                  int v66 = 8;
                }
                else
                {
                  int v66 = 0;
                }

                id v24 = v89;
LABEL_112:
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 1u;
                *(_DWORD *)(v25 + 60) = v66;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v66 = [v64 intValue];
                  goto LABEL_112;
                }
              }
            }
          }
          else
          {
            uint64_t v25 = 0;
          }
          -[GEOPDSearchSectionList addSection:](v6, (void *)v25);

          uint64_t v11 = v87;
          uint64_t v10 = v88;
          uint64_t v20 = v90;
        }
        ++v20;
      }
      while (v20 != v10);
      uint64_t v67 = [v8 countByEnumeratingWithState:&v91 objects:v99 count:16];
      uint64_t v10 = v67;
      if (!v67)
      {
LABEL_120:

        uint64_t v7 = v69;
        id v5 = v70;
LABEL_121:

        break;
      }
    }
  }
LABEL_122:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSectionListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_sections;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_sections;
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
        -[GEOPDSearchSectionList addSection:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sections = self->_sections;
    if ((unint64_t)sections | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](sections, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_sections hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end