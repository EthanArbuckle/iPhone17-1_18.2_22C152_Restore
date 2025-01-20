@interface ABCPbSummarySignatureRequest
+ (Class)attachmentsType;
- (BOOL)hasBuild;
- (BOOL)hasBuildVariant;
- (BOOL)hasCaseClosedTime;
- (BOOL)hasCaseClosureType;
- (BOOL)hasCaseContext;
- (BOOL)hasCaseDampeningType;
- (BOOL)hasCaseEffectiveProcess;
- (BOOL)hasCaseGroupIdentifier;
- (BOOL)hasCaseIdentifier;
- (BOOL)hasCaseRelatedProcesses;
- (BOOL)hasCaseStartTime;
- (BOOL)hasCaseThresholdValues;
- (BOOL)hasDomain;
- (BOOL)hasLogSizeTotal;
- (BOOL)hasProcess;
- (BOOL)hasRemoteTrigger;
- (BOOL)hasSubtype;
- (BOOL)hasSubtypeContext;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remoteTrigger;
- (NSMutableArray)attachments;
- (NSString)build;
- (NSString)buildVariant;
- (NSString)caseClosureType;
- (NSString)caseContext;
- (NSString)caseDampeningType;
- (NSString)caseEffectiveProcess;
- (NSString)caseGroupIdentifier;
- (NSString)caseIdentifier;
- (NSString)caseRelatedProcesses;
- (NSString)caseThresholdValues;
- (NSString)domain;
- (NSString)process;
- (NSString)subtype;
- (NSString)subtypeContext;
- (NSString)type;
- (double)caseClosedTime;
- (double)caseStartTime;
- (id)attachmentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attachmentsCount;
- (unint64_t)hash;
- (unsigned)logSizeTotal;
- (void)addAttachments:(id)a3;
- (void)clearAttachments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBuild:(id)a3;
- (void)setBuildVariant:(id)a3;
- (void)setCaseClosedTime:(double)a3;
- (void)setCaseClosureType:(id)a3;
- (void)setCaseContext:(id)a3;
- (void)setCaseDampeningType:(id)a3;
- (void)setCaseEffectiveProcess:(id)a3;
- (void)setCaseGroupIdentifier:(id)a3;
- (void)setCaseIdentifier:(id)a3;
- (void)setCaseRelatedProcesses:(id)a3;
- (void)setCaseStartTime:(double)a3;
- (void)setCaseThresholdValues:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHasCaseClosedTime:(BOOL)a3;
- (void)setHasCaseStartTime:(BOOL)a3;
- (void)setHasLogSizeTotal:(BOOL)a3;
- (void)setHasRemoteTrigger:(BOOL)a3;
- (void)setLogSizeTotal:(unsigned int)a3;
- (void)setProcess:(id)a3;
- (void)setRemoteTrigger:(BOOL)a3;
- (void)setSubtype:(id)a3;
- (void)setSubtypeContext:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSummarySignatureRequest

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
  *(unsigned char *)&self->_has |= 4u;
  self->_logSizeTotal = a3;
}

- (void)setHasLogSizeTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLogSizeTotal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCaseClosedTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_caseClosedTime = a3;
}

- (void)setHasCaseClosedTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaseClosedTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCaseClosureType
{
  return self->_caseClosureType != 0;
}

- (void)setCaseStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_caseStartTime = a3;
}

- (void)setHasCaseStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaseStartTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCaseContext
{
  return self->_caseContext != 0;
}

- (BOOL)hasCaseDampeningType
{
  return self->_caseDampeningType != 0;
}

- (BOOL)hasCaseEffectiveProcess
{
  return self->_caseEffectiveProcess != 0;
}

- (BOOL)hasCaseRelatedProcesses
{
  return self->_caseRelatedProcesses != 0;
}

- (BOOL)hasCaseThresholdValues
{
  return self->_caseThresholdValues != 0;
}

- (void)setRemoteTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_remoteTrigger = a3;
}

