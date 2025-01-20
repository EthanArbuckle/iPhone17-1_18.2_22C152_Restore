@interface _INPBResumeWorkoutIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasWorkoutName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)workoutName;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBResumeWorkoutIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setWorkoutName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBResumeWorkoutIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutName, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBDataString)workoutName
{
  return self->_workoutName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBResumeWorkoutIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  v6 = [(_INPBResumeWorkoutIntent *)self workoutName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"workoutName"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(_INPBDataString *)self->_workoutName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBResumeWorkoutIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBResumeWorkoutIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBResumeWorkoutIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBResumeWorkoutIntent *)self workoutName];
  v6 = [v4 workoutName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBResumeWorkoutIntent *)self workoutName];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBResumeWorkoutIntent *)self workoutName];
    v15 = [v4 workoutName];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBResumeWorkoutIntent allocWithZone:](_INPBResumeWorkoutIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBResumeWorkoutIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_workoutName copyWithZone:a3];
  [(_INPBResumeWorkoutIntent *)v5 setWorkoutName:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBResumeWorkoutIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBResumeWorkoutIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBResumeWorkoutIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBResumeWorkoutIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBResumeWorkoutIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBResumeWorkoutIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBResumeWorkoutIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBResumeWorkoutIntent *)self workoutName];

  if (v6)
  {
    uint64_t v7 = [(_INPBResumeWorkoutIntent *)self workoutName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResumeWorkoutIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasWorkoutName
{
  return self->_workoutName != 0;
}

- (void)setWorkoutName:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end