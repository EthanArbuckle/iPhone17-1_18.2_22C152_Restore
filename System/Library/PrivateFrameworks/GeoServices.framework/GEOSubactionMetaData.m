@interface GEOSubactionMetaData
+ (BOOL)isValid:(id)a3;
+ (Class)childItemSubactionTypeType;
+ (Class)displayedTextType;
- (BOOL)hasDisplayedString;
- (BOOL)hasSelectedSubactionIndex;
- (BOOL)hasSubactionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSubactionMetaData)init;
- (GEOSubactionMetaData)initWithData:(id)a3;
- (GEOSubactionMetaData)initWithDictionary:(id)a3;
- (GEOSubactionMetaData)initWithJSON:(id)a3;
- (NSMutableArray)childItemSubactionTypes;
- (NSMutableArray)displayedTexts;
- (NSString)displayedString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)childItemSubactionTypeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayedTextAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)subactionTypeAsString:(int)a3;
- (id)subactionsAsString:(int)a3;
- (int)StringAsSubactionType:(id)a3;
- (int)StringAsSubactions:(id)a3;
- (int)selectedSubactionIndex;
- (int)subactionAtIndex:(unint64_t)a3;
- (int)subactionType;
- (int)subactions;
- (unint64_t)childItemSubactionTypesCount;
- (unint64_t)displayedTextsCount;
- (unint64_t)hash;
- (unint64_t)subactionsCount;
- (void)_addNoFlagsChildItemSubactionType:(uint64_t)a1;
- (void)_addNoFlagsDisplayedText:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readChildItemSubactionTypes;
- (void)_readDisplayedString;
- (void)_readDisplayedTexts;
- (void)_readSubactions;
- (void)addChildItemSubactionType:(id)a3;
- (void)addDisplayedText:(id)a3;
- (void)addSubaction:(int)a3;
- (void)clearChildItemSubactionTypes;
- (void)clearDisplayedTexts;
- (void)clearSubactions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChildItemSubactionTypes:(id)a3;
- (void)setDisplayedString:(id)a3;
- (void)setDisplayedTexts:(id)a3;
- (void)setHasSelectedSubactionIndex:(BOOL)a3;
- (void)setHasSubactionType:(BOOL)a3;
- (void)setSelectedSubactionIndex:(int)a3;
- (void)setSubactionType:(int)a3;
- (void)setSubactions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOSubactionMetaData

- (GEOSubactionMetaData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSubactionMetaData;
  v2 = [(GEOSubactionMetaData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSubactionMetaData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSubactionMetaData;
  v3 = [(GEOSubactionMetaData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSubactionMetaData;
  [(GEOSubactionMetaData *)&v3 dealloc];
}

- (int)selectedSubactionIndex
{
  return self->_selectedSubactionIndex;
}

- (void)setSelectedSubactionIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_selectedSubactionIndex = a3;
}

- (void)setHasSelectedSubactionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasSelectedSubactionIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)subactionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_subactionType;
  }
  else {
    return 0;
  }
}

- (void)setSubactionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_subactionType = a3;
}

- (void)setHasSubactionType:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSubactionType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)subactionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = (void *)*((void *)&off_1E53EC860 + a3);
  }

  return v3;
}

- (int)StringAsSubactionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_ACTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUB_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TAP_PUBLISHER_COLLECTIONS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDisplayedString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayedString
{
  return self->_displayedString != 0;
}

- (NSString)displayedString
{
  -[GEOSubactionMetaData _readDisplayedString]((uint64_t)self);
  displayedString = self->_displayedString;

  return displayedString;
}

- (void)setDisplayedString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_displayedString, a3);
}

- (void)_readSubactions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubactions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)subactionsCount
{
  return self->_subactions.count;
}

- (int)subactions
{
  return self->_subactions.list;
}

- (void)clearSubactions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addSubaction:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (int)subactionAtIndex:(unint64_t)a3
{
  -[GEOSubactionMetaData _readSubactions]((uint64_t)self);
  p_subactions = &self->_subactions;
  unint64_t count = self->_subactions.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_subactions->list[a3];
}

