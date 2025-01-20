@interface AXMIDIEvent
+ (BOOL)supportsSecureCoding;
- (AXMIDIEvent)initWithCoder:(id)a3;
- (BOOL)isDownEvent;
- (BOOL)isOmniChannel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)noteDescription;
- (int64_t)noteValue;
- (int64_t)ordinalChannel;
- (int64_t)type;
- (unsigned)channel;
- (unsigned)control;
- (unsigned)controlValue;
- (unsigned)note;
- (unsigned)noteOctave;
- (unsigned)pitchBend;
- (unsigned)pressure;
- (unsigned)program;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(unsigned __int16)a3;
- (void)setControl:(unsigned __int8)a3;
- (void)setControlValue:(unsigned __int8)a3;
- (void)setNote:(unsigned __int8)a3;
- (void)setPitchBend:(unsigned __int16)a3;
- (void)setPressure:(unsigned __int8)a3;
- (void)setProgram:(unsigned __int8)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AXMIDIEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AXMIDIEvent);
  [(AXMIDIEvent *)v4 setChannel:[(AXMIDIEvent *)self channel]];
  [(AXMIDIEvent *)v4 setType:[(AXMIDIEvent *)self type]];
  [(AXMIDIEvent *)v4 setNote:[(AXMIDIEvent *)self note]];
  [(AXMIDIEvent *)v4 setPressure:[(AXMIDIEvent *)self pressure]];
  [(AXMIDIEvent *)v4 setControl:[(AXMIDIEvent *)self control]];
  [(AXMIDIEvent *)v4 setControlValue:[(AXMIDIEvent *)self controlValue]];
  [(AXMIDIEvent *)v4 setProgram:[(AXMIDIEvent *)self program]];
  [(AXMIDIEvent *)v4 setPitchBend:[(AXMIDIEvent *)self pitchBend]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent channel](self, "channel"), @"midi_channel");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent type](self, "type"), @"midi_type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent note](self, "note"), @"midi_note");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent pressure](self, "pressure"), @"midi_pressure");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent control](self, "control"), @"midi_control");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent controlValue](self, "controlValue"), @"midi_controlvalue");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent program](self, "program"), @"midi_program");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent pitchBend](self, "pitchBend"), @"midi_pitchbend");
}

- (AXMIDIEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMIDIEvent;
  v5 = [(AXMIDIEvent *)&v7 init];
  if (v5)
  {
    v5->_channel = [v4 decodeIntegerForKey:@"midi_channel"];
    v5->_type = [v4 decodeIntegerForKey:@"midi_type"];
    v5->_note = [v4 decodeIntegerForKey:@"midi_note"];
    v5->_pressure = [v4 decodeIntegerForKey:@"midi_pressure"];
    v5->_control = [v4 decodeIntegerForKey:@"midi_control"];
    v5->_controlValue = [v4 decodeIntegerForKey:@"midi_controlvalue"];
    v5->_program = [v4 decodeIntegerForKey:@"midi_program"];
    v5->_pitchBend = [v4 decodeIntegerForKey:@"midi_pitchbend"];
  }

  return v5;
}

- (id)description
{
  switch([(AXMIDIEvent *)self type])
  {
    case 0:
      v3 = @"Unknown";
      break;
    case 1:
      id v4 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v6 = [(AXMIDIEvent *)self noteDescription];
      objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      [v4 stringWithFormat:@"Note Off. note:%@ (%@) pressure:%@", v5, v6, v7];
      goto LABEL_7;
    case 2:
      v8 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v6 = [(AXMIDIEvent *)self noteDescription];
      objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      [v8 stringWithFormat:@"Note On. note:%@ (%@) pressure:%@", v5, v6, v7];
      goto LABEL_7;
    case 3:
      v9 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v6 = [(AXMIDIEvent *)self noteDescription];
      objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      [v9 stringWithFormat:@"AfterTouch. note:%@ (%@) pressure:%@", v5, v6, v7];
LABEL_7:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 4:
      v10 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent control](self, "control"));
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent controlValue](self, "controlValue"));
      v3 = [v10 stringWithFormat:@"Control Change. control:%@ value:%@", v5, v6];
