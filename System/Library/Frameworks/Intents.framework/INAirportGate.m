@interface INAirportGate
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAirport)airport;
- (INAirportGate)initWithAirport:(INAirport *)airport terminal:(NSString *)terminal gate:(NSString *)gate;
- (INAirportGate)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)gate;
- (NSString)terminal;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAirportGate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_terminal, 0);

  objc_storeStrong((id *)&self->_airport, 0);
}

- (NSString)gate
{
  return self->_gate;
}

- (NSString)terminal
{
  return self->_terminal;
}

- (INAirport)airport
{
  return self->_airport;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"airport";
  airport = self->_airport;
  v4 = airport;
  if (!airport)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"terminal";
  terminal = self->_terminal;
  v6 = terminal;
  if (!terminal)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"gate";
  gate = self->_gate;
  v8 = gate;
  if (!gate)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (gate)
  {
    if (terminal) {
      goto LABEL_9;
    }
LABEL_14:

    if (airport) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!terminal) {
    goto LABEL_14;
  }
LABEL_9:
  if (airport) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAirportGate;
  v6 = [(INAirportGate *)&v11 description];
  v7 = [(INAirportGate *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAirportGate *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_airport];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"airport");

  v9 = [v6 encodeObject:self->_terminal];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"terminal");

  v10 = [v6 encodeObject:self->_gate];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"gate");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  airport = self->_airport;
  id v5 = a3;
  [v5 encodeObject:airport forKey:@"airport"];
  [v5 encodeObject:self->_terminal forKey:@"terminal"];
  [v5 encodeObject:self->_gate forKey:@"gate"];
}

- (INAirportGate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airport"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"terminal"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"gate"];

  v14 = [(INAirportGate *)self initWithAirport:v5 terminal:v9 gate:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INAirportGate *)a3;
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
      airport = self->_airport;
      BOOL v9 = 0;
      if (airport == v5->_airport || -[INAirport isEqual:](airport, "isEqual:"))
      {
        terminal = self->_terminal;
        if (terminal == v5->_terminal || -[NSString isEqual:](terminal, "isEqual:"))
        {
          gate = self->_gate;
          if (gate == v5->_gate || -[NSString isEqual:](gate, "isEqual:")) {
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
  unint64_t v3 = [(INAirport *)self->_airport hash];
  NSUInteger v4 = [(NSString *)self->_terminal hash] ^ v3;
  return v4 ^ [(NSString *)self->_gate hash];
}

- (INAirportGate)initWithAirport:(INAirport *)airport terminal:(NSString *)terminal gate:(NSString *)gate
{
  v8 = airport;
  BOOL v9 = terminal;
  v10 = gate;
  v19.receiver = self;
  v19.super_class = (Class)INAirportGate;
  uint64_t v11 = [(INAirportGate *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(INAirport *)v8 copy];
    v13 = v11->_airport;
    v11->_airport = (INAirport *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v11->_terminal;
    v11->_terminal = (NSString *)v14;

    uint64_t v16 = [(NSString *)v10 copy];
    v17 = v11->_gate;
    v11->_gate = (NSString *)v16;
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
    v10 = [v8 objectForKeyedSubscript:@"airport"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"terminal"];
    v13 = [v8 objectForKeyedSubscript:@"gate"];
    uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithAirport:v11 terminal:v12 gate:v13];
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