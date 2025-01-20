@interface AWDSymptomsDiagnosticIncidentReport
+ (Class)incidentEventsType;
+ (Class)relatedNamesType;
- (BOOL)hasDampeningType;
- (BOOL)hasDetectedName;
- (BOOL)hasDomain;
- (BOOL)hasDuration;
- (BOOL)hasEffectiveName;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasHandledResult;
- (BOOL)hasIdentifier;
- (BOOL)hasSubtype;
- (BOOL)hasSubtypeContext;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)incidentEvents;
- (NSMutableArray)relatedNames;
- (NSString)detectedName;
- (NSString)domain;
- (NSString)effectiveName;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)subtype;
- (NSString)subtypeContext;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dampeningTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handledResultAsString:(int)a3;
- (id)incidentEventsAtIndex:(unint64_t)a3;
- (id)relatedNamesAtIndex:(unint64_t)a3;
- (int)StringAsDampeningType:(id)a3;
- (int)StringAsHandledResult:(id)a3;
- (int)dampeningType;
- (int)handledResult;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)incidentEventsCount;
- (unint64_t)relatedNamesCount;
- (unint64_t)timestamp;
- (unint64_t)timestampsIncidentEvents;
- (unint64_t)timestampsIncidentEventsAtIndex:(unint64_t)a3;
- (unint64_t)timestampsIncidentEventsCount;
- (unint64_t)version;
- (void)addIncidentEvents:(id)a3;
- (void)addRelatedNames:(id)a3;
- (void)addTimestampsIncidentEvents:(unint64_t)a3;
- (void)clearIncidentEvents;
- (void)clearRelatedNames;
- (void)clearTimestampsIncidentEvents;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDampeningType:(int)a3;
- (void)setDetectedName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setEffectiveName:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHandledResult:(int)a3;
- (void)setHasDampeningType:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHandledResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncidentEvents:(id)a3;
- (void)setRelatedNames:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setSubtypeContext:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTimestampsIncidentEvents:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setType:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSymptomsDiagnosticIncidentReport

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSymptomsDiagnosticIncidentReport;
  [(AWDSymptomsDiagnosticIncidentReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)handledResult
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_handledResult;
  }
  else {
    return 1;
  }
}

- (void)setHandledResult:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_handledResult = a3;
}

- (void)setHasHandledResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHandledResult
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)handledResultAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC30F8[a3 - 1];
  }

  return v3;
}

- (int)StringAsHandledResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Allowed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotAllowed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PriorityAllowed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TransientAllowed"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

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

- (BOOL)hasDetectedName
{
  return self->_detectedName != 0;
}

- (BOOL)hasEffectiveName
{
  return self->_effectiveName != 0;
}

- (void)clearRelatedNames
{
}

- (void)addRelatedNames:(id)a3
{
  id v4 = a3;
  relatedNames = self->_relatedNames;
  id v8 = v4;
  if (!relatedNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_relatedNames;
    self->_relatedNames = v6;

    id v4 = v8;
    relatedNames = self->_relatedNames;
  }
  [(NSMutableArray *)relatedNames addObject:v4];
}

- (unint64_t)relatedNamesCount
{
  return [(NSMutableArray *)self->_relatedNames count];
}

- (id)relatedNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_relatedNames objectAtIndex:a3];
}

+ (Class)relatedNamesType
{
  return (Class)objc_opt_class();
}

- (unint64_t)timestampsIncidentEventsCount
{
  return self->_timestampsIncidentEvents.count;
}

- (unint64_t)timestampsIncidentEvents
{
  return self->_timestampsIncidentEvents.list;
}

- (void)clearTimestampsIncidentEvents
{
}

- (void)addTimestampsIncidentEvents:(unint64_t)a3
{
}

- (unint64_t)timestampsIncidentEventsAtIndex:(unint64_t)a3
{
  p_timestampsIncidentEvents = &self->_timestampsIncidentEvents;
  unint64_t count = self->_timestampsIncidentEvents.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_timestampsIncidentEvents->list[a3];
}

- (void)setTimestampsIncidentEvents:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)clearIncidentEvents
{
}

