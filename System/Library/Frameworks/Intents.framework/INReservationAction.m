@interface INReservationAction
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)validDuration;
- (INReservationAction)initWithCoder:(id)a3;
- (INReservationAction)initWithType:(INReservationActionType)type validDuration:(INDateComponentsRange *)validDuration userActivity:(NSUserActivity *)userActivity;
- (INReservationActionType)type;
- (NSString)description;
- (NSUserActivity)userActivity;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INReservationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);

  objc_storeStrong((id *)&self->_validDuration, 0);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (INDateComponentsRange)validDuration
{
  return self->_validDuration;
}

- (INReservationActionType)type
{
  return self->_type;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"type";
  v3 = [NSNumber numberWithInteger:self->_type];
  v11[0] = v3;
  v10[1] = @"validDuration";
  validDuration = self->_validDuration;
  v5 = validDuration;
  if (!validDuration)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v5;
  v10[2] = @"userActivity";
  userActivity = self->_userActivity;
  v7 = userActivity;
  if (!userActivity)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (userActivity)
  {
    if (validDuration) {
      goto LABEL_7;
    }
  }
  else
  {

    if (validDuration) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INReservationAction;
  v6 = [(INReservationAction *)&v11 description];
  v7 = [(INReservationAction *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INReservationAction *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  if (self->_type == 1) {
    v8 = @"checkIn";
  }
  else {
    v8 = @"unknown";
  }
  v9 = v8;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"type");

  v10 = [v6 encodeObject:self->_validDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"validDuration");

  objc_super v11 = INUserActivitySerializeToData(self->_userActivity);
  v12 = [v6 encodeObject:v11];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"userActivity");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_validDuration forKey:@"validDuration"];
  INUserActivitySerializeToData(self->_userActivity);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"userActivity"];
}

- (INReservationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validDuration"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];

  v8 = INUserActivityDeserializeFromData(v7);
  v9 = [(INReservationAction *)self initWithType:v5 validDuration:v6 userActivity:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INReservationAction *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v8 = 0;
      if (self->_type == v5->_type)
      {
        validDuration = self->_validDuration;
        if (validDuration == v5->_validDuration || -[INDateComponentsRange isEqual:](validDuration, "isEqual:"))
        {
          userActivity = self->_userActivity;
          if (userActivity == v5->_userActivity || -[NSUserActivity isEqual:](userActivity, "isEqual:")) {
            BOOL v8 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(INDateComponentsRange *)self->_validDuration hash];
  unint64_t v6 = v5 ^ [(NSUserActivity *)self->_userActivity hash] ^ v4;

  return v6;
}

- (INReservationAction)initWithType:(INReservationActionType)type validDuration:(INDateComponentsRange *)validDuration userActivity:(NSUserActivity *)userActivity
{
  BOOL v8 = validDuration;
  v9 = userActivity;
  v17.receiver = self;
  v17.super_class = (Class)INReservationAction;
  v10 = [(INReservationAction *)&v17 init];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_int64_t type = type;
    uint64_t v12 = [(INDateComponentsRange *)v8 copy];
    v13 = v11->_validDuration;
    v11->_validDuration = (INDateComponentsRange *)v12;

    uint64_t v14 = [(NSUserActivity *)v9 _intents_copy];
    v15 = v11->_userActivity;
    v11->_userActivity = (NSUserActivity *)v14;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v10 = [v9 isEqualToString:@"checkIn"];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v7 objectForKeyedSubscript:@"validDuration"];
  v13 = [v8 decodeObjectOfClass:v11 from:v12];

  uint64_t v14 = objc_opt_class();
  v15 = [v7 objectForKeyedSubscript:@"userActivity"];

  v16 = [v8 decodeObjectOfClass:v14 from:v15];

  objc_super v17 = INUserActivityDeserializeFromData(v16);
  v18 = (void *)[objc_alloc((Class)a1) initWithType:v10 validDuration:v13 userActivity:v17];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end