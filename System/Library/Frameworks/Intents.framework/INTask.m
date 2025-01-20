@interface INTask
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INContactEventTrigger)contactEventTrigger;
- (INSpatialEventTrigger)spatialEventTrigger;
- (INSpeakableString)title;
- (INTask)init;
- (INTask)initWithCoder:(id)a3;
- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier;
- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier priority:(INTaskPriority)priority;
- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 contactEventTrigger:(id)a11 taskReference:(int64_t)a12;
- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 priority:(int64_t)a11 contactEventTrigger:(id)a12 taskReference:(int64_t)a13 parentIdentifier:(id)a14;
- (INTaskPriority)priority;
- (INTaskStatus)status;
- (INTaskType)taskType;
- (INTemporalEventTrigger)temporalEventTrigger;
- (NSDateComponents)createdDateComponents;
- (NSDateComponents)modifiedDateComponents;
- (NSString)description;
- (NSString)identifier;
- (NSString)parentIdentifier;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)taskReference;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTask

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INTask *)self title];
  v7 = objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (int64_t)taskReference
{
  return self->_taskReference;
}

- (INContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (INTaskPriority)priority
{
  return self->_priority;
}

- (INTaskType)taskType
{
  return self->_taskType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDateComponents)modifiedDateComponents
{
  return self->_modifiedDateComponents;
}

- (NSDateComponents)createdDateComponents
{
  return self->_createdDateComponents;
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (INSpatialEventTrigger)spatialEventTrigger
{
  return self->_spatialEventTrigger;
}

- (INTaskStatus)status
{
  return self->_status;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (id)_dictionaryRepresentation
{
  v32[12] = *MEMORY[0x1E4F143B8];
  uint64_t title = (uint64_t)self->_title;
  uint64_t v30 = title;
  v31[0] = @"title";
  if (!title)
  {
    uint64_t title = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)title;
  v32[0] = title;
  v31[1] = @"status";
  v29 = [NSNumber numberWithInteger:self->_status];
  v32[1] = v29;
  v31[2] = @"spatialEventTrigger";
  uint64_t spatialEventTrigger = (uint64_t)self->_spatialEventTrigger;
  uint64_t v28 = spatialEventTrigger;
  if (!spatialEventTrigger)
  {
    uint64_t spatialEventTrigger = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)spatialEventTrigger;
  v32[2] = spatialEventTrigger;
  v31[3] = @"temporalEventTrigger";
  uint64_t temporalEventTrigger = (uint64_t)self->_temporalEventTrigger;
  uint64_t v27 = temporalEventTrigger;
  if (!temporalEventTrigger)
  {
    uint64_t temporalEventTrigger = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)temporalEventTrigger;
  v32[3] = temporalEventTrigger;
  v31[4] = @"createdDateComponents";
  createdDateComponents = self->_createdDateComponents;
  uint64_t v7 = (uint64_t)createdDateComponents;
  if (!createdDateComponents)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v32[4] = v7;
  v31[5] = @"modifiedDateComponents";
  modifiedDateComponents = self->_modifiedDateComponents;
  uint64_t v9 = (uint64_t)modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v32[5] = v9;
  v31[6] = @"identifier";
  identifier = self->_identifier;
  uint64_t v11 = (uint64_t)identifier;
  if (!identifier)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v11;
  v32[6] = v11;
  v31[7] = @"taskType";
  v12 = [NSNumber numberWithInteger:self->_taskType];
  v32[7] = v12;
  v31[8] = @"priority";
  v13 = [NSNumber numberWithInteger:self->_priority];
  v32[8] = v13;
  v31[9] = @"contactEventTrigger";
  contactEventTrigger = self->_contactEventTrigger;
  v15 = contactEventTrigger;
  if (!contactEventTrigger)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[9] = v15;
  v31[10] = @"taskReference";
  v16 = [NSNumber numberWithInteger:self->_taskReference];
  v32[10] = v16;
  v31[11] = @"parentIdentifier";
  parentIdentifier = self->_parentIdentifier;
  v18 = parentIdentifier;
  if (!parentIdentifier)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[11] = v18;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
  if (!parentIdentifier) {

  }
  if (!contactEventTrigger) {
  if (identifier)
  }
  {
    if (modifiedDateComponents) {
      goto LABEL_23;
    }
LABEL_34:

    if (createdDateComponents) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }

  if (!modifiedDateComponents) {
    goto LABEL_34;
  }
LABEL_23:
  if (createdDateComponents) {
    goto LABEL_24;
  }
LABEL_35:

LABEL_24:
  if (!v27) {

  }
  if (!v28) {
  if (!v30)
  }

  return v26;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTask;
  v6 = [(INTask *)&v11 description];
  uint64_t v7 = [(INTask *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTask *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"title");

  int64_t status = self->_status;
  v10 = @"unknown";
  if (status == 2) {
    v10 = @"completed";
  }
  if (status == 1) {
    objc_super v11 = @"notCompleted";
  }
  else {
    objc_super v11 = v10;
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"status");

  v13 = [v6 encodeObject:self->_spatialEventTrigger];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"spatialEventTrigger");

  v14 = [v6 encodeObject:self->_temporalEventTrigger];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"temporalEventTrigger");

  v15 = [v6 encodeObject:self->_createdDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"createdDateComponents");

  v16 = [v6 encodeObject:self->_modifiedDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"modifiedDateComponents");

  v17 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"identifier");

  int64_t taskType = self->_taskType;
  v19 = @"unknown";
  if (taskType == 2) {
    v19 = @"completable";
  }
  if (taskType == 1) {
    v20 = @"notCompletable";
  }
  else {
    v20 = v19;
  }
  v21 = v20;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"taskType");

  int64_t priority = self->_priority;
  v23 = @"unknown";
  if (priority == 2) {
    v23 = @"flagged";
  }
  if (priority == 1) {
    v24 = @"notFlagged";
  }
  else {
    v24 = v23;
  }
  v25 = v24;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"priority");

  id v26 = [v6 encodeObject:self->_contactEventTrigger];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, @"contactEventTrigger");

  if (self->_taskReference == 1) {
    uint64_t v27 = @"currentActivity";
  }
  else {
    uint64_t v27 = @"unknown";
  }
  uint64_t v28 = v27;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v28, @"taskReference");

  v29 = [v6 encodeObject:self->_parentIdentifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v29, @"parentIdentifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_spatialEventTrigger forKey:@"spatialEventTrigger"];
  [v5 encodeObject:self->_temporalEventTrigger forKey:@"temporalEventTrigger"];
  [v5 encodeObject:self->_createdDateComponents forKey:@"createdDateComponents"];
  [v5 encodeObject:self->_modifiedDateComponents forKey:@"modifiedDateComponents"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_taskType forKey:@"taskType"];
  [v5 encodeInteger:self->_priority forKey:@"priority"];
  [v5 encodeObject:self->_contactEventTrigger forKey:@"contactEventTrigger"];
  [v5 encodeInteger:self->_taskReference forKey:@"taskReference"];
  [v5 encodeObject:self->_parentIdentifier forKey:@"parentIdentifier"];
}