- (void)addIncidentEvents:(id)a3
{
  id v4 = a3;
  incidentEvents = self->_incidentEvents;
  id v8 = v4;
  if (!incidentEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_incidentEvents;
    self->_incidentEvents = v6;

    id v4 = v8;
    incidentEvents = self->_incidentEvents;
  }
  [(NSMutableArray *)incidentEvents addObject:v4];
}

- (unint64_t)incidentEventsCount
{
  return [(NSMutableArray *)self->_incidentEvents count];
}

- (id)incidentEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_incidentEvents objectAtIndex:a3];
}

+ (Class)incidentEventsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)dampeningType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_dampeningType;
  }
  else {
    return 1;
  }
}

- (void)setDampeningType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dampeningType = a3;
}

- (void)setHasDampeningType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDampeningType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)dampeningTypeAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC3118[a3 - 1];
  }

  return v3;
}

- (int)StringAsDampeningType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TransientApproval"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HourlyQuotaExceeded"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DailyQuotaExceeded"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RandomizedSuppression"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UnsatisfiedSystemPrerequisites"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UnsatisfiedCollectionRequirements"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)AWDSymptomsDiagnosticIncidentReport;
  int v4 = [(AWDSymptomsDiagnosticIncidentReport *)&v8 description];
  v5 = [(AWDSymptomsDiagnosticIncidentReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v27 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v27 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v28 = self->_handledResult - 1;
  if (v28 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_handledResult);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_263FC30F8[v28];
  }
  [v3 setObject:v29 forKey:@"handledResult"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_duration];
    [v3 setObject:v5 forKey:@"duration"];
  }
