@interface HNDEventPointerStreamData
- (BSInvalidatable)pointerStream;
- (NSString)hardwareIdentifier;
- (unsigned)contextID;
- (unsigned)displayID;
- (void)setContextID:(unsigned int)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setPointerStream:(id)a3;
@end

@implementation HNDEventPointerStreamData

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (BSInvalidatable)pointerStream
{
  return self->_pointerStream;
}

- (void)setPointerStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerStream, 0);

  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end