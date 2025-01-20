@interface CMIOExtensionScheduledOutput
+ (BOOL)supportsSecureCoding;
+ (CMIOExtensionScheduledOutput)scheduledOutputWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds;
- (BOOL)isEqual:(id)a3;
- (CMIOExtensionScheduledOutput)initWithCoder:(id)a3;
- (CMIOExtensionScheduledOutput)initWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds;
- (CMIOExtensionScheduledOutput)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (uint64_t)hostTimeInNanoseconds;
- (uint64_t)sequenceNumber;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionScheduledOutput

+ (CMIOExtensionScheduledOutput)scheduledOutputWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSequenceNumber:sequenceNumber hostTimeInNanoseconds:hostTimeInNanoseconds];

  return (CMIOExtensionScheduledOutput *)v4;
}

- (CMIOExtensionScheduledOutput)initWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionScheduledOutput;
  v6 = [(CMIOExtensionScheduledOutput *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_sequenceNumber = sequenceNumber;
    v6->_hostTimeInNanoseconds = hostTimeInNanoseconds;
    v6->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionScheduledOutput: seqNum %lld, hostTime %.3f]>", sequenceNumber, (float)((float)hostTimeInNanoseconds / 1000000000.0)];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionScheduledOutput;
  [(CMIOExtensionScheduledOutput *)&v3 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t sequenceNumber = self->_sequenceNumber;
  if (sequenceNumber != [a3 sequenceNumber]) {
    return 0;
  }
  unint64_t hostTimeInNanoseconds = self->_hostTimeInNanoseconds;
  return hostTimeInNanoseconds == [a3 hostTimeInNanoseconds];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CMIOExtensionScheduledOutput allocWithZone:a3];
  unint64_t sequenceNumber = self->_sequenceNumber;
  unint64_t hostTimeInNanoseconds = self->_hostTimeInNanoseconds;

  return [(CMIOExtensionScheduledOutput *)v4 initWithSequenceNumber:sequenceNumber hostTimeInNanoseconds:hostTimeInNanoseconds];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_sequenceNumber forKey:@"sequenceNumber"];
  unint64_t hostTimeInNanoseconds = self->_hostTimeInNanoseconds;

  [a3 encodeInt64:hostTimeInNanoseconds forKey:@"hostTimeInNanoseconds"];
}

- (CMIOExtensionScheduledOutput)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeInt64ForKey:@"sequenceNumber"];
  uint64_t v6 = [a3 decodeInt64ForKey:@"hostTimeInNanoseconds"];

  return [(CMIOExtensionScheduledOutput *)self initWithSequenceNumber:v5 hostTimeInNanoseconds:v6];
}

- (id)copyXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "sequenceNumber", self->_sequenceNumber);
  xpc_dictionary_set_uint64(v3, "hostTimeInNanoseconds", self->_hostTimeInNanoseconds);
  return v3;
}

- (CMIOExtensionScheduledOutput)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "sequenceNumber");
    uint64_t v6 = xpc_dictionary_get_uint64(a3, "hostTimeInNanoseconds");
    return [(CMIOExtensionScheduledOutput *)self initWithSequenceNumber:uint64 hostTimeInNanoseconds:v6];
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
}

- (uint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (uint64_t)hostTimeInNanoseconds
{
  return self->_hostTimeInNanoseconds;
}

@end