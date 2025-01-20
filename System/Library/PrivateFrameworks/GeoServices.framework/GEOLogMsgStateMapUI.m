@interface GEOLogMsgStateMapUI
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLandscape;
- (BOOL)hasLayoutInfo;
- (BOOL)hasLayoutStyle;
- (BOOL)hasMultiTabsState;
- (BOOL)hasNumberOfMapsWindows;
- (BOOL)hasWindowSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)landscape;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMapUI)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapUI)initWithJSON:(id)a3;
- (GEOMultiTabsState)multiTabsState;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layoutInfoAsString:(int)a3;
- (id)layoutStyleAsString:(int)a3;
- (id)windowSizeAsString:(int)a3;
- (int)StringAsLayoutInfo:(id)a3;
- (int)StringAsLayoutStyle:(id)a3;
- (int)StringAsWindowSize:(id)a3;
- (int)layoutInfo;
- (int)layoutStyle;
- (int)windowSize;
- (unint64_t)hash;
- (unsigned)numberOfMapsWindows;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLandscape:(BOOL)a3;
- (void)setHasLayoutInfo:(BOOL)a3;
- (void)setHasLayoutStyle:(BOOL)a3;
- (void)setHasNumberOfMapsWindows:(BOOL)a3;
- (void)setHasWindowSize:(BOOL)a3;
- (void)setLandscape:(BOOL)a3;
- (void)setLayoutInfo:(int)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setMultiTabsState:(id)a3;
- (void)setNumberOfMapsWindows:(unsigned int)a3;
- (void)setWindowSize:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapUI

- (void).cxx_destruct
{
}

- (void)setWindowSize:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_windowSize = a3;
}

- (void)setNumberOfMapsWindows:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_numberOfMapsWindows = a3;
}

- (void)setLayoutStyle:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_layoutStyle = a3;
}

- (void)setLayoutInfo:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_layoutInfo = a3;
}

- (void)setLandscape:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_landscape = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_multiTabsState) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
}

- (int)layoutInfo
{
  if (*(unsigned char *)&self->_flags) {
    return self->_layoutInfo;
  }
  else {
    return 0;
  }
}

- (void)setHasLayoutInfo:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLayoutInfo
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)layoutInfoAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8BF8[a3];
  }

  return v3;
}

- (int)StringAsLayoutInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LAYOUT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MINI_LAYOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTIAL_LAYOUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FULL_LAYOUT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasMultiTabsState
{
  return self->_multiTabsState != 0;
}

- (GEOMultiTabsState)multiTabsState
{
  return self->_multiTabsState;
}

- (void)setMultiTabsState:(id)a3
{
}

- (int)layoutStyle
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_layoutStyle;
  }
  else {
    return 0;
  }
}

- (void)setHasLayoutStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLayoutStyle
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)layoutStyleAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8C18[a3];
  }

  return v3;
}

- (int)StringAsLayoutStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STYLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STANDARD_STYLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPACT_STYLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SIDE_BAR_STYLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FLOATING_STYLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STANDARD_SIDE_STYLE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)landscape
{
  return self->_landscape;
}

- (void)setHasLandscape:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLandscape
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfMapsWindows
{
  return self->_numberOfMapsWindows;
}

- (void)setHasNumberOfMapsWindows:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberOfMapsWindows
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)windowSize
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_windowSize;
  }
  else {
    return 1;
  }
}

- (void)setHasWindowSize:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWindowSize
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)windowSizeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7FF8[a3 - 1];
  }

  return v3;
}

- (int)StringAsWindowSize:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FULL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODERATE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SMALL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapUI;
  int v4 = [(GEOLogMsgStateMapUI *)&v8 description];
  id v5 = [(GEOLogMsgStateMapUI *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapUI _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_39;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 36))
  {
    uint64_t v5 = *(int *)(a1 + 16);
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53F8BF8[v5];
    }
    if (a2) {
      v7 = @"layoutInfo";
    }
    else {
      v7 = @"layout_info";
    }
    [v4 setObject:v6 forKey:v7];
  }
  objc_super v8 = [(id)a1 multiTabsState];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"multiTabsState";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"multi_tabs_state";
    }
    [v4 setObject:v10 forKey:v11];
  }
  char v12 = *(unsigned char *)(a1 + 36);
  if ((v12 & 2) != 0)
  {
    uint64_t v13 = *(int *)(a1 + 20);
    if (v13 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53F8C18[v13];
    }
    if (a2) {
      v15 = @"layoutStyle";
    }
    else {
      v15 = @"layout_style";
    }
    [v4 setObject:v14 forKey:v15];

    char v12 = *(unsigned char *)(a1 + 36);
  }
  if ((v12 & 0x10) == 0)
  {
    if ((v12 & 4) == 0) {
      goto LABEL_25;
    }
LABEL_28:
    v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v18 = @"numberOfMapsWindows";
    }
    else {
      v18 = @"number_of_maps_windows";
    }
    [v4 setObject:v17 forKey:v18];

    if ((*(unsigned char *)(a1 + 36) & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_32;
  }
  v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v4 setObject:v16 forKey:@"landscape"];

  char v12 = *(unsigned char *)(a1 + 36);
  if ((v12 & 4) != 0) {
    goto LABEL_28;
  }
LABEL_25:
  if ((v12 & 8) != 0)
  {
LABEL_32:
    unsigned int v19 = *(_DWORD *)(a1 + 28) - 1;
    if (v19 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E53F7FF8[v19];
    }
    if (a2) {
      v21 = @"windowSize";
    }
    else {
      v21 = @"window_size";
    }
    [v4 setObject:v20 forKey:v21];
  }