- (void)setHasRemoteTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRemoteTrigger
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearAttachments
{
}

- (void)addAttachments:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  id v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_attachments;
    self->_attachments = v6;

    id v4 = v8;
    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v4];
}

- (unint64_t)attachmentsCount
{
  return [(NSMutableArray *)self->_attachments count];
}

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attachments objectAtIndex:a3];
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSummarySignatureRequest;
  id v4 = [(ABCPbSummarySignatureRequest *)&v8 description];
  v5 = [(ABCPbSummarySignatureRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_logSizeTotal];
    [v4 setObject:v15 forKey:@"log_size_total"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v16 = [NSNumber numberWithDouble:self->_caseClosedTime];
    [v4 setObject:v16 forKey:@"case_closed_time"];
  }
  caseClosureType = self->_caseClosureType;
  if (caseClosureType) {
    [v4 setObject:caseClosureType forKey:@"case_closure_type"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18 = [NSNumber numberWithDouble:self->_caseStartTime];
    [v4 setObject:v18 forKey:@"case_start_time"];
  }
  caseContext = self->_caseContext;
  if (caseContext) {
    [v4 setObject:caseContext forKey:@"case_context"];
  }
  caseDampeningType = self->_caseDampeningType;
  if (caseDampeningType) {
    [v4 setObject:caseDampeningType forKey:@"case_dampening_type"];
  }
  caseEffectiveProcess = self->_caseEffectiveProcess;
  if (caseEffectiveProcess) {
    [v4 setObject:caseEffectiveProcess forKey:@"case_effective_process"];
  }
  caseRelatedProcesses = self->_caseRelatedProcesses;
  if (caseRelatedProcesses) {
    [v4 setObject:caseRelatedProcesses forKey:@"case_related_processes"];
  }
  caseThresholdValues = self->_caseThresholdValues;
  if (caseThresholdValues) {
    [v4 setObject:caseThresholdValues forKey:@"case_threshold_values"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v24 = [NSNumber numberWithBool:self->_remoteTrigger];
    [v4 setObject:v24 forKey:@"remote_trigger"];
  }
  if ([(NSMutableArray *)self->_attachments count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v26 = self->_attachments;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "dictionaryRepresentation", (void)v33);
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"attachments"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySignatureRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_type) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtype) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtypeContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_process) {
    PBDataWriterWriteStringField();
  }
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  if (self->_buildVariant) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseGroupIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_caseClosureType) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_caseContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseDampeningType) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseEffectiveProcess) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseRelatedProcesses) {
    PBDataWriterWriteStringField();
  }
  if (self->_caseThresholdValues) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_attachments;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v10;
  }
  if (self->_type)
  {
    objc_msgSend(v10, "setType:");
    id v4 = v10;
  }
  if (self->_subtype)
  {
    objc_msgSend(v10, "setSubtype:");
    id v4 = v10;
  }
  if (self->_subtypeContext)
  {
    objc_msgSend(v10, "setSubtypeContext:");
    id v4 = v10;
  }
  if (self->_caseIdentifier)
  {
    objc_msgSend(v10, "setCaseIdentifier:");
    id v4 = v10;
  }
  if (self->_process)
  {
    objc_msgSend(v10, "setProcess:");
    id v4 = v10;
  }
  if (self->_build)
  {
    objc_msgSend(v10, "setBuild:");
    id v4 = v10;
  }
  if (self->_buildVariant)
  {
    objc_msgSend(v10, "setBuildVariant:");
    id v4 = v10;
  }
  if (self->_caseGroupIdentifier)
  {
    objc_msgSend(v10, "setCaseGroupIdentifier:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_logSizeTotal;
    *((unsigned char *)v4 + 164) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_caseClosedTime;
    *((unsigned char *)v4 + 164) |= 1u;
  }
  if (self->_caseClosureType)
  {
    objc_msgSend(v10, "setCaseClosureType:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_caseStartTime;
    *((unsigned char *)v4 + 164) |= 2u;
  }
  if (self->_caseContext)
  {
    objc_msgSend(v10, "setCaseContext:");
    id v4 = v10;
  }
  if (self->_caseDampeningType)
  {
    objc_msgSend(v10, "setCaseDampeningType:");
    id v4 = v10;
  }
  if (self->_caseEffectiveProcess)
  {
    objc_msgSend(v10, "setCaseEffectiveProcess:");
    id v4 = v10;
  }
  if (self->_caseRelatedProcesses)
  {
    objc_msgSend(v10, "setCaseRelatedProcesses:");
    id v4 = v10;
  }
  if (self->_caseThresholdValues)
  {
    objc_msgSend(v10, "setCaseThresholdValues:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 160) = self->_remoteTrigger;
    *((unsigned char *)v4 + 164) |= 8u;
  }
  if ([(ABCPbSummarySignatureRequest *)self attachmentsCount])
  {
    [v10 clearAttachments];
    unint64_t v6 = [(ABCPbSummarySignatureRequest *)self attachmentsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ABCPbSummarySignatureRequest *)self attachmentsAtIndex:i];
        [v10 addAttachments:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  uint64_t v8 = [(NSString *)self->_type copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v8;

  uint64_t v10 = [(NSString *)self->_subtype copyWithZone:a3];
  long long v11 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v10;

  uint64_t v12 = [(NSString *)self->_subtypeContext copyWithZone:a3];
  long long v13 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v12;

  uint64_t v14 = [(NSString *)self->_caseIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  uint64_t v16 = [(NSString *)self->_process copyWithZone:a3];
  v17 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v16;

  uint64_t v18 = [(NSString *)self->_build copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  uint64_t v20 = [(NSString *)self->_buildVariant copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  uint64_t v22 = [(NSString *)self->_caseGroupIdentifier copyWithZone:a3];
  v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_logSizeTotal;
    *(unsigned char *)(v5 + 164) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_caseClosedTime;
    *(unsigned char *)(v5 + 164) |= 1u;
  }
  uint64_t v25 = [(NSString *)self->_caseClosureType copyWithZone:a3];
  v26 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v25;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_caseStartTime;
    *(unsigned char *)(v5 + 164) |= 2u;
  }
  uint64_t v27 = [(NSString *)self->_caseContext copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v27;

  uint64_t v29 = [(NSString *)self->_caseDampeningType copyWithZone:a3];
  v30 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v29;

  uint64_t v31 = [(NSString *)self->_caseEffectiveProcess copyWithZone:a3];
  v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  uint64_t v33 = [(NSString *)self->_caseRelatedProcesses copyWithZone:a3];
  long long v34 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v33;

  uint64_t v35 = [(NSString *)self->_caseThresholdValues copyWithZone:a3];
  long long v36 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v35;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 160) = self->_remoteTrigger;
    *(unsigned char *)(v5 + 164) |= 8u;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v37 = self->_attachments;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (void)v44);
        [(id)v5 addAttachments:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v39);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_52;
    }
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](type, "isEqual:")) {
      goto LABEL_52;
    }
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:")) {
      goto LABEL_52;
    }
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:")) {
      goto LABEL_52;
    }
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  process = self->_process;
  if ((unint64_t)process | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](process, "isEqual:")) {
      goto LABEL_52;
    }
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](build, "isEqual:")) {
      goto LABEL_52;
    }
  }
  buildVariant = self->_buildVariant;
  if ((unint64_t)buildVariant | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](buildVariant, "isEqual:")) {
      goto LABEL_52;
    }
  }
  caseGroupIdentifier = self->_caseGroupIdentifier;
  if ((unint64_t)caseGroupIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](caseGroupIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 164) & 4) == 0 || self->_logSizeTotal != *((_DWORD *)v4 + 30)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 164) & 4) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 164) & 1) == 0 || self->_caseClosedTime != *((double *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 164))
  {
    goto LABEL_52;
  }
  caseClosureType = self->_caseClosureType;
  if ((unint64_t)caseClosureType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](caseClosureType, "isEqual:")) {
      goto LABEL_52;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 164) & 2) == 0 || self->_caseStartTime != *((double *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 164) & 2) != 0)
  {
    goto LABEL_52;
  }
  caseContext = self->_caseContext;
  if ((unint64_t)caseContext | *((void *)v4 + 7)
    && !-[NSString isEqual:](caseContext, "isEqual:"))
  {
    goto LABEL_52;
  }
  caseDampeningType = self->_caseDampeningType;
  if ((unint64_t)caseDampeningType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](caseDampeningType, "isEqual:")) {
      goto LABEL_52;
    }
  }
  caseEffectiveProcess = self->_caseEffectiveProcess;
  if ((unint64_t)caseEffectiveProcess | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](caseEffectiveProcess, "isEqual:")) {
      goto LABEL_52;
    }
  }
  caseRelatedProcesses = self->_caseRelatedProcesses;
  if ((unint64_t)caseRelatedProcesses | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](caseRelatedProcesses, "isEqual:")) {
      goto LABEL_52;
    }
  }
  caseThresholdValues = self->_caseThresholdValues;
  if ((unint64_t)caseThresholdValues | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](caseThresholdValues, "isEqual:")) {
      goto LABEL_52;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 164) & 8) == 0) {
      goto LABEL_58;
    }
