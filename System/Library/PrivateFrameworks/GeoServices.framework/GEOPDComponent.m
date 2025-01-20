@interface GEOPDComponent
- (BOOL)hasTimestampFirstSeen;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)statusCodeIsValid;
- (char)_initWithDictionary:(uint64_t)a3 isJSON:;
- (double)timestampFirstSeen;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attribution;
- (id)commingledAttributions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)source;
- (id)values;
- (id)versionDomains;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addCommingledAttributions:(uint64_t)a1;
- (void)addValue:(uint64_t)a1;
- (void)addVersionDomain:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setAttribution:(uint64_t)a1;
- (void)setHasTimestampFirstSeen:(BOOL)a3;
- (void)setSource:(uint64_t)a1;
- (void)setTimestampFirstSeen:(double)a3;
- (void)setValues:(uint64_t)a1;
- (void)setVersionDomains:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionDomains, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_commingledAttributions, 0);
  objc_storeStrong((id *)&self->_attribution, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (BOOL)statusCodeIsValid
{
  return !self || (*(_WORD *)&self->_flags & 0x20) == 0 || (self->_status & 0xFFFFFFFD) == 0;
}

- (id)values
{
  if (a1)
  {
    a1 = (id *)a1[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)attribution
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)commingledAttributions
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)timestampFirstSeen
{
  return self->_timestampFirstSeen;
}

- (id)versionDomains
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_type;
    *(_WORD *)(v5 + 100) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_status;
  *(_WORD *)(v5 + 100) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 84) = self->_ttl;
  *(_WORD *)(v5 + 100) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_42:
  *(_DWORD *)(v5 + 76) = self->_startIndex;
  *(_WORD *)(v5 + 100) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 92) = self->_valuesAvailable;
    *(_WORD *)(v5 + 100) |= 0x100u;
  }
LABEL_7:
  id v8 = [(GEOPDAttribution *)self->_attribution copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v10 = self->_values;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v14) copyWithZone:a3];
        -[GEOPDComponent addValue:](v6, v15);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v12);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v16 = self->_versionDomains;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v20) copyWithZone:a3];
        -[GEOPDComponent addVersionDomain:](v6, v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_version;
    *(_WORD *)(v6 + 100) |= 0x200u;
  }
  id v22 = [(GEOPDSource *)self->_source copyWithZone:a3];
  v23 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v22;

  __int16 v24 = (__int16)self->_flags;
  if ((v24 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_cacheControl;
    *(_WORD *)(v6 + 100) |= 2u;
    __int16 v24 = (__int16)self->_flags;
  }
  if ((v24 & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_componentId;
    *(_WORD *)(v6 + 100) |= 4u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = self->_commingledAttributions;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v29), "copyWithZone:", a3, (void)v33);
        -[GEOPDComponent addCommingledAttributions:](v6, v30);

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v27);
  }

  __int16 v31 = (__int16)self->_flags;
  if ((v31 & 8) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_elevationModelUsed;
    *(_WORD *)(v6 + 100) |= 8u;
    __int16 v31 = (__int16)self->_flags;
  }
  if (v31)
  {
    *(double *)(v6 + 40) = self->_timestampFirstSeen;
    *(_WORD *)(v6 + 100) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)addVersionDomain:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addValue:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 0x100) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_attribution) {
    PBDataWriterWriteSubmessage();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = self->_values;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = self->_versionDomains;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  if ((*(_WORD *)&self->_flags & 0x200) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_source) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v16 = (__int16)self->_flags;
  if ((v16 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v16 = (__int16)self->_flags;
  }
  if ((v16 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = self->_commingledAttributions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  __int16 v22 = (__int16)self->_flags;
  if ((v22 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v22 = (__int16)self->_flags;
  }
  if (v22) {
    PBDataWriterWriteDoubleField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v23);
}

- (BOOL)hasTimestampFirstSeen
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setTimestampFirstSeen:(double)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_timestampFirstSeen = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 50);
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 22)) {
      goto LABEL_64;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 20)) {
      goto LABEL_64;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_ttl != *((_DWORD *)v4 + 21)) {
      goto LABEL_64;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_64;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_startIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_64;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_64;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0 || self->_valuesAvailable != *((_DWORD *)v4 + 23)) {
      goto LABEL_64;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_64;
  }
  attribution = self->_attribution;
  if ((unint64_t)attribution | *((void *)v4 + 2) && !-[GEOPDAttribution isEqual:](attribution, "isEqual:")) {
    goto LABEL_64;
  }
  values = self->_values;
  if ((unint64_t)values | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](values, "isEqual:")) {
      goto LABEL_64;
    }
  }
  versionDomains = self->_versionDomains;
  if ((unint64_t)versionDomains | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](versionDomains, "isEqual:")) {
      goto LABEL_64;
    }
  }
  __int16 v10 = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 50);
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0 || self->_version != *((_DWORD *)v4 + 24)) {
      goto LABEL_64;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_64;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 4))
  {
    if (!-[GEOPDSource isEqual:](source, "isEqual:")) {
      goto LABEL_64;
    }
    __int16 v10 = (__int16)self->_flags;
    __int16 v11 = *((_WORD *)v4 + 50);
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cacheControl != *((_DWORD *)v4 + 16)) {
      goto LABEL_64;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_64;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_componentId != *((_DWORD *)v4 + 17)) {
      goto LABEL_64;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_64;
  }
  commingledAttributions = self->_commingledAttributions;
  if ((unint64_t)commingledAttributions | *((void *)v4 + 3))
  {
    if (-[NSMutableArray isEqual:](commingledAttributions, "isEqual:"))
    {
      __int16 v10 = (__int16)self->_flags;
      __int16 v11 = *((_WORD *)v4 + 50);
      goto LABEL_54;
    }
LABEL_64:
    BOOL v14 = 0;
    goto LABEL_65;
  }
