@interface _INPBActivateCarSignalIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCarName;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBActivateCarSignalIntent)initWithCoder:(id)a3;
- (_INPBDataString)carName;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)signalsAsString:(int)a3;
- (int)StringAsSignals:(id)a3;
- (int)signals;
- (int)signalsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)signalsCount;
- (void)addSignals:(int)a3;
- (void)clearSignals;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCarName:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSignals:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBActivateCarSignalIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBActivateCarSignalIntent *)self carName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"carName"];

  v6 = [(_INPBActivateCarSignalIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if (self->_signals.count)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBActivateCarSignalIntent signalsCount](self, "signalsCount"));
    if ([(_INPBActivateCarSignalIntent *)self signalsCount])
    {
      unint64_t v9 = 0;
      do
      {
        int v10 = self->_signals.list[v9];
        if (v10 == 1)
        {
          v11 = @"AUDIBLE";
        }
        else if (v10 == 2)
        {
          v11 = @"VISIBLE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_signals.list[v9]);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v8 addObject:v11];

        ++v9;
      }
      while (v9 < [(_INPBActivateCarSignalIntent *)self signalsCount]);
    }
    [v3 setObject:v8 forKeyedSubscript:@"signals"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_carName hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBActivateCarSignalIntent *)self carName];
  v6 = [v4 carName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBActivateCarSignalIntent *)self carName];
  if (v7)
  {
    v8 = (void *)v7;
    unint64_t v9 = [(_INPBActivateCarSignalIntent *)self carName];
    int v10 = [v4 carName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBActivateCarSignalIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBActivateCarSignalIntent *)self intentMetadata];
    if (!v12)
    {

LABEL_15:
      char IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBActivateCarSignalIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  char IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBActivateCarSignalIntent allocWithZone:](_INPBActivateCarSignalIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBActivateCarSignalIntent *)v5 setCarName:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBActivateCarSignalIntent *)v5 setIntentMetadata:v7];

  PBRepeatedInt32Copy();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBActivateCarSignalIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBActivateCarSignalIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBActivateCarSignalIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBActivateCarSignalIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBActivateCarSignalIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBActivateCarSignalIntent *)self clearSignals];
  v3.receiver = self;
  v3.super_class = (Class)_INPBActivateCarSignalIntent;
  [(_INPBActivateCarSignalIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBActivateCarSignalIntent *)self carName];

  if (v4)
  {
    v5 = [(_INPBActivateCarSignalIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBActivateCarSignalIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBActivateCarSignalIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  p_signals = &self->_signals;
  unint64_t v9 = v11;
  if (p_signals->count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      unint64_t v9 = v11;
      ++v10;
    }
    while (v10 < p_signals->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBActivateCarSignalIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSignals:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"AUDIBLE"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"VISIBLE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)signalsAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"AUDIBLE";
  }
  else if (a3 == 2)
  {
    int v4 = @"VISIBLE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)signalsAtIndex:(unint64_t)a3
{
  return self->_signals.list[a3];
}

- (unint64_t)signalsCount
{
  return self->_signals.count;
}

- (void)addSignals:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearSignals
{
}

- (int)signals
{
  return self->_signals.list;
}

- (void)setSignals:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setCarName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end