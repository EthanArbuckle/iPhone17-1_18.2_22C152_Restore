@interface CTCellularPlanQRCodeAction
+ (BOOL)supportsSecureCoding;
- (CTCellularPlanQRCodeAction)initWithCoder:(id)a3;
- (NSString)OID;
- (NSString)matchingId;
- (NSString)message;
- (NSString)smdpAddress;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
- (void)setMatchingId:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOID:(id)a3;
- (void)setSmdpAddress:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CTCellularPlanQRCodeAction

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanQRCodeAction *)self message];
  [v3 appendFormat:@", message=%@", v4];

  v5 = [(CTCellularPlanQRCodeAction *)self title];
  [v3 appendFormat:@", title=%@", v5];

  v6 = [(CTCellularPlanQRCodeAction *)self smdpAddress];
  [v3 appendFormat:@", smdpAddress=%@", v6];

  v7 = [(CTCellularPlanQRCodeAction *)self matchingId];
  [v3 appendFormat:@", matchingId=%@", v7];

  v8 = [(CTCellularPlanQRCodeAction *)self OID];
  [v3 appendFormat:@", oid=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [CoreTelephonyClient alloc];
  v13 = [(CoreTelephonyClient *)v5 initWithQueue:MEMORY[0x1E4F14428]];
  v6 = objc_alloc_init(CTCellularPlanProvisioningRequest);
  v7 = [(CTCellularPlanQRCodeAction *)self smdpAddress];
  [(CTCellularPlanProvisioningRequest *)v6 setAddress:v7];

  v8 = [(CTCellularPlanQRCodeAction *)self matchingId];
  [(CTCellularPlanProvisioningRequest *)v6 setMatchingID:v8];

  v9 = [(CTCellularPlanQRCodeAction *)self OID];
  [(CTCellularPlanProvisioningRequest *)v6 setOID:v9];

  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v10 bundleIdentifier];
  unsigned int v12 = [v11 hasPrefix:@"com.apple."];

  [(CoreTelephonyClient *)v13 addQRCodePlanWith:v6 appType:v12 completionHandler:&__block_literal_global_10];
  v4[2](v4, 0);
}

void __59__CTCellularPlanQRCodeAction_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((unint64_t)(a2 - 1) > 2) {
    NSLog(&cfstr_ReceivedCallba_2.isa);
  }
  else {
    NSLog(&off_1E5265A10[a2 - 1]->isa);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTCellularPlanQRCodeAction *)self message];
  v6 = (void *)[v5 copy];
  [v4 setMessage:v6];

  v7 = [(CTCellularPlanQRCodeAction *)self title];
  v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  v9 = [(CTCellularPlanQRCodeAction *)self smdpAddress];
  v10 = (void *)[v9 copy];
  [v4 setSmdpAddress:v10];

  v11 = [(CTCellularPlanQRCodeAction *)self matchingId];
  unsigned int v12 = (void *)[v11 copy];
  [v4 setMatchingId:v12];

  v13 = [(CTCellularPlanQRCodeAction *)self OID];
  v14 = (void *)[v13 copy];
  [v4 setOID:v14];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTCellularPlanQRCodeAction *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(CTCellularPlanQRCodeAction *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  v7 = [(CTCellularPlanQRCodeAction *)self smdpAddress];
  [v4 encodeObject:v7 forKey:@"smdpaddress"];

  v8 = [(CTCellularPlanQRCodeAction *)self matchingId];
  [v4 encodeObject:v8 forKey:@"matchingid"];

  id v9 = [(CTCellularPlanQRCodeAction *)self OID];
  [v4 encodeObject:v9 forKey:@"oid"];
}

- (CTCellularPlanQRCodeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTCellularPlanQRCodeAction;
  v5 = [(CTCellularPlanQRCodeAction *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smdpaddress"];
    smdpAddress = v5->_smdpAddress;
    v5->_smdpAddress = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingid"];
    matchingId = v5->_matchingId;
    v5->_matchingId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oid"];
    OID = v5->_OID;
    v5->_OID = (NSString *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)smdpAddress
{
  return self->_smdpAddress;
}

- (void)setSmdpAddress:(id)a3
{
}

- (NSString)matchingId
{
  return self->_matchingId;
}

- (void)setMatchingId:(id)a3
{
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_matchingId, 0);
  objc_storeStrong((id *)&self->_smdpAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end