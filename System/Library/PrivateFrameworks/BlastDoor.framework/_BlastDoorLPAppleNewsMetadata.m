@interface _BlastDoorLPAppleNewsMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)source;
- (NSString)title;
- (_BlastDoorLPAppleNewsMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BlastDoorLPAppleNewsMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAppleNewsMetadata)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  v5 = [(_BlastDoorLPAppleNewsMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"source");
    source = v5->_source;
    v5->_source = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  id v4 = a3;
  [(_BlastDoorLPSpecializationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_source, @"source");
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, @"title");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPAppleNewsMetadata allocWithZone:a3];
  if (v4)
  {
    objc_super v5 = [(_BlastDoorLPAppleNewsMetadata *)self source];
    [(_BlastDoorLPAppleNewsMetadata *)v4 setSource:v5];

    uint64_t v6 = [(_BlastDoorLPAppleNewsMetadata *)self title];
    [(_BlastDoorLPAppleNewsMetadata *)v4 setTitle:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  if ([(_BlastDoorLPAppleNewsMetadata *)&v10 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_source && !objc_msgSend((id)v7, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v8 = v6[3];
        if (v8 | (unint64_t)self->_title) {
          char v5 = objc_msgSend((id)v8, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"source", @"title", 0);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end