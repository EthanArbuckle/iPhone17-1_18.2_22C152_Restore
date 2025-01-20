@interface HMPBMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addHapCategories:(uint64_t)a1;
- (uint64_t)addHapCharacteristics:(uint64_t)a1;
- (uint64_t)addHapServices:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation HMPBMetadata

- (BOOL)readFrom:(id)a3
{
  v4 = a3;
  v5 = (int *)MEMORY[0x1E4F940E8];
  v6 = (int *)MEMORY[0x1E4F940E0];
  v7 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_42:
    BOOL v25 = v4[*v7] == 0;
    goto LABEL_43;
  }
  v8 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v7]) {
      goto LABEL_42;
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
        goto LABEL_12;
      }
      v9 += 7;
      BOOL v15 = v10++ >= 9;
      if (v15)
      {
        unint64_t v11 = 0;
        int v16 = v4[*v7];
        goto LABEL_14;
      }
    }
    v4[*v7] = 1;
LABEL_12:
    int v16 = v4[*v7];
    if (v4[*v7]) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      goto LABEL_42;
    }
    switch((v11 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          uint64_t v21 = *v5;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 == -1 || v22 >= *(void *)&v4[*v6]) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)&v4[*v8] + v22);
          *(void *)&v4[v21] = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_38;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_40;
          }
        }
        v4[*v7] = 1;
LABEL_38:
        if (v4[*v7]) {
          LODWORD(v20) = 0;
        }
LABEL_40:
        self->_version = v20;
        goto LABEL_41;
      case 2u:
        v24 = objc_alloc_init(HMPBMetadataCharacteristic);
        -[HMPBMetadata addHapCharacteristics:]((uint64_t)self, v24);
        if (!PBReaderPlaceMark() || !HMPBMetadataCharacteristicReadFrom((uint64_t)v24, (uint64_t)v4)) {
          goto LABEL_44;
        }
        goto LABEL_36;
      case 3u:
        v24 = objc_alloc_init(HMPBMetadataService);
        -[HMPBMetadata addHapServices:]((uint64_t)self, v24);
        if (!PBReaderPlaceMark() || !HMPBMetadataServiceReadFrom((uint64_t)v24, (uint64_t)v4)) {
          goto LABEL_44;
        }
        goto LABEL_36;
      case 4u:
        v24 = objc_alloc_init(HMPBMetadataCategory);
        -[HMPBMetadata addHapCategories:]((uint64_t)self, v24);
        if PBReaderPlaceMark() && (HMPBMetadataCategoryReadFrom((uint64_t)v24, (uint64_t)v4))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
            goto LABEL_42;
          }
          continue;
        }
LABEL_44:

LABEL_45:
        BOOL v25 = 0;
LABEL_43:

        return v25;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_45;
        }
        goto LABEL_41;
    }
  }
}

- (uint64_t)addHapCharacteristics:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)addHapServices:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)addHapCategories:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 8);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      v5 = *(void **)(a1 + 8);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapServices, 0);
  objc_storeStrong((id *)&self->_hapCharacteristics, 0);

  objc_storeStrong((id *)&self->_hapCategories, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_hapCharacteristics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v10 = self->_hapServices;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v15 = self->_hapCategories;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_hapCharacteristics hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_hapServices hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_hapCategories hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  hapCharacteristics = self->_hapCharacteristics;
  if ((unint64_t)hapCharacteristics | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](hapCharacteristics, "isEqual:"))
  {
    goto LABEL_13;
  }
  hapServices = self->_hapServices;
  if ((unint64_t)hapServices | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](hapServices, "isEqual:")) {
      goto LABEL_13;
    }
  }
  hapCategories = self->_hapCategories;
  if ((unint64_t)hapCategories | *((void *)v4 + 1)) {
    char v8 = -[NSMutableArray isEqual:](hapCategories, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = self->_hapCharacteristics;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v11) copyWithZone:a3];
        -[HMPBMetadata addHapCharacteristics:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = self->_hapServices;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v17) copyWithZone:a3];
        -[HMPBMetadata addHapServices:]((uint64_t)v6, v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self->_hapCategories;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (void)v26);
        -[HMPBMetadata addHapCategories:]((uint64_t)v6, v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_hapCharacteristics count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_hapCharacteristics, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v6 = self->_hapCharacteristics;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"hapCharacteristics"];
  }
  if ([(NSMutableArray *)self->_hapServices count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_hapServices, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v13 = self->_hapServices;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v31 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"hapServices"];
  }
  if ([(NSMutableArray *)self->_hapCategories count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_hapCategories, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = self->_hapCategories;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "dictionaryRepresentation", (void)v27);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"hapCategories"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBMetadata;
  id v4 = [(HMPBMetadata *)&v8 description];
  uint64_t v5 = [(HMPBMetadata *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end