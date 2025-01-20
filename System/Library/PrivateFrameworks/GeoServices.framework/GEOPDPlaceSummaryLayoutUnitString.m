@interface GEOPDPlaceSummaryLayoutUnitString
+ (BOOL)isValid:(id)a3;
+ (Class)formatType;
+ (Class)styleAttributesType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasServerOverrideIdentifier;
- (BOOL)hasSupportMultiLineWrapping;
- (BOOL)hasSymbolColor;
- (BOOL)hasSymbolName;
- (BOOL)hasTextColor;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportMultiLineWrapping;
- (GEOPDPlaceSummaryLayoutUnitString)init;
- (GEOPDPlaceSummaryLayoutUnitString)initWithData:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitString)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitString)initWithJSON:(id)a3;
- (NSMutableArray)formats;
- (NSMutableArray)styleAttributes;
- (NSString)symbolColor;
- (NSString)symbolName;
- (NSString)textColor;
- (NSString)value;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formatAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)styleAttributesAtIndex:(unint64_t)a3;
- (unint64_t)formatsCount;
- (unint64_t)hash;
- (unint64_t)styleAttributesCount;
- (unsigned)serverOverrideIdentifier;
- (void)_addNoFlagsFormat:(uint64_t)a1;
- (void)_addNoFlagsStyleAttributes:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFormats;
- (void)_readStyleAttributes;
- (void)_readSymbolColor;
- (void)_readSymbolName;
- (void)_readTextColor;
- (void)_readValue;
- (void)addFormat:(id)a3;
- (void)addStyleAttributes:(id)a3;
- (void)clearFormats;
- (void)clearStyleAttributes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFormats:(id)a3;
- (void)setHasServerOverrideIdentifier:(BOOL)a3;
- (void)setHasSupportMultiLineWrapping:(BOOL)a3;
- (void)setServerOverrideIdentifier:(unsigned int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setSupportMultiLineWrapping:(BOOL)a3;
- (void)setSymbolColor:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitString

- (GEOPDPlaceSummaryLayoutUnitString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  v2 = [(GEOPDPlaceSummaryLayoutUnitString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  v3 = [(GEOPDPlaceSummaryLayoutUnitString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValue_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (NSString)value
{
  -[GEOPDPlaceSummaryLayoutUnitString _readValue]((uint64_t)self);
  value = self->_value;

  return value;
}

- (void)setValue:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)_readSymbolName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSymbolName
{
  return self->_symbolName != 0;
}

- (NSString)symbolName
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolName]((uint64_t)self);
  symbolName = self->_symbolName;

  return symbolName;
}

- (void)setSymbolName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (void)_readFormats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)formats
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  formats = self->_formats;

  return formats;
}

- (void)setFormats:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  formats = self->_formats;
  self->_formats = v4;
}

- (void)clearFormats
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  formats = self->_formats;

  [(NSMutableArray *)formats removeAllObjects];
}

- (void)addFormat:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutUnitString _addNoFlagsFormat:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsFormat:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)formatsCount
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  formats = self->_formats;

  return [(NSMutableArray *)formats count];
}

- (id)formatAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  formats = self->_formats;

  return (id)[(NSMutableArray *)formats objectAtIndex:a3];
}

+ (Class)formatType
{
  return (Class)objc_opt_class();
}

- (unsigned)serverOverrideIdentifier
{
  return self->_serverOverrideIdentifier;
}

- (void)setServerOverrideIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_serverOverrideIdentifier = a3;
}

- (void)setHasServerOverrideIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasServerOverrideIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)supportMultiLineWrapping
{
  return self->_supportMultiLineWrapping;
}

- (void)setSupportMultiLineWrapping:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_supportMultiLineWrapping = a3;
}

- (void)setHasSupportMultiLineWrapping:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSupportMultiLineWrapping
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readSymbolColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolColor_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSymbolColor
{
  return self->_symbolColor != 0;
}

- (NSString)symbolColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolColor]((uint64_t)self);
  symbolColor = self->_symbolColor;

  return symbolColor;
}

- (void)setSymbolColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_symbolColor, a3);
}

- (void)_readTextColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTextColor
{
  return self->_textColor != 0;
}

- (NSString)textColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readTextColor]((uint64_t)self);
  textColor = self->_textColor;

  return textColor;
}

- (void)setTextColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)styleAttributes
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  styleAttributes = self->_styleAttributes;
  self->_styleAttributes = v4;
}

- (void)clearStyleAttributes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  styleAttributes = self->_styleAttributes;

  [(NSMutableArray *)styleAttributes removeAllObjects];
}

- (void)addStyleAttributes:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutUnitString _addNoFlagsStyleAttributes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsStyleAttributes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)styleAttributesCount
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return [(NSMutableArray *)styleAttributes count];
}

