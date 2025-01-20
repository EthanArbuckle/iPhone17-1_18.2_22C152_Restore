@interface _BlastDoorLPFaceTimeInviteMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (_BlastDoorLPFaceTimeInviteMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BlastDoorLPFaceTimeInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPFaceTimeInviteMetadata)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPFaceTimeInviteMetadata;
  v5 = [(_BlastDoorLPFaceTimeInviteMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPFaceTimeInviteMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPFaceTimeInviteMetadata *)self title];
    [(_BlastDoorLPFaceTimeInviteMetadata *)v4 setTitle:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPFaceTimeInviteMetadata;
  if ([(_BlastDoorLPFaceTimeInviteMetadata *)&v8 isEqual:v4]) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = v4[2];
  if (!(v5 | (unint64_t)self->_title)) {
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
  return [(NSString *)self->_title hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", 0);
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
}

@end