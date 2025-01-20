@interface HDOriginalFHIRResourceObject
- (id)codableFHIRResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDateTimeZoneName:(id)a5 firstSeenDateTimeZoneName:(id)a6;
@end

@implementation HDOriginalFHIRResourceObject

- (id)codableFHIRResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDateTimeZoneName:(id)a5 firstSeenDateTimeZoneName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(HDOriginalFHIRResourceObject *)self receivedDate];
  v15 = [(HDOriginalFHIRResourceObject *)self firstSeenDate];
  id v16 = [(HDOriginalFHIRResourceObject *)self extractionHints];
  v17 = [(HDOriginalFHIRResourceObject *)self originInformation];
  v20.receiver = self;
  v20.super_class = (Class)HDOriginalFHIRResourceObject;
  v18 = [(HDOriginalFHIRResourceObject *)&v20 _codableFHIRResourceWithGatewayExternalID:v13 accountID:v12 receivedDate:v14 receivedDateTimeZoneName:v11 firstSeenDate:v15 firstSeenDateTimeZoneName:v10 extractionHints:v16 originInformation:v17];

  return v18;
}

@end