- (id)styleAttributesAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return (id)[(NSMutableArray *)styleAttributes objectAtIndex:a3];
}

+ (Class)styleAttributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  id v4 = [(GEOPDPlaceSummaryLayoutUnitString *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryLayoutUnitString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 value];
    if (v5) {
      [v4 setObject:v5 forKey:@"value"];
    }

    objc_super v6 = [(id)a1 symbolName];
    if (v6)
    {
      if (a2) {
        id v7 = @"symbolName";
      }
      else {
        id v7 = @"symbol_name";
      }
      [v4 setObject:v6 forKey:v7];
    }

    if ([*(id *)(a1 + 16) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v9 = *(id *)(a1 + 16);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v40 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"format"];
    }
    __int16 v16 = *(_WORD *)(a1 + 84);
    if (v16)
    {
      v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v18 = @"serverOverrideIdentifier";
      }
      else {
        v18 = @"server_override_identifier";
      }
      [v4 setObject:v17 forKey:v18];

      __int16 v16 = *(_WORD *)(a1 + 84);
    }
    if ((v16 & 2) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
      if (a2) {
        v20 = @"supportMultiLineWrapping";
      }
      else {
        v20 = @"support_multi_line_wrapping";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 symbolColor];
    if (v21)
    {
      if (a2) {
        v22 = @"symbolColor";
      }
      else {
        v22 = @"symbol_color";
      }
      [v4 setObject:v21 forKey:v22];
    }

    v23 = [(id)a1 textColor];
    if (v23)
    {
      if (a2) {
        v24 = @"textColor";
      }
      else {
        v24 = @"text_color";
      }
      [v4 setObject:v23 forKey:v24];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v26 = *(id *)(a1 + 24);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = objc_msgSend(v31, "dictionaryRepresentation", (void)v35);
            }
            objc_msgSend(v25, "addObject:", v32, (void)v35);
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v28);
      }

      if (a2) {
        v33 = @"styleAttributes";
      }
      else {
        v33 = @"style_attributes";
      }
      objc_msgSend(v4, "setObject:forKey:", v25, v33, (void)v35);
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
  return -[GEOPDPlaceSummaryLayoutUnitString _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitString *)-[GEOPDPlaceSummaryLayoutUnitString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setValue:v7];
      }
      if (a3) {
        objc_super v8 = @"symbolName";
      }
      else {
        objc_super v8 = @"symbol_name";
      }
      id v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = (void *)[v9 copy];
        [a1 setSymbolName:v10];
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:@"format"];
      objc_opt_class();
      id v43 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v49 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOPDPlaceSummaryFormat alloc];
                if (a3) {
                  uint64_t v19 = [(GEOPDPlaceSummaryFormat *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOPDPlaceSummaryFormat *)v18 initWithDictionary:v17];
                }
                v20 = (void *)v19;
                [a1 addFormat:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v14);
        }

        id v5 = v43;
      }

      if (a3) {
        v21 = @"serverOverrideIdentifier";
      }
      else {
        v21 = @"server_override_identifier";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setServerOverrideIdentifier:", objc_msgSend(v22, "unsignedIntValue"));
      }

      if (a3) {
        v23 = @"supportMultiLineWrapping";
      }
      else {
        v23 = @"support_multi_line_wrapping";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportMultiLineWrapping:", objc_msgSend(v24, "BOOLValue"));
      }

      if (a3) {
        v25 = @"symbolColor";
      }
      else {
        v25 = @"symbol_color";
      }
      id v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = (void *)[v26 copy];
        [a1 setSymbolColor:v27];
      }
      if (a3) {
        uint64_t v28 = @"textColor";
      }
      else {
        uint64_t v28 = @"text_color";
      }
      uint64_t v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = (void *)[v29 copy];
        [a1 setTextColor:v30];
      }
      if (a3) {
        v31 = @"styleAttributes";
      }
      else {
        v31 = @"style_attributes";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v45 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v39 = [GEOStyleAttributes alloc];
                if (a3) {
                  uint64_t v40 = [(GEOStyleAttributes *)v39 initWithJSON:v38];
                }
                else {
                  uint64_t v40 = [(GEOStyleAttributes *)v39 initWithDictionary:v38];
                }
                long long v41 = (void *)v40;
                [a1 addStyleAttributes:v40];
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v35);
        }

        id v5 = v43;
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitString *)-[GEOPDPlaceSummaryLayoutUnitString _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1247;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1248;
    }
    GEOPDPlaceSummaryLayoutUnitStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryLayoutUnitStringCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FC) == 0))
  {
    uint64_t v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    __int16 v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPlaceSummaryLayoutUnitString *)self readAll:0];
    if (self->_value) {
      PBDataWriterWriteStringField();
    }
    if (self->_symbolName) {
      PBDataWriterWriteStringField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v6 = self->_formats;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_symbolColor) {
      PBDataWriterWriteStringField();
    }
    if (self->_textColor) {
      PBDataWriterWriteStringField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_styleAttributes;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_formats;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  long long v13 = (id *)a3;
  [(GEOPDPlaceSummaryLayoutUnitString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_value) {
    objc_msgSend(v13, "setValue:");
  }
  if (self->_symbolName) {
    objc_msgSend(v13, "setSymbolName:");
  }
  if ([(GEOPDPlaceSummaryLayoutUnitString *)self formatsCount])
  {
    [v13 clearFormats];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutUnitString *)self formatsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryLayoutUnitString *)self formatAtIndex:i];
        [v13 addFormat:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v13 + 19) = self->_serverOverrideIdentifier;
    *((_WORD *)v13 + 42) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v13 + 80) = self->_supportMultiLineWrapping;
    *((_WORD *)v13 + 42) |= 2u;
  }
  if (self->_symbolColor) {
    objc_msgSend(v13, "setSymbolColor:");
  }
  if (self->_textColor) {
    objc_msgSend(v13, "setTextColor:");
  }
  if ([(GEOPDPlaceSummaryLayoutUnitString *)self styleAttributesCount])
  {
    [v13 clearStyleAttributes];
    unint64_t v9 = [(GEOPDPlaceSummaryLayoutUnitString *)self styleAttributesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(GEOPDPlaceSummaryLayoutUnitString *)self styleAttributesAtIndex:j];
        [v13 addStyleAttributes:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryLayoutUnitStringReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryLayoutUnitString *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_value copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_symbolName copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v13 = self->_formats;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addFormat:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_serverOverrideIdentifier;
    *(_WORD *)(v5 + 84) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_supportMultiLineWrapping;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  uint64_t v19 = [(NSString *)self->_symbolColor copyWithZone:a3];
  long long v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  uint64_t v21 = [(NSString *)self->_textColor copyWithZone:a3];
  long long v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = self->_styleAttributes;
  uint64_t v23 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v8);
        }
        id v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        [(id)v5 addStyleAttributes:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPDPlaceSummaryLayoutUnitString *)self readAll:1];
  [v4 readAll:1];
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:")) {
      goto LABEL_27;
    }
  }
  symbolName = self->_symbolName;
  if ((unint64_t)symbolName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](symbolName, "isEqual:")) {
      goto LABEL_27;
    }
  }
  formats = self->_formats;
  if ((unint64_t)formats | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](formats, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 42);
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_serverOverrideIdentifier != *((_DWORD *)v4 + 19)) {
      goto LABEL_27;
    }
  }
  else if (v9)
  {
    goto LABEL_27;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) != 0)
    {
      if (self->_supportMultiLineWrapping)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_27;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_21;
      }
    }
