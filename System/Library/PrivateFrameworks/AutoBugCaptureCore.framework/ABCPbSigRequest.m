@interface ABCPbSigRequest
- (BOOL)hasBuild;
- (BOOL)hasBuildVariant;
- (BOOL)hasCaseGroupIdentifier;
- (BOOL)hasCaseIdentifier;
- (BOOL)hasDomain;
- (BOOL)hasLogSizeTotal;
- (BOOL)hasProcess;
- (BOOL)hasSubtype;
- (BOOL)hasSubtypeContext;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)build;
- (NSString)buildVariant;
- (NSString)caseGroupIdentifier;
- (NSString)caseIdentifier;
- (NSString)domain;
- (NSString)process;
- (NSString)subtype;
- (NSString)subtypeContext;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)logSizeTotal;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setBuildVariant:(id)a3;
- (void)setCaseGroupIdentifier:(id)a3;
- (void)setCaseIdentifier:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHasLogSizeTotal:(BOOL)a3;
- (void)setLogSizeTotal:(unsigned int)a3;
- (void)setProcess:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setSubtypeContext:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigRequest

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasSubtypeContext
{
  return self->_subtypeContext != 0;
}

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasCaseGroupIdentifier
{
  return self->_caseGroupIdentifier != 0;
}

- (void)setLogSizeTotal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_logSizeTotal = a3;
}

- (void)setHasLogSizeTotal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogSizeTotal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigRequest;
  v4 = [(ABCPbSigRequest *)&v8 description];
  v5 = [(ABCPbSigRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  subtype = self->_subtype;
  if (subtype) {
    [v4 setObject:subtype forKey:@"subtype"];
  }
  subtypeContext = self->_subtypeContext;
  if (subtypeContext) {
    [v4 setObject:subtypeContext forKey:@"subtype_context"];
  }
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier) {
    [v4 setObject:caseIdentifier forKey:@"case_identifier"];
  }
  process = self->_process;
  if (process) {
    [v4 setObject:process forKey:@"process"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  buildVariant = self->_buildVariant;
  if (buildVariant) {
    [v4 setObject:buildVariant forKey:@"build_variant"];
  }
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if (caseGroupIdentifier) {
    [v4 setObject:caseGroupIdentifier forKey:@"case_group_identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_logSizeTotal];
    [v4 setObject:v14 forKey:@"log_size_total"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtypeContext)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_caseIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_process)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_buildVariant)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_caseGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    id v4 = v5;
  }
  if (self->_subtype)
  {
    objc_msgSend(v5, "setSubtype:");
    id v4 = v5;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v5, "setSubtypeContext:");
    id v4 = v5;
  }
  if (self->_caseIdentifier)
  {
    objc_msgSend(v5, "setCaseIdentifier:");
    id v4 = v5;
  }
  if (self->_process)
  {
    objc_msgSend(v5, "setProcess:");
    id v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    id v4 = v5;
  }
  if (self->_buildVariant)
  {
    objc_msgSend(v5, "setBuildVariant:");
    id v4 = v5;
  }
  if (self->_caseGroupIdentifier)
  {
    objc_msgSend(v5, "setCaseGroupIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_logSizeTotal;
    *((unsigned char *)v4 + 88) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_type copyWithZone:a3];
  v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  uint64_t v10 = [(NSString *)self->_subtype copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_subtypeContext copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_caseIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_process copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_build copyWithZone:a3];
  v19 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v18;

  uint64_t v20 = [(NSString *)self->_buildVariant copyWithZone:a3];
  v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  uint64_t v22 = [(NSString *)self->_caseGroupIdentifier copyWithZone:a3];
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_logSizeTotal;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_24;
    }
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](type, "isEqual:")) {
      goto LABEL_24;
    }
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:")) {
      goto LABEL_24;
    }
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:")) {
      goto LABEL_24;
    }
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:")) {
      goto LABEL_24;
    }
  }
  process = self->_process;
  if ((unint64_t)process | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](process, "isEqual:")) {
      goto LABEL_24;
    }
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](build, "isEqual:")) {
      goto LABEL_24;
    }
  }
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:")) {
      goto LABEL_24;
    }
  }
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if ((unint64_t)caseGroupIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](caseGroupIdentifier, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 88) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) != 0 && self->_logSizeTotal == *((_DWORD *)v4 + 12))
    {
      BOOL v14 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v14 = 0;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_type hash];
  NSUInteger v5 = [(NSString *)self->_subtype hash];
  NSUInteger v6 = [(NSString *)self->_subtypeContext hash];
  NSUInteger v7 = [(NSString *)self->_caseIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_process hash];
  NSUInteger v9 = [(NSString *)self->_build hash];
  NSUInteger v10 = [(NSString *)self->_buildVariant hash];
  NSUInteger v11 = [(NSString *)self->_caseGroupIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v12 = 2654435761 * self->_logSizeTotal;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[ABCPbSigRequest setDomain:](self, "setDomain:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 10))
  {
    -[ABCPbSigRequest setType:](self, "setType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 8))
  {
    -[ABCPbSigRequest setSubtype:](self, "setSubtype:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[ABCPbSigRequest setSubtypeContext:](self, "setSubtypeContext:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[ABCPbSigRequest setCaseIdentifier:](self, "setCaseIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[ABCPbSigRequest setProcess:](self, "setProcess:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ABCPbSigRequest setBuild:](self, "setBuild:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ABCPbSigRequest setBuildVariant:](self, "setBuildVariant:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ABCPbSigRequest setCaseGroupIdentifier:](self, "setCaseGroupIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[22])
  {
    self->_logSizeTotal = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
}

- (NSString)caseGroupIdentifier
{
  return self->_caseGroupIdentifier;
}

- (void)setCaseGroupIdentifier:(id)a3
{
}

- (unsigned)logSizeTotal
{
  return self->_logSizeTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
  objc_storeStrong((id *)&self->_caseGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end