@interface _MPCProtoTracklist
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)addAccountInfo:(uint64_t)a1;
- (void)addContainer:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoTracklist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_containers, 0);

  objc_storeStrong((id *)&self->_accountInfos, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_accountInfos hash];
  uint64_t v4 = [(NSMutableArray *)self->_containers hash];
  unint64_t v5 = [(_MPCProtoTracklistIndexPath *)self->_startingItemIndexPath hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_shuffleMode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  accountInfos = self->_accountInfos;
  if ((unint64_t)accountInfos | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](accountInfos, "isEqual:")) {
      goto LABEL_12;
    }
  }
  containers = self->_containers;
  if ((unint64_t)containers | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](containers, "isEqual:")) {
      goto LABEL_12;
    }
  }
  startingItemIndexPath = self->_startingItemIndexPath;
  if ((unint64_t)startingItemIndexPath | *((void *)v4 + 4))
  {
    if (!-[_MPCProtoTracklistIndexPath isEqual:](startingItemIndexPath, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_shuffleMode == *((_DWORD *)v4 + 6))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_accountInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        -[_MPCProtoTracklist addAccountInfo:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_containers;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (void)v21);
        -[_MPCProtoTracklist addContainer:](v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(_MPCProtoTracklistIndexPath *)self->_startingItemIndexPath copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_shuffleMode;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (void)addAccountInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      id v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addContainer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_accountInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_containers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_startingItemIndexPath) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  uint64_t v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v8 = (int *)MEMORY[0x263F62268];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          long long v18 = objc_alloc_init(_MPCProtoDelegateInfo);
          -[_MPCProtoTracklist addAccountInfo:]((uint64_t)self, v18);
          if PBReaderPlaceMark() && (_MPCProtoDelegateInfoReadFrom((uint64_t)v18, (uint64_t)a3)) {
            goto LABEL_29;
          }
          goto LABEL_43;
        case 2u:
          long long v18 = objc_alloc_init(_MPCProtoContainer);
          -[_MPCProtoTracklist addContainer:]((uint64_t)self, v18);
          if (!PBReaderPlaceMark() || (_MPCProtoContainerReadFrom((uint64_t)v18, (uint64_t)a3) & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_29;
        case 3u:
          long long v18 = objc_alloc_init(_MPCProtoTracklistIndexPath);
          objc_storeStrong((id *)&self->_startingItemIndexPath, v18);
          if (!PBReaderPlaceMark() || !_MPCProtoTracklistIndexPathReadFrom((uint64_t)v18, (uint64_t)a3))
          {
LABEL_43:

            LOBYTE(v19) = 0;
            return v19;
          }
LABEL_29:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_42;
          }
          break;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v23 = *v4;
            unint64_t v24 = *(void *)((char *)a3 + v23);
            if (v24 == -1 || v24 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v24);
              *(void *)((char *)a3 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_40;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v22) = 0;
          }
LABEL_40:
          self->_shuffleMode = v22;
          goto LABEL_41;
        default:
          int v19 = PBReaderSkipValueWithTag();
          if (!v19) {
            return v19;
          }
          goto LABEL_41;
      }
    }
  }
LABEL_42:
  LOBYTE(v19) = *((unsigned char *)a3 + *v6) == 0;
  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_accountInfos count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_accountInfos, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = self->_accountInfos;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"accountInfo"];
  }
  if ([(NSMutableArray *)self->_containers count])
  {
    unint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_containers, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = self->_containers;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"container"];
  }
  startingItemIndexPath = self->_startingItemIndexPath;
  if (startingItemIndexPath)
  {
    int v19 = [(_MPCProtoTracklistIndexPath *)startingItemIndexPath dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"startingItemIndexPath"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v20 = [NSNumber numberWithInt:self->_shuffleMode];
    [v3 setObject:v20 forKey:@"shuffleMode"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoTracklist;
  id v4 = [(_MPCProtoTracklist *)&v8 description];
  id v5 = [(_MPCProtoTracklist *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end