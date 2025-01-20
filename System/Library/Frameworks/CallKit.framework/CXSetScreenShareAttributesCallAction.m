@interface CXSetScreenShareAttributesCallAction
+ (BOOL)supportsSecureCoding;
- (CXScreenShareAttributes)attributes;
- (CXSetScreenShareAttributesCallAction)initWithCallUUID:(id)a3 attributes:(id)a4;
- (CXSetScreenShareAttributesCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetScreenShareAttributesCallAction

- (CXSetScreenShareAttributesCallAction)initWithCallUUID:(id)a3 attributes:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v8 = [(CXCallAction *)&v11 initWithCallUUID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_attributes, a4);
  }

  return v9;
}

- (id)customDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(CXSetScreenShareAttributesCallAction *)self attributes];
  [v3 appendFormat:@" attributes=%@", v4];

  v5 = (void *)[v3 copy];

  return v5;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXSetScreenShareAttributesCallAction;
  id v6 = a3;
  [(CXAction *)&v8 updateCopy:v6 withZone:a4];
  id v7 = [(CXSetScreenShareAttributesCallAction *)self attributes];
  [v6 setAttributes:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetScreenShareAttributesCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXSetScreenShareAttributesCallAction;
  v5 = [(CXCallAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_attributes);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    attributes = v5->_attributes;
    v5->_attributes = (CXScreenShareAttributes *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetScreenShareAttributesCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXSetScreenShareAttributesCallAction *)self attributes];
  uint64_t v6 = NSStringFromSelector(sel_attributes);
  [v4 encodeObject:v5 forKey:v6];
}

- (CXScreenShareAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end