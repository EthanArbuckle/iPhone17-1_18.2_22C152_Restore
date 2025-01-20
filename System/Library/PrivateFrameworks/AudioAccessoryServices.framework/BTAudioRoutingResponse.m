@interface BTAudioRoutingResponse
+ (BOOL)supportsSecureCoding;
- (BTAudioRoutingResponse)initWithCoder:(id)a3;
- (NSDictionary)wxInfo;
- (NSError)error;
- (NSString)deviceAddress;
- (NSString)reason;
- (id)description;
- (int)action;
- (unsigned)clientID;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setError:(id)a3;
- (void)setReason:(id)a3;
- (void)setWxInfo:(id)a3;
@end

@implementation BTAudioRoutingResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioRoutingResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTAudioRoutingResponse *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_action = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t action = self->_action;
  id v11 = v4;
  if (action)
  {
    [v4 encodeInteger:action forKey:@"actn"];
    id v4 = v11;
  }
  uint64_t clientID = self->_clientID;
  if (clientID)
  {
    [v11 encodeInt64:clientID forKey:@"cid"];
    id v4 = v11;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    [v11 encodeObject:deviceAddress forKey:@"dAdr"];
    id v4 = v11;
  }
  error = self->_error;
  if (error)
  {
    [v11 encodeObject:error forKey:@"err"];
    id v4 = v11;
  }
  reason = self->_reason;
  if (reason)
  {
    [v11 encodeObject:reason forKey:@"reas"];
    id v4 = v11;
  }
  wxInfo = self->_wxInfo;
  if (wxInfo)
  {
    [v11 encodeObject:wxInfo forKey:@"wxif"];
    id v4 = v11;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_uint64_t action = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSDictionary)wxInfo
{
  return self->_wxInfo;
}

- (void)setWxInfo:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_wxInfo, 0);

  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end