@interface AGXG17FamilyPerformanceStateAssertion
- (AGXG17FamilyPerformanceStateAssertion)initWithDevice:(id)a3 level:(int)a4;
- (BOOL)wasPerformanceStateAssertionMaintained;
- (int64_t)requestedPerformanceState;
- (void)dealloc;
@end

@implementation AGXG17FamilyPerformanceStateAssertion

- (BOOL)wasPerformanceStateAssertionMaintained
{
  v2 = objc_msgSend(-[AGXG17FamilyDevice getConsistentPerfStateInfoAndReset:](self->_device, "getConsistentPerfStateInfoAndReset:", 0), "objectForKeyedSubscript:", @"was_consistent");

  return [v2 BOOLValue];
}

- (int64_t)requestedPerformanceState
{
  unsigned int requestedLevel = self->_requestedLevel;
  if (requestedLevel >= 3) {
    return 255;
  }
  else {
    return requestedLevel;
  }
}

- (void)dealloc
{
  fwrite("AGX: Attempting to destroy performance state assertion\n\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  [(AGXG17FamilyDevice *)self->_device removePerformanceStateAssertion:self];
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyPerformanceStateAssertion;
  [(AGXG17FamilyPerformanceStateAssertion *)&v3 dealloc];
}

- (AGXG17FamilyPerformanceStateAssertion)initWithDevice:(id)a3 level:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyPerformanceStateAssertion;
  result = [(AGXG17FamilyPerformanceStateAssertion *)&v7 init];
  if (result)
  {
    result->_device = (AGXG17FamilyDevice *)a3;
    result->_unsigned int requestedLevel = a4;
  }
  return result;
}

@end