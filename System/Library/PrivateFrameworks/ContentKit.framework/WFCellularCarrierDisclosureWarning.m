@interface WFCellularCarrierDisclosureWarning
+ (BOOL)supportsSecureCoding;
- (NSString)displayedCarrierName;
- (WFCellularCarrierDisclosureWarning)initWithCoder:(id)a3;
- (WFCellularCarrierDisclosureWarning)initWithDisplayedCarrierName:(id)a3;
- (id)localizedMessage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFCellularCarrierDisclosureWarning

- (void).cxx_destruct
{
}

- (NSString)displayedCarrierName
{
  return self->_displayedCarrierName;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCellularCarrierDisclosureWarning *)self displayedCarrierName];
  [v4 encodeObject:v5 forKey:@"displayedCarrierName"];
}

- (WFCellularCarrierDisclosureWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayedCarrierName"];

  v6 = [(WFCellularCarrierDisclosureWarning *)self initWithDisplayedCarrierName:v5];
  return v6;
}

- (id)localizedMessage
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"This shortcut is attempting to use information about your cellular network “%1$@”. This may be used to infer your device location.");
  id v5 = [(WFCellularCarrierDisclosureWarning *)self displayedCarrierName];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (WFCellularCarrierDisclosureWarning)initWithDisplayedCarrierName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCellularCarrierDisclosureWarning;
  v6 = [(WFCellularCarrierDisclosureWarning *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayedCarrierName, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end