LABEL_9:

      goto LABEL_14;
    case 5:
      v11 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent program](self, "program"));
      [v11 stringWithFormat:@"Program Change. program:%@", v5];
      goto LABEL_13;
    case 6:
      v12 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      [v12 stringWithFormat:@"Channel AfterTouch. pressure:%@", v5];
      goto LABEL_13;
    case 7:
      v13 = NSString;
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[AXMIDIEvent pitchBend](self, "pitchBend"));
      [v13 stringWithFormat:@"Pitch Bend. value:%@", v5];
LABEL_13:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      break;
    case 8:
      v3 = [NSString stringWithFormat:@"System Exclusive"];
      break;
    default:
      v3 = 0;
      break;
  }
  v14 = NSString;
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMIDIEvent ordinalChannel](self, "ordinalChannel"));
  v16 = [v14 stringWithFormat:@"MIDIEvent<%p>: channel:%@ type:%@", self, v15, v3];

  return v16;
}

- (BOOL)isDownEvent
{
  return [(AXMIDIEvent *)self type] == 2;
}

- (int64_t)ordinalChannel
{
  int64_t result = self->_channel;
  if ((int)result > 127)
  {
    if ((int)result <= 2047)
    {
      if ((int)result > 511)
      {
        if (result == 512) {
          return 10;
        }
        if (result == 1024) {
          return 11;
        }
      }
      else
      {
        if (result == 128) {
          return 8;
        }
        if (result == 256) {
          return 9;
        }
      }
    }
    else if ((int)result < 0x2000)
    {
      if (result == 2048) {
        return 12;
      }
      if (result == 4096) {
        return 13;
      }
    }
    else
    {
      switch(result)
      {
        case 0x2000:
          return 14;
        case 0x4000:
          return 15;
        case 0x8000:
          return 16;
      }
    }
    return -1;
  }
  if ((int)result > 15)
  {
    switch(result)
    {
      case 0x10:
        return 5;
      case 0x20:
        return 6;
      case 0x40:
        return 7;
    }
    return -1;
  }
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      int64_t result = 1;
      break;
    case 2:
      int64_t result = 2;
      break;
    case 4:
      int64_t result = 3;
      break;
    case 8:
      int64_t result = 4;
      break;
    default:
      return -1;
  }
  return result;
}

- (BOOL)isOmniChannel
{
  return self->_channel == 0;
}

- (int64_t)noteValue
{
  int v2 = [(AXMIDIEvent *)self note];
  return (v2 - 12 * ((171 * v2) >> 11));
}

- (unsigned)noteOctave
{
  return (171 * [(AXMIDIEvent *)self note]) >> 11;
}

- (id)noteDescription
{
  unint64_t v3 = [(AXMIDIEvent *)self noteValue];
  if (v3 > 0xB) {
    id v4 = &stru_1EDC3DEF8;
  }
  else {
    id v4 = off_1E5587538[v3];
  }
  v5 = NSString;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXMIDIEvent noteOctave](self, "noteOctave"));
  objc_super v7 = [v5 stringWithFormat:@"%@-%@", v4, v6];

  return v7;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int16)a3
{
  self->_channel = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unsigned)note
{
  return self->_note;
}

- (void)setNote:(unsigned __int8)a3
{
  self->_note = a3;
}

- (unsigned)pressure
{
  return self->_pressure;
}

- (void)setPressure:(unsigned __int8)a3
{
  self->_pressure = a3;
}

- (unsigned)control
{
  return self->_control;
}

- (void)setControl:(unsigned __int8)a3
{
  self->_control = a3;
}

- (unsigned)controlValue
{
  return self->_controlValue;
}

- (void)setControlValue:(unsigned __int8)a3
{
  self->_controlValue = a3;
}

- (unsigned)program
{
  return self->_program;
}

- (void)setProgram:(unsigned __int8)a3
{
  self->_program = a3;
}

- (unsigned)pitchBend
{
  return self->_pitchBend;
}

- (void)setPitchBend:(unsigned __int16)a3
{
  self->_pitchBend = a3;
}

@end