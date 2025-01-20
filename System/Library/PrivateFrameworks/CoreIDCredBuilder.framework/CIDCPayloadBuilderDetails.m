@interface CIDCPayloadBuilderDetails
- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8;
- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9;
- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9 timePolicy:(int64_t)a10;
- (NSData)deviceKey;
- (NSDate)validFrom;
- (NSDate)validUntil;
- (NSDictionary)elements;
- (NSString)docType;
- (int64_t)signingAlgorithm;
- (int64_t)timePolicy;
- (unint64_t)format;
- (void)setDeviceKey:(id)a3;
- (void)setDocType:(id)a3;
- (void)setElements:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setSigningAlgorithm:(int64_t)a3;
- (void)setTimePolicy:(int64_t)a3;
- (void)setValidFrom:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation CIDCPayloadBuilderDetails

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8
{
  return [(CIDCPayloadBuilderDetails *)self initWithFormat:a3 docType:a4 elements:a5 validFrom:a6 validUntil:a7 deviceKey:a8 signingAlgorithm:-8];
}

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9
{
  return [(CIDCPayloadBuilderDetails *)self initWithFormat:a3 docType:a4 elements:a5 validFrom:a6 validUntil:a7 deviceKey:a8 signingAlgorithm:a9 timePolicy:0];
}

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9 timePolicy:(int64_t)a10
{
  v22.receiver = self;
  v22.super_class = (Class)CIDCPayloadBuilderDetails;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = [(CIDCPayloadBuilderDetails *)&v22 init];
  -[CIDCPayloadBuilderDetails setFormat:](v20, "setFormat:", a3, v22.receiver, v22.super_class);
  [(CIDCPayloadBuilderDetails *)v20 setDocType:v19];

  [(CIDCPayloadBuilderDetails *)v20 setElements:v18];
  [(CIDCPayloadBuilderDetails *)v20 setValidFrom:v17];

  [(CIDCPayloadBuilderDetails *)v20 setValidUntil:v16];
  [(CIDCPayloadBuilderDetails *)v20 setDeviceKey:v15];

  [(CIDCPayloadBuilderDetails *)v20 setSigningAlgorithm:a9];
  [(CIDCPayloadBuilderDetails *)v20 setTimePolicy:a10];
  return v20;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSString)docType
{
  return self->_docType;
}

- (void)setDocType:(id)a3
{
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (void)setValidFrom:(id)a3
{
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
}

- (int64_t)timePolicy
{
  return self->_timePolicy;
}

- (void)setTimePolicy:(int64_t)a3
{
  self->_timePolicy = a3;
}

- (NSData)deviceKey
{
  return self->_deviceKey;
}

- (void)setDeviceKey:(id)a3
{
}

- (int64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(int64_t)a3
{
  self->_signingAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceKey, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_elements, 0);

  objc_storeStrong((id *)&self->_docType, 0);
}

@end