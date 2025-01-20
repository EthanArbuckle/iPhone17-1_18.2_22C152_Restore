@interface VNImageprintObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)observationWithImageprint:(id)a3 error:(id *)a4;
- (BOOL)imageprintValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageprintValid;
- (NSData)rawImageprintDescriptor;
- (NSString)imageprintVersion;
- (VNImageprint)imageprint;
- (VNImageprintObservation)initWithCoder:(id)a3;
- (VNImageprintObservation)initWithRawImageprintDescriptor:(id)a3;
- (float)calculateDistanceFromImageprintObservation:(id)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImageprint:(id)a3;
@end

@implementation VNImageprintObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintVersion, 0);

  objc_storeStrong((id *)&self->_imageprint, 0);
}

- (NSString)imageprintVersion
{
  return self->_imageprintVersion;
}

- (BOOL)imageprintValid
{
  return self->_imageprintValid;
}

- (void)setImageprint:(id)a3
{
}

- (VNImageprint)imageprint
{
  return self->_imageprint;
}

- (NSData)rawImageprintDescriptor
{
  return 0;
}

- (VNImageprintObservation)initWithRawImageprintDescriptor:(id)a3
{
  return 0;
}

- (BOOL)isImageprintValid
{
  return 0;
}

- (float)calculateDistanceFromImageprintObservation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(VNImageprintObservation *)self imageprint];
    v6 = [v4 imageprint];
    v7 = [v5 distanceToImageprint:v6 error:0];

    [v7 floatValue];
    float v9 = v8;
  }
  else
  {
    float v9 = -1.0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNImageprintObservation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageprintObservation;
    if ([(VNObservation *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(VNImageprintObservation *)self imageprint];
      v7 = [(VNImageprintObservation *)v5 imageprint];
      char v8 = VisionCoreEqualOrNilObjects();
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
  v7.receiver = self;
  v7.super_class = (Class)VNImageprintObservation;
  id v3 = [(VNObservation *)&v7 hash];
  id v4 = [(VNImageprintObservation *)self imageprint];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (id)vn_cloneObject
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageprintObservation;
  id v3 = [(VNObservation *)&v6 vn_cloneObject];
  if (v3)
  {
    id v4 = (void *)[(VNImageprint *)self->_imageprint copy];
    [v3 setImageprint:v4];
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageprintObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNImageprintObservation");
  [v4 encodeObject:self->_imageprint forKey:@"VNImageprint"];
}

- (VNImageprintObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNImageprintObservation;
  objc_super v5 = [(VNObservation *)&v17 initWithCoder:v4];
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNImageprintObservation"))
  {
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNImageprint"];
    if (v7)
    {
      objc_storeStrong((id *)&v5->_imageprint, v7);
LABEL_6:
      objc_super v6 = v5;
LABEL_12:

      goto LABEL_13;
    }
    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    float v9 = objc_opt_class();
    id v16 = 0;
    objc_super v10 = +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", v9, [v9 currentRevision], &v16);
    id v11 = v16;
    if (v10)
    {
      v12 = [[VNImageprint alloc] initWithImageDescriptor:v8 type:0 originatingRequestSpecifier:v10];
      imageprint = v5->_imageprint;
      v5->_imageprint = v12;

      v14 = v5->_imageprint;
      if (v14) {
        goto LABEL_6;
      }
    }
    else
    {
      [v4 failWithError:v11];
    }
    objc_super v6 = 0;
    goto LABEL_12;
  }
  objc_super v6 = 0;
LABEL_13:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateImageprintRequest";
}

+ (id)observationWithImageprint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_super v6 = -[VNObservation initWithRequestRevision:]([VNImageprintObservation alloc], "initWithRequestRevision:", [v5 requestRevision]);
    objc_super v7 = v6;
    if (v6)
    {
      [(VNImageprintObservation *)v6 setImageprint:v5];
      id v8 = objc_alloc(MEMORY[0x1E4F29128]);
      float v9 = [v5 descriptor];
      objc_super v10 = [v9 externalImageId];
      id v11 = (void *)[v8 initWithUUIDString:v10];

      if (v11) {
        [(VNObservation *)v7 setUUID:v11];
      }
      v12 = v7;
    }
    else if (a4)
    {
      *a4 = +[VNError errorWithCode:5 message:@"Failed creating a new VNImageprintObservation object"];
    }
  }
  else if (a4)
  {
    +[VNError errorWithCode:5 message:@"nil imageprint supplied"];
    objc_super v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

@end