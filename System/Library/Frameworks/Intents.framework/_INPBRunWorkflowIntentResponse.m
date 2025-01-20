@interface _INPBRunWorkflowIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)stepType;
- (BOOL)continueRunning;
- (BOOL)hasContinueRunning;
- (BOOL)hasRequestsIntentExecution;
- (BOOL)hasUnderlyingIntent;
- (BOOL)hasUnderlyingIntentResponse;
- (BOOL)hasUtterance;
- (BOOL)hasWaitingForResume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestsIntentExecution;
- (BOOL)waitingForResume;
- (NSArray)steps;
- (NSString)utterance;
- (_INPBArchivedObject)underlyingIntent;
- (_INPBArchivedObject)underlyingIntentResponse;
- (_INPBRunWorkflowIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)stepAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stepsCount;
- (void)addStep:(id)a3;
- (void)clearSteps;
- (void)encodeWithCoder:(id)a3;
- (void)setContinueRunning:(BOOL)a3;
- (void)setHasContinueRunning:(BOOL)a3;
- (void)setHasRequestsIntentExecution:(BOOL)a3;
- (void)setHasWaitingForResume:(BOOL)a3;
- (void)setRequestsIntentExecution:(BOOL)a3;
- (void)setSteps:(id)a3;
- (void)setUnderlyingIntent:(id)a3;
- (void)setUnderlyingIntentResponse:(id)a3;
- (void)setUtterance:(id)a3;
- (void)setWaitingForResume:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRunWorkflowIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_underlyingIntentResponse, 0);
  objc_storeStrong((id *)&self->_underlyingIntent, 0);

  objc_storeStrong((id *)&self->_steps, 0);
}

