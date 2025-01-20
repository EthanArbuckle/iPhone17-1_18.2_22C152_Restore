@interface BCSChatSuggestMessage
+ (Class)callToActionsType;
+ (Class)chatOpenHoursType;
+ (Class)phoneOpenHoursType;
+ (Class)visibilitiesType;
- (BOOL)hasBackgroundColor;
- (BOOL)hasBizId;
- (BOOL)hasGroup;
- (BOOL)hasIntentId;
- (BOOL)hasIsVerified;
- (BOOL)hasName;
- (BOOL)hasPhoneHash;
- (BOOL)hasSquareLogoUrl;
- (BOOL)hasTimeZone;
- (BOOL)hasTintColor;
- (BOOL)hasWideLogoUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerified;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)callToActions;
- (NSMutableArray)chatOpenHours;
- (NSMutableArray)phoneOpenHours;
- (NSMutableArray)visibilities;
- (NSString)backgroundColor;
- (NSString)bizId;
- (NSString)group;
- (NSString)intentId;
- (NSString)name;
- (NSString)squareLogoUrl;
- (NSString)timeZone;
- (NSString)tintColor;
- (NSString)wideLogoUrl;
- (id)callToActionsAtIndex:(unint64_t)a3;
- (id)chatOpenHoursAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)phoneOpenHoursAtIndex:(unint64_t)a3;
- (id)visibilitiesAtIndex:(unint64_t)a3;
- (int64_t)phoneHash;
- (unint64_t)callToActionsCount;
- (unint64_t)chatOpenHoursCount;
- (unint64_t)hash;
- (unint64_t)phoneOpenHoursCount;
- (unint64_t)visibilitiesCount;
- (void)addCallToActions:(id)a3;
- (void)addChatOpenHours:(id)a3;
- (void)addPhoneOpenHours:(id)a3;
- (void)addVisibilities:(id)a3;
- (void)clearCallToActions;
- (void)clearChatOpenHours;
- (void)clearPhoneOpenHours;
- (void)clearVisibilities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBizId:(id)a3;
- (void)setCallToActions:(id)a3;
- (void)setChatOpenHours:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHasIsVerified:(BOOL)a3;
- (void)setHasPhoneHash:(BOOL)a3;
- (void)setIntentId:(id)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPhoneHash:(int64_t)a3;
- (void)setPhoneOpenHours:(id)a3;
- (void)setSquareLogoUrl:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setVisibilities:(id)a3;
- (void)setWideLogoUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSChatSuggestMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBizId
{
  return self->_bizId != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearChatOpenHours
{
}

- (void)addChatOpenHours:(id)a3
{
  id v4 = a3;
  chatOpenHours = self->_chatOpenHours;
  id v8 = v4;
  if (!chatOpenHours)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_chatOpenHours;
    self->_chatOpenHours = v6;

    id v4 = v8;
    chatOpenHours = self->_chatOpenHours;
  }
  [(NSMutableArray *)chatOpenHours addObject:v4];
}

- (unint64_t)chatOpenHoursCount
{
  return [(NSMutableArray *)self->_chatOpenHours count];
}

- (id)chatOpenHoursAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chatOpenHours objectAtIndex:a3];
}

+ (Class)chatOpenHoursType
{
  return (Class)objc_opt_class();
}

- (void)clearPhoneOpenHours
{
}

- (void)addPhoneOpenHours:(id)a3
{
  id v4 = a3;
  phoneOpenHours = self->_phoneOpenHours;
  id v8 = v4;
  if (!phoneOpenHours)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_phoneOpenHours;
    self->_phoneOpenHours = v6;

    id v4 = v8;
    phoneOpenHours = self->_phoneOpenHours;
  }
  [(NSMutableArray *)phoneOpenHours addObject:v4];
}

- (unint64_t)phoneOpenHoursCount
{
  return [(NSMutableArray *)self->_phoneOpenHours count];
}

- (id)phoneOpenHoursAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_phoneOpenHours objectAtIndex:a3];
}

+ (Class)phoneOpenHoursType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTimeZone
{
  return self->_timeZone != 0;
}

- (BOOL)hasSquareLogoUrl
{
  return self->_squareLogoUrl != 0;
}

- (BOOL)hasWideLogoUrl
{
  return self->_wideLogoUrl != 0;
}

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (BOOL)hasTintColor
{
  return self->_tintColor != 0;
}

- (void)setIsVerified:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearCallToActions
{
}

