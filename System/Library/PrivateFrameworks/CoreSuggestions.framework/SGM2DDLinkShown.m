@interface SGM2DDLinkShown
- (BOOL)hasInterface;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceAsString:(int)a3;
- (int)StringAsInterface:(id)a3;
- (int)interface;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInterface:(BOOL)a3;
- (void)setInterface:(int)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2DDLinkShown

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[SGM2DDLinkShown setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[6])
  {
    self->_interface = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_interface;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_interface == *((_DWORD *)v4 + 2))
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_interface;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v5 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_interface;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2DDLinkShownReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t interface = self->_interface;
    if (interface >= 0x14)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_interface);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5B8F828[interface];
    }
    [v4 setObject:v7 forKey:@"interface"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2DDLinkShown;
  id v4 = [(SGM2DDLinkShown *)&v8 description];
  id v5 = [(SGM2DDLinkShown *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsInterface:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMNLEventInterfaceSuggestd"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMail"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMailBanner"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMailDDLink"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessages"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessagesBanner"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessagesDDLink"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendar"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarNotification"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarInbox"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarEventDetails"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarCanvas"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarWidget"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarWidgetUpNext"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarZKW"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarAutocomplete"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMaps"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMapsWidget"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceTTLNotification"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceSpotlight"])
  {
    int v4 = 19;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)interfaceAsString:(int)a3
{
  if (a3 >= 0x14)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8F828[a3];
  }

  return v3;
}

- (BOOL)hasInterface
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasInterface:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t interface = a3;
}

- (int)interface
{
  if (*(unsigned char *)&self->_has) {
    return self->_interface;
  }
  else {
    return 0;
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"DDLinkShown";
  }
}

@end