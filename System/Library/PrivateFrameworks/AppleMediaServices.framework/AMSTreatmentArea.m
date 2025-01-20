@interface AMSTreatmentArea
+ (BOOL)supportsSecureCoding;
- (AMSTreatmentArea)initWithCoder:(id)a3;
- (AMSTreatmentArea)initWithIdentifier:(id)a3;
- (BOOL)cacheable;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheable:(BOOL)a3;
@end

@implementation AMSTreatmentArea

- (AMSTreatmentArea)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSTreatmentArea;
  v5 = [(AMSTreatmentArea *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(AMSTreatmentArea *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AMSTreatmentArea *)a3;
  v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;

      if (!v7
        || (BOOL v8 = [(AMSTreatmentArea *)self cacheable], v8 != [(AMSTreatmentArea *)v7 cacheable]))
      {
        char v9 = 0;
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v6 = [(AMSTreatmentArea *)self identifier];
      v10 = [(AMSTreatmentArea *)v7 identifier];
      char v9 = [(AMSTreatmentArea *)v6 isEqualToString:v10];
    }
    else
    {
      v7 = 0;
      char v9 = 0;
    }

    goto LABEL_10;
  }
  char v9 = 1;
LABEL_11:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSTreatmentArea cacheable](self, "cacheable"), @"cacheable");
  id v5 = [(AMSTreatmentArea *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (AMSTreatmentArea)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [(AMSTreatmentArea *)self initWithIdentifier:v5];
  uint64_t v7 = [v4 decodeBoolForKey:@"cacheable"];

  [(AMSTreatmentArea *)v6 setCacheable:v7];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = [(AMSTreatmentArea *)self dictionaryRepresentation];
  unint64_t v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"cacheable";
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSTreatmentArea cacheable](self, "cacheable"));
  v7[1] = @"identifier";
  v8[0] = v3;
  id v4 = [(AMSTreatmentArea *)self identifier];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)cacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end