- (void)addCallToActions:(id)a3
{
  id v4 = a3;
  callToActions = self->_callToActions;
  id v8 = v4;
  if (!callToActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_callToActions;
    self->_callToActions = v6;

    id v4 = v8;
    callToActions = self->_callToActions;
  }
  [(NSMutableArray *)callToActions addObject:v4];
}

- (unint64_t)callToActionsCount
{
  return [(NSMutableArray *)self->_callToActions count];
}

- (id)callToActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_callToActions objectAtIndex:a3];
}

+ (Class)callToActionsType
{
  return (Class)objc_opt_class();
}

- (void)clearVisibilities
{
}

- (void)addVisibilities:(id)a3
{
  id v4 = a3;
  visibilities = self->_visibilities;
  id v8 = v4;
  if (!visibilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_visibilities;
    self->_visibilities = v6;

    id v4 = v8;
    visibilities = self->_visibilities;
  }
  [(NSMutableArray *)visibilities addObject:v4];
}

- (unint64_t)visibilitiesCount
{
  return [(NSMutableArray *)self->_visibilities count];
}

- (id)visibilitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visibilities objectAtIndex:a3];
}

+ (Class)visibilitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSChatSuggestMessage;
  id v4 = [(BCSChatSuggestMessage *)&v8 description];
  v5 = [(BCSChatSuggestMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_phoneHash];
    [v3 setObject:v4 forKey:@"phone_hash"];
  }
  bizId = self->_bizId;
  if (bizId) {
    [v3 setObject:bizId forKey:@"biz_id"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_chatOpenHours count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_chatOpenHours, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    objc_super v8 = self->_chatOpenHours;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v56 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"chat_open_hours"];
  }
  if ([(NSMutableArray *)self->_phoneOpenHours count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_phoneOpenHours, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v15 = self->_phoneOpenHours;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v52 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"phone_open_hours"];
  }
  timeZone = self->_timeZone;
  if (timeZone) {
    [v3 setObject:timeZone forKey:@"time_zone"];
  }
  squareLogoUrl = self->_squareLogoUrl;
  if (squareLogoUrl) {
    [v3 setObject:squareLogoUrl forKey:@"square_logo_url"];
  }
  wideLogoUrl = self->_wideLogoUrl;
  if (wideLogoUrl) {
    [v3 setObject:wideLogoUrl forKey:@"wide_logo_url"];
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    [v3 setObject:backgroundColor forKey:@"background_color"];
  }
  tintColor = self->_tintColor;
  if (tintColor) {
    [v3 setObject:tintColor forKey:@"tint_color"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_isVerified];
    [v3 setObject:v26 forKey:@"is_verified"];
  }
  if ([(NSMutableArray *)self->_callToActions count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_callToActions, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v28 = self->_callToActions;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v48 + 1) + 8 * k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"call_to_actions"];
  }
  if ([(NSMutableArray *)self->_visibilities count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_visibilities, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v35 = self->_visibilities;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v45;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v45 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * m), "dictionaryRepresentation", (void)v44);
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKey:@"visibilities"];
  }
  intentId = self->_intentId;
  if (intentId) {
    [v3 setObject:intentId forKey:@"intent_id"];
  }
  group = self->_group;
  if (group) {
    [v3 setObject:group forKey:@"group"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BCSChatSuggestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_bizId) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_chatOpenHours;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_phoneOpenHours;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  if (self->_timeZone) {
    PBDataWriterWriteStringField();
  }
  if (self->_squareLogoUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_wideLogoUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_backgroundColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_tintColor) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_callToActions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_visibilities;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if (self->_intentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_group) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_phoneHash;
    *((unsigned char *)v4 + 124) |= 1u;
  }
  uint64_t v22 = v4;
  if (self->_bizId) {
    objc_msgSend(v4, "setBizId:");
  }
  if (self->_name) {
    objc_msgSend(v22, "setName:");
  }
  if ([(BCSChatSuggestMessage *)self chatOpenHoursCount])
  {
    [v22 clearChatOpenHours];
    unint64_t v5 = [(BCSChatSuggestMessage *)self chatOpenHoursCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BCSChatSuggestMessage *)self chatOpenHoursAtIndex:i];
        [v22 addChatOpenHours:v8];
      }
    }
  }
  if ([(BCSChatSuggestMessage *)self phoneOpenHoursCount])
  {
    [v22 clearPhoneOpenHours];
    unint64_t v9 = [(BCSChatSuggestMessage *)self phoneOpenHoursCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BCSChatSuggestMessage *)self phoneOpenHoursAtIndex:j];
        [v22 addPhoneOpenHours:v12];
      }
    }
  }
  if (self->_timeZone) {
    objc_msgSend(v22, "setTimeZone:");
  }
  if (self->_squareLogoUrl) {
    objc_msgSend(v22, "setSquareLogoUrl:");
  }
  if (self->_wideLogoUrl) {
    objc_msgSend(v22, "setWideLogoUrl:");
  }
  if (self->_backgroundColor) {
    objc_msgSend(v22, "setBackgroundColor:");
  }
  if (self->_tintColor) {
    objc_msgSend(v22, "setTintColor:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v22[120] = self->_isVerified;
    v22[124] |= 2u;
  }
  if ([(BCSChatSuggestMessage *)self callToActionsCount])
  {
    [v22 clearCallToActions];
    unint64_t v13 = [(BCSChatSuggestMessage *)self callToActionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(BCSChatSuggestMessage *)self callToActionsAtIndex:k];
        [v22 addCallToActions:v16];
      }
    }
  }
  if ([(BCSChatSuggestMessage *)self visibilitiesCount])
  {
    [v22 clearVisibilities];
    unint64_t v17 = [(BCSChatSuggestMessage *)self visibilitiesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(BCSChatSuggestMessage *)self visibilitiesAtIndex:m];
        [v22 addVisibilities:v20];
      }
    }
  }
  if (self->_intentId) {
    objc_msgSend(v22, "setIntentId:");
  }
  uint64_t v21 = v22;
  if (self->_group)
  {
    objc_msgSend(v22, "setGroup:");
    uint64_t v21 = v22;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_phoneHash;
    *(unsigned char *)(v5 + 124) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_bizId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v9;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v11 = self->_chatOpenHours;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChatOpenHours:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v13);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  unint64_t v17 = self->_phoneOpenHours;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addPhoneOpenHours:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_timeZone copyWithZone:a3];
  uint64_t v24 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v23;

  uint64_t v25 = [(NSString *)self->_squareLogoUrl copyWithZone:a3];
  long long v26 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v25;

  uint64_t v27 = [(NSString *)self->_wideLogoUrl copyWithZone:a3];
  long long v28 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v27;

  uint64_t v29 = [(NSString *)self->_backgroundColor copyWithZone:a3];
  long long v30 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v29;

  uint64_t v31 = [(NSString *)self->_tintColor copyWithZone:a3];
  long long v32 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v31;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 120) = self->_isVerified;
    *(unsigned char *)(v6 + 124) |= 2u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v33 = self->_callToActions;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addCallToActions:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v35);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v39 = self->_visibilities;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * m), "copyWithZone:", a3, (void)v50);
        [(id)v6 addVisibilities:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v41);
  }

  uint64_t v45 = [(NSString *)self->_intentId copyWithZone:a3];
  long long v46 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v45;

  uint64_t v47 = [(NSString *)self->_group copyWithZone:a3];
  long long v48 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v47;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 124) & 1) == 0 || self->_phoneHash != *((void *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 124))
  {
    goto LABEL_41;
  }
  bizId = self->_bizId;
  if ((unint64_t)bizId | *((void *)v4 + 3) && !-[NSString isEqual:](bizId, "isEqual:")) {
    goto LABEL_41;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_41;
    }
  }
  chatOpenHours = self->_chatOpenHours;
  if ((unint64_t)chatOpenHours | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](chatOpenHours, "isEqual:")) {
      goto LABEL_41;
    }
  }
  phoneOpenHours = self->_phoneOpenHours;
  if ((unint64_t)phoneOpenHours | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](phoneOpenHours, "isEqual:")) {
      goto LABEL_41;
    }
  }
  timeZone = self->_timeZone;
  if ((unint64_t)timeZone | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](timeZone, "isEqual:")) {
      goto LABEL_41;
    }
  }
  squareLogoUrl = self->_squareLogoUrl;
  if ((unint64_t)squareLogoUrl | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](squareLogoUrl, "isEqual:")) {
      goto LABEL_41;
    }
  }
  wideLogoUrl = self->_wideLogoUrl;
  if ((unint64_t)wideLogoUrl | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](wideLogoUrl, "isEqual:")) {
      goto LABEL_41;
    }
  }
  backgroundColor = self->_backgroundColor;
  if ((unint64_t)backgroundColor | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](backgroundColor, "isEqual:")) {
      goto LABEL_41;
    }
  }
  tintColor = self->_tintColor;
  if ((unint64_t)tintColor | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](tintColor, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((unsigned char *)v4 + 120)) {
          goto LABEL_41;
        }
        goto LABEL_33;
      }
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_33;
      }
    }
