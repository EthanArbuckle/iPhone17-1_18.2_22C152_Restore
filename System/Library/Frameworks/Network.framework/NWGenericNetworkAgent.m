@interface NWGenericNetworkAgent
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isNexusProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requiresAssert;
- (BOOL)supportsBrowse;
- (BOOL)supportsGroups;
- (BOOL)supportsResolve;
- (NSString)agentDescription;
- (NSString)agentDomain;
- (NSString)agentType;
- (NSString)privateDescription;
- (NSUUID)agentUUID;
- (NWGenericNetworkAgent)initWithKernelAgent:(const netagent *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (netagent)internalNetagent;
- (void)dealloc;
- (void)setInternalNetagent:(netagent *)a3;
@end

@implementation NWGenericNetworkAgent

- (void)setInternalNetagent:(netagent *)a3
{
  self->_internalNetagent = a3;
}

- (netagent)internalNetagent
{
  return self->_internalNetagent;
}

- (BOOL)supportsGroups
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][210] >> 1) & 1;
  }
  return (char)v3;
}

- (BOOL)supportsResolve
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LOBYTE(v3) = (_BYTE)[(NWGenericNetworkAgent *)self internalNetagent][210] & 1;
  }
  return (char)v3;
}

- (BOOL)requiresAssert
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][209] >> 1) & 1;
  }
  return (char)v3;
}

- (BOOL)supportsBrowse
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LOBYTE(v3) = (_BYTE)[(NWGenericNetworkAgent *)self internalNetagent][209] & 1;
  }
  return (char)v3;
}

- (BOOL)isNexusProvider
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = [(NWGenericNetworkAgent *)self internalNetagent][208] >> 7;
  }
  return (char)v3;
}

- (BOOL)isNetworkProvider
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 6) & 1;
  }
  return (char)v3;
}

- (BOOL)isSpecificUseOnly
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 5) & 1;
  }
  return (char)v3;
}

- (BOOL)isVoluntary
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 4) & 1;
  }
  return (char)v3;
}

- (BOOL)isUserActivated
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 3) & 1;
  }
  return (char)v3;
}

- (BOOL)isKernelActivated
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 2) & 1;
  }
  return (char)v3;
}

- (BOOL)isActive
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    LODWORD(v3) = ([(NWGenericNetworkAgent *)self internalNetagent][208] >> 1) & 1;
  }
  return (char)v3;
}

- (NSUUID)agentUUID
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3) {
    v3 = (netagent *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"));
  }

  return (NSUUID *)v3;
}

- (NSString)agentDescription
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 80);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)agentType
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 48);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)agentDomain
{
  v3 = [(NWGenericNetworkAgent *)self internalNetagent];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 16);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)privateDescription
{
  id v2 = [(NWGenericNetworkAgent *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWGenericNetworkAgent *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = [(NWGenericNetworkAgent *)self agentDomain];
  [v7 appendPrettyObject:v8 withName:@"domain" indent:v5 showFullContent:1];

  v9 = [(NWGenericNetworkAgent *)self agentType];
  [v7 appendPrettyObject:v9 withName:@"type" indent:v5 showFullContent:1];

  if (!v4)
  {
    v14 = [(NWGenericNetworkAgent *)self agentDescription];
    [v7 appendPrettyObject:v14 withName:@"description" indent:v5 showFullContent:1];

    BOOL v12 = [(NWGenericNetworkAgent *)self isActive];
    v13 = @"isActive";
    goto LABEL_19;
  }
  v10 = [(NWGenericNetworkAgent *)self agentUUID];
  [v7 appendPrettyObject:v10 withName:@"UUID" indent:v5 showFullContent:1];

  v11 = [(NWGenericNetworkAgent *)self agentDescription];
  [v7 appendPrettyObject:v11 withName:@"description" indent:v5 showFullContent:1];

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isActive](self, "isActive"), @"isActive", v5);
  if ([(NWGenericNetworkAgent *)self isKernelActivated]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isKernelActivated](self, "isKernelActivated"), @"isKernelActivated", v5);
  }
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isUserActivated](self, "isUserActivated"), @"isUserActivated", v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isVoluntary](self, "isVoluntary"), @"isVoluntary", v5);
  if ([(NWGenericNetworkAgent *)self isSpecificUseOnly]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isSpecificUseOnly](self, "isSpecificUseOnly"), @"isSpecificUseOnly", v5);
  }
  if ([(NWGenericNetworkAgent *)self isNetworkProvider]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isNetworkProvider](self, "isNetworkProvider"), @"isNetworkProvider", v5);
  }
  if ([(NWGenericNetworkAgent *)self isNexusProvider]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isNexusProvider](self, "isNexusProvider"), @"isNexusProvider", v5);
  }
  if ([(NWGenericNetworkAgent *)self supportsBrowse]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsBrowse](self, "supportsBrowse"), @"supportsBrowse", v5);
  }
  if ([(NWGenericNetworkAgent *)self supportsResolve]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsResolve](self, "supportsResolve"), @"supportsResolve", v5);
  }
  if ([(NWGenericNetworkAgent *)self supportsGroups]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsGroups](self, "supportsGroups"), @"supportsGroups", v5);
  }
  if ([(NWGenericNetworkAgent *)self requiresAssert])
  {
    BOOL v12 = [(NWGenericNetworkAgent *)self requiresAssert];
    v13 = @"requiresAssert";
LABEL_19:
    [v7 appendPrettyBOOL:v12 withName:v13 indent:v5];
  }
  return v7;
}

- (void)dealloc
{
  if ([(NWGenericNetworkAgent *)self internalNetagent])
  {
    free([(NWGenericNetworkAgent *)self internalNetagent]);
    [(NWGenericNetworkAgent *)self setInternalNetagent:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NWGenericNetworkAgent;
  [(NWGenericNetworkAgent *)&v3 dealloc];
}

- (NWGenericNetworkAgent)initWithKernelAgent:(const netagent *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NWGenericNetworkAgent;
  BOOL v4 = [(NWGenericNetworkAgent *)&v9 init];
  uint64_t v5 = v4;
  if (a3)
  {
    if (v4)
    {
      size_t v6 = a3->var5 + 216;
      id v7 = (netagent *)malloc_type_malloc(v6, 0x35CA1148uLL);
      v5->_internalNetagent = v7;
      if (v7) {
        memcpy(v7, a3, v6);
      }
    }
  }
  return v5;
}

@end