- (INTask)initWithCoder:(id)a3
{
  id v3 = a3;
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v22 = [v3 decodeIntegerForKey:@"status"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"spatialEventTrigger"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"temporalEventTrigger"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"createdDateComponents"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedDateComponents"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v3 decodeObjectOfClasses:v8 forKey:@"identifier"];

  uint64_t v10 = [v3 decodeIntegerForKey:@"taskType"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"priority"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contactEventTrigger"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"taskReference"];
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"parentIdentifier"];

  v18 = [(INTask *)self initWithTitle:v23 status:v22 taskType:v10 spatialEventTrigger:v21 temporalEventTrigger:v20 createdDateComponents:v4 modifiedDateComponents:v5 identifier:v9 priority:v11 contactEventTrigger:v12 taskReference:v13 parentIdentifier:v17];
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INTask *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t title = self->_title;
      BOOL v14 = 0;
      if ((title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:")) && self->_status == v5->_status)
      {
        uint64_t spatialEventTrigger = self->_spatialEventTrigger;
        if (spatialEventTrigger == v5->_spatialEventTrigger
          || -[INSpatialEventTrigger isEqual:](spatialEventTrigger, "isEqual:"))
        {
          uint64_t temporalEventTrigger = self->_temporalEventTrigger;
          if (temporalEventTrigger == v5->_temporalEventTrigger
            || -[INTemporalEventTrigger isEqual:](temporalEventTrigger, "isEqual:"))
          {
            createdDateComponents = self->_createdDateComponents;
            if (createdDateComponents == v5->_createdDateComponents
              || -[NSDateComponents isEqual:](createdDateComponents, "isEqual:"))
            {
              modifiedDateComponents = self->_modifiedDateComponents;
              if (modifiedDateComponents == v5->_modifiedDateComponents
                || -[NSDateComponents isEqual:](modifiedDateComponents, "isEqual:"))
              {
                identifier = self->_identifier;
                if ((identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
                  && self->_taskType == v5->_taskType
                  && self->_priority == v5->_priority)
                {
                  contactEventTrigger = self->_contactEventTrigger;
                  if ((contactEventTrigger == v5->_contactEventTrigger
                     || -[INContactEventTrigger isEqual:](contactEventTrigger, "isEqual:"))
                    && self->_taskReference == v5->_taskReference)
                  {
                    parentIdentifier = self->_parentIdentifier;
                    if (parentIdentifier == v5->_parentIdentifier
                      || -[NSString isEqual:](parentIdentifier, "isEqual:"))
                    {
                      BOOL v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_title hash];
  v4 = [NSNumber numberWithInteger:self->_status];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v3 ^ [(INSpatialEventTrigger *)self->_spatialEventTrigger hash];
  unint64_t v7 = v5 ^ v6 ^ [(INTemporalEventTrigger *)self->_temporalEventTrigger hash];
  uint64_t v8 = [(NSDateComponents *)self->_createdDateComponents hash];
  uint64_t v9 = v8 ^ [(NSDateComponents *)self->_modifiedDateComponents hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_identifier hash];
  uint64_t v11 = [NSNumber numberWithInteger:self->_taskType];
  uint64_t v12 = v7 ^ v10 ^ [v11 hash];
  uint64_t v13 = [NSNumber numberWithInteger:self->_priority];
  uint64_t v14 = [v13 hash];
  unint64_t v15 = v14 ^ [(INContactEventTrigger *)self->_contactEventTrigger hash];
  v16 = [NSNumber numberWithInteger:self->_taskReference];
  uint64_t v17 = v12 ^ v15 ^ [v16 hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_parentIdentifier hash];

  return v18;
}

- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  return [(INTask *)self initWithTitle:title status:status taskType:taskType spatialEventTrigger:spatialEventTrigger temporalEventTrigger:temporalEventTrigger createdDateComponents:createdDateComponents modifiedDateComponents:modifiedDateComponents identifier:identifier priority:0 contactEventTrigger:0 taskReference:0 parentIdentifier:0];
}

- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 priority:(int64_t)a11 contactEventTrigger:(id)a12 taskReference:(int64_t)a13 parentIdentifier:(id)a14
{
  id v45 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = a14;
  v46.receiver = self;
  v46.super_class = (Class)INTask;
  id v26 = [(INTask *)&v46 init];
  if (v26)
  {
    uint64_t v27 = [v45 copy];
    uint64_t title = v26->_title;
    v26->_uint64_t title = (INSpeakableString *)v27;

    v26->_int64_t status = a4;
    uint64_t v29 = [v19 copy];
    uint64_t spatialEventTrigger = v26->_spatialEventTrigger;
    v26->_uint64_t spatialEventTrigger = (INSpatialEventTrigger *)v29;

    uint64_t v31 = [v20 copy];
    uint64_t temporalEventTrigger = v26->_temporalEventTrigger;
    v26->_uint64_t temporalEventTrigger = (INTemporalEventTrigger *)v31;

    uint64_t v33 = [v21 copy];
    createdDateComponents = v26->_createdDateComponents;
    v26->_createdDateComponents = (NSDateComponents *)v33;

    uint64_t v35 = [v22 copy];
    modifiedDateComponents = v26->_modifiedDateComponents;
    v26->_modifiedDateComponents = (NSDateComponents *)v35;

    uint64_t v37 = [v23 copy];
    identifier = v26->_identifier;
    v26->_identifier = (NSString *)v37;

    v26->_int64_t taskType = a5;
    v26->_int64_t priority = a11;
    uint64_t v39 = [v24 copy];
    contactEventTrigger = v26->_contactEventTrigger;
    v26->_contactEventTrigger = (INContactEventTrigger *)v39;

    v26->_taskReference = a13;
    uint64_t v41 = [v25 copy];
    parentIdentifier = v26->_parentIdentifier;
    v26->_parentIdentifier = (NSString *)v41;
  }
  return v26;
}

- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier priority:(INTaskPriority)priority
{
  uint64_t v17 = title;
  NSUInteger v18 = spatialEventTrigger;
  id v19 = temporalEventTrigger;
  id v20 = createdDateComponents;
  id v21 = modifiedDateComponents;
  id v22 = identifier;
  v37.receiver = self;
  v37.super_class = (Class)INTask;
  id v23 = [(INTask *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [(INSpeakableString *)v17 copy];
    id v25 = v23->_title;
    v23->_uint64_t title = (INSpeakableString *)v24;

    v23->_int64_t status = status;
    uint64_t v26 = [(INSpatialEventTrigger *)v18 copy];
    uint64_t v27 = v23->_spatialEventTrigger;
    v23->_uint64_t spatialEventTrigger = (INSpatialEventTrigger *)v26;

    uint64_t v28 = [(INTemporalEventTrigger *)v19 copy];
    uint64_t v29 = v23->_temporalEventTrigger;
    v23->_uint64_t temporalEventTrigger = (INTemporalEventTrigger *)v28;

    uint64_t v30 = [(NSDateComponents *)v20 copy];
    uint64_t v31 = v23->_createdDateComponents;
    v23->_createdDateComponents = (NSDateComponents *)v30;

    uint64_t v32 = [(NSDateComponents *)v21 copy];
    uint64_t v33 = v23->_modifiedDateComponents;
    v23->_modifiedDateComponents = (NSDateComponents *)v32;

    uint64_t v34 = [(NSString *)v22 copy];
    uint64_t v35 = v23->_identifier;
    v23->_identifier = (NSString *)v34;

    v23->_int64_t taskType = taskType;
    v23->_int64_t priority = priority;
  }

  return v23;
}

- (INTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)INTask;
  return [(INTask *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    NSUInteger v10 = [v8 objectForKeyedSubscript:@"title"];
    v38 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"status"];
    uint64_t v37 = INTaskStatusWithString(v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 objectForKeyedSubscript:@"spatialEventTrigger"];
    uint64_t v35 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v14 = objc_opt_class();
    unint64_t v15 = [v8 objectForKeyedSubscript:@"temporalEventTrigger"];
    v36 = [v7 decodeObjectOfClass:v14 from:v15];

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"createdDateComponents"];
    NSUInteger v18 = [v7 decodeObjectOfClass:v16 from:v17];

    uint64_t v19 = objc_opt_class();
    id v20 = [v8 objectForKeyedSubscript:@"modifiedDateComponents"];
    id v21 = [v7 decodeObjectOfClass:v19 from:v20];

    id v22 = [v8 objectForKeyedSubscript:@"identifier"];
    id v23 = [v8 objectForKeyedSubscript:@"taskType"];
    uint64_t v24 = INTaskTypeWithString(v23);

    id v25 = [v8 objectForKeyedSubscript:@"priority"];
    uint64_t v26 = INTaskPriorityWithString(v25);

    uint64_t v27 = objc_opt_class();
    uint64_t v28 = [v8 objectForKeyedSubscript:@"contactEventTrigger"];
    uint64_t v29 = [v7 decodeObjectOfClass:v27 from:v28];

    uint64_t v30 = [v8 objectForKeyedSubscript:@"taskReference"];
    uint64_t v31 = [v30 isEqualToString:@"currentActivity"];

    uint64_t v32 = [v8 objectForKeyedSubscript:@"parentIdentifier"];
    uint64_t v33 = (void *)[[v39 alloc] initWithTitle:v38 status:v37 taskType:v24 spatialEventTrigger:v35 temporalEventTrigger:v36 createdDateComponents:v18 modifiedDateComponents:v21 identifier:v22 priority:v26 contactEventTrigger:v29 taskReference:v31 parentIdentifier:v32];
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 contactEventTrigger:(id)a11 taskReference:(int64_t)a12
{
  return [(INTask *)self initWithTitle:a3 status:a4 taskType:a5 spatialEventTrigger:a6 temporalEventTrigger:a7 createdDateComponents:a8 modifiedDateComponents:a9 identifier:a10 priority:0 contactEventTrigger:a11 taskReference:a12 parentIdentifier:0];
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  id v5 = [(INTask *)self contactEventTrigger];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INTask *)self contactEventTrigger];
  id v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  if ([v3 count]) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end