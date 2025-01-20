@interface GEOFormattedString
+ (BOOL)isValid:(id)a3;
+ (Class)formatArgumentType;
+ (Class)formatStringType;
+ (Class)formatStyleType;
+ (Class)separatorType;
- (BOOL)hasAlternativeString;
- (BOOL)hasMetaData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)init;
- (GEOFormattedString)initWithData:(id)a3;
- (GEOFormattedString)initWithDictionary:(id)a3;
- (GEOFormattedString)initWithJSON:(id)a3;
- (GEOFormattedString)initWithString:(id)a3;
- (GEOFormattedString)stringWithDefaultValues;
- (GEOFormattedStringMetaData)metaData;
- (GEOServerConditionalString)alternativeString;
- (NSArray)formatStrings;
- (NSArray)formatStyles;
- (NSArray)separators;
- (NSMutableArray)formatArguments;
- (NSString)basicString;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_joinFormattedComponentsWithSeparators:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)formatArgumentAtIndex:(unint64_t)a3;
- (id)formatStringAtIndex:(unint64_t)a3;
- (id)formatStyleAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)separatorAtIndex:(unint64_t)a3;
- (unint64_t)formatArgumentsCount;
- (unint64_t)formatStringsCount;
- (unint64_t)formatStylesCount;
- (unint64_t)hash;
- (unint64_t)separatorsCount;
- (void)_addNoFlagsFormatArgument:(uint64_t)a1;
- (void)_addNoFlagsFormatString:(uint64_t)a1;
- (void)_addNoFlagsFormatStyle:(uint64_t)a1;
- (void)_addNoFlagsSeparator:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlternativeString;
- (void)_readFormatArguments;
- (void)_readFormatStrings;
- (void)_readFormatStyles;
- (void)_readMetaData;
- (void)_readSeparators;
- (void)addFormatArgument:(id)a3;
- (void)addFormatString:(id)a3;
- (void)addFormatStyle:(id)a3;
- (void)addSeparator:(id)a3;
- (void)clearFormatArguments;
- (void)clearFormatStrings;
- (void)clearFormatStyles;
- (void)clearSeparators;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternativeString:(id)a3;
- (void)setFormatArguments:(id)a3;
- (void)setFormatStrings:(id)a3;
- (void)setFormatStyles:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setSeparators:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOFormattedString

- (GEOFormattedString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOFormattedString;
  v2 = [(GEOFormattedString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOFormattedString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOFormattedString;
  v3 = [(GEOFormattedString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFormatStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormatStrings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSArray)formatStrings
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  formatStrings = self->_formatStrings;

  return (NSArray *)formatStrings;
}

- (void)setFormatStrings:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatStrings = self->_formatStrings;
  self->_formatStrings = v4;
}

- (void)clearFormatStrings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatStrings = self->_formatStrings;

  [(NSMutableArray *)formatStrings removeAllObjects];
}

- (void)addFormatString:(id)a3
{
  id v4 = a3;
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFormatString:(uint64_t)a1
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

- (unint64_t)formatStringsCount
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  formatStrings = self->_formatStrings;

  return [(NSMutableArray *)formatStrings count];
}

- (id)formatStringAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  formatStrings = self->_formatStrings;

  return (id)[(NSMutableArray *)formatStrings objectAtIndex:a3];
}

+ (Class)formatStringType
{
  return (Class)objc_opt_class();
}

- (void)_readFormatArguments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormatArguments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)formatArguments
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  formatArguments = self->_formatArguments;

  return formatArguments;
}

- (void)setFormatArguments:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatArguments = self->_formatArguments;
  self->_formatArguments = v4;
}

- (void)clearFormatArguments
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatArguments = self->_formatArguments;

  [(NSMutableArray *)formatArguments removeAllObjects];
}

- (void)addFormatArgument:(id)a3
{
  id v4 = a3;
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatArgument:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFormatArgument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)formatArgumentsCount
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  formatArguments = self->_formatArguments;

  return [(NSMutableArray *)formatArguments count];
}

