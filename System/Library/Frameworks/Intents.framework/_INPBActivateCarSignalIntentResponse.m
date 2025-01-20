@interface _INPBActivateCarSignalIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBActivateCarSignalIntentResponse)initWithCoder:(id)a3;
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
- (void)setSignals:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBActivateCarSignalIntentResponse

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (void)writeTo:(id)a3
{
  p_signals = &self->_signals;
  if (self->_signals.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_signals->count);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBActivateCarSignalIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_signals.count)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBActivateCarSignalIntentResponse signalsCount](self, "signalsCount"));
    if ([(_INPBActivateCarSignalIntentResponse *)self signalsCount])
    {
      unint64_t v5 = 0;
      do
      {
        int v6 = self->_signals.list[v5];
        if (v6 == 1)
        {
          v7 = @"AUDIBLE";
        }
        else if (v6 == 2)
        {
          v7 = @"VISIBLE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_signals.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBActivateCarSignalIntentResponse *)self signalsCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"signals"];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [+[_INPBActivateCarSignalIntentResponse allocWithZone:a3] init];
  PBRepeatedInt32Copy();
  return v3;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (_INPBActivateCarSignalIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  int v6 = (_INPBActivateCarSignalIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        int v6 = (_INPBActivateCarSignalIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBActivateCarSignalIntentResponse *)self initWithData:v6];

    int v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBActivateCarSignalIntentResponse *)self clearSignals];
  v3.receiver = self;
  v3.super_class = (Class)_INPBActivateCarSignalIntentResponse;
  [(_INPBActivateCarSignalIntentResponse *)&v3 dealloc];
}

- (BOOL)readFrom:(id)a3
{
  return _INPBActivateCarSignalIntentResponseReadFrom((uint64_t)self, (uint64_t)a3);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end