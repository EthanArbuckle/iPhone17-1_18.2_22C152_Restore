@interface NWPBUpdateBrowse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBUpdateBrowse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredEndpoints, 0);

  objc_storeStrong((id *)&self->_clientUUID, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientUUID hash];
  return [(NSMutableArray *)self->_discoveredEndpoints hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientUUID = self->_clientUUID, !((unint64_t)clientUUID | v4[1]))
     || -[NSString isEqual:](clientUUID, "isEqual:")))
  {
    discoveredEndpoints = self->_discoveredEndpoints;
    if ((unint64_t)discoveredEndpoints | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](discoveredEndpoints, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientUUID copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = self->_discoveredEndpoints;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "copyWithZone:", a3, (void)v18);
        v14 = (void *)v5[2];
        if (!v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v16 = (void *)v5[2];
          v5[2] = v15;

          v14 = (void *)v5[2];
        }
        [v14 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_clientUUID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_discoveredEndpoints;
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

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int)*MEMORY[0x1E4F940E8];
  unint64_t v6 = *(void *)((char *)a3 + v5);
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v8 = *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]);
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (v6 < v8)
  {
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      v14 = (char *)a3 + *v9;
      if (*v14) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
      if (v6 >= v8) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0) {
        goto LABEL_40;
      }
      uint64_t v17 = *v4;
      unint64_t v18 = *(void *)((char *)a3 + v17);
      if (v18 == -1 || v18 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + *v11) + v18);
      *(void *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v21 = *v4;
      unint64_t v22 = *(void *)((char *)a3 + v21);
      if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v23 = v22 + 1;
      int v24 = *(char *)(*(void *)((char *)a3 + *v11) + v22);
      *(void *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v11) + v26);
      *(void *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v29 = *v4;
      unint64_t v30 = *(void *)((char *)a3 + v29);
      if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + *v11) + v30);
      *(void *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v33 = *v4;
      unint64_t v34 = *(void *)((char *)a3 + v33);
      if (v34 == -1 || v34 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v35 = v34 + 1;
      int v36 = *(char *)(*(void *)((char *)a3 + *v11) + v34);
      *(void *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v37 = *v4;
      unint64_t v38 = *(void *)((char *)a3 + v37);
      if (v38 == -1 || v38 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + *v11) + v38);
      *(void *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v41 = *v4;
      unint64_t v42 = *(void *)((char *)a3 + v41);
      if (v42 == -1 || v42 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v43 = v42 + 1;
      int v44 = *(char *)(*(void *)((char *)a3 + *v11) + v42);
      *(void *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v45 = *v4;
      unint64_t v46 = *(void *)((char *)a3 + v45);
      if (v46 == -1 || v46 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v47 = v46 + 1;
      int v48 = *(char *)(*(void *)((char *)a3 + *v11) + v46);
      *(void *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v49 = *v4;
      unint64_t v50 = *(void *)((char *)a3 + v49);
      if (v50 == -1 || v50 >= *(void *)((char *)a3 + *v7))
      {
LABEL_38:
        v14 = (char *)a3 + *v9;
        goto LABEL_39;
      }
      unint64_t v51 = v50 + 1;
      int v52 = *(char *)(*(void *)((char *)a3 + *v11) + v50);
      *(void *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        unint64_t v16 = 0;
        int v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }
LABEL_40:
      int v53 = *((unsigned __int8 *)a3 + *v9);
      if (*((unsigned char *)a3 + *v9)) {
        unint64_t v16 = 0;
      }
LABEL_42:
      if (v53) {
        BOOL v54 = 1;
      }
      else {
        BOOL v54 = (v16 & 7) == 4;
      }
      if (v54) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
      if ((v16 >> 3) == 2)
      {
        clientUUID = objc_alloc_init(NWPBEndpoint);
        if (self)
        {
          discoveredEndpoints = self->_discoveredEndpoints;
          if (!discoveredEndpoints)
          {
            v56 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v57 = self->_discoveredEndpoints;
            self->_discoveredEndpoints = v56;

            discoveredEndpoints = self->_discoveredEndpoints;
          }
          -[NSMutableArray addObject:](discoveredEndpoints, "addObject:", clientUUID, v59, v60);
        }

        uint64_t v59 = 0;
        uint64_t v60 = 0;
        if (!PBReaderPlaceMark() || !NWPBEndpointReadFrom((uint64_t)clientUUID, (uint64_t)a3))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_4;
      }
      if ((v16 >> 3) == 1)
      {
        PBReaderReadString();
        long long v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        clientUUID = (NWPBEndpoint *)self->_clientUUID;
        self->_clientUUID = v12;
LABEL_4:

        goto LABEL_5;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_5:
      uint64_t v5 = *v4;
      unint64_t v6 = *(void *)((char *)a3 + v5);
      unint64_t v8 = *(void *)((char *)a3 + *v7);
      if (v6 >= v8) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
    }
    unint64_t v16 = 0;
LABEL_39:
    unsigned char *v14 = 1;
    goto LABEL_40;
  }
  return *((unsigned char *)a3 + *v9) == 0;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  if ([(NSMutableArray *)self->_discoveredEndpoints count])
  {
    unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_discoveredEndpoints, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_discoveredEndpoints;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"discoveredEndpoints"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBUpdateBrowse;
  id v4 = [(NWPBUpdateBrowse *)&v8 description];
  uint64_t v5 = [(NWPBUpdateBrowse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end