- (id)formatArgumentAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  formatArguments = self->_formatArguments;

  return (id)[(NSMutableArray *)formatArguments objectAtIndex:a3];
}

+ (Class)formatArgumentType
{
  return (Class)objc_opt_class();
}

- (void)_readSeparators
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSeparators_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSArray)separators
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  separators = self->_separators;

  return (NSArray *)separators;
}

- (void)setSeparators:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  separators = self->_separators;
  self->_separators = v4;
}

- (void)clearSeparators
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  separators = self->_separators;

  [(NSMutableArray *)separators removeAllObjects];
}

- (void)addSeparator:(id)a3
{
  id v4 = a3;
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsSeparator:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSeparator:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)separatorsCount
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  separators = self->_separators;

  return [(NSMutableArray *)separators count];
}

- (id)separatorAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  separators = self->_separators;

  return (id)[(NSMutableArray *)separators objectAtIndex:a3];
}

+ (Class)separatorType
{
  return (Class)objc_opt_class();
}

- (void)_readFormatStyles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormatStyles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSArray)formatStyles
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  formatStyles = self->_formatStyles;

  return (NSArray *)formatStyles;
}

- (void)setFormatStyles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatStyles = self->_formatStyles;
  self->_formatStyles = v4;
}

- (void)clearFormatStyles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  formatStyles = self->_formatStyles;

  [(NSMutableArray *)formatStyles removeAllObjects];
}

- (void)addFormatStyle:(id)a3
{
  id v4 = a3;
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatStyle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFormatStyle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)formatStylesCount
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  formatStyles = self->_formatStyles;

  return [(NSMutableArray *)formatStyles count];
}

- (id)formatStyleAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  formatStyles = self->_formatStyles;

  return (id)[(NSMutableArray *)formatStyles objectAtIndex:a3];
}

+ (Class)formatStyleType
{
  return (Class)objc_opt_class();
}

- (void)_readAlternativeString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternativeString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAlternativeString
{
  return self->_alternativeString != 0;
}

- (GEOServerConditionalString)alternativeString
{
  -[GEOFormattedString _readAlternativeString]((uint64_t)self);
  alternativeString = self->_alternativeString;

  return (GEOServerConditionalString *)alternativeString;
}

- (void)setAlternativeString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_alternativeString, a3);
}

- (void)_readMetaData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetaData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (GEOFormattedStringMetaData)metaData
{
  -[GEOFormattedString _readMetaData]((uint64_t)self);
  metaData = self->_metaData;

  return metaData;
}

