@interface _INPBCarChargingConnectorPower
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChargingConnector;
- (BOOL)hasMaximumPower;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCarChargingConnectorPower)initWithCoder:(id)a3;
- (_INPBPower)maximumPower;
- (id)chargingConnectorAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsChargingConnector:(id)a3;
- (int)chargingConnector;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChargingConnector:(int)a3;
- (void)setHasChargingConnector:(BOOL)a3;
- (void)setMaximumPower:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCarChargingConnectorPower

- (void).cxx_destruct
{
}

- (_INPBPower)maximumPower
{
  return self->_maximumPower;
}

- (int)chargingConnector
{
  return self->_chargingConnector;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCarChargingConnectorPower *)self hasChargingConnector])
  {
    uint64_t v4 = [(_INPBCarChargingConnectorPower *)self chargingConnector];
    if ((v4 - 2) >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5520BD0[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"chargingConnector"];
  }
  v6 = [(_INPBCarChargingConnectorPower *)self maximumPower];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"maximumPower"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCarChargingConnectorPower *)self hasChargingConnector]) {
    uint64_t v3 = 2654435761 * self->_chargingConnector;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBPower *)self->_maximumPower hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBCarChargingConnectorPower *)self hasChargingConnector];
    if (v5 == [v4 hasChargingConnector])
    {
      if (![(_INPBCarChargingConnectorPower *)self hasChargingConnector]
        || ![v4 hasChargingConnector]
        || (int chargingConnector = self->_chargingConnector,
            chargingConnector == [v4 chargingConnector]))
      {
        v7 = [(_INPBCarChargingConnectorPower *)self maximumPower];
        v8 = [v4 maximumPower];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBCarChargingConnectorPower *)self maximumPower];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBCarChargingConnectorPower *)self maximumPower];
          v13 = [v4 maximumPower];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBCarChargingConnectorPower allocWithZone:](_INPBCarChargingConnectorPower, "allocWithZone:") init];
  if ([(_INPBCarChargingConnectorPower *)self hasChargingConnector]) {
    [(_INPBCarChargingConnectorPower *)v5 setChargingConnector:[(_INPBCarChargingConnectorPower *)self chargingConnector]];
  }
  id v6 = [(_INPBPower *)self->_maximumPower copyWithZone:a3];
  [(_INPBCarChargingConnectorPower *)v5 setMaximumPower:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCarChargingConnectorPower *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCarChargingConnectorPower)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCarChargingConnectorPower *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCarChargingConnectorPower *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCarChargingConnectorPower *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBCarChargingConnectorPower *)self hasChargingConnector]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBCarChargingConnectorPower *)self maximumPower];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBCarChargingConnectorPower *)self maximumPower];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarChargingConnectorPowerReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasMaximumPower
{
  return self->_maximumPower != 0;
}

- (void)setMaximumPower:(id)a3
{
}

- (int)StringAsChargingConnector:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"J1772"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"C_C_S1"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"C_C_S2"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CHAdeMO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"G_B_T_A_C"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"G_B_T_D_C"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Tesla"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Mennekes"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"N_A_C_S_D_C"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"N_A_C_S_A_C"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)chargingConnectorAsString:(int)a3
{
  if ((a3 - 2) >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520BD0[a3 - 2];
  }

  return v3;
}

- (void)setHasChargingConnector:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChargingConnector
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setChargingConnector:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int chargingConnector = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end