@interface ATXPBFaceGalleryConfiguration
+ (uint64_t)sectionsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)sourceAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionsAtIndex:(id *)a1;
- (uint64_t)StringAsSource:(uint64_t)a1;
- (uint64_t)addSections:(uint64_t)a1;
- (uint64_t)clearSections;
- (uint64_t)hasSource;
- (uint64_t)sections;
- (uint64_t)sectionsCount;
- (uint64_t)setHasSource:(uint64_t)result;
- (uint64_t)setSource:(uint64_t)result;
- (uint64_t)source;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setSections:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBFaceGalleryConfiguration

- (uint64_t)clearSections
{
  if (result) {
    return [*(id *)(result + 8) removeAllObjects];
  }
  return result;
}

- (uint64_t)addSections:(uint64_t)a1
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

- (uint64_t)sectionsCount
{
  if (result) {
    return [*(id *)(result + 8) count];
  }
  return result;
}

- (id)sectionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[1] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)sectionsType
{
  self;

  return objc_opt_class();
}

- (uint64_t)source
{
  if (result)
  {
    if (*(unsigned char *)(result + 20)) {
      return *(unsigned int *)(result + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setSource:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 20) |= 1u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasSource:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 20) = *(unsigned char *)(result + 20) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasSource
{
  if (result) {
    return *(unsigned char *)(result + 20) & 1;
  }
  return result;
}

- (__CFString)sourceAsString:(__CFString *)a1
{
  if (!a1)
  {
LABEL_11:
    return a1;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      a1 = @"Proactive";
      return a1;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  a1 = @"Unknown";
  return a1;
}

- (uint64_t)StringAsSource:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isEqualToString:@"Unknown"]) {
      a1 = 0;
    }
    else {
      a1 = [v4 isEqualToString:@"Proactive"];
    }
  }

  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBFaceGalleryConfiguration;
  id v4 = [(ATXPBFaceGalleryConfiguration *)&v8 description];
  v5 = [(ATXPBFaceGalleryConfiguration *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_sections count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_sections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"sections"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int source = self->_source;
    if (source)
    {
      if (source == 1)
      {
        v12 = @"Proactive";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = @"Unknown";
    }
    [v3 setObject:v12 forKey:@"source"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sections;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v8 = v3;
    if ([*(id *)(a1 + 8) count])
    {
      if (v8) {
        [v8[1] removeAllObjects];
      }
      uint64_t v4 = [*(id *)(a1 + 8) count];
      if (v4)
      {
        uint64_t v5 = v4;
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v7 = [*(id *)(a1 + 8) objectAtIndex:i];
          -[ATXPBFaceGalleryConfiguration addSections:]((uint64_t)v8, v7);
        }
      }
    }
    id v3 = v8;
    if (*(unsigned char *)(a1 + 20))
    {
      *((_DWORD *)v8 + 4) = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v8 + 20) |= 1u;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
        -[ATXPBFaceGalleryConfiguration addSections:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_source;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_source == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_sections hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_source;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3[1];
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
          -[ATXPBFaceGalleryConfiguration addSections:](a1, *(void **)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    if (*((unsigned char *)v4 + 20))
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v4 + 4);
      *(unsigned char *)(a1 + 20) |= 1u;
    }
  }
}

- (uint64_t)sections
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)setSections:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void).cxx_destruct
{
}

@end