- (void)setMetaData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOFormattedString;
  id v4 = [(GEOFormattedString *)&v8 description];
  id v5 = [(GEOFormattedString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormattedString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 40))
    {
      id v5 = [(id)a1 formatStrings];
      if (a2) {
        objc_super v6 = @"formatString";
      }
      else {
        objc_super v6 = @"format_string";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v48 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"formatArgument";
      }
      else {
        v15 = @"format_argument";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if (*(void *)(a1 + 64))
    {
      v16 = [(id)a1 separators];
      [v4 setObject:v16 forKey:@"separator"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"formatStyle";
      }
      else {
        v25 = @"format_style";
      }
      [v4 setObject:v17 forKey:v25];
    }
    v26 = [(id)a1 alternativeString];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"alternativeString";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"alternative_string";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = [(id)a1 metaData];
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"metaData";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"meta_data";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = *(void **)(a1 + 16);
    if (v34)
    {
      v35 = [v34 dictionaryRepresentation];
      v36 = v35;
      if (a2)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __48__GEOFormattedString__dictionaryRepresentation___block_invoke;
        v41[3] = &unk_1E53D8860;
        id v38 = v37;
        id v42 = v38;
        [v36 enumerateKeysAndObjectsUsingBlock:v41];
        id v39 = v38;

        v36 = v39;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
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
  return -[GEOFormattedString _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOFormattedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOFormattedString)initWithDictionary:(id)a3
{
  return (GEOFormattedString *)-[GEOFormattedString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"formatString";
      }
      else {
        objc_super v6 = @"format_string";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v76 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v70 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = (void *)[v13 copy];
                [a1 addFormatString:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v69 objects:v76 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v15 = @"formatArgument";
      }
      else {
        v15 = @"format_argument";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      id v56 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v66;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v66 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v65 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEOFormatArgument alloc];
                if (a3) {
                  uint64_t v24 = [(GEOFormatArgument *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEOFormatArgument *)v23 initWithDictionary:v22];
                }
                v25 = (void *)v24;
                [a1 addFormatArgument:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v65 objects:v75 count:16];
          }
          while (v19);
        }

        id v5 = v56;
      }

      v26 = [v5 objectForKeyedSubscript:@"separator"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v62;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v62 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v61 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = (void *)[v32 copy];
                [a1 addSeparator:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v61 objects:v74 count:16];
          }
          while (v29);
        }

        id v5 = v56;
      }

      if (a3) {
        v34 = @"formatStyle";
      }
      else {
        v34 = @"format_style";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v73 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v58;
          do
          {
            for (uint64_t m = 0; m != v38; ++m)
            {
              if (*(void *)v58 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v42 = [GEOFormatStyle alloc];
                if (a3) {
                  uint64_t v43 = [(GEOFormatStyle *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOFormatStyle *)v42 initWithDictionary:v41];
                }
                long long v44 = (void *)v43;
                [a1 addFormatStyle:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v57 objects:v73 count:16];
          }
          while (v38);
        }

        id v5 = v56;
      }

      if (a3) {
        long long v45 = @"alternativeString";
      }
      else {
        long long v45 = @"alternative_string";
      }
      long long v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = [GEOConditionalFormattedString alloc];
        if (a3) {
          uint64_t v48 = [(GEOConditionalFormattedString *)v47 initWithJSON:v46];
        }
        else {
          uint64_t v48 = [(GEOConditionalFormattedString *)v47 initWithDictionary:v46];
        }
        long long v49 = (void *)v48;
        [a1 setAlternativeString:v48];
      }
      if (a3) {
        long long v50 = @"metaData";
      }
      else {
        long long v50 = @"meta_data";
      }
      v51 = [v5 objectForKeyedSubscript:v50];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v52 = [GEOFormattedStringMetaData alloc];
        if (a3) {
          uint64_t v53 = [(GEOFormattedStringMetaData *)v52 initWithJSON:v51];
        }
        else {
          uint64_t v53 = [(GEOFormattedStringMetaData *)v52 initWithDictionary:v51];
        }
        v54 = (void *)v53;
        [a1 setMetaData:v53];
      }
    }
  }

  return a1;
}

