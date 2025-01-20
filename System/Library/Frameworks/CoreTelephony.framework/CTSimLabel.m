@interface CTSimLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)didSetup;
- (BOOL)isEqual:(id)a3;
- (CTSimLabel)initWithCoder:(id)a3;
- (CTSimLabel)initWithId:(id)a3 andText:(id)a4 andDidSetup:(BOOL)a5;
- (NSString)text;
- (NSString)unique_id;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSetup:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUnique_id:(id)a3;
@end

@implementation CTSimLabel

- (CTSimLabel)initWithId:(id)a3 andText:(id)a4 andDidSetup:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTSimLabel;
  v11 = [(CTSimLabel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_unique_id, a3);
    objc_storeStrong((id *)&v12->_text, a4);
    v12->_didSetup = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v8 = (CTSimLabel *)a3;
  if (v8 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(CTSimLabel *)self unique_id];
      id v10 = [(CTSimLabel *)v8 unique_id];
      if (v9 != v10)
      {
        v3 = [(CTSimLabel *)self unique_id];
        v4 = [(CTSimLabel *)v8 unique_id];
        if (![v3 isEqualToString:v4])
        {
          LOBYTE(v11) = 0;
          goto LABEL_15;
        }
      }
      v12 = [(CTSimLabel *)self text];
      v13 = [(CTSimLabel *)v8 text];
      if (v12 == v13
        || ([(CTSimLabel *)self text],
            v5 = objc_claimAutoreleasedReturnValue(),
            [(CTSimLabel *)v8 text],
            v6 = objc_claimAutoreleasedReturnValue(),
            [v5 isEqualToString:v6]))
      {
        BOOL v14 = [(CTSimLabel *)self didSetup];
        BOOL v11 = v14 ^ [(CTSimLabel *)v8 didSetup] ^ 1;
        if (v12 == v13)
        {

LABEL_14:
          if (v9 == v10)
          {
LABEL_16:

            goto LABEL_17;
          }
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_14;
    }
    LOBYTE(v11) = 0;
  }
LABEL_17:

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSimLabel *)self unique_id];
  [v3 appendFormat:@", unique-id=%@", v4];

  v5 = [(CTSimLabel *)self text];
  [v3 appendFormat:@", text=%@", v5];

  BOOL v6 = [(CTSimLabel *)self didSetup];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  [v3 appendFormat:@", didSetup=%@", v7];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSimLabel *)self unique_id];
  BOOL v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setUnique_id:", v6);

  v7 = [(CTSimLabel *)self text];
  v8 = (void *)[v7 copy];
  [v4 setText:v8];

  objc_msgSend(v4, "setDidSetup:", -[CTSimLabel didSetup](self, "didSetup"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTSimLabel *)self unique_id];
  [v6 encodeObject:v4 forKey:@"unique-id"];

  v5 = [(CTSimLabel *)self text];
  [v6 encodeObject:v5 forKey:@"text"];

  objc_msgSend(v6, "encodeBool:forKey:", -[CTSimLabel didSetup](self, "didSetup"), @"didSetup");
}

- (CTSimLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSimLabel;
  v5 = [(CTSimLabel *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unique-id"];
    unique_id = v5->_unique_id;
    v5->_unique_id = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v5->_didSetup = [v4 decodeBoolForKey:@"didSetup"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)unique_id
{
  return self->_unique_id;
}

- (void)setUnique_id:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_unique_id, 0);
}

@end