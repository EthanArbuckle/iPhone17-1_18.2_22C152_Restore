@interface GEODirectionsResponseExtension
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation GEODirectionsResponseExtension

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsResponseExtension;
  v4 = [(GEODirectionsResponseExtension *)&v8 description];
  v5 = [(GEODirectionsResponseExtension *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v3 = (unsigned __int8 *)a3;
  objc_sync_enter(v3);
  if (v3)
  {
    v4 = (int *)MEMORY[0x1E4F940E8];
    v5 = (int *)MEMORY[0x1E4F940E0];
    v6 = (int *)MEMORY[0x1E4F940C8];
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      int v8 = v3[*v6];
      if (*(void *)&v3[*v4] >= *(void *)&v3[*v5]) {
        break;
      }
      if (v3[*v6])
      {
        int v8 = 1;
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)&v3[v12];
        if (v13 == -1 || v13 >= *(void *)&v3[*v5]) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)&v3[*v7] + v13);
        *(void *)&v3[v12] = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_13;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          LOBYTE(v11) = 0;
          int v8 = v3[*v6];
          goto LABEL_15;
        }
      }
      v3[*v6] = 1;
LABEL_13:
      int v8 = v3[*v6];
      if (v3[*v6]) {
        LOBYTE(v11) = 0;
      }
LABEL_15:
      if (v8) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = (v11 & 7) == 4;
      }
      if (v16) {
        break;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        goto LABEL_20;
      }
    }
    BOOL v17 = v8 == 0;
  }
  else
  {
LABEL_20:
    BOOL v17 = 0;
  }
  objc_sync_exit(v3);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end