- (void)setSubactions:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147390](&self->_subactions, a3, a4);
}

- (id)subactionsAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = (void *)*((void *)&off_1E53EC860 + a3);
  }

  return v3;
}

- (int)StringAsSubactions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_ACTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUB_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TAP_PUBLISHER_COLLECTIONS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDisplayedTexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedTexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)displayedTexts
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  displayedTexts = self->_displayedTexts;

  return displayedTexts;
}

- (void)setDisplayedTexts:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  displayedTexts = self->_displayedTexts;
  self->_displayedTexts = v4;
}

- (void)clearDisplayedTexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  displayedTexts = self->_displayedTexts;

  [(NSMutableArray *)displayedTexts removeAllObjects];
}

- (void)addDisplayedText:(id)a3
{
  id v4 = a3;
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  -[GEOSubactionMetaData _addNoFlagsDisplayedText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsDisplayedText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)displayedTextsCount
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  displayedTexts = self->_displayedTexts;

  return [(NSMutableArray *)displayedTexts count];
}

- (id)displayedTextAtIndex:(unint64_t)a3
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  displayedTexts = self->_displayedTexts;

  return (id)[(NSMutableArray *)displayedTexts objectAtIndex:a3];
}

+ (Class)displayedTextType
{
  return (Class)objc_opt_class();
}

- (void)_readChildItemSubactionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildItemSubactionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)childItemSubactionTypes
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  childItemSubactionTypes = self->_childItemSubactionTypes;

  return childItemSubactionTypes;
}

- (void)setChildItemSubactionTypes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  childItemSubactionTypes = self->_childItemSubactionTypes;
  self->_childItemSubactionTypes = v4;
}

- (void)clearChildItemSubactionTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  childItemSubactionTypes = self->_childItemSubactionTypes;

  [(NSMutableArray *)childItemSubactionTypes removeAllObjects];
}

- (void)addChildItemSubactionType:(id)a3
{
  id v4 = a3;
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  -[GEOSubactionMetaData _addNoFlagsChildItemSubactionType:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsChildItemSubactionType:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)childItemSubactionTypesCount
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  childItemSubactionTypes = self->_childItemSubactionTypes;

  return [(NSMutableArray *)childItemSubactionTypes count];
}

- (id)childItemSubactionTypeAtIndex:(unint64_t)a3
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  childItemSubactionTypes = self->_childItemSubactionTypes;

  return (id)[(NSMutableArray *)childItemSubactionTypes objectAtIndex:a3];
}

