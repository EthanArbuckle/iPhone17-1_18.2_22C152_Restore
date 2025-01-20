@interface GEOGloriaTessellationOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)zoomLevelsAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOGloriaTessellationOptions

- (uint64_t)zoomLevelsAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(void *)(result + 16);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 8) + 4 * a2);
  }
  return result;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOGloriaTessellationOptions;
  [(GEOGloriaTessellationOptions *)&v3 dealloc];
}

- (BOOL)readFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E4F940E8];
    uint64_t v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      v8 = (int *)MEMORY[0x1E4F940B8];
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
          BOOL v15 = v10++ >= 9;
          if (v15)
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
        int v17 = v11 & 7;
        if (v16 || v17 == 4) {
          break;
        }
        if ((v11 >> 3) == 2)
        {
          if (v17 == 2)
          {
            if (!PBReaderPlaceMark()) {
              goto LABEL_59;
            }
            while (*(void *)&v4[*v5] < *(void *)&v4[*v6] && !v4[*v7])
            {
              char v25 = 0;
              unsigned int v26 = 0;
              uint64_t v27 = 0;
              while (1)
              {
                uint64_t v28 = *v5;
                unint64_t v29 = *(void *)&v4[v28];
                if (v29 == -1 || v29 >= *(void *)&v4[*v6]) {
                  break;
                }
                char v30 = *(unsigned char *)(*(void *)&v4[*v8] + v29);
                *(void *)&v4[v28] = v29 + 1;
                v27 |= (unint64_t)(v30 & 0x7F) << v25;
                if (v30 < 0)
                {
                  v25 += 7;
                  BOOL v15 = v26++ >= 9;
                  if (!v15) {
                    continue;
                  }
                }
                goto LABEL_40;
              }
              v4[*v7] = 1;
LABEL_40:
              PBRepeatedUInt32Add();
            }
            PBReaderRecallMark();
          }
          else
          {
            char v31 = 0;
            unsigned int v32 = 0;
            uint64_t v33 = 0;
            while (1)
            {
              uint64_t v34 = *v5;
              unint64_t v35 = *(void *)&v4[v34];
              if (v35 == -1 || v35 >= *(void *)&v4[*v6]) {
                break;
              }
              char v36 = *(unsigned char *)(*(void *)&v4[*v8] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_56;
            }
            v4[*v7] = 1;
LABEL_56:
            PBRepeatedUInt32Add();
          }
        }
        else if ((v11 >> 3) == 1)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          while (1)
          {
            uint64_t v22 = *v5;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v6]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_44;
            }
            v19 += 7;
            BOOL v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_46;
            }
          }
          v4[*v7] = 1;
LABEL_44:
          if (v4[*v7]) {
            LODWORD(v21) = 0;
          }
LABEL_46:
          self->_type = v21;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_59;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v37 = v4[*v7] == 0;
  }
  else
  {
LABEL_59:
    BOOL v37 = 0;
  }
  objc_sync_exit(v4);

  return v37;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOGloriaTessellationOptions;
  unint64_t v4 = [(GEOGloriaTessellationOptions *)&v8 description];
  v5 = [(GEOGloriaTessellationOptions *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = *(int *)(a1 + 32);
    if (v3 >= 3)
    {
      unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
    }
    else
    {
      unint64_t v4 = (void *)*((void *)&off_1E53EA728 + v3);
    }
    [v2 setObject:v4 forKey:@"type"];

    if (*(void *)(a1 + 16))
    {
      v5 = PBRepeatedUInt32NSArray();
      [v2 setObject:v5 forKey:@"zoomLevels"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  p_zoomLevels = &self->_zoomLevels;
  if (p_zoomLevels->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_zoomLevels->count);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_type;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_type == v4[8]) {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_type;
  return v2 ^ PBRepeatedUInt32Hash();
}

@end