LABEL_27:
    char v13 = 0;
    goto LABEL_28;
  }
  if ((v9 & 2) != 0) {
    goto LABEL_27;
  }
LABEL_21:
  symbolColor = self->_symbolColor;
  if ((unint64_t)symbolColor | *((void *)v4 + 4)
    && !-[NSString isEqual:](symbolColor, "isEqual:"))
  {
    goto LABEL_27;
  }
  textColor = self->_textColor;
  if ((unint64_t)textColor | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](textColor, "isEqual:")) {
      goto LABEL_27;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 3)) {
    char v13 = -[NSMutableArray isEqual:](styleAttributes, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutUnitString *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_value hash];
  NSUInteger v4 = [(NSString *)self->_symbolName hash];
  uint64_t v5 = [(NSMutableArray *)self->_formats hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v7 = 2654435761 * self->_serverOverrideIdentifier;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_supportMultiLineWrapping;
LABEL_6:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v7;
  NSUInteger v10 = v8 ^ [(NSString *)self->_symbolColor hash];
  NSUInteger v11 = v9 ^ v10 ^ [(NSString *)self->_textColor hash];
  return v11 ^ [(NSMutableArray *)self->_styleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 7)) {
    -[GEOPDPlaceSummaryLayoutUnitString setValue:](self, "setValue:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOPDPlaceSummaryLayoutUnitString setSymbolName:](self, "setSymbolName:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDPlaceSummaryLayoutUnitString *)self addFormat:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 42);
  if (v10)
  {
    self->_serverOverrideIdentifier = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v10 = *((_WORD *)v4 + 42);
  }
  if ((v10 & 2) != 0)
  {
    self->_supportMultiLineWrapping = *((unsigned char *)v4 + 80);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 4)) {
    -[GEOPDPlaceSummaryLayoutUnitString setSymbolColor:](self, "setSymbolColor:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOPDPlaceSummaryLayoutUnitString setTextColor:](self, "setTextColor:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 3);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEOPDPlaceSummaryLayoutUnitString addStyleAttributes:](self, "addStyleAttributes:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_formats, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end