LABEL_5:
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  subtype = self->_subtype;
  if (subtype) {
    [v3 setObject:subtype forKey:@"subtype"];
  }
  subtypeContext = self->_subtypeContext;
  if (subtypeContext) {
    [v3 setObject:subtypeContext forKey:@"subtypeContext"];
  }
  detectedName = self->_detectedName;
  if (detectedName) {
    [v3 setObject:detectedName forKey:@"detectedName"];
  }
  effectiveName = self->_effectiveName;
  if (effectiveName) {
    [v3 setObject:effectiveName forKey:@"effectiveName"];
  }
  relatedNames = self->_relatedNames;
  if (relatedNames) {
    [v3 setObject:relatedNames forKey:@"relatedNames"];
  }
  v14 = PBRepeatedUInt64NSArray();
  [v3 setObject:v14 forKey:@"timestampsIncidentEvents"];

  if ([(NSMutableArray *)self->_incidentEvents count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_incidentEvents, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v16 = self->_incidentEvents;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"incidentEvents"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 setObject:groupIdentifier forKey:@"groupIdentifier"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    v24 = [NSNumber numberWithUnsignedLongLong:self->_version];
    [v3 setObject:v24 forKey:@"version"];

    char v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0)
  {
    unsigned int v25 = self->_dampeningType - 1;
    if (v25 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dampeningType);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_263FC3118[v25];
    }
    [v3 setObject:v26 forKey:@"dampeningType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticIncidentReportReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
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
  if (self->_detectedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveName) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = self->_relatedNames;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if (self->_timestampsIncidentEvents.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v11;
    }
    while (v11 < self->_timestampsIncidentEvents.count);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = self->_incidentEvents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v17 = (char)self->_has;
  }
  if ((v17 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    *((unsigned char *)v4 + 152) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_handledResult;
  *((unsigned char *)v4 + 152) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[4] = self->_duration;
    *((unsigned char *)v4 + 152) |= 1u;
  }
LABEL_5:
  id v18 = v4;
  if (self->_identifier) {
    objc_msgSend(v4, "setIdentifier:");
  }
  if (self->_domain) {
    objc_msgSend(v18, "setDomain:");
  }
  if (self->_type) {
    objc_msgSend(v18, "setType:");
  }
  if (self->_subtype) {
    objc_msgSend(v18, "setSubtype:");
  }
  if (self->_subtypeContext) {
    objc_msgSend(v18, "setSubtypeContext:");
  }
  if (self->_detectedName) {
    objc_msgSend(v18, "setDetectedName:");
  }
  if (self->_effectiveName) {
    objc_msgSend(v18, "setEffectiveName:");
  }
  if ([(AWDSymptomsDiagnosticIncidentReport *)self relatedNamesCount])
  {
    [v18 clearRelatedNames];
    unint64_t v6 = [(AWDSymptomsDiagnosticIncidentReport *)self relatedNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(AWDSymptomsDiagnosticIncidentReport *)self relatedNamesAtIndex:i];
        [v18 addRelatedNames:v9];
      }
    }
  }
  if ([(AWDSymptomsDiagnosticIncidentReport *)self timestampsIncidentEventsCount])
  {
    [v18 clearTimestampsIncidentEvents];
    unint64_t v10 = [(AWDSymptomsDiagnosticIncidentReport *)self timestampsIncidentEventsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v18, "addTimestampsIncidentEvents:", -[AWDSymptomsDiagnosticIncidentReport timestampsIncidentEventsAtIndex:](self, "timestampsIncidentEventsAtIndex:", j));
    }
  }
  if ([(AWDSymptomsDiagnosticIncidentReport *)self incidentEventsCount])
  {
    [v18 clearIncidentEvents];
    unint64_t v13 = [(AWDSymptomsDiagnosticIncidentReport *)self incidentEventsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = [(AWDSymptomsDiagnosticIncidentReport *)self incidentEventsAtIndex:k];
        [v18 addIncidentEvents:v16];
      }
    }
  }
  if (self->_groupIdentifier) {
    objc_msgSend(v18, "setGroupIdentifier:");
  }
  char v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    *((void *)v18 + 6) = self->_version;
    *((unsigned char *)v18 + 152) |= 4u;
    char v17 = (char)self->_has;
  }
  if ((v17 & 8) != 0)
  {
    *((_DWORD *)v18 + 14) = self->_dampeningType;
    *((unsigned char *)v18 + 152) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 152) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_handledResult;
  *(unsigned char *)(v5 + 152) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 32) = self->_duration;
    *(unsigned char *)(v5 + 152) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v8;

  uint64_t v10 = [(NSString *)self->_domain copyWithZone:a3];
  unint64_t v11 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_type copyWithZone:a3];
  unint64_t v13 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v12;

  uint64_t v14 = [(NSString *)self->_subtype copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v14;

  uint64_t v16 = [(NSString *)self->_subtypeContext copyWithZone:a3];
  char v17 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v16;

  uint64_t v18 = [(NSString *)self->_detectedName copyWithZone:a3];
  long long v19 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v18;

  uint64_t v20 = [(NSString *)self->_effectiveName copyWithZone:a3];
  long long v21 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v20;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v22 = self->_relatedNames;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addRelatedNames:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v24);
  }

  PBRepeatedUInt64Copy();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v28 = self->_incidentEvents;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * j), "copyWithZone:", a3, (void)v38);
        [(id)v6 addIncidentEvents:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
  v35 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v34;

  char v36 = (char)self->_has;
  if ((v36 & 4) != 0)
  {
    *(void *)(v6 + 48) = self->_version;
    *(unsigned char *)(v6 + 152) |= 4u;
    char v36 = (char)self->_has;
  }
  if ((v36 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_dampeningType;
    *(unsigned char *)(v6 + 152) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 2) == 0 || self->_timestamp != *((void *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
LABEL_47:
    BOOL v15 = 0;
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 0x10) == 0 || self->_handledResult != *((_DWORD *)v4 + 24)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 152) & 1) == 0 || self->_duration != *((void *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 152))
  {
    goto LABEL_47;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 13)
    && !-[NSString isEqual:](identifier, "isEqual:"))
  {
    goto LABEL_47;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_47;
    }
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](type, "isEqual:")) {
      goto LABEL_47;
    }
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:")) {
      goto LABEL_47;
    }
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:")) {
      goto LABEL_47;
    }
  }
  detectedName = self->_detectedName;
  if ((unint64_t)detectedName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](detectedName, "isEqual:")) {
      goto LABEL_47;
    }
  }
  effectiveName = self->_effectiveName;
  if ((unint64_t)effectiveName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](effectiveName, "isEqual:")) {
      goto LABEL_47;
    }
  }
  relatedNames = self->_relatedNames;
  if ((unint64_t)relatedNames | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](relatedNames, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_47;
  }
  incidentEvents = self->_incidentEvents;
  if ((unint64_t)incidentEvents | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](incidentEvents, "isEqual:")) {
      goto LABEL_47;
    }
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 4) == 0 || self->_version != *((void *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 4) != 0)
  {
    goto LABEL_47;
  }
  BOOL v15 = (*((unsigned char *)v4 + 152) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 8) == 0 || self->_dampeningType != *((_DWORD *)v4 + 14)) {
      goto LABEL_47;
    }
    BOOL v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v19 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = 2654435761 * self->_handledResult;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v17 = 2654435761u * self->_duration;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v17 = 0;
