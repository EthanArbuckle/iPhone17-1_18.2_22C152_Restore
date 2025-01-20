@interface CoreIRLearningSession
+ (BOOL)supportsSecureCoding;
- (BOOL)startLearningCommand:(unint64_t)a3;
- (CoreIRDevice)owningDevice;
- (CoreIRLearningSession)init;
- (CoreIRLearningSession)initWithCoder:(id)a3;
- (CoreIRLearningSession)initWithReason:(unint64_t)a3;
- (CoreIRLearningSessionBridgeDelegate)bridgeDelegate;
- (CoreIRLearningSessionDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)endLearning;
- (void)setBridgeDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOwningDevice:(id)a3;
@end

@implementation CoreIRLearningSession

- (CoreIRLearningSession)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithReason:"];
  return 0;
}

- (CoreIRLearningSession)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreIRLearningSession;
  result = [(CoreIRLearningSession *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreIRLearningSession)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreIRLearningSession;
  v4 = [(CoreIRLearningSession *)&v6 init];
  if (v4) {
    v4->_reason = [a3 decodeInt32ForKey:@"Reason"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t reason = self->_reason;
  return (id)[v4 initWithReason:reason];
}

- (BOOL)startLearningCommand:(unint64_t)a3
{
  return 0;
}

- (void)endLearning
{
  owningDevice = self->_owningDevice;
  if (owningDevice && [(CoreIRDevice *)owningDevice learningSession] == self)
  {
    v4 = self->_owningDevice;
    [(CoreIRDevice *)v4 setLearningSession:0];
  }
}

- (unint64_t)reason
{
  return self->_reason;
}

- (CoreIRLearningSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreIRLearningSessionDelegate *)a3;
}

- (CoreIRDevice)owningDevice
{
  return self->_owningDevice;
}

- (void)setOwningDevice:(id)a3
{
  self->_owningDevice = (CoreIRDevice *)a3;
}

- (CoreIRLearningSessionBridgeDelegate)bridgeDelegate
{
  return self->_bridgeDelegate;
}

- (void)setBridgeDelegate:(id)a3
{
  self->_bridgeDelegate = (CoreIRLearningSessionBridgeDelegate *)a3;
}

@end