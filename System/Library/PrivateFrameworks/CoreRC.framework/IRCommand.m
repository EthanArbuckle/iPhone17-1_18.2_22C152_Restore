@interface IRCommand
+ (BOOL)supportsSecureCoding;
+ (id)commandWithProtocol:(id)a3 payload:(unint64_t)a4 repeat:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRepeat;
- (BOOL)setSequence:(unint64_t *)a3 withCount:(unint64_t)a4;
- (IRCommand)init;
- (IRCommand)initWithCoder:(id)a3;
- (IRCommand)initWithProtocol:(id)a3 payload:(unint64_t)a4 repeat:(BOOL)a5;
- (IRProtocol)protocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)payload;
- (unint64_t)sequence;
- (unint64_t)sequenceCount;
- (unint64_t)timestamp;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation IRCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithProtocol:(id)a3 payload:(unint64_t)a4 repeat:(BOOL)a5
{
  BOOL v5 = a5;
  if ([a3 protocolID] == 1) {
    +[AppleIRCommand matchNECVendorID:WORD1(a4)];
  }
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProtocol:a3 payload:a4 repeat:v5];
  return v8;
}

- (void)dealloc
{
  sequence = self->_sequence;
  if (sequence) {
    free(sequence);
  }

  v4.receiver = self;
  v4.super_class = (Class)IRCommand;
  [(IRCommand *)&v4 dealloc];
}

- (BOOL)setSequence:(unint64_t *)a3 withCount:(unint64_t)a4
{
  if (a4)
  {
    if (!self->_sequence)
    {
      v7 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
      self->_sequence = v7;
      if (v7)
      {
        self->_sequenceCount = a4;
        memcpy(v7, a3, 8 * a4);
        self->_payload = *self->_sequence;
      }
    }
  }
  return 0;
}

- (IRCommand)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithProtocol:payload:repeat:"];
  return 0;
}

- (IRCommand)initWithProtocol:(id)a3 payload:(unint64_t)a4 repeat:(BOOL)a5
{
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)IRCommand;
    v8 = [(IRCommand *)&v11 init];
    v9 = v8;
    if (v8)
    {
      v8->_payload = a4;
      v8->_isRepeat = a5;
      v8->_protocol = (IRProtocol *)a3;
      v9->_timestamp = mach_absolute_time();
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (IRCommand)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)IRCommand;
  objc_super v4 = [(IRCommand *)&v15 init];
  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"commandSequence");
    if ([v7 count])
    {
      v8 = (unint64_t *)malloc_type_calloc([v7 count], 8uLL, 0x100004000313F17uLL);
      v4->_sequence = v8;
      if (v8)
      {
        uint64_t v9 = [v7 count];
        v4->_unint64_t sequenceCount = v9;
        if (v9)
        {
          unint64_t v10 = 0;
          do
          {
            uint64_t v11 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v10), "unsignedLongLongValue");
            sequence = v4->_sequence;
            unint64_t sequenceCount = v4->_sequenceCount;
            sequence[v10++] = v11;
          }
          while (v10 < sequenceCount);
        }
        else
        {
          sequence = v4->_sequence;
        }
        v4->_payload = *sequence;
      }
    }
    v4->_isRepeat = [a3 decodeBoolForKey:@"commandIsRepeat"];
    v4->_protocol = (IRProtocol *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"commandProtocol"];
    v4->_timestamp = [a3 decodeInt64ForKey:@"commandTimestamp"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = (id)objc_opt_new();
  if (self->_sequenceCount)
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_sequence[v5++]));
    while (v5 < self->_sequenceCount);
  }
  [a3 encodeObject:self->_protocol forKey:@"commandProtocol"];
  [a3 encodeObject:v6 forKey:@"commandSequence"];
  [a3 encodeBool:self->_isRepeat forKey:@"commandIsRepeat"];
  [a3 encodeInt64:self->_timestamp forKey:@"commandTimestamp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithProtocol:payload:repeat:", -[IRCommand protocol](self, "protocol"), -[IRCommand payload](self, "payload"), -[IRCommand isRepeat](self, "isRepeat"));
  if (v4) {
    objc_msgSend(v4, "setTimestamp:", -[IRCommand timestamp](self, "timestamp"));
  }
  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)IRCommand;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[IRCommand description](&v8, sel_description));
  [v3 appendFormat:@" Protocol: %@;", self->_protocol];
  objc_msgSend(v3, "appendFormat:", @" Payload: %#llx;", self->_payload);
  if (self->_isRepeat) {
    objc_super v4 = "Y";
  }
  else {
    objc_super v4 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @" Repeat: %s;", v4);
  objc_msgSend(v3, "appendFormat:", @" Timestamp: %llu;", self->_timestamp);
  unint64_t v5 = " sequence:";
  if (!self->_sequenceCount) {
    unint64_t v5 = "";
  }
  objc_msgSend(v3, "appendFormat:", @" sequenceCount: %lu;%s", self->_sequenceCount, v5);
  if (self->_sequenceCount)
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @" %016llx", self->_sequence[v6++]);
    while (v6 < self->_sequenceCount);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    BOOL v5 = -[IRProtocol isEqual:](-[IRCommand protocol](self, "protocol"), "isEqual:", [a3 protocol]);
    if (!v5) {
      return v5;
    }
    unint64_t v6 = [(IRCommand *)self sequenceCount];
    if (v6 != [a3 sequenceCount])
    {
LABEL_7:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ([(IRCommand *)self sequenceCount])
    {
      BOOL v7 = memcmp(-[IRCommand sequence](self, "sequence"), (const void *)[a3 sequence], 8 * -[IRCommand sequenceCount](self, "sequenceCount")) == 0;
    }
    else
    {
      unint64_t v8 = [(IRCommand *)self payload];
      BOOL v7 = v8 == [a3 payload];
    }
    LOBYTE(v5) = v7;
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_payload ^ [(IRProtocol *)self->_protocol hash];
}

- (IRProtocol)protocol
{
  return self->_protocol;
}

- (unint64_t)payload
{
  return self->_payload;
}

- (BOOL)isRepeat
{
  return self->_isRepeat;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (unint64_t)sequenceCount
{
  return self->_sequenceCount;
}

@end