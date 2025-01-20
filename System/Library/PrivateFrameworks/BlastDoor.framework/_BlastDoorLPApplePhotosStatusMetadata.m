@interface _BlastDoorLPApplePhotosStatusMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)status;
- (_BlastDoorLPApplePhotosStatusMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation _BlastDoorLPApplePhotosStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosStatusMetadata)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPApplePhotosStatusMetadata;
  v5 = [(_BlastDoorLPApplePhotosStatusMetadata *)&v11 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "_bd_lp_strictlyDecodeNSAttributedStringForKey:", @"title");
    uint64_t v7 = truncatedAttributedStringAtMaximumMetadataLength(v6);

    status = v5->_status;
    v5->_status = (NSAttributedString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPApplePhotosStatusMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPApplePhotosStatusMetadata *)self status];
    [(_BlastDoorLPApplePhotosStatusMetadata *)v4 setStatus:v5];

    v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPApplePhotosStatusMetadata;
  if ([(_BlastDoorLPApplePhotosStatusMetadata *)&v8 isEqual:v4]) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = v4[2];
  if (!(v5 | (unint64_t)self->_status)) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = objc_msgSend((id)v5, "isEqual:");
  }
LABEL_7:

  return v6;
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

@end