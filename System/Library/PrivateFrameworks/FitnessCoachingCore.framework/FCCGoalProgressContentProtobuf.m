@interface FCCGoalProgressContentProtobuf
- (BOOL)hasEventIdentifier;
- (BOOL)hasExpectedGoalValue;
- (BOOL)hasGoalTypeToHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventIdentifier;
- (double)expectedGoalValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)goalTypeToHighlight;
- (int)goalTypesToDisplayAtIndex:(unint64_t)a3;
- (int)goalTypesToDisplays;
- (unint64_t)goalTypesToDisplaysCount;
- (unint64_t)hash;
- (void)addGoalTypesToDisplay:(int)a3;
- (void)clearGoalTypesToDisplays;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setExpectedGoalValue:(double)a3;
- (void)setGoalTypeToHighlight:(int)a3;
- (void)setGoalTypesToDisplays:(int *)a3 count:(unint64_t)a4;
- (void)setHasExpectedGoalValue:(BOOL)a3;
- (void)setHasGoalTypeToHighlight:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCGoalProgressContentProtobuf

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCGoalProgressContentProtobuf;
  [(FCCGoalProgressContentProtobuf *)&v3 dealloc];
}

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (unint64_t)goalTypesToDisplaysCount
{
  return self->_goalTypesToDisplays.count;
}

- (int)goalTypesToDisplays
{
  return self->_goalTypesToDisplays.list;
}

- (void)clearGoalTypesToDisplays
{
}

- (void)addGoalTypesToDisplay:(int)a3
{
}

- (int)goalTypesToDisplayAtIndex:(unint64_t)a3
{
  p_goalTypesToDisplays = &self->_goalTypesToDisplays;
  unint64_t count = self->_goalTypesToDisplays.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_goalTypesToDisplays->list[a3];
}

- (void)setGoalTypesToDisplays:(int *)a3 count:(unint64_t)a4
{
}

- (void)setGoalTypeToHighlight:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_goalTypeToHighlight = a3;
}

- (void)setHasGoalTypeToHighlight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGoalTypeToHighlight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setExpectedGoalValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expectedGoalValue = a3;
}

- (void)setHasExpectedGoalValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedGoalValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCGoalProgressContentProtobuf;
  v4 = [(FCCGoalProgressContentProtobuf *)&v8 description];
  v5 = [(FCCGoalProgressContentProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  eventIdentifier = self->_eventIdentifier;
  if (eventIdentifier) {
    [v3 setObject:eventIdentifier forKey:@"eventIdentifier"];
  }
  v6 = PBRepeatedInt32NSArray();
  [v4 setObject:v6 forKey:@"goalTypesToDisplay"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_goalTypeToHighlight];
    [v4 setObject:v8 forKey:@"goalTypeToHighlight"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_expectedGoalValue];
    [v4 setObject:v9 forKey:@"expectedGoalValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalProgressContentProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_goalTypesToDisplays.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_goalTypesToDisplays.count);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_eventIdentifier) {
    objc_msgSend(v8, "setEventIdentifier:");
  }
  if ([(FCCGoalProgressContentProtobuf *)self goalTypesToDisplaysCount])
  {
    [v8 clearGoalTypesToDisplays];
    unint64_t v4 = [(FCCGoalProgressContentProtobuf *)self goalTypesToDisplaysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addGoalTypesToDisplay:", -[FCCGoalProgressContentProtobuf goalTypesToDisplayAtIndex:](self, "goalTypesToDisplayAtIndex:", i));
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_goalTypeToHighlight;
    *((unsigned char *)v8 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v8 + 4) = *(void *)&self->_expectedGoalValue;
    *((unsigned char *)v8 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_eventIdentifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  PBRepeatedInt32Copy();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_goalTypeToHighlight;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 32) = self->_expectedGoalValue;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  eventIdentifier = self->_eventIdentifier;
  if ((unint64_t)eventIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](eventIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_goalTypeToHighlight != *((_DWORD *)v4 + 12)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_expectedGoalValue != *((double *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventIdentifier hash];
  uint64_t v4 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_goalTypeToHighlight;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double expectedGoalValue = self->_expectedGoalValue;
  double v7 = -expectedGoalValue;
  if (expectedGoalValue >= 0.0) {
    double v7 = self->_expectedGoalValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  id v9 = v4;
  if (v4[5])
  {
    -[FCCGoalProgressContentProtobuf setEventIdentifier:](self, "setEventIdentifier:");
    uint64_t v4 = v9;
  }
  uint64_t v5 = [v4 goalTypesToDisplaysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[FCCGoalProgressContentProtobuf addGoalTypesToDisplay:](self, "addGoalTypesToDisplay:", [v9 goalTypesToDisplayAtIndex:i]);
  }
  char v8 = *((unsigned char *)v9 + 52);
  if ((v8 & 2) != 0)
  {
    self->_goalTypeToHighlight = *((_DWORD *)v9 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v9 + 52);
  }
  if (v8)
  {
    self->_double expectedGoalValue = *((double *)v9 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (int)goalTypeToHighlight
{
  return self->_goalTypeToHighlight;
}

- (double)expectedGoalValue
{
  return self->_expectedGoalValue;
}

- (void).cxx_destruct
{
}

@end