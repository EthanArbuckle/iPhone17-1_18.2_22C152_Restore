@interface INTemporalEventTrigger
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)dateComponentsRange;
- (INTemporalEventTrigger)init;
- (INTemporalEventTrigger)initWithCoder:(id)a3;
- (INTemporalEventTrigger)initWithDateComponentsRange:(INDateComponentsRange *)dateComponentsRange;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTemporalEventTrigger

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

- (INDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"dateComponentsRange";
  dateComponentsRange = self->_dateComponentsRange;
  v3 = dateComponentsRange;
  if (!dateComponentsRange)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!dateComponentsRange) {

  }
  return v4;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTemporalEventTrigger;
  v6 = [(INTemporalEventTrigger *)&v11 description];
  v7 = [(INTemporalEventTrigger *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTemporalEventTrigger *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_dateComponentsRange];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"dateComponentsRange");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INTemporalEventTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponentsRange"];

  id v6 = [(INTemporalEventTrigger *)self initWithDateComponentsRange:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTemporalEventTrigger *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      dateComponentsRange = self->_dateComponentsRange;
      BOOL v7 = dateComponentsRange == v5->_dateComponentsRange
        || -[INDateComponentsRange isEqual:](dateComponentsRange, "isEqual:");
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(INDateComponentsRange *)self->_dateComponentsRange hash];
}

- (INTemporalEventTrigger)initWithDateComponentsRange:(INDateComponentsRange *)dateComponentsRange
{
  id v4 = dateComponentsRange;
  v9.receiver = self;
  v9.super_class = (Class)INTemporalEventTrigger;
  v5 = [(INTemporalEventTrigger *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(INDateComponentsRange *)v4 copy];
    BOOL v7 = v5->_dateComponentsRange;
    v5->_dateComponentsRange = (INDateComponentsRange *)v6;
  }
  return v5;
}

- (INTemporalEventTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)INTemporalEventTrigger;
  return [(INTemporalEventTrigger *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"dateComponentsRange"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = (void *)[objc_alloc((Class)a1) initWithDateComponentsRange:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end