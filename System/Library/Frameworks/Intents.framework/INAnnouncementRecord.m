@interface INAnnouncementRecord
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAnnouncementRecord)initWithCoder:(id)a3;
- (INAnnouncementRecord)initWithOriginator:(id)a3 identifier:(id)a4 duration:(id)a5;
- (INHomeFilter)originator;
- (NSNumber)duration;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAnnouncementRecord

- (unint64_t)hash
{
  unint64_t v3 = [(INHomeFilter *)self->_originator hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_duration hash];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"originator";
  originator = self->_originator;
  NSUInteger v4 = originator;
  if (!originator)
  {
    NSUInteger v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"identifier";
  identifier = self->_identifier;
  v6 = identifier;
  if (!identifier)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"duration";
  duration = self->_duration;
  v8 = duration;
  if (!duration)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (duration)
  {
    if (identifier) {
      goto LABEL_9;
    }
LABEL_14:

    if (originator) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!identifier) {
    goto LABEL_14;
  }
LABEL_9:
  if (originator) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_originator, 0);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (INHomeFilter)originator
{
  return self->_originator;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAnnouncementRecord;
  v6 = [(INAnnouncementRecord *)&v11 description];
  v7 = [(INAnnouncementRecord *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAnnouncementRecord *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_originator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"originator");

  v9 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"identifier");

  v10 = [v6 encodeObject:self->_duration];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"duration");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  originator = self->_originator;
  id v5 = a3;
  [v5 encodeObject:originator forKey:@"originator"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_duration forKey:@"duration"];
}

- (INAnnouncementRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originator"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"identifier"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];

  objc_super v11 = [(INAnnouncementRecord *)self initWithOriginator:v5 identifier:v9 duration:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INAnnouncementRecord *)a3;
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
      originator = self->_originator;
      BOOL v9 = 0;
      if (originator == v5->_originator || -[INHomeFilter isEqual:](originator, "isEqual:"))
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          duration = self->_duration;
          if (duration == v5->_duration || -[NSNumber isEqual:](duration, "isEqual:")) {
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

- (INAnnouncementRecord)initWithOriginator:(id)a3 identifier:(id)a4 duration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INAnnouncementRecord;
  objc_super v11 = [(INAnnouncementRecord *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    originator = v11->_originator;
    v11->_originator = (INHomeFilter *)v12;

    uint64_t v14 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    duration = v11->_duration;
    v11->_duration = (NSNumber *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"originator"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"identifier"];
    v13 = [v8 objectForKeyedSubscript:@"duration"];
    uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithOriginator:v11 identifier:v12 duration:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end