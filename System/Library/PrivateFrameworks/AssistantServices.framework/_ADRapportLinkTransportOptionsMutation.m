@interface _ADRapportLinkTransportOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkTransportOptionsMutation)initWithBase:(id)a3;
- (int64_t)getAllowsAWDL;
- (int64_t)getAllowsBLE;
- (int64_t)getAllowsBTPipe;
- (int64_t)getAllowsForceAWDL;
- (int64_t)getAllowsForceBLE;
- (int64_t)getAllowsInfraWiFi;
- (int64_t)getNoL2Cap;
- (void)setAllowsAWDL:(int64_t)a3;
- (void)setAllowsBLE:(int64_t)a3;
- (void)setAllowsBTPipe:(int64_t)a3;
- (void)setAllowsForceAWDL:(int64_t)a3;
- (void)setAllowsForceBLE:(int64_t)a3;
- (void)setAllowsInfraWiFi:(int64_t)a3;
- (void)setNoL2Cap:(int64_t)a3;
@end

@implementation _ADRapportLinkTransportOptionsMutation

- (void).cxx_destruct
{
}

- (void)setNoL2Cap:(int64_t)a3
{
  self->_noL2Cap = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x81u;
}

- (int64_t)getNoL2Cap
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80000000) != 0) {
    return self->_noL2Cap;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base noL2Cap];
  }
}

- (void)setAllowsForceAWDL:(int64_t)a3
{
  self->_allowsForceAWDL = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (int64_t)getAllowsForceAWDL
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0) {
    return self->_allowsForceAWDL;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsForceAWDL];
  }
}

- (void)setAllowsForceBLE:(int64_t)a3
{
  self->_allowsForceBLE = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (int64_t)getAllowsForceBLE
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_allowsForceBLE;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsForceBLE];
  }
}

- (void)setAllowsBTPipe:(int64_t)a3
{
  self->_allowsBTPipe = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getAllowsBTPipe
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_allowsBTPipe;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsBTPipe];
  }
}

- (void)setAllowsInfraWiFi:(int64_t)a3
{
  self->_allowsInfraWiFi = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getAllowsInfraWiFi
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_allowsInfraWiFi;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsInfraWiFi];
  }
}

- (void)setAllowsBLE:(int64_t)a3
{
  self->_allowsBLE = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getAllowsBLE
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_allowsBLE;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsBLE];
  }
}

- (void)setAllowsAWDL:(int64_t)a3
{
  self->_allowsAWDL = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getAllowsAWDL
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_allowsAWDL;
  }
  else {
    return [(ADRapportLinkTransportOptions *)self->_base allowsAWDL];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADRapportLinkTransportOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADRapportLinkTransportOptionsMutation;
  v6 = [(_ADRapportLinkTransportOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end