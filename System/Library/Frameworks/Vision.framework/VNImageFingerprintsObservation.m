@interface VNImageFingerprintsObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)fingerprintHashes;
- (VNImageFingerprintsObservation)initWithCoder:(id)a3;
- (VNImageFingerprintsObservation)initWithOriginatingRequestSpecifier:(id)a3 fingerprintHashes:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageFingerprintsObservation

- (void).cxx_destruct
{
}

- (NSArray)fingerprintHashes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (VNImageFingerprintsObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNImageFingerprintsObservation;
  v5 = [(VNObservation *)&v13 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"hashes"];
  fingerprintHashes = v5->_fingerprintHashes;
  v5->_fingerprintHashes = (NSArray *)v9;

  if (!v5->_fingerprintHashes) {
    v11 = 0;
  }
  else {
LABEL_3:
  }
    v11 = v5;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNImageFingerprintsObservation;
  id v4 = a3;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fingerprintHashes, @"hashes", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNImageFingerprintsObservation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      id v6 = [(VNImageFingerprintsObservation *)self fingerprintHashes];
      uint64_t v7 = [(VNImageFingerprintsObservation *)v5 fingerprintHashes];

      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_fingerprintHashes hash];
}

- (VNImageFingerprintsObservation)initWithOriginatingRequestSpecifier:(id)a3 fingerprintHashes:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNImageFingerprintsObservation;
  uint64_t v7 = [(VNObservation *)&v11 initWithOriginatingRequestSpecifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fingerprintHashes = v7->_fingerprintHashes;
    v7->_fingerprintHashes = (NSArray *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end