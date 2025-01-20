@interface LPSharingStatusMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPSharingStatusMetadata)initWithCoder:(id)a3;
- (NSAttributedString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation LPSharingStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharingStatusMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPSharingStatusMetadata;
  v5 = [(LPSharingStatusMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = decodeAttributedStringForKey(v4, @"status");
    status = v5->_status;
    v5->_status = (NSAttributedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPSharingStatusMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPSharingStatusMetadata *)self status];
    [(LPSharingStatusMetadata *)v4 setStatus:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPSharingStatusMetadata;
  if ([(LPSharingStatusMetadata *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = objectsAreEqual_0(v4[2], self->_status);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSAttributedString *)self->_status hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"status", 0);
}

- (NSAttributedString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 unspecializedPresentationProperties];
  if (sizeClassAllowsStatusTransformation([v4 effectiveSizeClass]))
  {
    uint64_t v6 = [(LPSharingStatusMetadata *)self status];
    objc_super v7 = [v5 captionBar];
    v8 = [v7 bottom];
    v9 = [v8 leading];
    [v9 setAttributedText:v6];
  }

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 0;
}

@end