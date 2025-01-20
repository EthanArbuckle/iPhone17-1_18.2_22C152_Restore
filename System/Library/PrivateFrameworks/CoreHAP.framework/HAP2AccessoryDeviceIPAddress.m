@interface HAP2AccessoryDeviceIPAddress
- (HAP2AccessoryDeviceIPAddress)initWithAddress:(const coap_address_t *)a3;
- (coap_address_t)address;
- (coap_address_t)getAddressPtr;
@end

@implementation HAP2AccessoryDeviceIPAddress

- (coap_address_t)address
{
  in6_addr v3 = *(in6_addr *)((char *)&self->addr.sin6.sin6_addr + 12);
  *(_OWORD *)&retstr->size = *(_OWORD *)&self->addr.sin6.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->addr.sin6.sin6_addr + 4) = v3;
  return self;
}

- (coap_address_t)getAddressPtr
{
  return &self->_address;
}

- (HAP2AccessoryDeviceIPAddress)initWithAddress:(const coap_address_t *)a3
{
  *(in6_addr *)((char *)&self->_address.addr.sin6.sin6_addr + 4) = 0u;
  *(_OWORD *)&self->_address.size = 0u;
  self->_address.size = a3->size;
  p_addr = &a3->addr;
  int sa_family = a3->addr.sa.sa_family;
  if (sa_family == 2)
  {
    self->_address.addr.sa = p_addr->sa;
  }
  else if (sa_family == 30)
  {
    self->_address.addr.sa.int sa_family = 30;
    self->_address.addr.sin6.sin6_addr = a3->addr.sin6.sin6_addr;
    self->_address.addr.sin.sin_port = a3->addr.sin.sin_port;
    self->_address.addr.sin6.sin6_scope_id = a3->addr.sin6.sin6_scope_id;
  }
  else
  {
    memcpy(&self->_address.addr, p_addr, a3->size);
  }
  return self;
}

@end