@interface DRSProtoDiagnosticRequestStats
+ (Class)outcomesType;
- (BOOL)hasBuild;
- (BOOL)hasIssueCategory;
- (BOOL)hasIssueDescription;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)outcomes;
- (NSString)build;
- (NSString)issueCategory;
- (NSString)issueDescription;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outcomesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)outcomesCount;
- (void)addOutcomes:(id)a3;
- (void)clearOutcomes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setIssueCategory:(id)a3;
- (void)setIssueDescription:(id)a3;
- (void)setOutcomes:(id)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoDiagnosticRequestStats

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasIssueCategory
{
  return self->_issueCategory != 0;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (void)clearOutcomes
{
}

- (void)addOutcomes:(id)a3
{
  id v4 = a3;
  outcomes = self->_outcomes;
  id v8 = v4;
  if (!outcomes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_outcomes;
    self->_outcomes = v6;

    id v4 = v8;
    outcomes = self->_outcomes;
  }
  [(NSMutableArray *)outcomes addObject:v4];
}

- (unint64_t)outcomesCount
{
  return [(NSMutableArray *)self->_outcomes count];
}

- (id)outcomesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outcomes objectAtIndex:a3];
}

+ (Class)outcomesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticRequestStats;
  id v4 = [(DRSProtoDiagnosticRequestStats *)&v8 description];
  v5 = [(DRSProtoDiagnosticRequestStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v4 setObject:teamId forKey:@"team_id"];
  }
  issueCategory = self->_issueCategory;
  if (issueCategory) {
    [v4 setObject:issueCategory forKey:@"issue_category"];
  }
  issueDescription = self->_issueDescription;
  if (issueDescription) {
    [v4 setObject:issueDescription forKey:@"issue_description"];
  }
  if ([(NSMutableArray *)self->_outcomes count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_outcomes, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_outcomes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"outcomes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticRequestStatsReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  if (self->_teamId) {
    PBDataWriterWriteStringField();
  }
  if (self->_issueCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_issueDescription) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_outcomes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_build) {
    objc_msgSend(v8, "setBuild:");
  }
  if (self->_teamId) {
    objc_msgSend(v8, "setTeamId:");
  }
  if (self->_issueCategory) {
    objc_msgSend(v8, "setIssueCategory:");
  }
  if (self->_issueDescription) {
    objc_msgSend(v8, "setIssueDescription:");
  }
  if ([(DRSProtoDiagnosticRequestStats *)self outcomesCount])
  {
    [v8 clearOutcomes];
    unint64_t v4 = [(DRSProtoDiagnosticRequestStats *)self outcomesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(DRSProtoDiagnosticRequestStats *)self outcomesAtIndex:i];
        [v8 addOutcomes:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_build copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_teamId copyWithZone:a3];
  uint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSString *)self->_issueCategory copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_issueDescription copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_outcomes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addOutcomes:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((build = self->_build, !((unint64_t)build | v4[1]))
     || -[NSString isEqual:](build, "isEqual:"))
    && ((teamId = self->_teamId, !((unint64_t)teamId | v4[5]))
     || -[NSString isEqual:](teamId, "isEqual:"))
    && ((issueCategory = self->_issueCategory, !((unint64_t)issueCategory | v4[2]))
     || -[NSString isEqual:](issueCategory, "isEqual:"))
    && ((issueDescription = self->_issueDescription, !((unint64_t)issueDescription | v4[3]))
     || -[NSString isEqual:](issueDescription, "isEqual:")))
  {
    outcomes = self->_outcomes;
    if ((unint64_t)outcomes | v4[4]) {
      char v10 = -[NSMutableArray isEqual:](outcomes, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_build hash];
  NSUInteger v4 = [(NSString *)self->_teamId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_issueCategory hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_issueDescription hash];
  return v6 ^ [(NSMutableArray *)self->_outcomes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[DRSProtoDiagnosticRequestStats setBuild:](self, "setBuild:");
  }
  if (*((void *)v4 + 5)) {
    -[DRSProtoDiagnosticRequestStats setTeamId:](self, "setTeamId:");
  }
  if (*((void *)v4 + 2)) {
    -[DRSProtoDiagnosticRequestStats setIssueCategory:](self, "setIssueCategory:");
  }
  if (*((void *)v4 + 3)) {
    -[DRSProtoDiagnosticRequestStats setIssueDescription:](self, "setIssueDescription:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[DRSProtoDiagnosticRequestStats addOutcomes:](self, "addOutcomes:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (void)setIssueCategory:(id)a3
{
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
}

- (NSMutableArray)outcomes
{
  return self->_outcomes;
}

- (void)setOutcomes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_outcomes, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end