@interface VN3XKGTKNBvy6h4RFtpxLyW
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VN3XKGTKNBvy6h4RFtpxLyW)initWithCoder:(id)a3;
- (VN3XKGTKNBvy6h4RFtpxLyW)initWithOriginatingRequestSpecifier:(id)a3 imageSignatureprint:(id)a4 imageSignatureHash:(id)a5;
- (VN6Ac6Cyl5O5oK19HboyMBR)imageSignatureprint;
- (VN6B8mkraBUpwUqskMYPtS3)imageSignatureHash;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VN3XKGTKNBvy6h4RFtpxLyW

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSignatureHash, 0);

  objc_storeStrong((id *)&self->_imageSignatureprint, 0);
}

- (VN6B8mkraBUpwUqskMYPtS3)imageSignatureHash
{
  return (VN6B8mkraBUpwUqskMYPtS3 *)objc_getProperty(self, a2, 104, 1);
}

- (VN6Ac6Cyl5O5oK19HboyMBR)imageSignatureprint
{
  return (VN6Ac6Cyl5O5oK19HboyMBR *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VN3XKGTKNBvy6h4RFtpxLyW *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
    if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(VN3XKGTKNBvy6h4RFtpxLyW *)self imageSignatureprint];
      v7 = [(VN3XKGTKNBvy6h4RFtpxLyW *)v5 imageSignatureprint];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(VN3XKGTKNBvy6h4RFtpxLyW *)self imageSignatureHash];
        v10 = [(VN3XKGTKNBvy6h4RFtpxLyW *)v5 imageSignatureHash];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  id v3 = [(VNObservation *)&v9 hash];
  v4 = [(VN3XKGTKNBvy6h4RFtpxLyW *)self imageSignatureprint];
  uint64_t v5 = [v4 hash];

  v6 = [(VN3XKGTKNBvy6h4RFtpxLyW *)self imageSignatureHash];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  id v3 = [(VNObservation *)&v9 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VN6Ac6Cyl5O5oK19HboyMBR *)self->_imageSignatureprint copy];
    uint64_t v5 = (void *)v3[12];
    v3[12] = v4;

    uint64_t v6 = [(VN6B8mkraBUpwUqskMYPtS3 *)self->_imageSignatureHash copy];
    unint64_t v7 = (void *)v3[13];
    v3[13] = v6;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNImageHashSignatureObservation");
  [v4 encodeObject:self->_imageSignatureprint forKey:@"sgnPrnt"];
  [v4 encodeObject:self->_imageSignatureHash forKey:@"sgnHash"];
}

- (VN3XKGTKNBvy6h4RFtpxLyW)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  objc_super v5 = [(VNObservation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNImageHashSignatureObservation");
    if (!v6)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sgnPrnt"];
      imageSignatureprint = v5->_imageSignatureprint;
      v5->_imageSignatureprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sgnHash"];
      imageSignatureHash = v5->_imageSignatureHash;
      v5->_imageSignatureHash = (VN6B8mkraBUpwUqskMYPtS3 *)v12;

      objc_super v9 = v5;
      goto LABEL_6;
    }
    unint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   objc_opt_class(),
                   0,
                   v6);
    char v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v8];
  }
  objc_super v9 = 0;
LABEL_6:

  return v9;
}

- (VN3XKGTKNBvy6h4RFtpxLyW)initWithOriginatingRequestSpecifier:(id)a3 imageSignatureprint:(id)a4 imageSignatureHash:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VN3XKGTKNBvy6h4RFtpxLyW;
  char v11 = [(VNObservation *)&v18 initWithOriginatingRequestSpecifier:v8];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    imageSignatureprint = v11->_imageSignatureprint;
    v11->_imageSignatureprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v12;

    uint64_t v14 = [v10 copy];
    imageSignatureHash = v11->_imageSignatureHash;
    v11->_imageSignatureHash = (VN6B8mkraBUpwUqskMYPtS3 *)v14;

    v16 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end