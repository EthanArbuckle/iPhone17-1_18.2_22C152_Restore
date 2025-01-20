@interface CRProtocolRestrictedInvocationChain
- (BOOL)_selector:(SEL)a3 isPartOfProtocol:(id)a4;
- (BOOL)_selectorIsPartOfRestrictingProtocol:(SEL)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)invocationChain:(id)a3 shouldForwardInvocation:(id)a4 toTarget:(id)a5;
- (BOOL)isEligibleForSelector:(SEL)a3;
- (CRProtocolRestrictedInvocationChain)init;
- (Protocol)restrictingProtocol;
- (void)setRestrictingProtocol:(id)a3;
@end

@implementation CRProtocolRestrictedInvocationChain

- (CRProtocolRestrictedInvocationChain)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRProtocolRestrictedInvocationChain;
  v2 = [(CRInvocationChain *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)CRProtocolRestrictedInvocationChain;
    [(CRInvocationChain *)&v5 setDelegate:v2];
  }
  return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  objc_super v5 = v4;
  if (self->_restrictingProtocol == v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__CRProtocolRestrictedInvocationChain_conformsToProtocol___block_invoke;
    v8[3] = &unk_2647EEF48;
    v9 = v4;
    v10 = &v11;
    [(CRInvocationChain *)self enumerateChainedObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __58__CRProtocolRestrictedInvocationChain_conformsToProtocol___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 conformsToProtocol:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)invocationChain:(id)a3 shouldForwardInvocation:(id)a4 toTarget:(id)a5
{
  if (a3 != self) {
    return 0;
  }
  id v7 = a3;
  LOBYTE(a4) = objc_msgSend(v7, "_selectorIsPartOfRestrictingProtocol:", objc_msgSend(a4, "selector"));

  return (char)a4;
}

- (BOOL)isEligibleForSelector:(SEL)a3
{
  BOOL v5 = -[CRProtocolRestrictedInvocationChain _selectorIsPartOfRestrictingProtocol:](self, "_selectorIsPartOfRestrictingProtocol:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRProtocolRestrictedInvocationChain;
    LOBYTE(v5) = [(CRInvocationChain *)&v7 isEligibleForSelector:a3];
  }
  return v5;
}

- (BOOL)_selectorIsPartOfRestrictingProtocol:(SEL)a3
{
  BOOL v5 = NSStringFromSelector(a3);
  char v6 = [v5 containsString:@"commandWasPerformed"];

  if (v6) {
    return 1;
  }
  restrictingProtocol = self->_restrictingProtocol;
  return [(CRProtocolRestrictedInvocationChain *)self _selector:a3 isPartOfProtocol:restrictingProtocol];
}

- (BOOL)_selector:(SEL)a3 isPartOfProtocol:(id)a4
{
  char v6 = (Protocol *)a4;
  objc_super v7 = v6;
  if (v6)
  {
    unsigned int outCount = 0;
    v8 = protocol_copyMethodDescriptionList(v6, 0, 1, &outCount);
    if (outCount)
    {
      uint64_t v9 = 0;
      while (v8[v9].name != a3)
      {
        if (outCount == ++v9) {
          goto LABEL_6;
        }
      }
      goto LABEL_17;
    }
LABEL_6:
    free(v8);
    unsigned int v16 = 0;
    v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &v16);
    if (v16)
    {
      uint64_t v10 = 0;
      while (v8[v10].name != a3)
      {
        if (v16 == ++v10) {
          goto LABEL_10;
        }
      }
      goto LABEL_17;
    }
LABEL_10:
    free(v8);
    unsigned int v15 = 0;
    uint64_t v11 = protocol_copyProtocolList(v7, &v15);
    if (v15)
    {
      uint64_t v12 = 0;
      while (![(CRProtocolRestrictedInvocationChain *)self _selector:a3 isPartOfProtocol:v11[v12]])
      {
        if (++v12 >= (unint64_t)v15) {
          goto LABEL_14;
        }
      }
      v8 = (objc_method_description *)v11;
LABEL_17:
      free(v8);
      BOOL v13 = 1;
      goto LABEL_18;
    }
LABEL_14:
    free(v11);
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (Protocol)restrictingProtocol
{
  return self->_restrictingProtocol;
}

- (void)setRestrictingProtocol:(id)a3
{
}

- (void).cxx_destruct
{
}

@end