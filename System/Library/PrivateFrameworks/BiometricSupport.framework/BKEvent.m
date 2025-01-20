@interface BKEvent
- (BKEvent)initWithEncodedEventOrCode:(unsigned int)a3;
- (BKEvent)initWithEventOrCode:(unint64_t)a3;
- (BOOL)isHigh;
- (BOOL)isLow;
- (BOOL)isMetadata;
- (BOOL)isSmartKeyboard;
- (BOOL)isStart;
- (BOOL)isTerminal;
- (id)description;
- (unsigned)cls;
- (unsigned)event;
- (void)encodeEventValue:(unsigned int *)a3 secondValue:(unsigned int *)a4;
- (void)setProperties;
@end

@implementation BKEvent

- (BKEvent)initWithEventOrCode:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKEvent;
  v4 = [(BKEvent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_cls = BYTE4(a3);
    v4->_event = a3;
    [(BKEvent *)v4 setProperties];
  }
  return v5;
}

- (BKEvent)initWithEncodedEventOrCode:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKEvent;
  v4 = [(BKEvent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_cls = HIBYTE(a3);
    v4->_event = a3 & 0x3FFFFF;
    v4->_isHigh = (a3 & 0x800000) != 0;
    v4->_isLow = (a3 & 0x400000) != 0;
    [(BKEvent *)v4 setProperties];
  }
  return v5;
}

- (void)setProperties
{
  if (self->_cls == 1)
  {
    if (self->_event != 58) {
      return;
    }
    goto LABEL_9;
  }
  if (self->_cls) {
    return;
  }
  signed int event = self->_event;
  if (event >= 655360)
  {
    if ((event - 655360) >= 2) {
      goto LABEL_12;
    }
    uint64_t v3 = 12;
LABEL_14:
    *((unsigned char *)&self->super.isa + v3) = 1;
    return;
  }
  switch(event)
  {
    case 65538:
      goto LABEL_9;
    case 262144:
LABEL_13:
      uint64_t v3 = 9;
      goto LABEL_14;
    case 262146:
LABEL_9:
      uint64_t v3 = 10;
      goto LABEL_14;
  }
LABEL_12:
  if ((event - 393216) < 0x101) {
    goto LABEL_13;
  }
  if ((event - 0x80000) < 0x101)
  {
    uint64_t v3 = 11;
    goto LABEL_14;
  }
}

- (id)description
{
  if (self->_isHigh)
  {
    uint64_t v3 = "HI ";
  }
  else if (self->_isLow)
  {
    uint64_t v3 = "LO ";
  }
  else
  {
    uint64_t v3 = (const char *)&unk_22004A573;
  }
  if (self->_cls) {
    objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"class %u code %s%u (%x)", self->_cls, v3, self->_event, self->_event);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"code %s%u (%x)", v3, self->_event, self->_event, v7);
  }
  v5 = v4;
  if (self->_isStart) {
    [v4 appendFormat:@" (start)"];
  }
  if (self->_isTerminal) {
    [v5 appendFormat:@" (terminal)"];
  }
  if (self->_isMetadata) {
    [v5 appendFormat:@" (metadata)"];
  }
  if (self->_isSmartKeyboard) {
    [v5 appendFormat:@" (smart keyboard)"];
  }
  return v5;
}

- (void)encodeEventValue:(unsigned int *)a3 secondValue:(unsigned int *)a4
{
  unsigned int event = self->_event;
  int v5 = self->_cls << 24;
  if (event < 0x400000)
  {
    unsigned int v6 = 0;
    *a3 = v5 | event;
  }
  else
  {
    *a3 = v5 | HIWORD(event) | 0x800000;
    unsigned int v6 = LOWORD(self->_event) | (self->_cls << 24) | 0x400000;
  }
  *a4 = v6;
}

- (unsigned)cls
{
  return self->_cls;
}

- (unsigned)event
{
  return self->_event;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (BOOL)isTerminal
{
  return self->_isTerminal;
}

- (BOOL)isMetadata
{
  return self->_isMetadata;
}

- (BOOL)isSmartKeyboard
{
  return self->_isSmartKeyboard;
}

- (BOOL)isHigh
{
  return self->_isHigh;
}

- (BOOL)isLow
{
  return self->_isLow;
}

@end