LABEL_54:
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_elevationModelUsed != *((_DWORD *)v4 + 18)) {
      goto LABEL_64;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_64;
  }
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_timestampFirstSeen != *((double *)v4 + 5)) {
      goto LABEL_64;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v11 & 1) == 0;
  }
LABEL_65:

  return v14;
}

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
  id v3 = *(id *)(a1 + 48);
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
        if (-[GEOPDComponentValue hasGreenTeaWithValue:](*(void *)(*((void *)&v10 + 1) + 8 * v7), a2))
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

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      -[GEOPDAttribution clearUnknownFields:](*(void *)(a1 + 16), 1);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDComponentValue clearUnknownFields:](*(void *)(*((void *)&v19 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }

      -[GEOPDSource clearUnknownFields:](*(void *)(a1 + 32), 1);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            -[GEOPDAttribution clearUnknownFields:](*(void *)(*((void *)&v15 + 1) + 8 * v14++), 1);
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)setAttribution:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setValues:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setVersionDomains:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (id)source
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSource:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)addCommingledAttributions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDComponent;
  id v4 = [(GEOPDComponent *)&v8 description];
  id v5 = [(GEOPDComponent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_210;
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 0x80) != 0)
  {
    uint64_t v6 = @"COMPONENT_TYPE_UNKNOWN";
    switch(*(_DWORD *)(a1 + 88))
    {
      case 0:
        break;
      case 1:
        uint64_t v6 = @"COMPONENT_TYPE_ENTITY";
        break;
      case 2:
        uint64_t v6 = @"COMPONENT_TYPE_PLACE_INFO";
        break;
      case 3:
        uint64_t v6 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
        break;
      case 4:
        uint64_t v6 = @"COMPONENT_TYPE_BOUNDS";
        break;
      case 5:
        uint64_t v6 = @"COMPONENT_TYPE_ADDRESS";
        break;
      case 6:
        uint64_t v6 = @"COMPONENT_TYPE_RATING";
        break;
      case 7:
        uint64_t v6 = @"COMPONENT_TYPE_REVIEW";
        break;
      case 8:
        uint64_t v6 = @"COMPONENT_TYPE_PHOTO";
        break;
      case 9:
        uint64_t v6 = @"COMPONENT_TYPE_HOURS";
        break;
      case 0xA:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_INFO";
        break;
      case 0xB:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
        break;
      case 0xC:
        uint64_t v6 = @"COMPONENT_TYPE_ETA";
        break;
      case 0xD:
        uint64_t v6 = @"COMPONENT_TYPE_FLYOVER";
        break;
      case 0xE:
        uint64_t v6 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
        break;
      case 0xF:
        uint64_t v6 = @"COMPONENT_TYPE_AMENITIES";
        break;
      case 0x10:
        uint64_t v6 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
        break;
      case 0x14:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
        break;
      case 0x15:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
        break;
      case 0x16:
        uint64_t v6 = @"COMPONENT_TYPE_TEXT_BLOCK";
        break;
      case 0x17:
        uint64_t v6 = @"COMPONENT_TYPE_FACTOID";
        break;
      case 0x18:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
        break;
      case 0x19:
        uint64_t v6 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
        break;
      case 0x1A:
        uint64_t v6 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
        break;
      case 0x1B:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
        break;
      case 0x1D:
        uint64_t v6 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
        break;
      case 0x1E:
        uint64_t v6 = @"COMPONENT_TYPE_RESULT_SNIPPET";
        break;
      case 0x1F:
        uint64_t v6 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
        break;
      case 0x20:
        uint64_t v6 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
        break;
      case 0x21:
        uint64_t v6 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
        break;
      case 0x22:
        uint64_t v6 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
        break;
      case 0x24:
        uint64_t v6 = @"COMPONENT_TYPE_TIP";
        break;
      case 0x25:
        uint64_t v6 = @"COMPONENT_TYPE_PLACECARD_URL";
        break;
      case 0x26:
        uint64_t v6 = @"COMPONENT_TYPE_ASSOCIATED_APP";
        break;
      case 0x27:
        uint64_t v6 = @"COMPONENT_TYPE_MESSAGE_LINK";
        break;
      case 0x28:
        uint64_t v6 = @"COMPONENT_TYPE_QUICK_LINK";
        break;
      case 0x29:
        uint64_t v6 = @"COMPONENT_TYPE_RAP";
        break;
      case 0x2A:
        uint64_t v6 = @"COMPONENT_TYPE_OFFLINE_AREA";
        break;
      case 0x2B:
        uint64_t v6 = @"COMPONENT_TYPE_LOCATION_EVENT";
        break;
      case 0x2C:
        uint64_t v6 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
        break;
      case 0x2D:
        uint64_t v6 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
        break;
      case 0x2E:
        uint64_t v6 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
        break;
      case 0x2F:
        uint64_t v6 = @"COMPONENT_TYPE_OFFLINE_SIZE";
        break;
      case 0x30:
        uint64_t v6 = @"COMPONENT_TYPE_VENUE_INFO";
        break;
      case 0x31:
        uint64_t v6 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
        break;
      case 0x32:
        uint64_t v6 = @"COMPONENT_TYPE_CONTAINED_PLACE";
        break;
      case 0x33:
        uint64_t v6 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
        break;
      case 0x34:
        uint64_t v6 = @"COMPONENT_TYPE_ICON";
        break;
      case 0x35:
        uint64_t v6 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
        break;
      case 0x36:
        uint64_t v6 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
        break;
      case 0x37:
        uint64_t v6 = @"COMPONENT_TYPE_STOREFRONT";
        break;
      case 0x38:
        uint64_t v6 = @"COMPONENT_TYPE_GROUND_VIEW_LABEL";
        break;
      case 0x39:
        uint64_t v6 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
        break;
      case 0x3A:
        uint64_t v6 = @"COMPONENT_TYPE_POI_EVENT";
        break;
      case 0x3B:
        uint64_t v6 = @"COMPONENT_TYPE_STOREFRONT_PRESENTATION";
        break;
      case 0x3C:
        uint64_t v6 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
        break;
      case 0x3D:
        uint64_t v6 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
        break;
      case 0x3E:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
        break;
      case 0x3F:
        uint64_t v6 = @"COMPONENT_TYPE_LINKED_SERVICE";
        break;
      case 0x40:
        uint64_t v6 = @"COMPONENT_TYPE_BUSINESS_HOURS";
        break;
      case 0x41:
        uint64_t v6 = @"COMPONENT_TYPE_COLLECTION";
        break;
      case 0x42:
        uint64_t v6 = @"COMPONENT_TYPE_RELATED_PLACE";
        break;
      case 0x43:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
        break;
      case 0x44:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
        break;
      case 0x45:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
        break;
      case 0x46:
        uint64_t v6 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
        break;
      case 0x47:
        uint64_t v6 = @"COMPONENT_TYPE_PUBLISHER";
        break;
      case 0x48:
        uint64_t v6 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
        break;
      case 0x49:
        uint64_t v6 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
        break;
      case 0x4A:
        uint64_t v6 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
        break;
      case 0x4C:
        uint64_t v6 = @"COMPONENT_TYPE_COLLECTION_IDS";
        break;
      case 0x4D:
        uint64_t v6 = @"COMPONENT_TYPE_ISO_3166_CODE";
        break;
      case 0x4E:
        uint64_t v6 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
        break;
      case 0x4F:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
        break;
      case 0x51:
        uint64_t v6 = @"COMPONENT_TYPE_STOREFRONT_FACES";
        break;
      case 0x52:
        uint64_t v6 = @"COMPONENT_TYPE_GUIDE_GROUP";
        break;
      case 0x53:
        uint64_t v6 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
        break;
      case 0x54:
        uint64_t v6 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
        break;
      case 0x55:
        uint64_t v6 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
        break;
      case 0x56:
        uint64_t v6 = @"COMPONENT_TYPE_ABOUT";
        break;
      case 0x57:
        uint64_t v6 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
        break;
      case 0x58:
        uint64_t v6 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
        break;
      case 0x59:
        uint64_t v6 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
        break;
      case 0x5A:
        uint64_t v6 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
        break;
      case 0x5B:
        uint64_t v6 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
        break;
      case 0x5C:
        uint64_t v6 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
        break;
      case 0x5D:
        uint64_t v6 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
        break;
      case 0x5E:
        uint64_t v6 = @"COMPONENT_TYPE_ACTION_DATA";
        break;
      case 0x5F:
        uint64_t v6 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
        break;
      case 0x60:
        uint64_t v6 = @"COMPONENT_TYPE_POI_CLAIM";
        break;
      case 0x61:
        uint64_t v6 = @"COMPONENT_TYPE_EV_CHARGER";
        break;
      case 0x62:
        uint64_t v6 = @"COMPONENT_TYPE_TRAIL_HEAD";
        break;
      case 0x63:
        uint64_t v6 = @"COMPONENT_TYPE_TOOL_TIP";
        break;
      case 0x64:
        uint64_t v6 = @"COMPONENT_TYPE_REFRESH_ID";
        break;
      case 0x65:
        uint64_t v6 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
        break;
      case 0x66:
        uint64_t v6 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
        break;
      case 0x67:
        uint64_t v6 = @"COMPONENT_TYPE_FORWARD_INFO";
        break;
      case 0x68:
        uint64_t v6 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
        break;
      case 0x69:
        uint64_t v6 = @"COMPONENT_TYPE_HIKE_SUMMARY";
        break;
      case 0x6A:
        uint64_t v6 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v4 setObject:v6 forKey:@"type"];

    __int16 v5 = *(_WORD *)(a1 + 100);
  }
  if ((v5 & 0x20) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 80);
    if (v7 <= 29)
    {
      objc_super v8 = @"STATUS_SUCCESS";
      switch(v7)
      {
        case 0:
          goto LABEL_123;
        case 1:
          objc_super v8 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v8 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_118;
        case 5:
          objc_super v8 = @"INVALID_REQUEST";
          break;
        default:
          if (v7 != 20) {
            goto LABEL_118;
          }
          objc_super v8 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_123;
    }
    if (v7 > 49)
    {
      if (v7 == 50)
      {
        objc_super v8 = @"STATUS_DEDUPED";
        goto LABEL_123;
      }
      if (v7 == 60)
      {
        objc_super v8 = @"VERSION_MISMATCH";
        goto LABEL_123;
      }
    }
    else
    {
      if (v7 == 30)
      {
        objc_super v8 = @"NEEDS_REFINEMENT";
        goto LABEL_123;
      }
      if (v7 == 40)
      {
        objc_super v8 = @"FAILED_NOT_AUTHORIZED";
LABEL_123:
        [v4 setObject:v8 forKey:@"status"];

        __int16 v5 = *(_WORD *)(a1 + 100);
        goto LABEL_124;
      }
    }
LABEL_118:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_123;
  }
