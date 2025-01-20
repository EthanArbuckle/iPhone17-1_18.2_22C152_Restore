@interface _INPBAirportGate
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAirport;
- (BOOL)hasGate;
- (BOOL)hasTerminal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)gate;
- (NSString)terminal;
- (_INPBAirport)airport;
- (_INPBAirportGate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAirport:(id)a3;
- (void)setGate:(id)a3;
- (void)setTerminal:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAirportGate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_gate, 0);

  objc_storeStrong((id *)&self->_airport, 0);
}

- (NSString)terminal
{
  return self->_terminal;
}

- (NSString)gate
{
  return self->_gate;
}

- (_INPBAirport)airport
{
  return self->_airport;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAirportGate *)self airport];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"airport"];

  if (self->_gate)
  {
    v6 = [(_INPBAirportGate *)self gate];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"gate"];
  }
  if (self->_terminal)
  {
    v8 = [(_INPBAirportGate *)self terminal];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"terminal"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAirport *)self->_airport hash];
  NSUInteger v4 = [(NSString *)self->_gate hash] ^ v3;
  return v4 ^ [(NSString *)self->_terminal hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBAirportGate *)self airport];
  v6 = [v4 airport];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBAirportGate *)self airport];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAirportGate *)self airport];
    v10 = [v4 airport];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAirportGate *)self gate];
  v6 = [v4 gate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBAirportGate *)self gate];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAirportGate *)self gate];
    v15 = [v4 gate];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAirportGate *)self terminal];
  v6 = [v4 terminal];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBAirportGate *)self terminal];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBAirportGate *)self terminal];
    v20 = [v4 terminal];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBAirportGate allocWithZone:](_INPBAirportGate, "allocWithZone:") init];
  id v6 = [(_INPBAirport *)self->_airport copyWithZone:a3];
  [(_INPBAirportGate *)v5 setAirport:v6];

  uint64_t v7 = (void *)[(NSString *)self->_gate copyWithZone:a3];
  [(_INPBAirportGate *)v5 setGate:v7];

  v8 = (void *)[(NSString *)self->_terminal copyWithZone:a3];
  [(_INPBAirportGate *)v5 setTerminal:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAirportGate *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAirportGate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAirportGate *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAirportGate *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAirportGate *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBAirportGate *)self airport];

  if (v4)
  {
    v5 = [(_INPBAirportGate *)self airport];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBAirportGate *)self gate];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBAirportGate *)self terminal];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAirportGateReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTerminal
{
  return self->_terminal != 0;
}

- (void)setTerminal:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  terminal = self->_terminal;
  self->_terminal = v4;

  MEMORY[0x1F41817F8](v4, terminal);
}

- (BOOL)hasGate
{
  return self->_gate != 0;
}

- (void)setGate:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  gate = self->_gate;
  self->_gate = v4;

  MEMORY[0x1F41817F8](v4, gate);
}

- (BOOL)hasAirport
{
  return self->_airport != 0;
}

- (void)setAirport:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end