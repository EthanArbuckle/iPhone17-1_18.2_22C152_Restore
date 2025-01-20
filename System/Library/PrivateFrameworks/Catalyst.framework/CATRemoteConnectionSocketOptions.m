@interface CATRemoteConnectionSocketOptions
- (NSNumber)adaptiveWriteTimeout;
- (NSNumber)keepAliveCount;
- (NSNumber)keepAliveDelay;
- (NSNumber)keepAliveEnabled;
- (NSNumber)keepAliveInterval;
- (NSNumber)netServiceType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAdaptiveWriteTimeout:(id)a3;
- (void)setKeepAliveCount:(id)a3;
- (void)setKeepAliveDelay:(id)a3;
- (void)setKeepAliveEnabled:(id)a3;
- (void)setKeepAliveInterval:(id)a3;
- (void)setNetServiceType:(id)a3;
@end

@implementation CATRemoteConnectionSocketOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  if (v4)
  {
    v5 = [(CATRemoteConnectionSocketOptions *)self adaptiveWriteTimeout];
    [v4 setAdaptiveWriteTimeout:v5];

    v6 = [(CATRemoteConnectionSocketOptions *)self keepAliveEnabled];
    [v4 setKeepAliveEnabled:v6];

    v7 = [(CATRemoteConnectionSocketOptions *)self keepAliveDelay];
    [v4 setKeepAliveDelay:v7];

    v8 = [(CATRemoteConnectionSocketOptions *)self keepAliveInterval];
    [v4 setKeepAliveInterval:v8];

    v9 = [(CATRemoteConnectionSocketOptions *)self keepAliveCount];
    [v4 setKeepAliveCount:v9];

    v10 = [(CATRemoteConnectionSocketOptions *)self netServiceType];
    [v4 setNetServiceType:v10];
  }
  return v4;
}

- (NSNumber)adaptiveWriteTimeout
{
  return self->_adaptiveWriteTimeout;
}

- (void)setAdaptiveWriteTimeout:(id)a3
{
}

- (NSNumber)keepAliveEnabled
{
  return self->_keepAliveEnabled;
}

- (void)setKeepAliveEnabled:(id)a3
{
}

- (NSNumber)keepAliveDelay
{
  return self->_keepAliveDelay;
}

- (void)setKeepAliveDelay:(id)a3
{
}

- (NSNumber)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(id)a3
{
}

- (NSNumber)keepAliveCount
{
  return self->_keepAliveCount;
}

- (void)setKeepAliveCount:(id)a3
{
}

- (NSNumber)netServiceType
{
  return self->_netServiceType;
}

- (void)setNetServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceType, 0);
  objc_storeStrong((id *)&self->_keepAliveCount, 0);
  objc_storeStrong((id *)&self->_keepAliveInterval, 0);
  objc_storeStrong((id *)&self->_keepAliveDelay, 0);
  objc_storeStrong((id *)&self->_keepAliveEnabled, 0);

  objc_storeStrong((id *)&self->_adaptiveWriteTimeout, 0);
}

@end