LABEL_124:
  if ((v5 & 0x40) == 0)
  {
    if ((v5 & 0x10) == 0) {
      goto LABEL_126;
    }
LABEL_135:
    uint64_t v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      long long v15 = @"startIndex";
    }
    else {
      long long v15 = @"start_index";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(_WORD *)(a1 + 100) & 0x100) == 0) {
      goto LABEL_131;
    }
    goto LABEL_127;
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  [v4 setObject:v13 forKey:@"ttl"];

  __int16 v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 0x10) != 0) {
    goto LABEL_135;
  }
LABEL_126:
  if ((v5 & 0x100) != 0)
  {
LABEL_127:
    uint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
    if (a2) {
      id v10 = @"valuesAvailable";
    }
    else {
      id v10 = @"values_available";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_131:
  id v11 = *(id *)(a1 + 16);
  uint64_t v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    long long v16 = [v11 dictionaryRepresentation];
    }
    [v4 setObject:v16 forKey:@"attribution"];
  }
  if ([*(id *)(a1 + 48) count])
  {
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v66 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          if (a2) {
            [v23 jsonRepresentation];
          }
          else {
          long long v24 = [v23 dictionaryRepresentation];
          }
          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"value"];
  }
  uint64_t v25 = *(void **)(a1 + 56);
  if (v25)
  {
    id v26 = v25;
    if (a2) {
      long long v27 = @"versionDomain";
    }
    else {
      long long v27 = @"version_domain";
    }
    [v4 setObject:v26 forKey:v27];
  }
  if ((*(_WORD *)(a1 + 100) & 0x200) != 0)
  {
    long long v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    [v4 setObject:v28 forKey:@"version"];
  }
  id v29 = *(id *)(a1 + 32);
  long long v30 = v29;
  if (v29)
  {
    if (a2) {
      [v29 jsonRepresentation];
    }
    else {
    long long v31 = [v29 dictionaryRepresentation];
    }
    [v4 setObject:v31 forKey:@"source"];
  }
  __int16 v32 = *(_WORD *)(a1 + 100);
  if ((v32 & 2) != 0)
  {
    uint64_t v33 = *(int *)(a1 + 64);
    if (v33 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
      long long v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v34 = off_1E53E37E8[v33];
    }
    if (a2) {
      long long v35 = @"cacheControl";
    }
    else {
      long long v35 = @"cache_control";
    }
    [v4 setObject:v34 forKey:v35];

    __int16 v32 = *(_WORD *)(a1 + 100);
  }
  if ((v32 & 4) != 0)
  {
    long long v36 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
    if (a2) {
      long long v37 = @"componentId";
    }
    else {
      long long v37 = @"component_id";
    }
    [v4 setObject:v36 forKey:v37];
  }
  if ([*(id *)(a1 + 24) count])
  {
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v39 = *(id *)(a1 + 24);
    uint64_t v40 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v62 != v42) {
            objc_enumerationMutation(v39);
          }
          long long v44 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          if (a2) {
            [v44 jsonRepresentation];
          }
          else {
          v45 = [v44 dictionaryRepresentation];
          }
          [v38 addObject:v45];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v41);
    }

    if (a2) {
      v46 = @"commingledAttributions";
    }
    else {
      v46 = @"commingled_attributions";
    }
    [v4 setObject:v38 forKey:v46];
  }
  __int16 v47 = *(_WORD *)(a1 + 100);
  if ((v47 & 8) != 0)
  {
    int v48 = *(_DWORD *)(a1 + 72);
    if (v48)
    {
      if (v48 == 1)
      {
        v49 = @"ELEVATION_MODEL_WGS84";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 72));
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v49 = @"ELEVATION_MODEL_EGM96";
    }
    if (a2) {
      v50 = @"elevationModelUsed";
    }
    else {
      v50 = @"elevation_model_used";
    }
    [v4 setObject:v49 forKey:v50];

    __int16 v47 = *(_WORD *)(a1 + 100);
  }
  if (v47)
  {
    v51 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v4 setObject:v51 forKey:@"timestampFirstSeen"];
  }
  v52 = *(void **)(a1 + 8);
  if (v52)
  {
    v53 = [v52 dictionaryRepresentation];
    v54 = v53;
    if (a2)
    {
      v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __44__GEOPDComponent__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E53D8860;
      id v56 = v55;
      id v60 = v56;
      [v54 enumerateKeysAndObjectsUsingBlock:v59];
      id v57 = v56;

      v54 = v57;
    }
    [v4 setObject:v54 forKey:@"Unknown Fields"];
  }
