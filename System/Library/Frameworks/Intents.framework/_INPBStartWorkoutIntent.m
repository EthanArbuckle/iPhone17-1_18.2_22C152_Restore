@interface _INPBStartWorkoutIntent
+ (BOOL)supportsSecureCoding;
+ (Class)associatedItemsType;
- (BOOL)hasCustomization;
- (BOOL)hasGoalValue;
- (BOOL)hasIntentMetadata;
- (BOOL)hasIsBuiltInWorkoutType;
- (BOOL)hasIsOpenEnded;
- (BOOL)hasIsVoiceOnly;
- (BOOL)hasSequenceLabel;
- (BOOL)hasWorkoutGoalUnitType;
- (BOOL)hasWorkoutLocationType;
- (BOOL)hasWorkoutName;
- (BOOL)isBuiltInWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpenEnded;
- (BOOL)isVoiceOnly;
- (BOOL)readFrom:(id)a3;
- (NSArray)associatedItems;
- (_INPBDataString)workoutName;
- (_INPBDouble)goalValue;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBStartWorkoutIntent)initWithCoder:(id)a3;
- (_INPBWorkoutCustomization)customization;
- (id)associatedItemsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)sequenceLabelAsString:(int)a3;
- (id)workoutGoalUnitTypeAsString:(int)a3;
- (id)workoutLocationTypeAsString:(int)a3;
- (int)StringAsSequenceLabel:(id)a3;
- (int)StringAsWorkoutGoalUnitType:(id)a3;
- (int)StringAsWorkoutLocationType:(id)a3;
- (int)sequenceLabel;
- (int)workoutGoalUnitType;
- (int)workoutLocationType;
- (unint64_t)associatedItemsCount;
- (unint64_t)hash;
- (void)addAssociatedItems:(id)a3;
- (void)clearAssociatedItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedItems:(id)a3;
- (void)setCustomization:(id)a3;
- (void)setGoalValue:(id)a3;
- (void)setHasIsBuiltInWorkoutType:(BOOL)a3;
- (void)setHasIsOpenEnded:(BOOL)a3;
- (void)setHasIsVoiceOnly:(BOOL)a3;
- (void)setHasSequenceLabel:(BOOL)a3;
- (void)setHasWorkoutGoalUnitType:(BOOL)a3;
- (void)setHasWorkoutLocationType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setIsBuiltInWorkoutType:(BOOL)a3;
- (void)setIsOpenEnded:(BOOL)a3;
- (void)setIsVoiceOnly:(BOOL)a3;
- (void)setSequenceLabel:(int)a3;
- (void)setWorkoutGoalUnitType:(int)a3;
- (void)setWorkoutLocationType:(int)a3;
- (void)setWorkoutName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartWorkoutIntent

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_associatedItems count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = self->_associatedItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"associatedItems"];
  }
  v11 = [(_INPBStartWorkoutIntent *)self customization];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"customization"];

  v13 = [(_INPBStartWorkoutIntent *)self goalValue];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"goalValue"];

  v15 = [(_INPBStartWorkoutIntent *)self intentMetadata];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType])
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartWorkoutIntent isBuiltInWorkoutType](self, "isBuiltInWorkoutType"));
    [v3 setObject:v17 forKeyedSubscript:@"isBuiltInWorkoutType"];
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsOpenEnded])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartWorkoutIntent isOpenEnded](self, "isOpenEnded"));
    [v3 setObject:v18 forKeyedSubscript:@"isOpenEnded"];
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsVoiceOnly])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartWorkoutIntent isVoiceOnly](self, "isVoiceOnly"));
    [v3 setObject:v19 forKeyedSubscript:@"isVoiceOnly"];
  }
  if ([(_INPBStartWorkoutIntent *)self hasSequenceLabel])
  {
    uint64_t v20 = [(_INPBStartWorkoutIntent *)self sequenceLabel];
    if (v20)
    {
      if (v20 == 1)
      {
        v21 = @"next";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = @"last";
    }
    [v3 setObject:v21 forKeyedSubscript:@"sequenceLabel"];
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType])
  {
    uint64_t v22 = [(_INPBStartWorkoutIntent *)self workoutGoalUnitType];
    if (v22 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E551C188[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"workoutGoalUnitType"];
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutLocationType])
  {
    uint64_t v24 = [(_INPBStartWorkoutIntent *)self workoutLocationType];
    if (v24)
    {
      if (v24 == 1)
      {
        v25 = @"INDOOR";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = @"OUTDOOR";
    }
    [v3 setObject:v25 forKeyedSubscript:@"workoutLocationType"];
  }
  v26 = [(_INPBStartWorkoutIntent *)self workoutName];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"workoutName"];

  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_associatedItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBStartWorkoutIntent *)self customization];

  if (v10)
  {
    v11 = [(_INPBStartWorkoutIntent *)self customization];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(_INPBStartWorkoutIntent *)self goalValue];

  if (v12)
  {
    v13 = [(_INPBStartWorkoutIntent *)self goalValue];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBStartWorkoutIntent *)self intentMetadata];

  if (v14)
  {
    v15 = [(_INPBStartWorkoutIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsOpenEnded]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsVoiceOnly]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBStartWorkoutIntent *)self hasSequenceLabel]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutLocationType]) {
    PBDataWriterWriteInt32Field();
  }
  v16 = [(_INPBStartWorkoutIntent *)self workoutName];

  if (v16)
  {
    v17 = [(_INPBStartWorkoutIntent *)self workoutName];
    PBDataWriterWriteSubmessage();
  }
}

