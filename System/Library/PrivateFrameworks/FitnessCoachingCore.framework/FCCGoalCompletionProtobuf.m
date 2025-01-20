@interface FCCGoalCompletionProtobuf
- (BOOL)hasActivitySummaryIndex;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)completedGoalTypes;
- (int)completedGoalTypesAtIndex:(unint64_t)a3;
- (int64_t)activitySummaryIndex;
- (unint64_t)completedGoalTypesCount;
- (unint64_t)hash;
- (void)addCompletedGoalTypes:(int)a3;
- (void)clearCompletedGoalTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivitySummaryIndex:(int64_t)a3;
- (void)setCompletedGoalTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasActivitySummaryIndex:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCGoalCompletionProtobuf

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCGoalCompletionProtobuf;
  [(FCCGoalCompletionProtobuf *)&v3 dealloc];
}

- (void)setActivitySummaryIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activitySummaryIndex = a3;
}

- (void)setHasActivitySummaryIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivitySummaryIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (unint64_t)completedGoalTypesCount
{
  return self->_completedGoalTypes.count;
}

- (int)completedGoalTypes
{
  return self->_completedGoalTypes.list;
}

- (void)clearCompletedGoalTypes
{
}

- (void)addCompletedGoalTypes:(int)a3
{
}

- (int)completedGoalTypesAtIndex:(unint64_t)a3
{
  p_completedGoalTypes = &self->_completedGoalTypes;
  unint64_t count = self->_completedGoalTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_completedGoalTypes->list[a3];
}

- (void)setCompletedGoalTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCGoalCompletionProtobuf;
  v4 = [(FCCGoalCompletionProtobuf *)&v8 description];
  v5 = [(FCCGoalCompletionProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_activitySummaryIndex];
    [v3 setObject:v4 forKey:@"activitySummaryIndex"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  v6 = PBRepeatedInt32NSArray();
  [v3 setObject:v6 forKey:@"completedGoalTypes"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalCompletionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  p_completedGoalTypes = &self->_completedGoalTypes;
  if (p_completedGoalTypes->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_completedGoalTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_activitySummaryIndex;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v8 = v4;
  if (self->_identifier) {
    objc_msgSend(v4, "setIdentifier:");
  }
  if ([(FCCGoalCompletionProtobuf *)self completedGoalTypesCount])
  {
    [v8 clearCompletedGoalTypes];
    unint64_t v5 = [(FCCGoalCompletionProtobuf *)self completedGoalTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addCompletedGoalTypes:", -[FCCGoalCompletionProtobuf completedGoalTypesAtIndex:](self, "completedGoalTypesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 32) = self->_activitySummaryIndex;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  id v8 = (void *)v6[5];
  v6[5] = v7;

  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_activitySummaryIndex != *((void *)v4 + 4)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_10:
    char IsEqual = 0;
    goto LABEL_11;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_10;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_activitySummaryIndex;
  }
  else {
    uint64_t v2 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return v3 ^ v2 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_activitySummaryIndex = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v8 = v4;
  if (v4[5])
  {
    -[FCCGoalCompletionProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v8;
  }
  uint64_t v5 = [v4 completedGoalTypesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[FCCGoalCompletionProtobuf addCompletedGoalTypes:](self, "addCompletedGoalTypes:", [v8 completedGoalTypesAtIndex:i]);
  }
}

- (int64_t)activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end