LABEL_39:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapUI _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapUI)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapUI *)-[GEOLogMsgStateMapUI _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"layoutInfo";
      }
      else {
        v6 = @"layout_info";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"UNKNOWN_LAYOUT"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"MINI_LAYOUT"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"PARTIAL_LAYOUT"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"FULL_LAYOUT"])
        {
          uint64_t v9 = 3;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setLayoutInfo:v9];
LABEL_20:

      if (a3) {
        v10 = @"multiTabsState";
      }
      else {
        v10 = @"multi_tabs_state";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v12 = [GEOMultiTabsState alloc];
        if (a3) {
          uint64_t v13 = [(GEOMultiTabsState *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOMultiTabsState *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setMultiTabsState:v13];
      }
      if (a3) {
        v15 = @"layoutStyle";
      }
      else {
        v15 = @"layout_style";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if ([v17 isEqualToString:@"UNKNOWN_STYLE"])
        {
          uint64_t v18 = 0;
        }
        else if ([v17 isEqualToString:@"STANDARD_STYLE"])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:@"COMPACT_STYLE"])
        {
          uint64_t v18 = 2;
        }
        else if ([v17 isEqualToString:@"SIDE_BAR_STYLE"])
        {
          uint64_t v18 = 3;
        }
        else if ([v17 isEqualToString:@"FLOATING_STYLE"])
        {
          uint64_t v18 = 4;
        }
        else if ([v17 isEqualToString:@"STANDARD_SIDE_STYLE"])
        {
          uint64_t v18 = 5;
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_49;
        }
        uint64_t v18 = [v16 intValue];
      }
      [a1 setLayoutStyle:v18];
LABEL_49:

      unsigned int v19 = [v5 objectForKeyedSubscript:@"landscape"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLandscape:", objc_msgSend(v19, "BOOLValue"));
      }

      if (a3) {
        v20 = @"numberOfMapsWindows";
      }
      else {
        v20 = @"number_of_maps_windows";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfMapsWindows:", objc_msgSend(v21, "unsignedIntValue"));
      }

      if (a3) {
        v22 = @"windowSize";
      }
      else {
        v22 = @"window_size";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        if ([v24 isEqualToString:@"FULL"])
        {
          uint64_t v25 = 1;
        }
        else if ([v24 isEqualToString:@"DEFAULT"])
        {
          uint64_t v25 = 2;
        }
        else if ([v24 isEqualToString:@"MODERATE"])
        {
          uint64_t v25 = 3;
        }
        else if ([v24 isEqualToString:@"SMALL"])
        {
          uint64_t v25 = 4;
        }
        else
        {
          uint64_t v25 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_73:

          goto LABEL_74;
        }
        uint64_t v25 = [v23 intValue];
      }
      [a1 setWindowSize:v25];
      goto LABEL_73;
    }
  }
LABEL_74:

  return a1;
}

- (GEOLogMsgStateMapUI)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapUI *)-[GEOLogMsgStateMapUI _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapUIIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapUIReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  v6 = a3;
  [(GEOLogMsgStateMapUI *)self readAll:0];
  int v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
    v6[4] = self->_layoutInfo;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  if (self->_multiTabsState)
  {
    objc_msgSend(v6, "setMultiTabsState:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[5] = self->_layoutStyle;
    *((unsigned char *)v4 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 32) = self->_landscape;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v4[6] = self->_numberOfMapsWindows;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_9:
    v4[7] = self->_windowSize;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_layoutInfo;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v7 = [(GEOMultiTabsState *)self->_multiTabsState copyWithZone:a3];
  id v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_layoutStyle;
    *(unsigned char *)(v6 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 24) = self->_numberOfMapsWindows;
      *(unsigned char *)(v6 + 36) |= 4u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 32) = self->_landscape;
  *(unsigned char *)(v6 + 36) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 28) = self->_windowSize;
    *(unsigned char *)(v6 + 36) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  [(GEOLogMsgStateMapUI *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_layoutInfo != *((_DWORD *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_32;
  }
  multiTabsState = self->_multiTabsState;
  if ((unint64_t)multiTabsState | *((void *)v4 + 1))
  {
    if (!-[GEOMultiTabsState isEqual:](multiTabsState, "isEqual:")) {
      goto LABEL_32;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_layoutStyle != *((_DWORD *)v4 + 5)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_landscape)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_32;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_23;
      }
    }
LABEL_32:
    BOOL v8 = 0;
    goto LABEL_33;
  }
  if ((v6 & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_23:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfMapsWindows != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  BOOL v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_windowSize != *((_DWORD *)v4 + 7)) {
      goto LABEL_32;
    }
    BOOL v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapUI *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_layoutInfo;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOMultiTabsState *)self->_multiTabsState hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_layoutStyle;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_landscape;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_numberOfMapsWindows;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_windowSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = (int *)a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  if (v8[9])
  {
    self->_layoutInfo = v8[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  multiTabsState = self->_multiTabsState;
  uint64_t v6 = *((void *)v8 + 1);
  if (multiTabsState)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMultiTabsState mergeFrom:](multiTabsState, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgStateMapUI setMultiTabsState:](self, "setMultiTabsState:");
  }
  unint64_t v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 36);
  if ((v7 & 2) != 0)
  {
    self->_layoutStyle = v4[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v4 + 36);
    if ((v7 & 0x10) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((v4[9] & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_landscape = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v7 = *((unsigned char *)v4 + 36);
  if ((v7 & 4) == 0)
  {
LABEL_12:
    if ((v7 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  self->_numberOfMapsWindows = v4[6];
  *(unsigned char *)&self->_flags |= 4u;
  if ((v4[9] & 8) != 0)
  {
LABEL_13:
    self->_windowSize = v4[7];
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_14:
}

@end