LABEL_41:
    char v18 = 0;
    goto LABEL_42;
  }
  if ((*((unsigned char *)v4 + 124) & 2) != 0) {
    goto LABEL_41;
  }
LABEL_33:
  callToActions = self->_callToActions;
  if ((unint64_t)callToActions | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](callToActions, "isEqual:"))
  {
    goto LABEL_41;
  }
  visibilities = self->_visibilities;
  if ((unint64_t)visibilities | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](visibilities, "isEqual:")) {
      goto LABEL_41;
    }
  }
  intentId = self->_intentId;
  if ((unint64_t)intentId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](intentId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  group = self->_group;
  if ((unint64_t)group | *((void *)v4 + 6)) {
    char v18 = -[NSString isEqual:](group, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_42:

  return v18;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v18 = 2654435761 * self->_phoneHash;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_bizId hash];
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSMutableArray *)self->_chatOpenHours hash];
  uint64_t v5 = [(NSMutableArray *)self->_phoneOpenHours hash];
  NSUInteger v6 = [(NSString *)self->_timeZone hash];
  NSUInteger v7 = [(NSString *)self->_squareLogoUrl hash];
  NSUInteger v8 = [(NSString *)self->_wideLogoUrl hash];
  NSUInteger v9 = [(NSString *)self->_backgroundColor hash];
  NSUInteger v10 = [(NSString *)self->_tintColor hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_isVerified;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v17 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v13 = [(NSMutableArray *)self->_callToActions hash];
  uint64_t v14 = v13 ^ [(NSMutableArray *)self->_visibilities hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_intentId hash];
  return v12 ^ v15 ^ [(NSString *)self->_group hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 124))
  {
    self->_phoneHash = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3]) {
    -[BCSChatSuggestMessage setBizId:](self, "setBizId:");
  }
  if (*((void *)v5 + 8)) {
    -[BCSChatSuggestMessage setName:](self, "setName:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = *((id *)v5 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BCSChatSuggestMessage *)self addChatOpenHours:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = *((id *)v5 + 9);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [(BCSChatSuggestMessage *)self addPhoneOpenHours:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  if (*((void *)v5 + 11)) {
    -[BCSChatSuggestMessage setTimeZone:](self, "setTimeZone:");
  }
  if (*((void *)v5 + 10)) {
    -[BCSChatSuggestMessage setSquareLogoUrl:](self, "setSquareLogoUrl:");
  }
  if (*((void *)v5 + 14)) {
    -[BCSChatSuggestMessage setWideLogoUrl:](self, "setWideLogoUrl:");
  }
  if (*((void *)v5 + 2)) {
    -[BCSChatSuggestMessage setBackgroundColor:](self, "setBackgroundColor:");
  }
  if (*((void *)v5 + 12)) {
    -[BCSChatSuggestMessage setTintColor:](self, "setTintColor:");
  }
  if ((*((unsigned char *)v5 + 124) & 2) != 0)
  {
    self->_isVerified = *((unsigned char *)v5 + 120);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = *((id *)v5 + 4);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(BCSChatSuggestMessage *)self addCallToActions:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v5 + 13);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[BCSChatSuggestMessage addVisibilities:](self, "addVisibilities:", *(void *)(*((void *)&v26 + 1) + 8 * m), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }

  if (*((void *)v5 + 7)) {
    -[BCSChatSuggestMessage setIntentId:](self, "setIntentId:");
  }
  if (*((void *)v5 + 6)) {
    -[BCSChatSuggestMessage setGroup:](self, "setGroup:");
  }
}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)bizId
{
  return self->_bizId;
}

- (void)setBizId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)chatOpenHours
{
  return self->_chatOpenHours;
}

- (void)setChatOpenHours:(id)a3
{
}

- (NSMutableArray)phoneOpenHours
{
  return self->_phoneOpenHours;
}

- (void)setPhoneOpenHours:(id)a3
{
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)squareLogoUrl
{
  return self->_squareLogoUrl;
}

- (void)setSquareLogoUrl:(id)a3
{
}

- (NSString)wideLogoUrl
{
  return self->_wideLogoUrl;
}

- (void)setWideLogoUrl:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSMutableArray)callToActions
{
  return self->_callToActions;
}

- (void)setCallToActions:(id)a3
{
}

- (NSMutableArray)visibilities
{
  return self->_visibilities;
}

- (void)setVisibilities:(id)a3
{
}

- (NSString)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideLogoUrl, 0);
  objc_storeStrong((id *)&self->_visibilities, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_squareLogoUrl, 0);
  objc_storeStrong((id *)&self->_phoneOpenHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_chatOpenHours, 0);
  objc_storeStrong((id *)&self->_callToActions, 0);
  objc_storeStrong((id *)&self->_bizId, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end