+ (Class)childItemSubactionTypeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSubactionMetaData;
  id v4 = [(GEOSubactionMetaData *)&v8 description];
  id v5 = [(GEOSubactionMetaData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSubactionMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 84);
    if (v5)
    {
      objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        id v7 = @"selectedSubactionIndex";
      }
      else {
        id v7 = @"selected_subaction_index";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 84);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v8 = *(int *)(a1 + 80);
      if (v8 >= 4)
      {
        v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
      }
      else
      {
        v9 = (void *)*((void *)&off_1E53EC860 + v8);
      }
      if (a2) {
        v10 = @"subactionType";
      }
      else {
        v10 = @"subaction_type";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 displayedString];
    if (v11)
    {
      if (a2) {
        v12 = @"displayedString";
      }
      else {
        v12 = @"displayed_string";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(void *)(a1 + 24))
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v14 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = *(int *)(*v14 + 4 * v15);
          if (v16 >= 4)
          {
            v17 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
          }
          else
          {
            v17 = (void *)*((void *)&off_1E53EC860 + v16);
          }
          [v13 addObject:v17];

          ++v15;
          v14 = (void *)(a1 + 16);
        }
        while (v15 < *(void *)(a1 + 24));
      }
      [v4 setObject:v13 forKey:@"subaction"];
    }
    if (*(void *)(a1 + 56))
    {
      v18 = [(id)a1 displayedTexts];
      if (a2) {
        v19 = @"displayedText";
      }
      else {
        v19 = @"displayed_text";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if (*(void *)(a1 + 40))
    {
      v20 = [(id)a1 childItemSubactionTypes];
      if (a2) {
        v21 = @"childItemSubactionType";
      }
      else {
        v21 = @"child_item_subaction_type";
      }
      [v4 setObject:v20 forKey:v21];
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
  return -[GEOSubactionMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSubactionMetaData)initWithDictionary:(id)a3
{
  return (GEOSubactionMetaData *)-[GEOSubactionMetaData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_82;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"selectedSubactionIndex";
    }
    else {
      id v7 = @"selected_subaction_index";
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setSelectedSubactionIndex:", objc_msgSend(v8, "intValue"));
    }

    if (a3) {
      v9 = @"subactionType";
    }
    else {
      v9 = @"subaction_type";
    }
    v10 = [v5 objectForKeyedSubscript:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if ([v11 isEqualToString:@"USER_ACTION"])
      {
        uint64_t v12 = 0;
      }
      else if ([v11 isEqualToString:@"SEARCH"])
      {
        uint64_t v12 = 1;
      }
      else if ([v11 isEqualToString:@"SUB_POI"])
      {
        uint64_t v12 = 2;
      }
      else if ([v11 isEqualToString:@"TAP_PUBLISHER_COLLECTIONS"])
      {
        uint64_t v12 = 3;
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_25:

        if (a3) {
          v13 = @"displayedString";
        }
        else {
          v13 = @"displayed_string";
        }
        v14 = [v5 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v15 = (void *)[v14 copy];
          [v6 setDisplayedString:v15];
        }
        uint64_t v16 = [v5 objectForKeyedSubscript:@"subaction"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v45 = a3;
          id v46 = v5;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v44 = v16;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
          if (!v18) {
            goto LABEL_52;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v56;
          while (1)
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v56 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v55 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v23 = v22;
                if ([v23 isEqualToString:@"USER_ACTION"])
                {
                  uint64_t v24 = 0;
                }
                else if ([v23 isEqualToString:@"SEARCH"])
                {
                  uint64_t v24 = 1;
                }
                else if ([v23 isEqualToString:@"SUB_POI"])
                {
                  uint64_t v24 = 2;
                }
                else if ([v23 isEqualToString:@"TAP_PUBLISHER_COLLECTIONS"])
                {
                  uint64_t v24 = 3;
                }
                else
                {
                  uint64_t v24 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_50;
                }
                uint64_t v24 = [v22 intValue];
              }
              [v6 addSubaction:v24];
LABEL_50:
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
            if (!v19)
            {
LABEL_52:

              id v5 = v46;
              a3 = v45;
              uint64_t v16 = v44;
              break;
            }
          }
        }

        if (a3) {
          v25 = @"displayedText";
        }
        else {
          v25 = @"displayed_text";
        }
        v26 = [v5 objectForKeyedSubscript:v25];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v52;
            do
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v52 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v51 + 1) + 8 * v31);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v33 = (void *)[v32 copy];
                  [v6 addDisplayedText:v33];
                }
                ++v31;
              }
              while (v29 != v31);
              uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
            }
            while (v29);
          }
        }
        if (a3) {
          v34 = @"childItemSubactionType";
        }
        else {
          v34 = @"child_item_subaction_type";
        }
        v35 = [v5 objectForKeyedSubscript:v34];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v36 = v35;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v48;
            do
            {
              uint64_t v40 = 0;
              do
              {
                if (*(void *)v48 != v39) {
                  objc_enumerationMutation(v36);
                }
                v41 = *(void **)(*((void *)&v47 + 1) + 8 * v40);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v42 = (void *)[v41 copy];
                  [v6 addChildItemSubactionType:v42];
                }
                ++v40;
              }
              while (v38 != v40);
              uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v38);
          }
        }
        goto LABEL_82;
      }
      uint64_t v12 = [v10 intValue];
    }
    [v6 setSubactionType:v12];
    goto LABEL_25;
  }
LABEL_82:

  return v6;
}

