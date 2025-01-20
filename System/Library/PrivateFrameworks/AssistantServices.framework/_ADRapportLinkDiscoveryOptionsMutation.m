@interface _ADRapportLinkDiscoveryOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkDiscoveryOptionsMutation)initWithBase:(id)a3;
- (int64_t)getIncludesFamily;
- (int64_t)getIncludesHome;
- (int64_t)getIncludesRemoraDevices;
- (void)setIncludesFamily:(int64_t)a3;
- (void)setIncludesHome:(int64_t)a3;
- (void)setIncludesRemoraDevices:(int64_t)a3;
@end

@implementation _ADRapportLinkDiscoveryOptionsMutation

- (void).cxx_destruct
{
}

- (void)setIncludesRemoraDevices:(int64_t)a3
{
  self->_includesRemoraDevices = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getIncludesRemoraDevices
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_includesRemoraDevices;
  }
  else {
    return [(ADRapportLinkDiscoveryOptions *)self->_base includesRemoraDevices];
  }
}

- (void)setIncludesHome:(int64_t)a3
{
  self->_includesHome = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getIncludesHome
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_includesHome;
  }
  else {
    return [(ADRapportLinkDiscoveryOptions *)self->_base includesHome];
  }
}

- (void)setIncludesFamily:(int64_t)a3
{
  self->_includesFamily = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getIncludesFamily
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_includesFamily;
  }
  else {
    return [(ADRapportLinkDiscoveryOptions *)self->_base includesFamily];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADRapportLinkDiscoveryOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADRapportLinkDiscoveryOptionsMutation;
  v6 = [(_ADRapportLinkDiscoveryOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end