- (unint64_t)hash
{
  uint64_t v13 = [(NSArray *)self->_associatedItems hash];
  unint64_t v3 = [(_INPBWorkoutCustomization *)self->_customization hash];
  unint64_t v4 = [(_INPBDouble *)self->_goalValue hash];
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType]) {
    uint64_t v6 = 2654435761 * self->_isBuiltInWorkoutType;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsOpenEnded]) {
    uint64_t v7 = 2654435761 * self->_isOpenEnded;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsVoiceOnly]) {
    uint64_t v8 = 2654435761 * self->_isVoiceOnly;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(_INPBStartWorkoutIntent *)self hasSequenceLabel]) {
    uint64_t v9 = 2654435761 * self->_sequenceLabel;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType]) {
    uint64_t v10 = 2654435761 * self->_workoutGoalUnitType;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutLocationType]) {
    uint64_t v11 = 2654435761 * self->_workoutLocationType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_INPBDataString *)self->_workoutName hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_goalValue, 0);
  objc_storeStrong((id *)&self->_customization, 0);

  objc_storeStrong((id *)&self->_associatedItems, 0);
}

- (_INPBDataString)workoutName
{
  return self->_workoutName;
}

- (int)workoutLocationType
{
  return self->_workoutLocationType;
}

- (int)workoutGoalUnitType
{
  return self->_workoutGoalUnitType;
}

- (int)sequenceLabel
{
  return self->_sequenceLabel;
}

- (BOOL)isVoiceOnly
{
  return self->_isVoiceOnly;
}

- (BOOL)isOpenEnded
{
  return self->_isOpenEnded;
}

- (BOOL)isBuiltInWorkoutType
{
  return self->_isBuiltInWorkoutType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDouble)goalValue
{
  return self->_goalValue;
}

- (_INPBWorkoutCustomization)customization
{
  return self->_customization;
}

