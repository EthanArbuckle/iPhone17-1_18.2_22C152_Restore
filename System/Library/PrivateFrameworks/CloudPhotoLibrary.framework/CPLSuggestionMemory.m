@interface CPLSuggestionMemory
- (BOOL)hasContext;
- (BOOL)hasFeature;
- (BOOL)hasMemoryIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)context;
- (NSString)memoryIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)feature;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setFeature:(unsigned int)a3;
- (void)setHasFeature:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMemoryIdentifier:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLSuggestionMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (unsigned)feature
{
  return self->_feature;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setMemoryIdentifier:(id)a3
{
}

- (NSString)memoryIdentifier
{
  return self->_memoryIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[CPLSuggestionMemory setMemoryIdentifier:](self, "setMemoryIdentifier:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_type = v4[8];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_feature = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[CPLSuggestionMemory setContext:](self, "setContext:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_memoryIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_context hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_feature;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_context hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  memoryIdentifier = self->_memoryIdentifier;
  if ((unint64_t)memoryIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](memoryIdentifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_feature != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](context, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_memoryIdentifier copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_feature;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_context copyWithZone:a3];
  v10 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v9;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_memoryIdentifier)
  {
    objc_msgSend(v4, "setMemoryIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_feature;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_context)
  {
    objc_msgSend(v6, "setContext:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_memoryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_context)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionMemoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  memoryIdentifier = self->_memoryIdentifier;
  if (memoryIdentifier) {
    [v3 setObject:memoryIdentifier forKey:@"memoryIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    char v7 = [NSNumber numberWithUnsignedInt:self->_type];
    [v4 setObject:v7 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = [NSNumber numberWithUnsignedInt:self->_feature];
    [v4 setObject:v8 forKey:@"feature"];
  }
  context = self->_context;
  if (context) {
    [v4 setObject:context forKey:@"context"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLSuggestionMemory;
  id v4 = [(CPLSuggestionMemory *)&v8 description];
  uint64_t v5 = [(CPLSuggestionMemory *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasFeature
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFeature:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFeature:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feature = a3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasMemoryIdentifier
{
  return self->_memoryIdentifier != 0;
}

@end