LABEL_52:
    char v21 = 0;
    goto LABEL_53;
  }
  if ((*((unsigned char *)v4 + 164) & 8) == 0) {
    goto LABEL_52;
  }
  if (!self->_remoteTrigger)
  {
    if (!*((unsigned char *)v4 + 160)) {
      goto LABEL_58;
    }
    goto LABEL_52;
  }
  if (!*((unsigned char *)v4 + 160)) {
    goto LABEL_52;
  }
LABEL_58:
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((void *)v4 + 3)) {
    char v21 = -[NSMutableArray isEqual:](attachments, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_53:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v31 = [(NSString *)self->_domain hash];
  NSUInteger v30 = [(NSString *)self->_type hash];
  NSUInteger v29 = [(NSString *)self->_subtype hash];
  NSUInteger v28 = [(NSString *)self->_subtypeContext hash];
  NSUInteger v27 = [(NSString *)self->_caseIdentifier hash];
  NSUInteger v26 = [(NSString *)self->_process hash];
  NSUInteger v25 = [(NSString *)self->_build hash];
  NSUInteger v24 = [(NSString *)self->_buildVariant hash];
  NSUInteger v23 = [(NSString *)self->_caseGroupIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v21 = 2654435761 * self->_logSizeTotal;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v21 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double caseClosedTime = self->_caseClosedTime;
  double v4 = -caseClosedTime;
  if (caseClosedTime >= 0.0) {
    double v4 = self->_caseClosedTime;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_caseClosureType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double caseStartTime = self->_caseStartTime;
    double v11 = -caseStartTime;
    if (caseStartTime >= 0.0) {
      double v11 = self->_caseStartTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_caseContext hash];
  NSUInteger v15 = [(NSString *)self->_caseDampeningType hash];
  NSUInteger v16 = [(NSString *)self->_caseEffectiveProcess hash];
  NSUInteger v17 = [(NSString *)self->_caseRelatedProcesses hash];
  NSUInteger v18 = [(NSString *)self->_caseThresholdValues hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_remoteTrigger;
  }
  else {
    uint64_t v19 = 0;
  }
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSMutableArray *)self->_attachments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 14)) {
    -[ABCPbSummarySignatureRequest setDomain:](self, "setDomain:");
  }
  if (*((void *)v4 + 19)) {
    -[ABCPbSummarySignatureRequest setType:](self, "setType:");
  }
  if (*((void *)v4 + 17)) {
    -[ABCPbSummarySignatureRequest setSubtype:](self, "setSubtype:");
  }
  if (*((void *)v4 + 18)) {
    -[ABCPbSummarySignatureRequest setSubtypeContext:](self, "setSubtypeContext:");
  }
  if (*((void *)v4 + 11)) {
    -[ABCPbSummarySignatureRequest setCaseIdentifier:](self, "setCaseIdentifier:");
  }
  if (*((void *)v4 + 16)) {
    -[ABCPbSummarySignatureRequest setProcess:](self, "setProcess:");
  }
  if (*((void *)v4 + 4)) {
    -[ABCPbSummarySignatureRequest setBuild:](self, "setBuild:");
  }
  if (*((void *)v4 + 5)) {
    -[ABCPbSummarySignatureRequest setBuildVariant:](self, "setBuildVariant:");
  }
  if (*((void *)v4 + 10)) {
    -[ABCPbSummarySignatureRequest setCaseGroupIdentifier:](self, "setCaseGroupIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 164);
  if ((v5 & 4) != 0)
  {
    self->_logSizeTotal = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 164);
  }
  if (v5)
  {
    self->_double caseClosedTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[ABCPbSummarySignatureRequest setCaseClosureType:](self, "setCaseClosureType:");
  }
  if ((*((unsigned char *)v4 + 164) & 2) != 0)
  {
    self->_double caseStartTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[ABCPbSummarySignatureRequest setCaseContext:](self, "setCaseContext:");
  }
  if (*((void *)v4 + 8)) {
    -[ABCPbSummarySignatureRequest setCaseDampeningType:](self, "setCaseDampeningType:");
  }
  if (*((void *)v4 + 9)) {
    -[ABCPbSummarySignatureRequest setCaseEffectiveProcess:](self, "setCaseEffectiveProcess:");
  }
  if (*((void *)v4 + 12)) {
    -[ABCPbSummarySignatureRequest setCaseRelatedProcesses:](self, "setCaseRelatedProcesses:");
  }
  if (*((void *)v4 + 13)) {
    -[ABCPbSummarySignatureRequest setCaseThresholdValues:](self, "setCaseThresholdValues:");
  }
  if ((*((unsigned char *)v4 + 164) & 8) != 0)
  {
    self->_remoteTrigger = *((unsigned char *)v4 + 160);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ABCPbSummarySignatureRequest addAttachments:](self, "addAttachments:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
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

- (double)caseClosedTime
{
  return self->_caseClosedTime;
}

- (NSString)caseClosureType
{
  return self->_caseClosureType;
}

- (void)setCaseClosureType:(id)a3
{
}

- (double)caseStartTime
{
  return self->_caseStartTime;
}

- (NSString)caseContext
{
  return self->_caseContext;
}

- (void)setCaseContext:(id)a3
{
}

- (NSString)caseDampeningType
{
  return self->_caseDampeningType;
}

- (void)setCaseDampeningType:(id)a3
{
}

- (NSString)caseEffectiveProcess
{
  return self->_caseEffectiveProcess;
}

- (void)setCaseEffectiveProcess:(id)a3
{
}

- (NSString)caseRelatedProcesses
{
  return self->_caseRelatedProcesses;
}

- (void)setCaseRelatedProcesses:(id)a3
{
}

- (NSString)caseThresholdValues
{
  return self->_caseThresholdValues;
}

- (void)setCaseThresholdValues:(id)a3
{
}

- (BOOL)remoteTrigger
{
  return self->_remoteTrigger;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_caseThresholdValues, 0);
  objc_storeStrong((id *)&self->_caseRelatedProcesses, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
  objc_storeStrong((id *)&self->_caseGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_caseEffectiveProcess, 0);
  objc_storeStrong((id *)&self->_caseDampeningType, 0);
  objc_storeStrong((id *)&self->_caseContext, 0);
  objc_storeStrong((id *)&self->_caseClosureType, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_attachments, 0);
}

@end