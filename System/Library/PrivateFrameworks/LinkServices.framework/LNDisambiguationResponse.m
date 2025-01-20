@interface LNDisambiguationResponse
+ (BOOL)supportsSecureCoding;
- (LNDisambiguationResponse)initWithCoder:(id)a3;
- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5;
- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5 updates:(id)a6;
- (LNValue)value;
- (NSDictionary)updates;
- (NSNumber)selectedIndex;
- (NSUUID)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDisambiguationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_selectedIndex, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (LNValue)value
{
  return self->_value;
}

- (NSNumber)selectedIndex
{
  return self->_selectedIndex;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNDisambiguationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedIndex"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"updates"];

  if (v5 && (v6 || v7 || v12))
  {
    self = [(LNDisambiguationResponse *)self initWithIdentifier:v5 selectedIndex:v6 value:v7 updates:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDisambiguationResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNDisambiguationResponse *)self selectedIndex];
  [v4 encodeObject:v6 forKey:@"selectedIndex"];

  v7 = [(LNDisambiguationResponse *)self value];
  [v4 encodeObject:v7 forKey:@"value"];

  id v8 = [(LNDisambiguationResponse *)self updates];
  [v4 encodeObject:v8 forKey:@"updates"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNDisambiguationResponse *)self identifier];
  v7 = [(LNDisambiguationResponse *)self selectedIndex];
  id v8 = [(LNDisambiguationResponse *)self value];
  uint64_t v9 = [(LNDisambiguationResponse *)self updates];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, selectedIndex: %@, value: %@, updates: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5
{
  return [(LNDisambiguationResponse *)self initWithIdentifier:a3 selectedIndex:a4 value:a5 updates:0];
}

- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5 updates:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"LNDisambiguationResponse.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
  }
  if (!v14 && !v15)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNDisambiguationResponse.m", 21, @"either selectedIndex, value, or updates must be non-null." object file lineNumber description];
  }
LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)LNDisambiguationResponse;
  v16 = [(LNDisambiguationResponse *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_selectedIndex, a4);
    objc_storeStrong((id *)&v17->_value, a5);
    objc_storeStrong((id *)&v17->_updates, a6);
    v18 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end