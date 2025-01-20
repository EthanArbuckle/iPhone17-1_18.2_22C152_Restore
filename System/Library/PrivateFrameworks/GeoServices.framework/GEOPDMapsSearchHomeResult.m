@interface GEOPDMapsSearchHomeResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsSearchHomeSections;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addMapsSearchHomeSection:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsSearchHomeResult

- (id)mapsSearchHomeSections
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMapsSearchHomeSection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsSearchHomeResult;
  v4 = [(GEOPDMapsSearchHomeResult *)&v8 description];
  id v5 = [(GEOPDMapsSearchHomeResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsSearchHomeResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"mapsSearchHomeSection";
      }
      else {
        v13 = @"maps_search_home_section";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __55__GEOPDMapsSearchHomeResult__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsSearchHomeResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDMapsSearchHomeResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDMapsSearchHomeResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_mapsSearchHomeSections;
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

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = *(id *)(a1 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    uint64_t v7 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    uint64_t v27 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (v11)
        {
          -[GEOPDMapsSearchHomeSection _readCollectionSuggestionResult](*(void *)(*((void *)&v28 + 1) + 8 * i));
          if (-[GEOPDCollectionSuggestionResult hasGreenTeaWithValue:](*(void *)(v11 + v6[376]), a2)) {
            goto LABEL_36;
          }
          -[GEOPDMapsSearchHomeSection _readGuidesLocationsSuggestionResult](v11);
          uint64_t v12 = v7[378];
          uint64_t v13 = *(void *)(v11 + v12);
          if (v13)
          {
            -[GEOPDGuidesLocationsSuggestionResult _readEntrys](*(void *)(v11 + v12));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v14 = *(id *)(v13 + v9[323]);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v33;
              while (2)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v33 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(void *)(*((void *)&v32 + 1) + 8 * j), a2))
                  {

                    goto LABEL_36;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            -[GEOPDGuidesLocationsSuggestionResult _readExploreGuidesEntry](v13);
            if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(void *)(v13 + 32), a2)) {
              goto LABEL_36;
            }
          }
          -[GEOPDMapsSearchHomeSection _readPlaceSuggestionResult](v11);
          uint64_t v19 = *(void *)(v11 + 48);
          if (v19)
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v20 = *(id *)(v19 + 16);
            uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v33;
              while (2)
              {
                for (uint64_t k = 0; k != v22; ++k)
                {
                  if (*(void *)v33 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  if ([*(id *)(*((void *)&v32 + 1) + 8 * k) hasGreenTeaWithValue:a2])
                  {

                    goto LABEL_36;
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }
          }
          -[GEOPDMapsSearchHomeSection _readPublisherSuggestionResult](v11);
          uint64_t v6 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          uint64_t v7 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          uint64_t v8 = v27;
          uint64_t v9 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          if (-[GEOPDPublisherSuggestionResult hasGreenTeaWithValue:](*(void *)(v11 + 56), a2))
          {
LABEL_36:
            uint64_t v25 = 1;
            goto LABEL_37;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
      uint64_t v25 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_37:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_mapsSearchHomeSections;
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
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        -[GEOPDMapsSearchHomeResult addMapsSearchHomeSection:]((uint64_t)v5, v11);

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
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    mapsSearchHomeSections = self->_mapsSearchHomeSections;
    if ((unint64_t)mapsSearchHomeSections | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](mapsSearchHomeSections, "isEqual:");
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
  return [(NSMutableArray *)self->_mapsSearchHomeSections hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSearchHomeSections, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end