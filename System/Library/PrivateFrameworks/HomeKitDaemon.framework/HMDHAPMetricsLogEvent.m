@interface HMDHAPMetricsLogEvent
- (unint64_t)accessoryServerInvalidations;
- (unint64_t)btleConnectionPerReasons;
- (unint64_t)btleConnections;
- (unint64_t)btleDiscoveries;
- (unint64_t)receivedHTTPEvents;
- (unint64_t)receivedHTTPResponses;
- (unint64_t)sentHTTPRequests;
- (void)updateWithHAPAccessoryServer:(id)a3;
@end

@implementation HMDHAPMetricsLogEvent

- (unint64_t)btleConnectionPerReasons
{
  return self->_btleConnectionPerReasons;
}

- (unint64_t)btleDiscoveries
{
  return self->_btleDiscoveries;
}

- (unint64_t)btleConnections
{
  return self->_btleConnections;
}

- (unint64_t)accessoryServerInvalidations
{
  return self->_accessoryServerInvalidations;
}

- (unint64_t)receivedHTTPEvents
{
  return self->_receivedHTTPEvents;
}

- (unint64_t)receivedHTTPResponses
{
  return self->_receivedHTTPResponses;
}

- (unint64_t)sentHTTPRequests
{
  return self->_sentHTTPRequests;
}

- (void)updateWithHAPAccessoryServer:(id)a3
{
  id v16 = a3;
  if ([v16 conformsToProtocol:&unk_26E616AA8]) {
    v4 = v16;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [v5 readAndResetHAPMetrics:1];
    if (v6)
    {
      if ([v16 linkType] == 1)
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock_with_options();
        v8 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D58);
        self->_accessoryServerInvalidations += [v8 unsignedIntegerValue];

        v9 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D70);
        self->_sentHTTPRequests += [v9 unsignedIntegerValue];

        v10 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D88);
        self->_receivedHTTPResponses += [v10 unsignedIntegerValue];

        v11 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471DA0);
        uint64_t v12 = [v11 unsignedIntegerValue];
        v13 = &OBJC_IVAR___HMDHAPMetricsLogEvent__receivedHTTPEvents;
LABEL_10:
        *(Class *)((char *)&self->super.super.isa + *v13) = (Class)(*(char **)((char *)&self->super.super.isa + *v13)
                                                                  + v12);

        os_unfair_lock_unlock(p_lock);
        goto LABEL_11;
      }
      if ([v16 linkType] == 2)
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock_with_options();
        v14 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D58);
        self->_btleConnections += [v14 unsignedIntegerValue];

        v15 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D70);
        self->_btleDiscoveries += [v15 unsignedIntegerValue];

        v11 = objc_msgSend(v6, "hmf_numberForKey:", &unk_26E471D88);
        uint64_t v12 = [v11 unsignedIntegerValue];
        v13 = &OBJC_IVAR___HMDHAPMetricsLogEvent__btleConnectionPerReasons;
        goto LABEL_10;
      }
    }
LABEL_11:
  }
}

@end