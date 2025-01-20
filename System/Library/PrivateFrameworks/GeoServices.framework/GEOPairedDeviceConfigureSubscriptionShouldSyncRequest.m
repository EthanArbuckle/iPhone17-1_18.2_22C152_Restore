@interface GEOPairedDeviceConfigureSubscriptionShouldSyncRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasShouldSyncToPairedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSyncToPairedDevice;
- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)initWithDictionary:(id)a3;
- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)initWithJSON:(id)a3;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldSyncToPairedDevice:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setShouldSyncToPairedDevice:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceConfigureSubscriptionShouldSyncRequest

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)shouldSyncToPairedDevice
{
  return self->_shouldSyncToPairedDevice;
}

- (void)setShouldSyncToPairedDevice:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_shouldSyncToPairedDevice = a3;
}

- (void)setHasShouldSyncToPairedDevice:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasShouldSyncToPairedDevice
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceConfigureSubscriptionShouldSyncRequest;
  v4 = [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)&v8 description];
  v5 = [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    if (*(unsigned char *)(a1 + 28))
    {
      v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        v7 = @"shouldSyncToPairedDevice";
      }
      else {
        v7 = @"should_sync_to_paired_device";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __83__GEOPairedDeviceConfigureSubscriptionShouldSyncRequest__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __83__GEOPairedDeviceConfigureSubscriptionShouldSyncRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)-[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      if (a3) {
        objc_super v8 = @"shouldSyncToPairedDevice";
      }
      else {
        objc_super v8 = @"should_sync_to_paired_device";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldSyncToPairedDevice:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)initWithJSON:(id)a3
{
  return (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)-[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceConfigureSubscriptionShouldSyncRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceConfigureSubscriptionShouldSyncRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self readAll:0];
  if (self->_identifier) {
    objc_msgSend(v4, "setIdentifier:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[24] = self->_shouldSyncToPairedDevice;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 24) = self->_shouldSyncToPairedDevice;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_shouldSyncToPairedDevice)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_shouldSyncToPairedDevice;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 2)) {
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest setIdentifier:](self, "setIdentifier:");
  }
  if (v4[28])
  {
    self->_shouldSyncToPairedDevice = v4[24];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end