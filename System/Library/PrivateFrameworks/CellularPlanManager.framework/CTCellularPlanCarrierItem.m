@interface CTCellularPlanCarrierItem
+ (BOOL)supportsSecureCoding;
- (BOOL)applePaySupported;
- (CTCellularPlanCarrierItem)initWithCoder:(id)a3;
- (CTCellularPlanCarrierItem)initWithName:(id)a3 plan:(id)a4 url:(id)a5 applePaySupported:(BOOL)a6 responseType:(id)a7 warningText:(id)a8 purchaseOption:(id)a9;
- (CTPlan)plan;
- (NSString)name;
- (NSString)planPurchaseEndpointType;
- (NSString)purchaseOption;
- (NSString)warningText;
- (NSString)websheetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellularPlanCarrierItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanCarrierItem)initWithName:(id)a3 plan:(id)a4 url:(id)a5 applePaySupported:(BOOL)a6 responseType:(id)a7 warningText:(id)a8 purchaseOption:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CTCellularPlanCarrierItem;
  v21 = [(CTCellularPlanCarrierItem *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    name = v21->_name;
    v21->_name = (NSString *)v22;

    objc_storeStrong((id *)&v21->_plan, a4);
    uint64_t v24 = [v17 copy];
    websheetURL = v21->_websheetURL;
    v21->_websheetURL = (NSString *)v24;

    v21->_applePaySupported = a6;
    uint64_t v26 = [v18 copy];
    planPurchaseEndpointType = v21->_planPurchaseEndpointType;
    v21->_planPurchaseEndpointType = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    warningText = v21->_warningText;
    v21->_warningText = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    purchaseOption = v21->_purchaseOption;
    v21->_purchaseOption = (NSString *)v30;
  }
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(NSString *)self->_name copy];
  plan = self->_plan;
  v7 = (void *)[(NSString *)self->_websheetURL copy];
  BOOL applePaySupported = self->_applePaySupported;
  v9 = (void *)[(NSString *)self->_planPurchaseEndpointType copy];
  v10 = (void *)[(NSString *)self->_warningText copy];
  v11 = (void *)[(NSString *)self->_purchaseOption copy];
  v12 = (void *)[v4 initWithName:v5 plan:plan url:v7 applePaySupported:applePaySupported responseType:v9 warningText:v10 purchaseOption:v11];

  return v12;
}

- (CTCellularPlanCarrierItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanCarrierItem;
  v5 = [(CTCellularPlanCarrierItem *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plan"];
    plan = v5->_plan;
    v5->_plan = (CTPlan *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"websheetUrl"];
    websheetURL = v5->_websheetURL;
    v5->_websheetURL = (NSString *)v10;

    v5->_BOOL applePaySupported = [v4 decodeBoolForKey:@"applePay"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseType"];
    planPurchaseEndpointType = v5->_planPurchaseEndpointType;
    v5->_planPurchaseEndpointType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"warningText"];
    warningText = v5->_warningText;
    v5->_warningText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseOption"];
    purchaseOption = v5->_purchaseOption;
    v5->_purchaseOption = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"carrierName"];
  [v5 encodeObject:self->_plan forKey:@"plan"];
  [v5 encodeObject:self->_websheetURL forKey:@"websheetUrl"];
  [v5 encodeBool:self->_applePaySupported forKey:@"applePay"];
  [v5 encodeObject:self->_planPurchaseEndpointType forKey:@"responseType"];
  [v5 encodeObject:self->_warningText forKey:@"warningText"];
  [v5 encodeObject:self->_purchaseOption forKey:@"purchaseOption"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p Carrier Name: %@ plan: %@ ApplePay: %d warningText: %@ purchaseOption: %@>", v5, self, self->_name, self->_plan, self->_applePaySupported, self->_warningText, self->_purchaseOption];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (CTPlan)plan
{
  return self->_plan;
}

- (NSString)websheetURL
{
  return self->_websheetURL;
}

- (BOOL)applePaySupported
{
  return self->_applePaySupported;
}

- (NSString)planPurchaseEndpointType
{
  return self->_planPurchaseEndpointType;
}

- (NSString)warningText
{
  return self->_warningText;
}

- (NSString)purchaseOption
{
  return self->_purchaseOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_purchaseOption, 0);
  objc_storeStrong((id *)&self->_addOnEndpointType, 0);
  objc_storeStrong((id *)&self->_addOnWebsheetURL, 0);
  objc_storeStrong((id *)&self->_warningText, 0);
  objc_storeStrong((id *)&self->_planPurchaseEndpointType, 0);
  objc_storeStrong((id *)&self->_websheetURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end