LABEL_8:
  NSUInteger v16 = [(NSString *)self->_identifier hash];
  NSUInteger v15 = [(NSString *)self->_domain hash];
  NSUInteger v3 = [(NSString *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_subtype hash];
  NSUInteger v5 = [(NSString *)self->_subtypeContext hash];
  NSUInteger v6 = [(NSString *)self->_detectedName hash];
  NSUInteger v7 = [(NSString *)self->_effectiveName hash];
  uint64_t v8 = [(NSMutableArray *)self->_relatedNames hash];
  uint64_t v9 = PBRepeatedUInt64Hash();
  uint64_t v10 = [(NSMutableArray *)self->_incidentEvents hash];
  NSUInteger v11 = [(NSString *)self->_groupIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v12 = 2654435761u * self->_version;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v13 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  unint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_dampeningType;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 152);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 152);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_handledResult = *((_DWORD *)v4 + 24);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)v4 + 152))
  {
LABEL_4:
    self->_duration = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 13)) {
    -[AWDSymptomsDiagnosticIncidentReport setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v5 + 9)) {
    -[AWDSymptomsDiagnosticIncidentReport setDomain:](self, "setDomain:");
  }
  if (*((void *)v5 + 18)) {
    -[AWDSymptomsDiagnosticIncidentReport setType:](self, "setType:");
  }
  if (*((void *)v5 + 16)) {
    -[AWDSymptomsDiagnosticIncidentReport setSubtype:](self, "setSubtype:");
  }
  if (*((void *)v5 + 17)) {
    -[AWDSymptomsDiagnosticIncidentReport setSubtypeContext:](self, "setSubtypeContext:");
  }
  if (*((void *)v5 + 8)) {
    -[AWDSymptomsDiagnosticIncidentReport setDetectedName:](self, "setDetectedName:");
  }
  if (*((void *)v5 + 10)) {
    -[AWDSymptomsDiagnosticIncidentReport setEffectiveName:](self, "setEffectiveName:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *((id *)v5 + 15);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDSymptomsDiagnosticIncidentReport *)self addRelatedNames:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v5 timestampsIncidentEventsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[AWDSymptomsDiagnosticIncidentReport addTimestampsIncidentEvents:](self, "addTimestampsIncidentEvents:", [v5 timestampsIncidentEventsAtIndex:j]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = *((id *)v5 + 14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[AWDSymptomsDiagnosticIncidentReport addIncidentEvents:](self, "addIncidentEvents:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  if (*((void *)v5 + 11)) {
    -[AWDSymptomsDiagnosticIncidentReport setGroupIdentifier:](self, "setGroupIdentifier:");
  }
  char v20 = *((unsigned char *)v5 + 152);
  if ((v20 & 4) != 0)
  {
    self->_version = *((void *)v5 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v20 = *((unsigned char *)v5 + 152);
  }
  if ((v20 & 8) != 0)
  {
    self->_dampeningType = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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

- (NSString)detectedName
{
  return self->_detectedName;
}

- (void)setDetectedName:(id)a3
{
}

- (NSString)effectiveName
{
  return self->_effectiveName;
}

- (void)setEffectiveName:(id)a3
{
}

- (NSMutableArray)relatedNames
{
  return self->_relatedNames;
}

- (void)setRelatedNames:(id)a3
{
}

- (NSMutableArray)incidentEvents
{
  return self->_incidentEvents;
}

- (void)setIncidentEvents:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_incidentEvents, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_detectedName, 0);
}

@end