- (NSArray)associatedItems
{
  return self->_associatedItems;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  unint64_t v5 = [(_INPBStartWorkoutIntent *)self associatedItems];
  uint64_t v6 = [v4 associatedItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v7 = [(_INPBStartWorkoutIntent *)self associatedItems];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBStartWorkoutIntent *)self associatedItems];
    uint64_t v10 = [v4 associatedItems];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBStartWorkoutIntent *)self customization];
  uint64_t v6 = [v4 customization];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v12 = [(_INPBStartWorkoutIntent *)self customization];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBStartWorkoutIntent *)self customization];
    v15 = [v4 customization];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBStartWorkoutIntent *)self goalValue];
  uint64_t v6 = [v4 goalValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v17 = [(_INPBStartWorkoutIntent *)self goalValue];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBStartWorkoutIntent *)self goalValue];
    long long v20 = [v4 goalValue];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBStartWorkoutIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v22 = [(_INPBStartWorkoutIntent *)self intentMetadata];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_INPBStartWorkoutIntent *)self intentMetadata];
    v25 = [v4 intentMetadata];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int v27 = [(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType];
  if (v27 != [v4 hasIsBuiltInWorkoutType]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType])
  {
    if ([v4 hasIsBuiltInWorkoutType])
    {
      int isBuiltInWorkoutType = self->_isBuiltInWorkoutType;
      if (isBuiltInWorkoutType != [v4 isBuiltInWorkoutType]) {
        goto LABEL_51;
      }
    }
  }
  int v29 = [(_INPBStartWorkoutIntent *)self hasIsOpenEnded];
  if (v29 != [v4 hasIsOpenEnded]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsOpenEnded])
  {
    if ([v4 hasIsOpenEnded])
    {
      int isOpenEnded = self->_isOpenEnded;
      if (isOpenEnded != [v4 isOpenEnded]) {
        goto LABEL_51;
      }
    }
  }
  int v31 = [(_INPBStartWorkoutIntent *)self hasIsVoiceOnly];
  if (v31 != [v4 hasIsVoiceOnly]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsVoiceOnly])
  {
    if ([v4 hasIsVoiceOnly])
    {
      int isVoiceOnly = self->_isVoiceOnly;
      if (isVoiceOnly != [v4 isVoiceOnly]) {
        goto LABEL_51;
      }
    }
  }
  int v33 = [(_INPBStartWorkoutIntent *)self hasSequenceLabel];
  if (v33 != [v4 hasSequenceLabel]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasSequenceLabel])
  {
    if ([v4 hasSequenceLabel])
    {
      int sequenceLabel = self->_sequenceLabel;
      if (sequenceLabel != [v4 sequenceLabel]) {
        goto LABEL_51;
      }
    }
  }
  int v35 = [(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType];
  if (v35 != [v4 hasWorkoutGoalUnitType]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType])
  {
    if ([v4 hasWorkoutGoalUnitType])
    {
      int workoutGoalUnitType = self->_workoutGoalUnitType;
      if (workoutGoalUnitType != [v4 workoutGoalUnitType]) {
        goto LABEL_51;
      }
    }
  }
  int v37 = [(_INPBStartWorkoutIntent *)self hasWorkoutLocationType];
  if (v37 != [v4 hasWorkoutLocationType]) {
    goto LABEL_51;
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutLocationType])
  {
    if ([v4 hasWorkoutLocationType])
    {
      int workoutLocationType = self->_workoutLocationType;
      if (workoutLocationType != [v4 workoutLocationType]) {
        goto LABEL_51;
      }
    }
  }
  unint64_t v5 = [(_INPBStartWorkoutIntent *)self workoutName];
  uint64_t v6 = [v4 workoutName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v39 = [(_INPBStartWorkoutIntent *)self workoutName];
    if (!v39)
    {

LABEL_54:
      BOOL v44 = 1;
      goto LABEL_52;
    }
    v40 = (void *)v39;
    v41 = [(_INPBStartWorkoutIntent *)self workoutName];
    v42 = [v4 workoutName];
    char v43 = [v41 isEqual:v42];

    if (v43) {
      goto LABEL_54;
    }
  }
  else
  {
LABEL_50:
  }
LABEL_51:
  BOOL v44 = 0;
