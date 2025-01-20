@interface IDSGFTMetricsLink
- (void)allocBindRequestTimeOut;
- (void)linkConnectedWithProtocolStack:(id)a3;
- (void)receiveAllocbindResponse;
- (void)receiveBindingRequest;
- (void)receiveBindingResponse;
- (void)sendAllocbindRequest;
- (void)sendBindingRequest;
- (void)sendBindingResponse;
- (void)setChannelDataProtocolStack:(id)a3;
- (void)setIPVersion:(unsigned __int8)a3;
- (void)setIsTLEEnabled:(BOOL)a3;
- (void)setLinkType:(id)a3;
- (void)setLocalRAT:(unsigned int)a3;
- (void)setRelayProtocolStack:(id)a3;
- (void)setRemoteRAT:(unsigned int)a3;
- (void)virtualRelayLinkConnected;
@end

@implementation IDSGFTMetricsLink

- (void)setLinkType:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, @"t");
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setLocalRAT:(unsigned int)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v6 = NSString;
  v7 = IDSRadioAccessTechnologyToString(a3);
  v10 = objc_msgSend_stringWithUTF8String_(v6, v8, (uint64_t)v7, v9);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v11, (uint64_t)v10, v12, @"lrat");

  os_unfair_lock_unlock(p_lock);
}

- (void)setRemoteRAT:(unsigned int)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v6 = NSString;
  v7 = IDSRadioAccessTechnologyToString(a3);
  v10 = objc_msgSend_stringWithUTF8String_(v6, v8, (uint64_t)v7, v9);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v11, (uint64_t)v10, v12, @"rrat");

  os_unfair_lock_unlock(p_lock);
}

- (void)setIPVersion:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v8 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v6, v3, v7);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v9, (uint64_t)v8, v10, @"ipver");

  os_unfair_lock_unlock(p_lock);
}

- (void)setRelayProtocolStack:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, @"rps");
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setChannelDataProtocolStack:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, @"cdps");
  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setIsTLEEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v8 = objc_msgSend_numberWithBool_(NSNumber, v6, v3, v7);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v9, (uint64_t)v8, v10, @"tle");

  os_unfair_lock_unlock(p_lock);
}

- (void)sendBindingRequest
{
  objc_msgSend_event_(self, a2, @"sendbreq", v2);
}

- (void)sendBindingResponse
{
  objc_msgSend_event_(self, a2, @"sendbrsp", v2);
}

- (void)receiveBindingRequest
{
  objc_msgSend_event_(self, a2, @"recvbreq", v2);
}

- (void)receiveBindingResponse
{
  objc_msgSend_event_(self, a2, @"recvbrsp", v2);
}

- (void)sendAllocbindRequest
{
  objc_msgSend_event_(self, a2, @"sendabreq", v2);
}

- (void)receiveAllocbindResponse
{
  objc_msgSend_event_(self, a2, @"sendabrsp", v2);
}

- (void)virtualRelayLinkConnected
{
  objc_msgSend_event_(self, a2, @"lc-vr", v2);
}

- (void)linkConnectedWithProtocolStack:(id)a3
{
  id v4 = a3;
  objc_msgSend_event_(self, v5, @"lc", v6);
  objc_msgSend_stringWithFormat_(NSString, v7, @"lc-%@", v8, v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_event_(self, v9, (uint64_t)v11, v10);
}

- (void)allocBindRequestTimeOut
{
  objc_msgSend_event_(self, a2, @"abtout", v2);
}

@end