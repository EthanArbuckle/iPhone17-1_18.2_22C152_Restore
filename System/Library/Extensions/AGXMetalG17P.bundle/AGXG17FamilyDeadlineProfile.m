@interface AGXG17FamilyDeadlineProfile
- (AGXG17FamilyDeadlineProfile)initWithDevice:(__IOGPUDevice *)a3 executionSize:(unint64_t)a4;
- (void)dealloc;
@end

@implementation AGXG17FamilyDeadlineProfile

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    unsigned int deadlineProfileID = self->_deadlineProfileID;
    if (deadlineProfileID)
    {
      uint64_t inputStruct = 0;
      int v7 = 0;
      unsigned int v8 = deadlineProfileID;
      IOConnectCallStructMethod(deviceRef->var2, 0x10Cu, &inputStruct, 0x10uLL, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyDeadlineProfile;
  [(AGXG17FamilyDeadlineProfile *)&v5 dealloc];
}

- (AGXG17FamilyDeadlineProfile)initWithDevice:(__IOGPUDevice *)a3 executionSize:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AGXG17FamilyDeadlineProfile;
  v6 = [(AGXG17FamilyDeadlineProfile *)&v14 init];
  int v7 = v6;
  if (v6)
  {
    v6->_deviceRef = a3;
    CFRetain(a3);
    int v12 = a4;
    unsigned int v13 = 0;
    size_t outputStructCnt = 16;
    unint64_t outputStruct = 0;
    if (IOConnectCallStructMethod(v7->_deviceRef->var2, 0x10Bu, &outputStruct, 0x10uLL, &outputStruct, &outputStructCnt))
    {

      return 0;
    }
    else
    {
      v7->_unsigned int deadlineProfileID = v13;
      unint64_t v8 = outputStruct;
      v7->_executionSize = a4;
      v7->_globalTraceObjectID = v8;
    }
  }
  return v7;
}

@end