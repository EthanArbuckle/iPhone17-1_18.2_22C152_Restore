@interface GEOFlyoverRegionVersions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveRegions:(uint64_t)a1;
- (uint64_t)addRegion:(uint64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOFlyoverRegionVersions

- (void)dealloc
{
  if (self)
  {
    self->_regionsSpace = 0;
    self->_regionsCount = 0;
    free(self->_regions);
    self->_regions = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOFlyoverRegionVersions;
  [(GEOFlyoverRegionVersions *)&v3 dealloc];
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 24);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (16 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 16 * v9, 0x6110FBE8uLL);
    if (result)
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 8) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 16)), 16 * (v9 - *(void *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (uint64_t)addRegion:(uint64_t)a3
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t result = -[GEOFlyoverRegionVersions _reserveRegions:](result, 1uLL);
    if (result)
    {
      unint64_t v6 = (void *)(*(void *)(v5 + 8) + 16 * *(void *)(v5 + 16));
      *unint64_t v6 = a2;
      v6[1] = a3;
      ++*(void *)(v5 + 16);
    }
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOFlyoverRegionVersions;
  unint64_t v4 = [(GEOFlyoverRegionVersions *)&v8 description];
  uint64_t v5 = [(GEOFlyoverRegionVersions *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFlyoverRegionVersions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = (void *)v4;
    unint64_t v6 = 0x1E9106000uLL;
    if (*(void *)(a1 + 16))
    {
      v20 = (void *)v4;
      unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 16)];
      if (*(void *)(a1 + 16))
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        v10 = @"data_version";
        if (a2) {
          v10 = @"dataVersion";
        }
        v21 = v10;
        do
        {
          unint64_t v11 = v6;
          uint64_t v12 = *(void *)(a1 + 8);
          v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v20);
          uint64_t v14 = v12 + v8;
          char v15 = *(unsigned char *)(v12 + v8 + 12);
          if (v15)
          {
            v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v12 + v8)];
            [v13 setObject:v17 forKey:v21];

            char v15 = *(unsigned char *)(v14 + 12);
            if ((v15 & 2) != 0)
            {
LABEL_14:
              v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v12 + v8 + 4)];
              [v13 setObject:v18 forKey:@"region"];

              if ((*(unsigned char *)(v14 + 12) & 4) == 0) {
                goto LABEL_11;
              }
LABEL_10:
              v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v12 + v8 + 8)];
              [v13 setObject:v16 forKey:@"version"];

              goto LABEL_11;
            }
          }
          else if ((*(unsigned char *)(v12 + v8 + 12) & 2) != 0)
          {
            goto LABEL_14;
          }
          if ((v15 & 4) != 0) {
            goto LABEL_10;
          }
