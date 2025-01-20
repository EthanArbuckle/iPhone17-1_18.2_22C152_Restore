@interface GEORevealedPlaceCardModuleTypeInfos
+ (BOOL)isValid:(id)a3;
+ (Class)buttonsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORevealedPlaceCardModuleTypeInfos)initWithDictionary:(id)a3;
- (GEORevealedPlaceCardModuleTypeInfos)initWithJSON:(id)a3;
- (NSMutableArray)buttons;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)buttonsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)buttonsCount;
- (unint64_t)hash;
- (void)addButtons:(id)a3;
- (void)clearButtons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setButtons:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORevealedPlaceCardModuleTypeInfos

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (void)clearButtons
{
}

- (void)addButtons:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  id v8 = v4;
  if (!buttons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_buttons;
    self->_buttons = v6;

    id v4 = v8;
    buttons = self->_buttons;
  }
  [(NSMutableArray *)buttons addObject:v4];
}

- (unint64_t)buttonsCount
{
  return [(NSMutableArray *)self->_buttons count];
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_buttons objectAtIndex:a3];
}

+ (Class)buttonsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORevealedPlaceCardModuleTypeInfos;
  id v4 = [(GEORevealedPlaceCardModuleTypeInfos *)&v8 description];
  v5 = [(GEORevealedPlaceCardModuleTypeInfos *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModuleTypeInfos _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = a1[1];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v14);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v14);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"buttons"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORevealedPlaceCardModuleTypeInfos _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORevealedPlaceCardModuleTypeInfos)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeInfos *)-[GEORevealedPlaceCardModuleTypeHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORevealedPlaceCardModuleTypeInfos)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeInfos *)-[GEORevealedPlaceCardModuleTypeHours _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleTypeInfosIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleTypeInfosReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_buttons;
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

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEORevealedPlaceCardModuleTypeInfos *)self readAll:0];
  if ([(GEORevealedPlaceCardModuleTypeInfos *)self buttonsCount])
  {
    [v8 clearButtons];
    unint64_t v4 = [(GEORevealedPlaceCardModuleTypeInfos *)self buttonsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORevealedPlaceCardModuleTypeInfos *)self buttonsAtIndex:i];
        [v8 addButtons:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_buttons;
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
        [v5 addButtons:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEORevealedPlaceCardModuleTypeInfos *)self readAll:1];
    [v4 readAll:1];
    buttons = self->_buttons;
    if ((unint64_t)buttons | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](buttons, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEORevealedPlaceCardModuleTypeInfos *)self readAll:1];
  buttons = self->_buttons;

  return [(NSMutableArray *)buttons hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[1];
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
        -[GEORevealedPlaceCardModuleTypeInfos addButtons:](self, "addButtons:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end