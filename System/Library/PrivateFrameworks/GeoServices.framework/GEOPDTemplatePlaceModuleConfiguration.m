@interface GEOPDTemplatePlaceModuleConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sectionTitle;
- (id)sectionTitles;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)addSectionTitle:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTemplatePlaceModuleConfiguration

- (id)sectionTitle
{
  v2 = -[GEOPDTemplatePlaceModuleConfiguration sectionTitles]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a1 + 16);
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
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "clearUnknownFields:", 1, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)sectionTitles
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSectionTitle:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDTemplatePlaceModuleConfiguration;
  uint64_t v4 = [(GEOPDTemplatePlaceModuleConfiguration *)&v8 description];
  id v5 = [(GEOPDTemplatePlaceModuleConfiguration *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTemplatePlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_45;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 40) & 8) != 0)
  {
    id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
    if (a2) {
      uint64_t v6 = @"templatePlaceComponentId";
    }
    else {
      uint64_t v6 = @"template_place_component_id";
    }
    [v4 setObject:v5 forKey:v6];
  }
  if ([*(id *)(a1 + 16) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = *(id *)(a1 + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    if (a2) {
      v15 = @"sectionTitle";
    }
    else {
      v15 = @"section_title";
    }
    [v4 setObject:v7 forKey:v15];
  }
  char v16 = *(unsigned char *)(a1 + 40);
  if ((v16 & 2) != 0)
  {
    v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v18 = @"numberOfRows";
    }
    else {
      v18 = @"number_of_rows";
    }
    [v4 setObject:v17 forKey:v18];

    char v16 = *(unsigned char *)(a1 + 40);
    if ((v16 & 4) == 0)
    {
LABEL_24:
      if ((v16 & 1) == 0) {
        goto LABEL_41;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 4) == 0)
  {
    goto LABEL_24;
  }
  uint64_t v19 = *(int *)(a1 + 32);
  if (v19 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E53E4310[v19];
  }
  [v4 setObject:v20 forKey:@"orientation"];

  if (*(unsigned char *)(a1 + 40))
  {
LABEL_34:
    uint64_t v21 = *(int *)(a1 + 24);
    if (v21 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E53E4328[v21];
    }
    if (a2) {
      v23 = @"layoutType";
    }
    else {
      v23 = @"layout_type";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_41:
  v24 = *(void **)(a1 + 8);
  if (v24)
  {
    v25 = [v24 dictionaryRepresentation];
    v26 = v25;
    if (a2)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__GEOPDTemplatePlaceModuleConfiguration__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E53D8860;
      id v28 = v27;
      id v32 = v28;
      [v26 enumerateKeysAndObjectsUsingBlock:v31];
      id v29 = v28;

      v26 = v29;
    }
    [v4 setObject:v26 forKey:@"Unknown Fields"];
  }
LABEL_45:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTemplatePlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOPDTemplatePlaceModuleConfiguration__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"templatePlaceComponentId";
    }
    else {
      id v7 = @"template_place_component_id";
    }
    id v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v8 intValue];
      *(unsigned char *)(v6 + 40) |= 8u;
      *(_DWORD *)(v6 + 36) = v9;
    }

    if (a3) {
      id v10 = @"sectionTitle";
    }
    else {
      id v10 = @"section_title";
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v5;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [GEOLocalizedString alloc];
              if (a3) {
                uint64_t v19 = [(GEOLocalizedString *)v18 initWithJSON:v17];
              }
              else {
                uint64_t v19 = [(GEOLocalizedString *)v18 initWithDictionary:v17];
              }
              v20 = v19;
              -[GEOPDTemplatePlaceModuleConfiguration addSectionTitle:](v6, v19);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v14);
      }

      id v5 = v32;
    }

    if (a3) {
      uint64_t v21 = @"numberOfRows";
    }
    else {
      uint64_t v21 = @"number_of_rows";
    }
    v22 = [v5 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [v22 intValue];
      *(unsigned char *)(v6 + 40) |= 2u;
      *(_DWORD *)(v6 + 28) = v23;
    }

    v24 = [v5 objectForKeyedSubscript:@"orientation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v24;
      if ([v25 isEqualToString:@"ORIENTATION_UNKNOWN"])
      {
        int v26 = 0;
      }
      else if ([v25 isEqualToString:@"ORIENTATION_HORIZONTAL"])
      {
        int v26 = 1;
      }
      else if ([v25 isEqualToString:@"ORIENTATION_VERTICAL"])
      {
        int v26 = 2;
      }
      else
      {
        int v26 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_41;
      }
      int v26 = [v24 intValue];
    }
    *(unsigned char *)(v6 + 40) |= 4u;
    *(_DWORD *)(v6 + 32) = v26;
LABEL_41:

    if (a3) {
      v27 = @"layoutType";
    }
    else {
      v27 = @"layout_type";
    }
    id v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = v28;
      if ([v29 isEqualToString:@"LAYOUT_TYPE_UNKNOWN"])
      {
        int v30 = 0;
      }
      else if ([v29 isEqualToString:@"LAYOUT_TYPE_IMAGE_TEXT"])
      {
        int v30 = 1;
      }
      else if ([v29 isEqualToString:@"LAYOUT_TYPE_IMAGE_ICON_TEXT"])
      {
        int v30 = 2;
      }
      else if ([v29 isEqualToString:@"LAYOUT_TYPE_ICON_TEXT"])
      {
        int v30 = 3;
      }
      else if ([v29 isEqualToString:@"LAYOUT_TYPE_TEXT_ONLY"])
      {
        int v30 = 4;
      }
      else
      {
        int v30 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:

        goto LABEL_61;
      }
      int v30 = [v28 intValue];
    }
    *(unsigned char *)(v6 + 40) |= 1u;
    *(_DWORD *)(v6 + 24) = v30;
    goto LABEL_60;
  }
LABEL_61:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTemplatePlaceModuleConfigurationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_sectionTitles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (flags) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_templatePlaceComponentId;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_sectionTitles;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        -[GEOPDTemplatePlaceModuleConfiguration addSectionTitle:](v6, v12);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    *(_DWORD *)(v6 + 32) = self->_orientation;
    *(unsigned char *)(v6 + 40) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 28) = self->_numberOfRows;
  *(unsigned char *)(v6 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (flags)
  {
LABEL_13:
    *(_DWORD *)(v6 + 24) = self->_layoutType;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
LABEL_14:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 40);
  if ((flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_templatePlaceComponentId != *((_DWORD *)v4 + 9)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  sectionTitles = self->_sectionTitles;
  if ((unint64_t)sectionTitles | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](sectionTitles, "isEqual:"))
    {
LABEL_24:
      BOOL v8 = 0;
      goto LABEL_25;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numberOfRows != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_orientation != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_layoutType != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
    BOOL v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_templatePlaceComponentId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_sectionTitles hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_numberOfRows;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_orientation;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_layoutType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitles, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end