- (GEOFormattedString)initWithJSON:(id)a3
{
  return (GEOFormattedString *)-[GEOFormattedString _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_2600;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2601;
    }
    GEOFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOFormattedStringCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormattedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormattedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOFormattedStringIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v22 = self->_reader;
    objc_sync_enter(v22);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOFormattedString *)self readAll:0];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    objc_super v6 = self->_formatStrings;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v37;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = self->_formatArguments;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v14 = self->_separators;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v18 = self->_formatStyles;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v19);
    }

    if (self->_alternativeString) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_metaData) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v21 = (id *)a3;
  [(GEOFormattedString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 18) = self->_readerMarkPos;
  *((_DWORD *)v21 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOFormattedString *)self formatStringsCount])
  {
    [v21 clearFormatStrings];
    unint64_t v4 = [(GEOFormattedString *)self formatStringsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOFormattedString *)self formatStringAtIndex:i];
        [v21 addFormatString:v7];
      }
    }
  }
  if ([(GEOFormattedString *)self formatArgumentsCount])
  {
    [v21 clearFormatArguments];
    unint64_t v8 = [(GEOFormattedString *)self formatArgumentsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOFormattedString *)self formatArgumentAtIndex:j];
        [v21 addFormatArgument:v11];
      }
    }
  }
  if ([(GEOFormattedString *)self separatorsCount])
  {
    [v21 clearSeparators];
    unint64_t v12 = [(GEOFormattedString *)self separatorsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOFormattedString *)self separatorAtIndex:k];
        [v21 addSeparator:v15];
      }
    }
  }
  if ([(GEOFormattedString *)self formatStylesCount])
  {
    [v21 clearFormatStyles];
    unint64_t v16 = [(GEOFormattedString *)self formatStylesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOFormattedString *)self formatStyleAtIndex:m];
        [v21 addFormatStyle:v19];
      }
    }
  }
  if (self->_alternativeString) {
    objc_msgSend(v21, "setAlternativeString:");
  }
  uint64_t v20 = v21;
  if (self->_metaData)
  {
    objc_msgSend(v21, "setMetaData:");
    uint64_t v20 = v21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOFormattedStringReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOFormattedString *)self readAll:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v8 = self->_formatStrings;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v5 addFormatString:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v13 = self->_formatArguments;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addFormatArgument:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v18 = self->_separators;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v21) copyWithZone:a3];
        [(id)v5 addSeparator:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v19);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v23 = self->_formatStyles;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (void)v33);
        [(id)v5 addFormatStyle:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v24);
  }

  id v28 = [(GEOConditionalFormattedString *)self->_alternativeString copyWithZone:a3];
  long long v29 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v28;

  id v30 = [(GEOFormattedStringMetaData *)self->_metaData copyWithZone:a3];
  long long v31 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v30;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOFormattedString *)self readAll:1],
         [v4 readAll:1],
         formatStrings = self->_formatStrings,
         !((unint64_t)formatStrings | v4[5]))
     || -[NSMutableArray isEqual:](formatStrings, "isEqual:"))
    && ((formatArguments = self->_formatArguments, !((unint64_t)formatArguments | v4[4]))
     || -[NSMutableArray isEqual:](formatArguments, "isEqual:"))
    && ((separators = self->_separators, !((unint64_t)separators | v4[8]))
     || -[NSMutableArray isEqual:](separators, "isEqual:"))
    && ((formatStyles = self->_formatStyles, !((unint64_t)formatStyles | v4[6]))
     || -[NSMutableArray isEqual:](formatStyles, "isEqual:"))
    && ((alternativeString = self->_alternativeString, !((unint64_t)alternativeString | v4[3]))
     || -[GEOConditionalFormattedString isEqual:](alternativeString, "isEqual:")))
  {
    metaData = self->_metaData;
    if ((unint64_t)metaData | v4[7]) {
      char v11 = -[GEOFormattedStringMetaData isEqual:](metaData, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOFormattedString *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_formatStrings hash];
  uint64_t v4 = [(NSMutableArray *)self->_formatArguments hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_separators hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_formatStyles hash];
  unint64_t v7 = [(GEOConditionalFormattedString *)self->_alternativeString hash];
  return v6 ^ v7 ^ [(GEOFormattedStringMetaData *)self->_metaData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v4[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOFormattedString *)self addFormatString:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOFormattedString *)self addFormatArgument:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v4[8];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOFormattedString *)self addSeparator:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v4[6];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        -[GEOFormattedString addFormatStyle:](self, "addFormatStyle:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v22);
  }

  alternativeString = self->_alternativeString;
  id v26 = v4[3];
  if (alternativeString)
  {
    if (v26) {
      -[GEOConditionalFormattedString mergeFrom:](alternativeString, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOFormattedString setAlternativeString:](self, "setAlternativeString:");
  }
  metaData = self->_metaData;
  id v28 = v4[7];
  if (metaData)
  {
    if (v28) {
      -[GEOFormattedStringMetaData mergeFrom:](metaData, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOFormattedString setMetaData:](self, "setMetaData:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2605);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOFormattedString *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_formatArguments;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_formatStyles;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(GEOConditionalFormattedString *)self->_alternativeString clearUnknownFields:1];
    [(GEOFormattedStringMetaData *)self->_metaData clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_formatStyles, 0);
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_formatArguments, 0);
  objc_storeStrong((id *)&self->_alternativeString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOFormattedString)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOFormattedString;
  id v5 = [(GEOFormattedString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 copy];
    [(GEOFormattedString *)v5 addFormatString:v6];

    uint64_t v7 = v5;
  }

  return v5;
}

- (NSString)basicString
{
  BOOL v3 = [(GEOFormattedString *)self formatArguments];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [(GEOFormattedString *)self formatStrings];
    id v5 = [v6 firstObject];
  }

  return (NSString *)v5;
}

- (GEOFormattedString)stringWithDefaultValues
{
  v2 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(GEOFormattedString *)self formatArguments];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(GEOFormattedString *)v2 formatStrings];
    id v28 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = [(GEOFormattedString *)v2 formatStrings];
    uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v40;
      long long v30 = v2;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v8 length])
          {
            uint64_t v33 = i;
            objc_super v9 = (void *)[v8 mutableCopy];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v34 = [(GEOFormattedString *)v2 formatArguments];
            uint64_t v10 = [v34 countByEnumeratingWithState:&v35 objects:v45 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v36 != v12) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  uint64_t v15 = [v14 stringWithDefaultValues];
                  uint64_t v16 = [v14 token];
                  if (v16)
                  {
                    uint64_t v17 = [v9 rangeOfString:v16];
                    if (v17 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0)
                    {
                      uint64_t v20 = v17;
                      do
                      {
                        if (v15)
                        {
                          objc_msgSend(v9, "replaceCharactersInRange:withString:", v20, v18, v15);
                        }
                        else
                        {
                          objc_msgSend(v9, "deleteCharactersInRange:", v20, v18);
                          long long v21 = GEOGetGEOFormattedStringLog();
                          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138477827;
                            long long v44 = v14;
                            _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Error formatting argument %{private}@", buf, 0xCu);
                          }
                        }
                        uint64_t v22 = [v9 rangeOfString:v16];
                        if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
                          break;
                        }
                        uint64_t v20 = v22;
                      }
                      while (v18);
                    }
                  }
                  else
                  {
                    long long v23 = GEOGetGEOFormattedStringLog();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      long long v44 = v14;
                      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Format argument %{private}@ has no token", buf, 0xCu);
                    }
                  }
                }
                uint64_t v11 = [v34 countByEnumeratingWithState:&v35 objects:v45 count:16];
              }
              while (v11);
            }

            if ([v9 length]) {
              [v28 addObject:v9];
            }

            v2 = v30;
            uint64_t i = v33;
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v32);
    }

    long long v24 = v28;
    uint64_t v25 = [(GEOFormattedString *)v2 _joinFormattedComponentsWithSeparators:v28];
  }
  else
  {
    long long v24 = [(GEOFormattedString *)v2 formatStrings];
    uint64_t v25 = [v24 firstObject];
  }
  id v26 = (void *)v25;

  return (GEOFormattedString *)v26;
}

- (id)_joinFormattedComponentsWithSeparators:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v4 count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v4 objectAtIndexedSubscript:v6];
      [v5 appendString:v7];
      if (v6 < [v4 count] - 1)
      {
        uint64_t v8 = [(GEOFormattedString *)self separators];
        if (v6 >= [v8 count]) {
          goto LABEL_7;
        }
        objc_super v9 = [(GEOFormattedString *)self separators];
        uint64_t v10 = [v9 objectAtIndexedSubscript:v6];

        if (v10) {
          break;
        }
      }
LABEL_8:

      if (++v6 >= [v4 count]) {
        goto LABEL_9;
      }
    }
    [v5 appendString:v10];
    uint64_t v8 = (void *)v10;
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (BOOL)isPrivate
{
  if (![(GEOFormattedString *)self hasMetaData]) {
    return 1;
  }
  BOOL v3 = [(GEOFormattedString *)self metaData];
  BOOL v4 = [v3 spokenPrivacyFilterType] != 1;

  return v4;
}

@end