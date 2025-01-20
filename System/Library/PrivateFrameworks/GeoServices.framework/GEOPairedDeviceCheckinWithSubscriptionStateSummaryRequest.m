@interface GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSummarySHA256Hash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithDictionary:(id)a3;
- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithJSON:(id)a3;
- (NSData)summarySHA256Hash;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSummarySHA256Hash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest

- (BOOL)hasSummarySHA256Hash
{
  return self->_summarySHA256Hash != 0;
}

- (NSData)summarySHA256Hash
{
  return self->_summarySHA256Hash;
}

- (void)setSummarySHA256Hash:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest;
  v4 = [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)&v8 description];
  v5 = [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 summarySHA256Hash];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"summarySHA256Hash"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"summarySHA256Hash"];
      }
    }

    objc_super v8 = (void *)a1[1];
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __87__GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest__dictionaryRepresentation___block_invoke;
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
  return -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _dictionaryRepresentation:](self, 1);
}

void __87__GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)-[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"summarySHA256Hash"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
        [a1 setSummarySHA256Hash:v5];
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithJSON:(id)a3
{
  return (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)-[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_summarySHA256Hash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self readAll:0];
  if (self->_summarySHA256Hash) {
    objc_msgSend(v4, "setSummarySHA256Hash:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_summarySHA256Hash copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self readAll:1];
    [v4 readAll:1];
    summarySHA256Hash = self->_summarySHA256Hash;
    if ((unint64_t)summarySHA256Hash | v4[2]) {
      char v5 = -[NSData isEqual:](summarySHA256Hash, "isEqual:");
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
  [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self readAll:1];
  summarySHA256Hash = self->_summarySHA256Hash;

  return [(NSData *)summarySHA256Hash hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[2];

  if (v5)
  {
    [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self setSummarySHA256Hash:v5];
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
    [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySHA256Hash, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end