LABEL_210:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDComponent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDComponent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (char)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_350;
  }
  a1 = (char *)(id)[a1 init];

  if (!a1) {
    goto LABEL_350;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  int v7 = &OBJC_IVAR___GEOXPCReply__error;
  id v82 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if ([v8 isEqualToString:@"COMPONENT_TYPE_UNKNOWN"])
    {
      int v9 = 0;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ENTITY"])
    {
      int v9 = 1;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACE_INFO"])
    {
      int v9 = 2;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ROAD_ACCESS_INFO"])
    {
      int v9 = 3;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_BOUNDS"])
    {
      int v9 = 4;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ADDRESS"])
    {
      int v9 = 5;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RATING"])
    {
      int v9 = 6;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_REVIEW"])
    {
      int v9 = 7;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PHOTO"])
    {
      int v9 = 8;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_HOURS"])
    {
      int v9 = 9;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO"])
    {
      int v9 = 10;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_SCHEDULE"])
    {
      int v9 = 11;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ETA"])
    {
      int v9 = 12;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_FLYOVER"])
    {
      int v9 = 13;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RAW_ATTRIBUTE"])
    {
      int v9 = 14;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_AMENITIES"])
    {
      int v9 = 15;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_STYLE_ATTRIBUTES"])
    {
      int v9 = 16;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INCIDENT"])
    {
      int v9 = 20;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO"])
    {
      int v9 = 21;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TEXT_BLOCK"])
    {
      int v9 = 22;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_FACTOID"])
    {
      int v9 = 23;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ATTRIBUTION"])
    {
      int v9 = 24;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_BUSINESS_CLAIM"])
    {
      int v9 = 25;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_CAPTIONED_PHOTO"])
    {
      int v9 = 26;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET"])
    {
      int v9 = 27;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_EXTERNAL_ACTION"])
    {
      int v9 = 29;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RESULT_SNIPPET"])
    {
      int v9 = 30;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ADDRESS_OBJECT"])
    {
      int v9 = 31;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT"])
    {
      int v9 = 32;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK"])
    {
      int v9 = 33;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT"])
    {
      int v9 = 34;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TIP"])
    {
      int v9 = 36;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACECARD_URL"])
    {
      int v9 = 37;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ASSOCIATED_APP"])
    {
      int v9 = 38;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_MESSAGE_LINK"])
    {
      int v9 = 39;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_QUICK_LINK"])
    {
      int v9 = 40;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RAP"])
    {
      int v9 = 41;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_OFFLINE_AREA"])
    {
      int v9 = 42;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_LOCATION_EVENT"])
    {
      int v9 = 43;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS"])
    {
      int v9 = 44;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_OFFLINE_IDENTIFIER"])
    {
      int v9 = 45;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_OFFLINE_QUAD_NODES"])
    {
      int v9 = 46;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_OFFLINE_SIZE"])
    {
      int v9 = 47;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_VENUE_INFO"])
    {
      int v9 = 48;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST"])
    {
      int v9 = 49;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_CONTAINED_PLACE"])
    {
      int v9 = 50;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_WIFI_FINGERPRINT"])
    {
      int v9 = 51;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ICON"])
    {
      int v9 = 52;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PRICE_DESCRIPTION"])
    {
      int v9 = 53;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_BROWSE_CATEGORIES"])
    {
      int v9 = 54;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_STOREFRONT"])
    {
      int v9 = 55;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_GROUND_VIEW_LABEL"])
    {
      int v9 = 56;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ANNOTATED_ITEM_LIST"])
    {
      int v9 = 57;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_POI_EVENT"])
    {
      int v9 = 58;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_PRESENTATION"])
    {
      int v9 = 59;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACECARD_LAYOUT"])
    {
      int v9 = 60;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PROTOTYPE_CONTAINER"])
    {
      int v9 = 61;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION"])
    {
      int v9 = 62;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_LINKED_SERVICE"])
    {
      int v9 = 63;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_BUSINESS_HOURS"])
    {
      int v9 = 64;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_COLLECTION"])
    {
      int v9 = 65;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_RELATED_PLACE"])
    {
      int v9 = 66;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP"])
    {
      int v9 = 67;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME"])
    {
      int v9 = 68;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY"])
    {
      int v9 = 69;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES"])
    {
      int v9 = 70;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PUBLISHER"])
    {
      int v9 = 71;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
    {
      int v9 = 72;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACE_QUESTIONNAIRE"])
    {
      int v9 = 73;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_PLACE_COLLECTION_ITEM"])
    {
      int v9 = 74;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_COLLECTION_IDS"])
    {
      int v9 = 76;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ISO_3166_CODE"])
    {
      int v9 = 77;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_VENDOR_AMENITIES"])
    {
      int v9 = 78;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE"])
    {
      int v9 = 79;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_FACES"])
    {
      int v9 = 81;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_GUIDE_GROUP"])
    {
      int v9 = 82;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_CONTAINMENT_PLACE"])
    {
      int v9 = 83;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_CATEGORIZED_PHOTOS"])
    {
      int v9 = 84;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_EXPLORE_GUIDES"])
    {
      int v9 = 85;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ABOUT"])
    {
      int v9 = 86;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_LABEL_GEOMETRY"])
    {
      int v9 = 87;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ENHANCED_PLACEMENT"])
    {
      int v9 = 88;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TEMPLATE_PLACE"])
    {
      int v9 = 89;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_SEARCH_ENRICHMENT"])
    {
      int v9 = 90;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO"])
    {
      int v9 = 91;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_BUSINESS_ASSETS"])
    {
      int v9 = 92;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_INFO"])
    {
      int v9 = 93;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ACTION_DATA"])
    {
      int v9 = 94;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_DATA"])
    {
      int v9 = 95;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_POI_CLAIM"])
    {
      int v9 = 96;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_EV_CHARGER"])
    {
      int v9 = 97;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TRAIL_HEAD"])
    {
      int v9 = 98;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_TOOL_TIP"])
    {
      int v9 = 99;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_REFRESH_ID"])
    {
      int v9 = 100;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_ADDRESS_COMPONENTS"])
    {
      int v9 = 101;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO"])
    {
      int v9 = 102;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_FORWARD_INFO"])
    {
      int v9 = 103;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO"])
    {
      int v9 = 104;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_HIKE_SUMMARY"])
    {
      int v9 = 105;
    }
    else if ([v8 isEqualToString:@"COMPONENT_TYPE_HIKE_GEOMETRY"])
    {
      int v9 = 106;
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_209;
    }
    int v9 = [v6 intValue];
  }
  *((_WORD *)a1 + 50) |= 0x80u;
  *((_DWORD *)a1 + 22) = v9;
LABEL_209:

  id v10 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"STATUS_SUCCESS"])
    {
      int v12 = 0;
    }
    else if ([v11 isEqualToString:@"STATUS_FAILED"])
    {
      int v12 = 1;
    }
    else if ([v11 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      int v12 = 2;
    }
    else if ([v11 isEqualToString:@"INVALID_REQUEST"])
    {
      int v12 = 5;
    }
    else if ([v11 isEqualToString:@"FAILED_NO_RESULT"])
    {
      int v12 = 20;
    }
    else if ([v11 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      int v12 = 30;
    }
    else if ([v11 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      int v12 = 40;
    }
    else if ([v11 isEqualToString:@"STATUS_DEDUPED"])
    {
      int v12 = 50;
    }
    else if ([v11 isEqualToString:@"VERSION_MISMATCH"])
    {
      int v12 = 60;
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_233;
    }
    int v12 = [v10 intValue];
  }
  *((_WORD *)a1 + 50) |= 0x20u;
  *((_DWORD *)a1 + 20) = v12;
LABEL_233:

  uint64_t v13 = [v5 objectForKeyedSubscript:@"ttl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [v13 unsignedIntValue];
    *((_WORD *)a1 + 50) |= 0x40u;
    *((_DWORD *)a1 + 21) = v14;
  }

  if (a3) {
    long long v15 = @"startIndex";
  }
  else {
    long long v15 = @"start_index";
  }
  long long v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = [v16 intValue];
    *((_WORD *)a1 + 50) |= 0x10u;
    *((_DWORD *)a1 + 19) = v17;
  }

  if (a3) {
    id v18 = @"valuesAvailable";
  }
  else {
    id v18 = @"values_available";
  }
  uint64_t v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v20 = [v19 intValue];
    *((_WORD *)a1 + 50) |= 0x100u;
    *((_DWORD *)a1 + 23) = v20;
  }

  uint64_t v21 = [v5 objectForKeyedSubscript:@"attribution"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = [GEOPDAttribution alloc];
    if (v22) {
      long long v23 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v22, v21, a3);
    }
    else {
      long long v23 = 0;
    }
    -[GEOPDComponent setAttribution:]((uint64_t)a1, v23);
  }
  long long v24 = [v5 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v80 = v24;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v91 objects:v97 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v92;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v92 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v91 + 1) + 8 * v29);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v31 = [GEOPDComponentValue alloc];
            if (v31) {
              __int16 v32 = (void *)-[GEOPDComponentValue _initWithDictionary:isJSON:](v31, v30, a3);
            }
            else {
              __int16 v32 = 0;
            }
            -[GEOPDComponent addValue:]((uint64_t)a1, v32);
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v33 = [v25 countByEnumeratingWithState:&v91 objects:v97 count:16];
        uint64_t v27 = v33;
      }
      while (v33);
    }

    long long v24 = v80;
    int v7 = &OBJC_IVAR___GEOXPCReply__error;
  }

  if (a3) {
    long long v34 = @"versionDomain";
  }
  else {
    long long v34 = @"version_domain";
  }
  long long v35 = objc_msgSend(v5, "objectForKeyedSubscript:", v34, v80);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v87 objects:v96 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v88 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v42 = (void *)[v41 copy];
            -[GEOPDComponent addVersionDomain:]((uint64_t)a1, v42);
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v87 objects:v96 count:16];
      }
      while (v38);
    }

    id v5 = v82;
    int v7 = &OBJC_IVAR___GEOXPCReply__error;
  }

  long long v43 = [v5 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v44 = [v43 unsignedIntValue];
    *(_WORD *)&a1[v7[735]] |= 0x200u;
    *((_DWORD *)a1 + 24) = v44;
  }

  v45 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [GEOPDSource alloc];
    if (v46)
    {
      id v47 = v45;
      v46 = [(GEOPDSource *)v46 init];
      if (v46)
      {
        if (a3) {
          int v48 = @"resultProviderId";
        }
        else {
          int v48 = @"result_provider_id";
        }
        v49 = [v47 objectForKeyedSubscript:v48];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v50 = [v49 intValue];
          *(unsigned char *)&v46->_flags |= 0x10u;
          *(unsigned char *)&v46->_flags |= 1u;
          v46->_resultProviderId = v50;
        }

        if (a3) {
          v51 = @"sourceId";
        }
        else {
          v51 = @"source_id";
        }
        v52 = [v47 objectForKeyedSubscript:v51];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v53 = (void *)[v52 copy];
          -[GEOPDSource setSourceId:]((uint64_t)v46, v53);
        }
        v54 = [v47 objectForKeyedSubscript:@"version"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = (void *)[v54 copy];
          -[GEOPDSource setVersion:]((uint64_t)v46, v55);
        }
        int v7 = &OBJC_IVAR___GEOXPCReply__error;
      }
    }
    -[GEOPDComponent setSource:]((uint64_t)a1, v46);
  }
  if (a3) {
    id v56 = @"cacheControl";
  }
  else {
    id v56 = @"cache_control";
  }
  id v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v58 = v57;
    if ([v58 isEqualToString:@"UNKNOWN_CACHEABILITY"])
    {
      int v59 = 0;
    }
    else if ([v58 isEqualToString:@"UNCACHEABLE"])
    {
      int v59 = 1;
    }
    else if ([v58 isEqualToString:@"CACHEABLE"])
    {
      int v59 = 2;
    }
    else
    {
      int v59 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_313;
    }
    int v59 = [v57 intValue];
  }
  *(_WORD *)&a1[v7[735]] |= 2u;
  *((_DWORD *)a1 + 16) = v59;
LABEL_313:

  if (a3) {
    id v60 = @"componentId";
  }
  else {
    id v60 = @"component_id";
  }
  long long v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v62 = [v61 intValue];
    *(_WORD *)&a1[v7[735]] |= 4u;
    *((_DWORD *)a1 + 17) = v62;
  }

  if (a3) {
    long long v63 = @"commingledAttributions";
  }
  else {
    long long v63 = @"commingled_attributions";
  }
  long long v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v81 = v64;
    id v65 = v64;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v83 objects:v95 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v84;
      do
      {
        uint64_t v69 = 0;
        do
        {
          if (*(void *)v84 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = *(void **)(*((void *)&v83 + 1) + 8 * v69);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v71 = [GEOPDAttribution alloc];
            if (v71) {
              v72 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v71, v70, a3);
            }
            else {
              v72 = 0;
            }
            -[GEOPDComponent addCommingledAttributions:]((uint64_t)a1, v72);
          }
          ++v69;
        }
        while (v67 != v69);
        uint64_t v73 = [v65 countByEnumeratingWithState:&v83 objects:v95 count:16];
        uint64_t v67 = v73;
      }
      while (v73);
    }

    long long v64 = v81;
    id v5 = v82;
    int v7 = &OBJC_IVAR___GEOXPCReply__error;
  }

  if (a3) {
    v74 = @"elevationModelUsed";
  }
  else {
    v74 = @"elevation_model_used";
  }
  v75 = objc_msgSend(v5, "objectForKeyedSubscript:", v74, v81);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v76 = v75;
    if ([v76 isEqualToString:@"ELEVATION_MODEL_EGM96"]) {
      int v77 = 0;
    }
    else {
      int v77 = [v76 isEqualToString:@"ELEVATION_MODEL_WGS84"];
    }

    goto LABEL_346;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v77 = [v75 intValue];
LABEL_346:
    *(_WORD *)&a1[v7[735]] |= 8u;
    *((_DWORD *)a1 + 18) = v77;
  }

  v78 = [v5 objectForKeyedSubscript:@"timestampFirstSeen"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v78 doubleValue];
    objc_msgSend(a1, "setTimestampFirstSeen:");
  }

  a1 = a1;
LABEL_350:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    uint64_t v25 = 2654435761 * self->_type;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_status;
      if ((flags & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_4:
    uint64_t v23 = 2654435761 * self->_ttl;
    if ((flags & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v22 = 0;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v23 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v22 = 2654435761 * self->_startIndex;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_6:
    uint64_t v21 = 2654435761 * self->_valuesAvailable;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v21 = 0;
LABEL_12:
  unint64_t v20 = [(GEOPDAttribution *)self->_attribution hash];
  uint64_t v4 = [(NSMutableArray *)self->_values hash];
  uint64_t v5 = [(NSMutableArray *)self->_versionDomains hash];
  if ((*(_WORD *)&self->_flags & 0x200) != 0) {
    uint64_t v6 = 2654435761 * self->_version;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOPDSource *)self->_source hash];
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_cacheControl;
    if ((v8 & 4) != 0) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((v8 & 4) != 0)
    {
LABEL_17:
      uint64_t v10 = 2654435761 * self->_componentId;
      goto LABEL_20;
    }
  }
  uint64_t v10 = 0;
LABEL_20:
  uint64_t v11 = [(NSMutableArray *)self->_commingledAttributions hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_elevationModelUsed;
    if (v12) {
      goto LABEL_22;
    }
LABEL_27:
    unint64_t v18 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18;
  }
  uint64_t v13 = 0;
  if ((v12 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_22:
  double timestampFirstSeen = self->_timestampFirstSeen;
  double v15 = -timestampFirstSeen;
  if (timestampFirstSeen >= 0.0) {
    double v15 = self->_timestampFirstSeen;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_60;
  }
  __int16 v5 = v3[50];
  if ((v5 & 0x80) != 0)
  {
    *(_DWORD *)(a1 + 88) = *((_DWORD *)v3 + 22);
    *(_WORD *)(a1 + 100) |= 0x80u;
    __int16 v5 = v3[50];
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 80) = *((_DWORD *)v3 + 20);
  *(_WORD *)(a1 + 100) |= 0x20u;
  __int16 v5 = v3[50];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_14:
    *(_DWORD *)(a1 + 76) = *((_DWORD *)v3 + 19);
    *(_WORD *)(a1 + 100) |= 0x10u;
    if ((v3[50] & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *(_DWORD *)(a1 + 84) = *((_DWORD *)v3 + 21);
  *(_WORD *)(a1 + 100) |= 0x40u;
  __int16 v5 = v3[50];
  if ((v5 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_6:
  if ((v5 & 0x100) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 92) = *((_DWORD *)v3 + 23);
    *(_WORD *)(a1 + 100) |= 0x100u;
  }
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 16);
  unint64_t v7 = (void *)*((void *)v4 + 2);
  if (v6)
  {
    if (v7) {
      -[GEOPDAttribution mergeFrom:](v6, v7);
    }
  }
  else if (v7)
  {
    -[GEOPDComponent setAttribution:](a1, v7);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = *((id *)v4 + 6);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOPDComponent addValue:](a1, *(void **)(*((void *)&v38 + 1) + 8 * i));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOPDComponent addVersionDomain:](a1, *(void **)(*((void *)&v34 + 1) + 8 * j));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
    *(_WORD *)(a1 + 100) |= 0x200u;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = (void *)*((void *)v4 + 4);
  if (v18)
  {
    if (v19)
    {
      unint64_t v20 = v19;
      -[GEOPDSource readAll:]((uint64_t)v20, 0);
      if (v20[14])
      {
        *(_DWORD *)(v18 + 52) = v20[13];
        *(unsigned char *)(v18 + 56) |= 1u;
      }
      uint64_t v21 = (void *)*((void *)v20 + 3);
      if (v21) {
        -[GEOPDSource setSourceId:](v18, v21);
      }
      uint64_t v22 = (void *)*((void *)v20 + 4);
      if (v22) {
        -[GEOPDSource setVersion:](v18, v22);
      }
    }
  }
  else if (v19)
  {
    -[GEOPDComponent setSource:](a1, v19);
  }
  __int16 v23 = *((_WORD *)v4 + 50);
  if ((v23 & 2) != 0)
  {
    *(_DWORD *)(a1 + 64) = *((_DWORD *)v4 + 16);
    *(_WORD *)(a1 + 100) |= 2u;
    __int16 v23 = *((_WORD *)v4 + 50);
  }
  if ((v23 & 4) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(_WORD *)(a1 + 100) |= 4u;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v24 = *((id *)v4 + 3);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v24);
        }
        -[GEOPDComponent addCommingledAttributions:](a1, *(void **)(*((void *)&v30 + 1) + 8 * k));
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v26);
  }

  __int16 v29 = *((_WORD *)v4 + 50);
  if ((v29 & 8) != 0)
  {
    *(_DWORD *)(a1 + 72) = *((_DWORD *)v4 + 18);
    *(_WORD *)(a1 + 100) |= 8u;
    __int16 v29 = *((_WORD *)v4 + 50);
  }
  if (v29)
  {
    *(void *)(a1 + 40) = *((void *)v4 + 5);
    *(_WORD *)(a1 + 100) |= 1u;
  }
LABEL_60:
}

- (void)setHasTimestampFirstSeen:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

@end