LABEL_52:

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBStartWorkoutIntent allocWithZone:](_INPBStartWorkoutIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_associatedItems copyWithZone:a3];
  [(_INPBStartWorkoutIntent *)v5 setAssociatedItems:v6];

  id v7 = [(_INPBWorkoutCustomization *)self->_customization copyWithZone:a3];
  [(_INPBStartWorkoutIntent *)v5 setCustomization:v7];

  id v8 = [(_INPBDouble *)self->_goalValue copyWithZone:a3];
  [(_INPBStartWorkoutIntent *)v5 setGoalValue:v8];

  id v9 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBStartWorkoutIntent *)v5 setIntentMetadata:v9];

  if ([(_INPBStartWorkoutIntent *)self hasIsBuiltInWorkoutType]) {
    [(_INPBStartWorkoutIntent *)v5 setIsBuiltInWorkoutType:[(_INPBStartWorkoutIntent *)self isBuiltInWorkoutType]];
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsOpenEnded]) {
    [(_INPBStartWorkoutIntent *)v5 setIsOpenEnded:[(_INPBStartWorkoutIntent *)self isOpenEnded]];
  }
  if ([(_INPBStartWorkoutIntent *)self hasIsVoiceOnly]) {
    [(_INPBStartWorkoutIntent *)v5 setIsVoiceOnly:[(_INPBStartWorkoutIntent *)self isVoiceOnly]];
  }
  if ([(_INPBStartWorkoutIntent *)self hasSequenceLabel]) {
    [(_INPBStartWorkoutIntent *)v5 setSequenceLabel:[(_INPBStartWorkoutIntent *)self sequenceLabel]];
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutGoalUnitType]) {
    [(_INPBStartWorkoutIntent *)v5 setWorkoutGoalUnitType:[(_INPBStartWorkoutIntent *)self workoutGoalUnitType]];
  }
  if ([(_INPBStartWorkoutIntent *)self hasWorkoutLocationType]) {
    [(_INPBStartWorkoutIntent *)v5 setWorkoutLocationType:[(_INPBStartWorkoutIntent *)self workoutLocationType]];
  }
  id v10 = [(_INPBDataString *)self->_workoutName copyWithZone:a3];
  [(_INPBStartWorkoutIntent *)v5 setWorkoutName:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartWorkoutIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartWorkoutIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartWorkoutIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartWorkoutIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartWorkoutIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartWorkoutIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasWorkoutName
{
  return self->_workoutName != 0;
}

- (void)setWorkoutName:(id)a3
{
}

- (int)StringAsWorkoutLocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OUTDOOR"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"INDOOR"];
  }

  return v4;
}

- (id)workoutLocationTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"INDOOR";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"OUTDOOR";
  }
  return v4;
}

- (void)setHasWorkoutLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWorkoutLocationType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setWorkoutLocationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int workoutLocationType = a3;
  }
}

- (int)StringAsWorkoutGoalUnitType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Inch"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Meter"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Foot"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Mile"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Yard"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Second"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Minute"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Hour"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Joule"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KiloCalorie"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)workoutGoalUnitTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C188[a3];
  }

  return v3;
}

- (void)setHasWorkoutGoalUnitType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWorkoutGoalUnitType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWorkoutGoalUnitType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int workoutGoalUnitType = a3;
  }
}

- (int)StringAsSequenceLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"last"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"next"];
  }

  return v4;
}

- (id)sequenceLabelAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"next";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"last";
  }
  return v4;
}

- (void)setHasSequenceLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSequenceLabel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSequenceLabel:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int sequenceLabel = a3;
  }
}

- (void)setHasIsVoiceOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsVoiceOnly
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsVoiceOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isVoiceOnly = a3;
}

- (void)setHasIsOpenEnded:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsOpenEnded
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsOpenEnded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isOpenEnded = a3;
}

- (void)setHasIsBuiltInWorkoutType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsBuiltInWorkoutType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsBuiltInWorkoutType:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isBuiltInWorkoutType = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasGoalValue
{
  return self->_goalValue != 0;
}

- (void)setGoalValue:(id)a3
{
}

- (BOOL)hasCustomization
{
  return self->_customization != 0;
}

- (void)setCustomization:(id)a3
{
}

- (id)associatedItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_associatedItems objectAtIndexedSubscript:a3];
}

- (unint64_t)associatedItemsCount
{
  return [(NSArray *)self->_associatedItems count];
}

- (void)addAssociatedItems:(id)a3
{
  id v4 = a3;
  associatedItems = self->_associatedItems;
  id v8 = v4;
  if (!associatedItems)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_associatedItems;
    self->_associatedItems = v6;

    id v4 = v8;
    associatedItems = self->_associatedItems;
  }
  [(NSArray *)associatedItems addObject:v4];
}

- (void)clearAssociatedItems
{
}

- (void)setAssociatedItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  associatedItems = self->_associatedItems;
  self->_associatedItems = v4;

  MEMORY[0x1F41817F8](v4, associatedItems);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)associatedItemsType
{
  return (Class)objc_opt_class();
}

@end