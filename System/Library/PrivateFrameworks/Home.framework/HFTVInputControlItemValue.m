@interface HFTVInputControlItemValue
+ (id)valueWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6;
- (BOOL)isConfigured;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isSelected;
- (HFTVInputControlItemValue)initWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6;
- (NSNumber)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation HFTVInputControlItemValue

- (HFTVInputControlItemValue)initWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFTVInputControlItemValue;
  v12 = [(HFTVInputControlItemValue *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSNumber *)v15;

    v12->_isHidden = a5;
    v12->_isSelected = a6;
  }

  return v12;
}

- (BOOL)isConfigured
{
  return ![(HFTVInputControlItemValue *)self isHidden];
}

+ (id)valueWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputName:v10 identifier:v9 isHidden:v7 isSelected:v6];

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [(HFTVInputControlItemValue *)self name];
  [v3 appendString:v4];

  v5 = [(HFTVInputControlItemValue *)self identifier];
  BOOL v6 = [v5 stringValue];
  [v3 appendString:v6];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFTVInputControlItemValue isHidden](self, "isHidden"));
  v8 = [v7 stringValue];
  [v3 appendString:v8];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HFTVInputControlItemValue isSelected](self, "isSelected"));
  id v10 = [v9 stringValue];
  [v3 appendString:v10];

  unint64_t v11 = [v3 hash];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v6;

  if (v7 == self)
  {
    LOBYTE(v13) = 1;
  }
  else if (v7)
  {
    v8 = [(HFTVInputControlItemValue *)v7 name];
    id v9 = [(HFTVInputControlItemValue *)self name];
    if ([v8 isEqualToString:v9])
    {
      id v10 = [(HFTVInputControlItemValue *)v7 identifier];
      unint64_t v11 = [(HFTVInputControlItemValue *)self identifier];
      if ([v10 isEqualToNumber:v11]
        && (BOOL v12 = [(HFTVInputControlItemValue *)v7 isHidden],
            v12 == [(HFTVInputControlItemValue *)self isHidden]))
      {
        BOOL v14 = [(HFTVInputControlItemValue *)v7 isSelected];
        int v13 = v14 ^ [(HFTVInputControlItemValue *)self isSelected] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFTVInputControlItemValue *)self name];
  [v3 appendString:v4 withName:@"inputName"];

  id v5 = [(HFTVInputControlItemValue *)self identifier];
  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v5, "integerValue"), @"identifier");

  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFTVInputControlItemValue isHidden](self, "isHidden"), @"isHidden");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFTVInputControlItemValue isSelected](self, "isSelected"), @"isSelected");
  id v9 = [v3 build];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  id v5 = [(HFTVInputControlItemValue *)self name];
  id v6 = [(HFTVInputControlItemValue *)self identifier];
  id v7 = objc_msgSend(v4, "valueWithInputName:identifier:isHidden:isSelected:", v5, v6, -[HFTVInputControlItemValue isHidden](self, "isHidden"), -[HFTVInputControlItemValue isSelected](self, "isSelected"));

  return v7;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end