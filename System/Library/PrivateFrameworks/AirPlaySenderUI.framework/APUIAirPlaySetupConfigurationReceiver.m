@interface APUIAirPlaySetupConfigurationReceiver
- (BOOL)routeToReceiverAfterSetup;
- (NSString)ID;
- (NSString)authString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAuthString:(id)a3;
- (void)setID:(id)a3;
- (void)setRouteToReceiverAfterSetup:(BOOL)a3;
@end

@implementation APUIAirPlaySetupConfigurationReceiver

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(APUIAirPlaySetupConfigurationReceiver *)self ID];
  [v4 setID:v5];

  v6 = [(APUIAirPlaySetupConfigurationReceiver *)self authString];
  [v4 setAuthString:v6];

  objc_msgSend(v4, "setRouteToReceiverAfterSetup:", -[APUIAirPlaySetupConfigurationReceiver routeToReceiverAfterSetup](self, "routeToReceiverAfterSetup"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(APUIAirPlaySetupConfigurationReceiver *)self ID];
  v5 = [(APUIAirPlaySetupConfigurationReceiver *)self authString];
  if (v5 && !IsAppleInternalBuild())
  {
    int v7 = 0;
    v6 = @"#Redacted#";
  }
  else
  {
    v6 = [(APUIAirPlaySetupConfigurationReceiver *)self authString];
    int v7 = 1;
  }
  BOOL v8 = [(APUIAirPlaySetupConfigurationReceiver *)self routeToReceiverAfterSetup];
  v9 = "no";
  if (v8) {
    v9 = "yes";
  }
  v10 = [v3 stringWithFormat:@"Receiver<ID=%@|authString=%@|routeToReceiverAfterSetup=%s>", v4, v6, v9];
  if (v7) {

  }
  return v10;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)authString
{
  return self->_authString;
}

- (void)setAuthString:(id)a3
{
}

- (BOOL)routeToReceiverAfterSetup
{
  return self->_routeToReceiverAfterSetup;
}

- (void)setRouteToReceiverAfterSetup:(BOOL)a3
{
  self->_routeToReceiverAfterSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authString, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end