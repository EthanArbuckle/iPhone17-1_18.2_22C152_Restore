@interface MessagesDaemon
- (BOOL)isSetupComplete;
- (BOOL)launchListenerForCapability:(unsigned int)a3;
- (IMMessageContext)currentMessageContext;
- (ParentalControlsProtocol)parentalControls;
- (id)intentProcessor;
- (unint64_t)vcCapabilities;
- (unint64_t)vcCapabilitiesForListenerID:(id)a3;
- (void)notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:(unint64_t)a3;
- (void)setCurrentMessageContext:(id)a3;
- (void)setParentalControls:(id)a3;
- (void)setSetupComplete:(BOOL)a3;
@end

@implementation MessagesDaemon

- (ParentalControlsProtocol)parentalControls
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (ParentalControlsProtocol *)v2;
}

- (void)setParentalControls:(id)a3
{
  *(void *)self->parentalControls = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isSetupComplete
{
  return self->isSetupComplete[0];
}

- (void)setSetupComplete:(BOOL)a3
{
  self->isSetupComplete[0] = a3;
}

- (IMMessageContext)currentMessageContext
{
  return (IMMessageContext *)*(id *)&self->currentMessageContext[7];
}

- (void)setCurrentMessageContext:(id)a3
{
  swift_beginAccess();
  v5 = *(void **)&self->currentMessageContext[7];
  *(void *)&self->currentMessageContext[7] = a3;
  id v6 = a3;
}

- (BOOL)launchListenerForCapability:(unsigned int)a3
{
  return 1;
}

- (void)notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:(unint64_t)a3
{
  sub_10003408C(&self->connectionManager[7], *(void *)&self->connectionManager[31]);
  swift_retain();
  sub_10004CF90();

  swift_release();
}

- (id)intentProcessor
{
  void (*v2)(void *__return_ptr, uint64_t);
  uint64_t v3;
  void *v4;
  uint64_t v6;
  void v7[5];
  uint64_t vars8;

  v2 = *(void (**)(void *__return_ptr, uint64_t))(*(void *)self->_TtCs12_SwiftObject_opaque + 272);
  v3 = swift_retain();
  v2(v7, v3);
  swift_release();
  sub_100033764((uint64_t)v7, (uint64_t)&v6);
  sub_100032DB4(&qword_10007C1A8);
  v4 = (void *)sub_10004D4C0();
  sub_100035800((uint64_t)v7, &qword_10007C1A8);

  return v4;
}

- (unint64_t)vcCapabilities
{
  return 0;
}

- (unint64_t)vcCapabilitiesForListenerID:(id)a3
{
  return 0;
}

@end