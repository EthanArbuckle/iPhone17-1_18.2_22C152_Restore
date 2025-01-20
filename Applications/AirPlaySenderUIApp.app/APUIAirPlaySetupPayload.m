@interface APUIAirPlaySetupPayload
+ (BOOL)supportsSecureCoding;
- (APUIAirPlaySetupPayload)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNetworkHidden;
- (BOOL)routeToReceiver;
- (NSString)brokerToken;
- (NSString)captivePortalAuthToken;
- (NSString)receiverToken;
- (NSString)wifiPassphrase;
- (NSString)wifiSSID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBrokerToken:(id)a3;
- (void)setCaptivePortalAuthToken:(id)a3;
- (void)setIsNetworkHidden:(BOOL)a3;
- (void)setReceiverToken:(id)a3;
- (void)setRouteToReceiver:(BOOL)a3;
- (void)setWifiPassphrase:(id)a3;
- (void)setWifiSSID:(id)a3;
@end

@implementation APUIAirPlaySetupPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APUIAirPlaySetupPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APUIAirPlaySetupPayload;
  v5 = [(APUIAirPlaySetupPayload *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiSSID"];
    [(APUIAirPlaySetupPayload *)v5 setWifiSSID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiPassphrase"];
    [(APUIAirPlaySetupPayload *)v5 setWifiPassphrase:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brokerToken"];
    [(APUIAirPlaySetupPayload *)v5 setBrokerToken:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverToken"];
    [(APUIAirPlaySetupPayload *)v5 setReceiverToken:v9];

    -[APUIAirPlaySetupPayload setIsNetworkHidden:](v5, "setIsNetworkHidden:", [v4 decodeBoolForKey:@"isNetworkHidden"]);
    -[APUIAirPlaySetupPayload setRouteToReceiver:](v5, "setRouteToReceiver:", [v4 decodeBoolForKey:@"routeToReceiver"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captivePortalAuthToken"];
    [(APUIAirPlaySetupPayload *)v5 setCaptivePortalAuthToken:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APUIAirPlaySetupPayload *)self wifiSSID];
  [v4 encodeObject:v5 forKey:@"wifiSSID"];

  v6 = [(APUIAirPlaySetupPayload *)self wifiPassphrase];
  [v4 encodeObject:v6 forKey:@"wifiPassphrase"];

  v7 = [(APUIAirPlaySetupPayload *)self brokerToken];
  [v4 encodeObject:v7 forKey:@"brokerToken"];

  v8 = [(APUIAirPlaySetupPayload *)self receiverToken];
  [v4 encodeObject:v8 forKey:@"receiverToken"];

  [v4 encodeBool:[self isNetworkHidden] forKey:@"isNetworkHidden"];
  [v4 encodeBool:[self routeToReceiver] forKey:@"routeToReceiver"];
  id v9 = [(APUIAirPlaySetupPayload *)self captivePortalAuthToken];
  [v4 encodeObject:v9 forKey:@"captivePortalAuthToken"];
}

- (id)description
{
  uint64_t v26 = objc_opt_class();
  v3 = [(APUIAirPlaySetupPayload *)self wifiSSID];
  if (v3 && !IsAppleInternalBuild())
  {
    int v5 = 0;
    id v4 = @"#Redacted#";
  }
  else
  {
    id v4 = [(APUIAirPlaySetupPayload *)self wifiSSID];
    int v5 = 1;
  }
  v6 = [(APUIAirPlaySetupPayload *)self wifiPassphrase];
  if (v6 && !IsAppleInternalBuild())
  {
    int v25 = 0;
    v7 = @"#Redacted#";
  }
  else
  {
    v7 = [(APUIAirPlaySetupPayload *)self wifiPassphrase];
    int v25 = 1;
  }
  v24 = [(APUIAirPlaySetupPayload *)self brokerToken];
  if (v24 && !IsAppleInternalBuild())
  {
    int v22 = 0;
    CFStringRef v23 = @"#Redacted#";
  }
  else
  {
    CFStringRef v23 = [(APUIAirPlaySetupPayload *)self brokerToken];
    int v22 = 1;
  }
  v21 = [(APUIAirPlaySetupPayload *)self receiverToken];
  if (v21 && !IsAppleInternalBuild())
  {
    int v20 = 0;
    v27 = @"#Redacted#";
  }
  else
  {
    v27 = [(APUIAirPlaySetupPayload *)self receiverToken];
    int v20 = 1;
  }
  BOOL v8 = [(APUIAirPlaySetupPayload *)self routeToReceiver];
  BOOL v9 = [(APUIAirPlaySetupPayload *)self isNetworkHidden];
  v10 = [(APUIAirPlaySetupPayload *)self captivePortalAuthToken];
  if (v10 && !IsAppleInternalBuild())
  {
    BOOL v19 = v8;
    v15 = (__CFString *)v23;
    v16 = +[NSString stringWithFormat:@"<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>", v26, self, v4, v7, v23, v27, v19, v9, @"#Redacted#"];
  }
  else
  {
    [(APUIAirPlaySetupPayload *)self captivePortalAuthToken];
    v11 = v6;
    int v12 = v5;
    v14 = v13 = v3;
    BOOL v18 = v8;
    v15 = (__CFString *)v23;
    v16 = +[NSString stringWithFormat:@"<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>", v26, self, v4, v7, v23, v27, v18, v9, v14];

    v3 = v13;
    int v5 = v12;
    v6 = v11;
  }

  if (v20) {
  if (v22)
  }

  if (v25) {
  if (v5)
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (!v5 || (NSClassFromString(@"APUIAirPlaySetupPayload"), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v38 = 0;
    v7 = 0;
    goto LABEL_48;
  }
  id v6 = v5;
  v7 = v6;
  wifiSSID = self->_wifiSSID;
  if (!wifiSSID)
  {
    uint64_t v14 = [v6 wifiSSID];
    if (!v14) {
      goto LABEL_12;
    }
    BOOL isNetworkHidden = v14;
    if (!self->_wifiSSID) {
      goto LABEL_46;
    }
  }
  uint64_t v9 = [v7 wifiSSID];
  if (!v9) {
    goto LABEL_45;
  }
  v10 = (void *)v9;
  v11 = self->_wifiSSID;
  int v12 = [v7 wifiSSID];
  unsigned int v13 = [(NSString *)v11 isEqualToString:v12];

  if (wifiSSID)
  {
    if (!v13) {
      goto LABEL_47;
    }
  }
  else
  {

    if ((v13 & 1) == 0) {
      goto LABEL_47;
    }
  }
LABEL_12:
  wifiSSID = self->_wifiPassphrase;
  if (!wifiSSID)
  {
    uint64_t v20 = [v7 wifiPassphrase];
    if (!v20) {
      goto LABEL_21;
    }
    BOOL isNetworkHidden = v20;
    if (!self->_wifiPassphrase) {
      goto LABEL_46;
    }
  }
  uint64_t v15 = [v7 wifiPassphrase];
  if (!v15) {
    goto LABEL_45;
  }
  v16 = (void *)v15;
  wifiPassphrase = self->_wifiPassphrase;
  BOOL v18 = [v7 wifiPassphrase];
  unsigned int v19 = [(NSString *)wifiPassphrase isEqualToString:v18];

  if (wifiSSID)
  {
    if (!v19) {
      goto LABEL_47;
    }
  }
  else
  {

    if ((v19 & 1) == 0) {
      goto LABEL_47;
    }
  }
LABEL_21:
  wifiSSID = self->_captivePortalAuthToken;
  if (!wifiSSID)
  {
    uint64_t v26 = [v7 captivePortalAuthToken];
    if (!v26) {
      goto LABEL_30;
    }
    BOOL isNetworkHidden = v26;
    if (!self->_captivePortalAuthToken) {
      goto LABEL_46;
    }
  }
  uint64_t v21 = [v7 captivePortalAuthToken];
  if (!v21) {
    goto LABEL_45;
  }
  int v22 = (void *)v21;
  captivePortalAuthToken = self->_captivePortalAuthToken;
  v24 = [v7 captivePortalAuthToken];
  unsigned int v25 = [(NSString *)captivePortalAuthToken isEqual:v24];

  if (wifiSSID)
  {
    if (!v25) {
      goto LABEL_47;
    }
  }
  else
  {

    if ((v25 & 1) == 0) {
      goto LABEL_47;
    }
  }
LABEL_30:
  BOOL isNetworkHidden = self->_isNetworkHidden;
  if (isNetworkHidden != [v7 isNetworkHidden]) {
    goto LABEL_47;
  }
  wifiSSID = self->_brokerToken;
  if (!wifiSSID)
  {
    uint64_t v32 = [v7 brokerToken];
    if (!v32) {
      goto LABEL_40;
    }
    BOOL isNetworkHidden = v32;
    if (!self->_brokerToken) {
      goto LABEL_46;
    }
  }
  uint64_t v27 = [v7 brokerToken];
  if (!v27) {
    goto LABEL_45;
  }
  v28 = (void *)v27;
  brokerToken = self->_brokerToken;
  v30 = [v7 brokerToken];
  unsigned int v31 = [(NSString *)brokerToken isEqualToString:v30];

  if (wifiSSID)
  {
    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {

    if ((v31 & 1) == 0) {
      goto LABEL_47;
    }
  }
LABEL_40:
  wifiSSID = self->_receiverToken;
  if (!wifiSSID)
  {
    uint64_t v40 = [v7 receiverToken];
    if (!v40) {
      goto LABEL_53;
    }
    BOOL isNetworkHidden = v40;
    if (!self->_receiverToken)
    {
LABEL_46:

      goto LABEL_47;
    }
  }
  uint64_t v33 = [v7 receiverToken];
  if (!v33)
  {
LABEL_45:
    if (wifiSSID) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  v34 = (void *)v33;
  receiverToken = self->_receiverToken;
  v36 = [v7 receiverToken];
  unsigned int v37 = [(NSString *)receiverToken isEqualToString:v36];

  if (!wifiSSID)
  {

    if ((v37 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_53:
    int routeToReceiver = self->_routeToReceiver;
    BOOL v38 = routeToReceiver == [v7 routeToReceiver];
    goto LABEL_48;
  }
  if (v37) {
    goto LABEL_53;
  }
LABEL_47:
  BOOL v38 = 0;
LABEL_48:

  return v38;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (NSString)wifiPassphrase
{
  return self->_wifiPassphrase;
}

- (void)setWifiPassphrase:(id)a3
{
}

- (NSString)captivePortalAuthToken
{
  return self->_captivePortalAuthToken;
}

- (void)setCaptivePortalAuthToken:(id)a3
{
}

- (BOOL)isNetworkHidden
{
  return self->_isNetworkHidden;
}

- (void)setIsNetworkHidden:(BOOL)a3
{
  self->_BOOL isNetworkHidden = a3;
}

- (NSString)brokerToken
{
  return self->_brokerToken;
}

- (void)setBrokerToken:(id)a3
{
}

- (NSString)receiverToken
{
  return self->_receiverToken;
}

- (void)setReceiverToken:(id)a3
{
}

- (BOOL)routeToReceiver
{
  return self->_routeToReceiver;
}

- (void)setRouteToReceiver:(BOOL)a3
{
  self->_int routeToReceiver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverToken, 0);
  objc_storeStrong((id *)&self->_brokerToken, 0);
  objc_storeStrong((id *)&self->_captivePortalAuthToken, 0);
  objc_storeStrong((id *)&self->_wifiPassphrase, 0);

  objc_storeStrong((id *)&self->_wifiSSID, 0);
}

@end