- (BOOL)waitingForResume
{
  return self->_waitingForResume;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (_INPBArchivedObject)underlyingIntentResponse
{
  return self->_underlyingIntentResponse;
}

- (_INPBArchivedObject)underlyingIntent
{
  return self->_underlyingIntent;
}

- (NSArray)steps
{
  return self->_steps;
}

- (BOOL)requestsIntentExecution
{
  return self->_requestsIntentExecution;
}

- (BOOL)continueRunning
{
  return self->_continueRunning;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBRunWorkflowIntentResponse *)self hasContinueRunning])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunWorkflowIntentResponse continueRunning](self, "continueRunning"));
    [v3 setObject:v4 forKeyedSubscript:@"continueRunning"];
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunWorkflowIntentResponse requestsIntentExecution](self, "requestsIntentExecution"));
    [v3 setObject:v5 forKeyedSubscript:@"requestsIntentExecution"];
  }
  if ([(NSArray *)self->_steps count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = self->_steps;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"step"];
  }
  v13 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"underlyingIntent"];

  v15 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"underlyingIntentResponse"];

  if (self->_utterance)
  {
    v17 = [(_INPBRunWorkflowIntentResponse *)self utterance];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"utterance"];
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunWorkflowIntentResponse waitingForResume](self, "waitingForResume"));
    [v3 setObject:v19 forKeyedSubscript:@"waitingForResume"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBRunWorkflowIntentResponse *)self hasContinueRunning]) {
    uint64_t v3 = 2654435761 * self->_continueRunning;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution]) {
    uint64_t v4 = 2654435761 * self->_requestsIntentExecution;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSArray *)self->_steps hash];
  unint64_t v6 = [(_INPBArchivedObject *)self->_underlyingIntent hash];
  unint64_t v7 = [(_INPBArchivedObject *)self->_underlyingIntentResponse hash];
  NSUInteger v8 = [(NSString *)self->_utterance hash];
  if ([(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume]) {
    uint64_t v9 = 2654435761 * self->_waitingForResume;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  int v5 = [(_INPBRunWorkflowIntentResponse *)self hasContinueRunning];
  if (v5 != [v4 hasContinueRunning]) {
    goto LABEL_30;
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasContinueRunning])
  {
    if ([v4 hasContinueRunning])
    {
      int continueRunning = self->_continueRunning;
      if (continueRunning != [v4 continueRunning]) {
        goto LABEL_30;
      }
    }
  }
  int v7 = [(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution];
  if (v7 != [v4 hasRequestsIntentExecution]) {
    goto LABEL_30;
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution])
  {
    if ([v4 hasRequestsIntentExecution])
    {
      int requestsIntentExecution = self->_requestsIntentExecution;
      if (requestsIntentExecution != [v4 requestsIntentExecution]) {
        goto LABEL_30;
      }
    }
  }
  uint64_t v9 = [(_INPBRunWorkflowIntentResponse *)self steps];
  uint64_t v10 = [v4 steps];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v11 = [(_INPBRunWorkflowIntentResponse *)self steps];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBRunWorkflowIntentResponse *)self steps];
    v14 = [v4 steps];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];
  uint64_t v10 = [v4 underlyingIntent];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v16 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];
    v19 = [v4 underlyingIntent];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];
  uint64_t v10 = [v4 underlyingIntentResponse];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v21 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];
  if (v21)
  {
    long long v22 = (void *)v21;
    long long v23 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];
    long long v24 = [v4 underlyingIntentResponse];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBRunWorkflowIntentResponse *)self utterance];
  uint64_t v10 = [v4 utterance];
  if ((v9 == 0) == (v10 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v26 = [(_INPBRunWorkflowIntentResponse *)self utterance];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBRunWorkflowIntentResponse *)self utterance];
    v29 = [v4 utterance];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  int v33 = [(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume];
  if (v33 == [v4 hasWaitingForResume])
  {
    if (![(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume]
      || ![v4 hasWaitingForResume]
      || (int waitingForResume = self->_waitingForResume,
          waitingForResume == [v4 waitingForResume]))
    {
      BOOL v31 = 1;
      goto LABEL_31;
    }
  }
LABEL_30:
  BOOL v31 = 0;
LABEL_31:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBRunWorkflowIntentResponse allocWithZone:](_INPBRunWorkflowIntentResponse, "allocWithZone:") init];
  if ([(_INPBRunWorkflowIntentResponse *)self hasContinueRunning]) {
    [(_INPBRunWorkflowIntentResponse *)v5 setContinueRunning:[(_INPBRunWorkflowIntentResponse *)self continueRunning]];
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution]) {
    [(_INPBRunWorkflowIntentResponse *)v5 setRequestsIntentExecution:[(_INPBRunWorkflowIntentResponse *)self requestsIntentExecution]];
  }
  unint64_t v6 = (void *)[(NSArray *)self->_steps copyWithZone:a3];
  [(_INPBRunWorkflowIntentResponse *)v5 setSteps:v6];

  id v7 = [(_INPBArchivedObject *)self->_underlyingIntent copyWithZone:a3];
  [(_INPBRunWorkflowIntentResponse *)v5 setUnderlyingIntent:v7];

  id v8 = [(_INPBArchivedObject *)self->_underlyingIntentResponse copyWithZone:a3];
  [(_INPBRunWorkflowIntentResponse *)v5 setUnderlyingIntentResponse:v8];

  uint64_t v9 = (void *)[(NSString *)self->_utterance copyWithZone:a3];
  [(_INPBRunWorkflowIntentResponse *)v5 setUtterance:v9];

  if ([(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume]) {
    [(_INPBRunWorkflowIntentResponse *)v5 setWaitingForResume:[(_INPBRunWorkflowIntentResponse *)self waitingForResume]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRunWorkflowIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRunWorkflowIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRunWorkflowIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRunWorkflowIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRunWorkflowIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBRunWorkflowIntentResponse *)self hasContinueRunning]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasRequestsIntentExecution]) {
    PBDataWriterWriteBOOLField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = self->_steps;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];

  if (v10)
  {
    uint64_t v11 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntent];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];

  if (v12)
  {
    v13 = [(_INPBRunWorkflowIntentResponse *)self underlyingIntentResponse];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBRunWorkflowIntentResponse *)self utterance];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBRunWorkflowIntentResponse *)self hasWaitingForResume]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunWorkflowIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasWaitingForResume:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWaitingForResume
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWaitingForResume:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int waitingForResume = a3;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (void)setUtterance:(id)a3
{
  self->_utterance = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasUnderlyingIntentResponse
{
  return self->_underlyingIntentResponse != 0;
}

- (void)setUnderlyingIntentResponse:(id)a3
{
}

- (BOOL)hasUnderlyingIntent
{
  return self->_underlyingIntent != 0;
}

- (void)setUnderlyingIntent:(id)a3
{
}

- (id)stepAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_steps objectAtIndexedSubscript:a3];
}

- (unint64_t)stepsCount
{
  return [(NSArray *)self->_steps count];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  steps = self->_steps;
  id v8 = v4;
  if (!steps)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_steps;
    self->_steps = v6;

    id v4 = v8;
    steps = self->_steps;
  }
  [(NSArray *)steps addObject:v4];
}

- (void)clearSteps
{
}

- (void)setSteps:(id)a3
{
  self->_steps = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasRequestsIntentExecution:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestsIntentExecution
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestsIntentExecution:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requestsIntentExecution = a3;
}

- (void)setHasContinueRunning:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContinueRunning
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContinueRunning:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int continueRunning = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

@end