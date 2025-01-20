@interface SpeakThisEventContext
- (NSString)displayHardwareID;
- (SpeakThisEventContext)initWithDisplayID:(int64_t)a3 contextID:(unsigned int)a4 displayHardwareID:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)displayID;
- (unsigned)contextID;
- (void)setContextID:(unsigned int)a3;
- (void)setDisplayHardwareID:(id)a3;
- (void)setDisplayID:(int64_t)a3;
@end

@implementation SpeakThisEventContext

- (SpeakThisEventContext)initWithDisplayID:(int64_t)a3 contextID:(unsigned int)a4 displayHardwareID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SpeakThisEventContext;
  v10 = [(SpeakThisEventContext *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_displayID = a3;
    v10->_contextID = a4;
    objc_storeStrong((id *)&v10->_displayHardwareID, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(id)objc_opt_class() allocWithZone:a3];
  v5[2] = self->_displayID;
  *((_DWORD *)v5 + 2) = self->_contextID;
  id v6 = [(NSString *)self->_displayHardwareID copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (int64_t)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(int64_t)a3
{
  self->_displayID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (NSString)displayHardwareID
{
  return self->_displayHardwareID;
}

- (void)setDisplayHardwareID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end