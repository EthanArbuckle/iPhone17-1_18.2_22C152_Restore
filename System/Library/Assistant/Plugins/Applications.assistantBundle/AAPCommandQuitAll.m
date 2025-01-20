@interface AAPCommandQuitAll
- (AAPApplicationTerminator)terminator;
- (AAPCommandQuitAll)initWithDictionary:(id)a3;
- (id)_selfReferencingCommandFailedWithReason:(id)a3;
- (id)_selfReferencingCommandSucceeded;
- (void)performWithCompletion:(id)a3;
- (void)setTerminator:(id)a3;
@end

@implementation AAPCommandQuitAll

- (id)_selfReferencingCommandSucceeded
{
  id v3 = objc_alloc_init((Class)SACommandSucceeded);
  objc_msgSend(v3, "setAceId:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"));
  objc_msgSend(v3, "setRefId:", -[AAPCommandQuitAll aceId](self, "aceId"));
  return v3;
}

- (id)_selfReferencingCommandFailedWithReason:(id)a3
{
  id v5 = objc_alloc_init((Class)SACommandFailed);
  objc_msgSend(v5, "setAceId:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"));
  objc_msgSend(v5, "setRefId:", -[AAPCommandQuitAll aceId](self, "aceId"));
  [v5 setReason:a3];
  return v5;
}

- (AAPCommandQuitAll)initWithDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAPCommandQuitAll;
  id v3 = [(AAPCommandQuitAll *)&v5 initWithDictionary:a3];
  if (v3) {
    v3->_terminator = objc_alloc_init(AAPApplicationTerminator);
  }
  return v3;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = objc_msgSend(-[AAPCommandQuitAll _selfReferencingCommandFailedWithReason:](self, "_selfReferencingCommandFailedWithReason:", @"Quit All Apps unsupported on this platform"), "dictionary");
  objc_super v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

- (AAPApplicationTerminator)terminator
{
  return self->_terminator;
}

- (void)setTerminator:(id)a3
{
}

@end