LABEL_11:
          [v7 addObject:v13];

          ++v9;
          unint64_t v6 = v11;
          v8 += 16;
        }
        while (v9 < *(void *)(a1 + *(int *)(v11 + 2028)));
      }
      uint64_t v5 = v20;
      objc_msgSend(v20, "setObject:forKey:", v7, @"region", v20);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOFlyoverRegionVersions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    uint64_t v5 = (int *)MEMORY[0x1E4F940E8];
    unint64_t v6 = (int *)MEMORY[0x1E4F940E0];
    unint64_t v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
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
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        if ((v11 >> 3) == 1)
        {
          if (!PBReaderPlaceMark()) {
            goto LABEL_82;
          }
          -[GEOFlyoverRegionVersions _reserveRegions:]((uint64_t)self, 1uLL);
          if (*(void *)&v4[*v5] < *(void *)&v4[*v6])
          {
            v18 = &self->_regions[self->_regionsCount];
            p_var3 = &v18->var3;
            do
            {
              if (v4[*v7]) {
                break;
              }
              char v20 = 0;
              unsigned int v21 = 0;
              unint64_t v22 = 0;
              while (1)
              {
                uint64_t v23 = *v5;
                unint64_t v24 = *(void *)&v4[v23];
                if (v24 == -1 || v24 >= *(void *)&v4[*v6]) {
                  break;
                }
                char v25 = *(unsigned char *)(*(void *)&v4[*v8] + v24);
                *(void *)&v4[v23] = v24 + 1;
                v22 |= (unint64_t)(v25 & 0x7F) << v20;
                if ((v25 & 0x80) == 0) {
                  goto LABEL_32;
                }
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  unint64_t v22 = 0;
                  int v26 = v4[*v7];
                  goto LABEL_34;
                }
              }
              v4[*v7] = 1;
LABEL_32:
              int v26 = v4[*v7];
              if (v4[*v7]) {
                unint64_t v22 = 0;
              }
LABEL_34:
              if (v26 || (v22 & 7) == 4) {
                break;
              }
              unint64_t v28 = v22 >> 3;
              if ((v22 >> 3) == 3)
              {
                char v37 = 0;
                unsigned int v38 = 0;
                uint64_t v31 = 0;
                *(unsigned char *)p_var3 |= 1u;
                while (1)
                {
                  uint64_t v39 = *v5;
                  unint64_t v40 = *(void *)&v4[v39];
                  if (v40 == -1 || v40 >= *(void *)&v4[*v6]) {
                    break;
                  }
                  char v41 = *(unsigned char *)(*(void *)&v4[*v8] + v40);
                  *(void *)&v4[v39] = v40 + 1;
                  v31 |= (unint64_t)(v41 & 0x7F) << v37;
                  if ((v41 & 0x80) == 0)
                  {
                    p_var2 = v18;
                    goto LABEL_68;
                  }
                  v37 += 7;
                  BOOL v35 = v38++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = v18;
                    goto LABEL_70;
                  }
                }
                p_var2 = v18;
LABEL_67:
                v4[*v7] = 1;
              }
              else if (v28 == 2)
              {
                char v42 = 0;
                unsigned int v43 = 0;
                uint64_t v31 = 0;
                *(unsigned char *)p_var3 |= 4u;
                while (1)
                {
                  uint64_t v44 = *v5;
                  unint64_t v45 = *(void *)&v4[v44];
                  if (v45 == -1 || v45 >= *(void *)&v4[*v6])
                  {
                    p_var2 = (GEOFlyoverRegion *)&v18->var2;
                    goto LABEL_67;
                  }
                  char v46 = *(unsigned char *)(*(void *)&v4[*v8] + v45);
                  *(void *)&v4[v44] = v45 + 1;
                  v31 |= (unint64_t)(v46 & 0x7F) << v42;
                  if ((v46 & 0x80) == 0) {
                    break;
                  }
                  v42 += 7;
                  BOOL v35 = v43++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = (GEOFlyoverRegion *)&v18->var2;
                    goto LABEL_70;
                  }
                }
                p_var2 = (GEOFlyoverRegion *)&v18->var2;
              }
              else
              {
                if (v28 != 1)
                {
                  if ((PBReaderSkipValueWithTag() & 1) == 0) {
                    goto LABEL_82;
                  }
                  continue;
                }
                char v29 = 0;
                unsigned int v30 = 0;
                uint64_t v31 = 0;
                *(unsigned char *)p_var3 |= 2u;
                while (1)
                {
                  uint64_t v32 = *v5;
                  unint64_t v33 = *(void *)&v4[v32];
                  if (v33 == -1 || v33 >= *(void *)&v4[*v6])
                  {
                    p_var2 = (GEOFlyoverRegion *)&v18->var1;
                    goto LABEL_67;
                  }
                  char v34 = *(unsigned char *)(*(void *)&v4[*v8] + v33);
                  *(void *)&v4[v32] = v33 + 1;
                  v31 |= (unint64_t)(v34 & 0x7F) << v29;
                  if ((v34 & 0x80) == 0) {
                    break;
                  }
                  v29 += 7;
                  BOOL v35 = v30++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = (GEOFlyoverRegion *)&v18->var1;
                    goto LABEL_70;
                  }
                }
                p_var2 = (GEOFlyoverRegion *)&v18->var1;
              }
LABEL_68:
              if (v4[*v7]) {
                LODWORD(v31) = 0;
              }
LABEL_70:
              p_var2->var0 = v31;
            }
            while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
          }
          if (v4[*v7]) {
            goto LABEL_82;
          }
          PBReaderRecallMark();
          ++self->_regionsCount;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_82;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v47 = v4[*v7] == 0;
  }
  else
  {
LABEL_82:
    BOOL v47 = 0;
  }
  objc_sync_exit(v4);

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_regionsCount)
  {
    uint64_t v5 = 0;
    for (unint64_t i = 0; i < self->_regionsCount; ++i)
    {
      PBDataWriterPlaceMark();
      unint64_t v7 = &self->_regions[v5];
      char var3 = (char)v7->var3;
      if ((var3 & 2) != 0)
      {
        PBDataWriterWriteUint32Field();
        char var3 = (char)v7->var3;
        if ((var3 & 4) != 0)
        {
LABEL_10:
          PBDataWriterWriteUint32Field();
          if ((*(unsigned char *)&v7->var3 & 1) == 0) {
            goto LABEL_7;
          }
LABEL_6:
          PBDataWriterWriteUint32Field();
          goto LABEL_7;
        }
      }
      else if ((*(unsigned char *)&v7->var3 & 4) != 0)
      {
        goto LABEL_10;
      }
      if (var3) {
        goto LABEL_6;
      }
LABEL_7:
      PBDataWriterRecallMark();
      ++v5;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEOFlyoverRegionVersions _reserveRegions:](v4, regionsCount);
    memcpy(*(void **)(v5 + 8), self->_regions, 16 * self->_regionsCount);
    *(void *)(v5 + 16) = self->_regionsCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t regionsCount = self->_regionsCount, (const void *)regionsCount == v4[2])
    && memcmp(self->_regions, v4[1], 16 * regionsCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  return PBHashBytes();
}

@end