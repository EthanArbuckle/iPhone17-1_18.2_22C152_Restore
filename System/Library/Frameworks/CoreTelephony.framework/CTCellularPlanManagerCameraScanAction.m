@interface CTCellularPlanManagerCameraScanAction
+ (BOOL)supportsSecureCoding;
- (CTCellularPlanManagerCameraScanAction)initWithCoder:(id)a3;
- (NSString)OID;
- (NSString)matchingId;
- (NSString)message;
- (NSString)smdpAddress;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)performWithAppName:(id)a3 completionHandler:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
- (void)setMatchingId:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOID:(id)a3;
- (void)setSmdpAddress:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CTCellularPlanManagerCameraScanAction

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanManagerCameraScanAction *)self message];
  [v3 appendFormat:@", message=%@", v4];

  v5 = [(CTCellularPlanManagerCameraScanAction *)self title];
  [v3 appendFormat:@", title=%@", v5];

  v6 = [(CTCellularPlanManagerCameraScanAction *)self smdpAddress];
  [v3 appendFormat:@", smdpAddress=%@", v6];

  v7 = [(CTCellularPlanManagerCameraScanAction *)self matchingId];
  [v3 appendFormat:@", matchingId=%@", v7];

  v8 = [(CTCellularPlanManagerCameraScanAction *)self OID];
  [v3 appendFormat:@", oid=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v7 = [v4 bundleForClass:objc_opt_class()];
  v6 = [v7 localizedStringForKey:@"CAMERA" value:&stru_1ECFD6720 table:@"CBMessage"];
  [(CTCellularPlanManagerCameraScanAction *)self performWithAppName:v6 completionHandler:v5];
}

- (void)performWithAppName:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void))a4;
  id v7 = a3;
  v8 = [CoreTelephonyClient alloc];
  v10 = [(CoreTelephonyClient *)v8 initWithQueue:MEMORY[0x1E4F14428]];
  v9 = objc_alloc_init(CTCellularPlanProvisioningRequest);
  [(CTCellularPlanProvisioningRequest *)v9 setAddress:self->_smdpAddress];
  [(CTCellularPlanProvisioningRequest *)v9 setMatchingID:self->_matchingId];
  [(CTCellularPlanProvisioningRequest *)v9 setOID:self->_OID];
  [(CoreTelephonyClient *)v10 addPlanWith:v9 appName:v7 appType:1 completionHandler:&__block_literal_global_3];

  v6[2](v6, 0);
}

void __78__CTCellularPlanManagerCameraScanAction_performWithAppName_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((unint64_t)(a2 - 1) > 2) {
    NSLog(&cfstr_RecievedCallba_2.isa);
  }
  else {
    NSLog(*((NSString **)&off_1E5263100 + a2 - 1));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTCellularPlanManagerCameraScanAction *)self message];
  v6 = (void *)[v5 copy];
  [v4 setMessage:v6];

  id v7 = [(CTCellularPlanManagerCameraScanAction *)self title];
  v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  v9 = [(CTCellularPlanManagerCameraScanAction *)self smdpAddress];
  v10 = (void *)[v9 copy];
  [v4 setSmdpAddress:v10];

  v11 = [(CTCellularPlanManagerCameraScanAction *)self matchingId];
  v12 = (void *)[v11 copy];
  [v4 setMatchingId:v12];

  v13 = [(CTCellularPlanManagerCameraScanAction *)self OID];
  v14 = (void *)[v13 copy];
  [v4 setOID:v14];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTCellularPlanManagerCameraScanAction *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(CTCellularPlanManagerCameraScanAction *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  id v7 = [(CTCellularPlanManagerCameraScanAction *)self smdpAddress];
  [v4 encodeObject:v7 forKey:@"smdpaddress"];

  v8 = [(CTCellularPlanManagerCameraScanAction *)self matchingId];
  [v4 encodeObject:v8 forKey:@"matchingid"];

  id v9 = [(CTCellularPlanManagerCameraScanAction *)self OID];
  [v4 encodeObject:v9 forKey:@"oid"];
}

- (CTCellularPlanManagerCameraScanAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTCellularPlanManagerCameraScanAction;
  id v5 = [(CTCellularPlanManagerCameraScanAction *)&v17 init];
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