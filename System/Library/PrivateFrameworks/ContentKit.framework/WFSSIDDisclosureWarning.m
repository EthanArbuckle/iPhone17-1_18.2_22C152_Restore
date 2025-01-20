@interface WFSSIDDisclosureWarning
+ (BOOL)supportsSecureCoding;
- (NSString)displayedNetworkName;
- (WFSSIDDisclosureWarning)initWithCoder:(id)a3;
- (WFSSIDDisclosureWarning)initWithDisplayedNetworkName:(id)a3;
- (id)localizedMessage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSSIDDisclosureWarning

- (void).cxx_destruct
{
}

- (NSString)displayedNetworkName
{
  return self->_displayedNetworkName;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSSIDDisclosureWarning *)self displayedNetworkName];
  [v4 encodeObject:v5 forKey:@"displayedNetworkName"];
}

- (WFSSIDDisclosureWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayedNetworkName"];

  v6 = [(WFSSIDDisclosureWarning *)self initWithDisplayedNetworkName:v5];
  return v6;
}

- (id)localizedMessage
{
  v3 = [MEMORY[0x263F85258] currentDevice];
  int v4 = [v3 hasCapability:*MEMORY[0x263F85698]];

  id v5 = NSString;
  if (v4) {
    v6 = @"This shortcut is attempting to use your WLAN network name “%1$@”. This may be used to infer your device location.";
  }
  else {
    v6 = @"This shortcut is attempting to use your Wi-Fi network name “%1$@”. This may be used to infer your device location.";
  }
  v7 = WFLocalizedString(v6);
  v8 = [(WFSSIDDisclosureWarning *)self displayedNetworkName];
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (WFSSIDDisclosureWarning)initWithDisplayedNetworkName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSSIDDisclosureWarning;
  v6 = [(WFSSIDDisclosureWarning *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayedNetworkName, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end