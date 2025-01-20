@interface INEventParticipant
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INEventParticipant)initWithCoder:(id)a3;
- (INEventParticipant)initWithPerson:(id)a3 status:(int64_t)a4 isUser:(id)a5 isEventOrganizer:(id)a6;
- (INPerson)person;
- (NSNumber)isEventOrganizer;
- (NSNumber)isUser;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)status;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INEventParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEventOrganizer, 0);
  objc_storeStrong((id *)&self->_isUser, 0);

  objc_storeStrong((id *)&self->_person, 0);
}

- (NSNumber)isEventOrganizer
{
  return self->_isEventOrganizer;
}

- (NSNumber)isUser
{
  return self->_isUser;
}

- (int64_t)status
{
  return self->_status;
}

- (INPerson)person
{
  return self->_person;
}

- (id)_dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"person";
  person = self->_person;
  v4 = person;
  if (!person)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"status";
  v5 = [NSNumber numberWithInteger:self->_status];
  v13[1] = v5;
  v12[2] = @"isUser";
  isUser = self->_isUser;
  v7 = isUser;
  if (!isUser)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v7;
  v12[3] = @"isEventOrganizer";
  isEventOrganizer = self->_isEventOrganizer;
  v9 = isEventOrganizer;
  if (!isEventOrganizer)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (isEventOrganizer)
  {
    if (isUser) {
      goto LABEL_9;
    }
  }
  else
  {

    if (isUser) {
      goto LABEL_9;
    }
  }

LABEL_9:
  if (!person) {

  }
  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INEventParticipant;
  v6 = [(INEventParticipant *)&v11 description];
  v7 = [(INEventParticipant *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INEventParticipant *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_person];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"person");

  unint64_t v9 = self->_status - 1;
  if (v9 > 6) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E551EE90[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"status");

  v12 = [v6 encodeObject:self->_isUser];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"isUser");

  v13 = [v6 encodeObject:self->_isEventOrganizer];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"isEventOrganizer");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  person = self->_person;
  id v5 = a3;
  [v5 encodeObject:person forKey:@"person"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_isUser forKey:@"isUser"];
  [v5 encodeObject:self->_isEventOrganizer forKey:@"isEventOrganizer"];
}

- (INEventParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"person"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"status"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isUser"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isEventOrganizer"];

  unint64_t v9 = [(INEventParticipant *)self initWithPerson:v5 status:v6 isUser:v7 isEventOrganizer:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INEventParticipant *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      person = self->_person;
      BOOL v9 = 0;
      if ((person == v5->_person || -[INPerson isEqual:](person, "isEqual:")) && self->_status == v5->_status)
      {
        isUser = self->_isUser;
        if (isUser == v5->_isUser || -[NSNumber isEqual:](isUser, "isEqual:"))
        {
          isEventOrganizer = self->_isEventOrganizer;
          if (isEventOrganizer == v5->_isEventOrganizer
            || -[NSNumber isEqual:](isEventOrganizer, "isEqual:"))
          {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPerson *)self->_person hash];
  id v4 = [NSNumber numberWithInteger:self->_status];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v3 ^ [(NSNumber *)self->_isUser hash];
  unint64_t v7 = v5 ^ v6 ^ [(NSNumber *)self->_isEventOrganizer hash];

  return v7;
}

- (INEventParticipant)initWithPerson:(id)a3 status:(int64_t)a4 isUser:(id)a5 isEventOrganizer:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)INEventParticipant;
  v13 = [(INEventParticipant *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    person = v13->_person;
    v13->_person = (INPerson *)v14;

    v13->_status = a4;
    uint64_t v16 = [v11 copy];
    isUser = v13->_isUser;
    v13->_isUser = (NSNumber *)v16;

    uint64_t v18 = [v12 copy];
    isEventOrganizer = v13->_isEventOrganizer;
    v13->_isEventOrganizer = (NSNumber *)v18;
  }
  return v13;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"person"];
    id v11 = [v7 decodeObjectOfClass:v9 from:v10];

    id v12 = [v8 objectForKeyedSubscript:@"status"];
    uint64_t v13 = INEventParticipantStatusWithString(v12);

    uint64_t v14 = [v8 objectForKeyedSubscript:@"isUser"];
    v15 = [v8 objectForKeyedSubscript:@"isEventOrganizer"];
    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithPerson:v11 status:v13 isUser:v14 isEventOrganizer:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  id v5 = [(INEventParticipant *)self person];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INEventParticipant *)self person];
  id v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  if ([v3 count]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end