@interface INContactEventTrigger
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INContactEventTrigger)initWithCoder:(id)a3;
- (INContactEventTrigger)initWithTriggerContact:(id)a3;
- (INPerson)triggerContact;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INContactEventTrigger

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  id v5 = [(INContactEventTrigger *)self triggerContact];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INContactEventTrigger *)self triggerContact];
  id v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  if ([v3 count]) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

- (INPerson)triggerContact
{
  return self->_triggerContact;
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"triggerContact";
  triggerContact = self->_triggerContact;
  id v3 = triggerContact;
  if (!triggerContact)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!triggerContact) {

  }
  return v4;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INContactEventTrigger;
  v6 = [(INContactEventTrigger *)&v11 description];
  id v7 = [(INContactEventTrigger *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INContactEventTrigger *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_triggerContact];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"triggerContact");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INContactEventTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerContact"];

  id v6 = [(INContactEventTrigger *)self initWithTriggerContact:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INContactEventTrigger *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      triggerContact = self->_triggerContact;
      BOOL v7 = triggerContact == v5->_triggerContact || -[INPerson isEqual:](triggerContact, "isEqual:");
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
  return [(INPerson *)self->_triggerContact hash];
}

- (INContactEventTrigger)initWithTriggerContact:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INContactEventTrigger;
  id v5 = [(INContactEventTrigger *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    triggerContact = v5->_triggerContact;
    v5->_triggerContact = (INPerson *)v6;
  }
  return v5;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"triggerContact"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = (void *)[objc_alloc((Class)a1) initWithTriggerContact:v11];
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