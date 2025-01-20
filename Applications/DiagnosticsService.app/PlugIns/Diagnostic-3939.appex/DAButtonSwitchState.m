@interface DAButtonSwitchState
- (BOOL)isEventAcceptable:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5;
- (DAButtonSwitchState)initWithIdentifier:(id)a3;
- (DAButtonSwitchState)initWithIdentifier:(id)a3 startingState:(int)a4;
- (NSString)identifier;
- (unint64_t)expectedEvent;
- (void)getNextEvent;
- (void)getTypeForEvent:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5;
- (void)setExpectedEvent:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation DAButtonSwitchState

- (DAButtonSwitchState)initWithIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)DAButtonSwitchState;
  v5 = [(DAButtonSwitchState *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_identifier = v4;
    if ([(NSString *)v4 isEqualToString:@"Home"])
    {
      uint64_t v7 = 1;
LABEL_20:
      v6->_expectedEvent = v7;
      goto LABEL_21;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"RingerButton"])
    {
      uint64_t v7 = 0x10000000;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"Ringer"])
    {
      uint64_t v7 = 4;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"Sleep"])
    {
      uint64_t v7 = 16;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"VolumeIncrement"])
    {
      uint64_t v7 = 64;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"VolumeDecrement"])
    {
      uint64_t v7 = 256;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"DigitalCrown"])
    {
      uint64_t v7 = 1024;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"Side"])
    {
      uint64_t v7 = 4096;
      goto LABEL_20;
    }
    if ([(NSString *)v6->_identifier isEqualToString:@"App"])
    {
      uint64_t v7 = 0x4000000;
      goto LABEL_20;
    }
  }
LABEL_21:

  return v6;
}

- (DAButtonSwitchState)initWithIdentifier:(id)a3 startingState:(int)a4
{
  result = [(DAButtonSwitchState *)self initWithIdentifier:a3];
  if (result)
  {
    if (a4 == 1)
    {
      unint64_t v6 = 8;
    }
    else
    {
      if (a4) {
        return result;
      }
      unint64_t v6 = 4;
    }
    result->_expectedEvent = v6;
  }
  return result;
}

- (BOOL)isEventAcceptable:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5
{
  [(DAButtonSwitchState *)self getTypeForEvent:a3 type:a4 eventType:a5];
  unint64_t v7 = [(DAButtonSwitchState *)self expectedEvent];
  if (v7 == a3) {
    [(DAButtonSwitchState *)self getNextEvent];
  }
  return v7 == a3;
}

- (void)getNextEvent
{
  if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)1)
  {
    uint64_t v3 = 2;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)2)
  {
    uint64_t v3 = 1;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)0x10000000)
  {
    uint64_t v3 = 0x20000000;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)0x20000000)
  {
    uint64_t v3 = 0x10000000;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)4)
  {
    uint64_t v3 = 8;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)8)
  {
    uint64_t v3 = 4;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)16)
  {
    uint64_t v3 = 32;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)32)
  {
    uint64_t v3 = 16;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)64)
  {
    uint64_t v3 = 128;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)128)
  {
    uint64_t v3 = 64;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)512)
  {
    uint64_t v3 = 256;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)256)
  {
    uint64_t v3 = 512;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)2048)
  {
    uint64_t v3 = 1024;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)1024)
  {
    uint64_t v3 = 2048;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)4096)
  {
    uint64_t v3 = 0x2000;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)0x2000)
  {
    uint64_t v3 = 4096;
  }
  else if ((id)[(DAButtonSwitchState *)self expectedEvent] == (id)0x8000000)
  {
    uint64_t v3 = 0x4000000;
  }
  else
  {
    if ((id)[(DAButtonSwitchState *)self expectedEvent] != (id)0x4000000) {
      return;
    }
    uint64_t v3 = 0x8000000;
  }

  [(DAButtonSwitchState *)self setExpectedEvent:v3];
}

- (void)getTypeForEvent:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5
{
  *a4 = @"Button";
  v8 = @"KeyDown";
  if ((uint64_t)a3 > 511)
  {
    if ((uint64_t)a3 < 0x2000)
    {
      if ((uint64_t)a3 > 2047)
      {
        if (a3 == 2048) {
          goto LABEL_28;
        }
        if (a3 != 4096) {
          return;
        }
      }
      else
      {
        if (a3 == 512) {
          goto LABEL_28;
        }
        if (a3 != 1024) {
          return;
        }
      }
    }
    else
    {
      if ((uint64_t)a3 > 0x7FFFFFF)
      {
        if (a3 != 0x8000000)
        {
          if (a3 == 0x10000000) {
            goto LABEL_29;
          }
          if (a3 != 0x20000000) {
            return;
          }
        }
        goto LABEL_28;
      }
      if (a3 == 0x2000) {
        goto LABEL_28;
      }
      if (a3 != 0x4000000) {
        return;
      }
    }
LABEL_29:
    *a5 = v8;
    return;
  }
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 <= 127)
    {
      if (a3 != 32)
      {
        if (a3 != 64) {
          return;
        }
        goto LABEL_29;
      }
LABEL_28:
      v8 = @"KeyUp";
      goto LABEL_29;
    }
    if (a3 == 128) {
      goto LABEL_28;
    }
    if (a3 != 256) {
      return;
    }
    goto LABEL_29;
  }
  switch(a3)
  {
    case 1uLL:
      goto LABEL_29;
    case 2uLL:
      goto LABEL_28;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      *a4 = @"Switch";
      v8 = @"StateTone";
      goto LABEL_29;
    case 8uLL:
      *a4 = @"Switch";
      v8 = @"StateSilent";
      goto LABEL_29;
    default:
      if (a3 == 16) {
        goto LABEL_29;
      }
      break;
  }
}

- (unint64_t)expectedEvent
{
  return self->_expectedEvent;
}

- (void)setExpectedEvent:(unint64_t)a3
{
  self->_expectedEvent = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

@end