- (GEOSubactionMetaData)initWithJSON:(id)a3
{
  return (GEOSubactionMetaData *)-[GEOSubactionMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_955_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_956_0;
    }
    GEOSubactionMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSubactionMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSubactionMetaDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSubactionMetaData *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_displayedString) {
      PBDataWriterWriteStringField();
    }
    if (self->_subactions.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_subactions.count);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = self->_displayedTexts;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = self->_childItemSubactionTypes;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOSubactionMetaData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 16) = self->_readerMarkPos;
  *((_DWORD *)v16 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v16 + 19) = self->_selectedSubactionIndex;
    *((unsigned char *)v16 + 84) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v16 + 20) = self->_subactionType;
    *((unsigned char *)v16 + 84) |= 2u;
  }
  if (self->_displayedString) {
    objc_msgSend(v16, "setDisplayedString:");
  }
  if ([(GEOSubactionMetaData *)self subactionsCount])
  {
    [v16 clearSubactions];
    unint64_t v5 = [(GEOSubactionMetaData *)self subactionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v16, "addSubaction:", -[GEOSubactionMetaData subactionAtIndex:](self, "subactionAtIndex:", i));
    }
  }
  if ([(GEOSubactionMetaData *)self displayedTextsCount])
  {
    [v16 clearDisplayedTexts];
    unint64_t v8 = [(GEOSubactionMetaData *)self displayedTextsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(GEOSubactionMetaData *)self displayedTextAtIndex:j];
        [v16 addDisplayedText:v11];
      }
    }
  }
  if ([(GEOSubactionMetaData *)self childItemSubactionTypesCount])
  {
    [v16 clearChildItemSubactionTypes];
    unint64_t v12 = [(GEOSubactionMetaData *)self childItemSubactionTypesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        unint64_t v15 = [(GEOSubactionMetaData *)self childItemSubactionTypeAtIndex:k];
        [v16 addChildItemSubactionType:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSubactionMetaDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSubactionMetaData *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_selectedSubactionIndex;
    *(unsigned char *)(v5 + 84) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_subactionType;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_displayedString copyWithZone:a3];
  id v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  PBRepeatedInt32Copy();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v12 = self->_displayedTexts;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDisplayedText:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v8 = self->_childItemSubactionTypes;
  uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v8);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v5 addChildItemSubactionType:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOSubactionMetaData *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_selectedSubactionIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_subactionType != *((_DWORD *)v4 + 20)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_19;
  }
  displayedString = self->_displayedString;
  if ((unint64_t)displayedString | *((void *)v4 + 6)
    && !-[NSString isEqual:](displayedString, "isEqual:"))
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_19;
  }
  displayedTexts = self->_displayedTexts;
  if ((unint64_t)displayedTexts | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](displayedTexts, "isEqual:")) {
      goto LABEL_19;
    }
  }
  childItemSubactionTypes = self->_childItemSubactionTypes;
  if ((unint64_t)childItemSubactionTypes | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](childItemSubactionTypes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  [(GEOSubactionMetaData *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_selectedSubactionIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_subactionType;
LABEL_6:
  uint64_t v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_displayedString hash];
  uint64_t v7 = v5 ^ PBRepeatedInt32Hash() ^ v6;
  uint64_t v8 = [(NSMutableArray *)self->_displayedTexts hash];
  return v7 ^ v8 ^ [(NSMutableArray *)self->_childItemSubactionTypes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 84);
  if (v5)
  {
    self->_selectedSubactionIndex = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 84);
  }
  if ((v5 & 2) != 0)
  {
    self->_subactionType = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[GEOSubactionMetaData setDisplayedString:](self, "setDisplayedString:");
  }
  uint64_t v6 = [v4 subactionsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[GEOSubactionMetaData addSubaction:](self, "addSubaction:", [v4 subactionAtIndex:i]);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 7);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(GEOSubactionMetaData *)self addDisplayedText:*(void *)(*((void *)&v23 + 1) + 8 * j)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 5);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[GEOSubactionMetaData addChildItemSubactionType:](self, "addChildItemSubactionType:", *(void *)(*((void *)&v19 + 1) + 8 * k), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTexts, 0);
  objc_storeStrong((id *)&self->_displayedString, 0);
  objc_storeStrong((id *)&self->_childItemSubactionTypes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end