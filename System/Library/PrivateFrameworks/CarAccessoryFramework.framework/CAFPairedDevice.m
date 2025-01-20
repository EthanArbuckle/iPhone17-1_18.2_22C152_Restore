@interface CAFPairedDevice
- (CAFPairedDevice)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (unsigned)sortOrder;
- (unsigned)state;
@end

@implementation CAFPairedDevice

- (CAFPairedDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAFPairedDevice;
  v5 = [(CAFPairedDevice *)&v17 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"identifier"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"name"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSString *)v9;
    }
    else {
      v10 = 0;
    }

    name = v5->_name;
    v5->_name = v10;

    objc_opt_class();
    id v12 = [v4 objectForKey:@"sortOrder"];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v5->_sortOrder = [v13 unsignedShortValue];
    objc_opt_class();
    id v14 = [v4 objectForKey:@"state"];
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v5->_state = [v15 unsignedCharValue];
  }

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"identifier";
  v3 = [(CAFPairedDevice *)self identifier];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v12[0] = v4;
  v11[1] = @"name";
  v5 = [(CAFPairedDevice *)self name];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v12[1] = v6;
  v11[2] = @"sortOrder";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CAFPairedDevice sortOrder](self, "sortOrder"));
  v12[2] = v7;
  v11[3] = @"state";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFPairedDevice state](self, "state"));
  v12[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  if (!v5) {
  if (!v3)
  }

  return (NSDictionary *)v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFPairedDevice *)self identifier];
  id v6 = [(CAFPairedDevice *)self name];
  v7 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@, %@: %hu, %@: %hhu }>", v4, self, @"identifier", v5, @"name", v6, @"sortOrder", -[CAFPairedDevice sortOrder](self, "sortOrder"), @"state", -[CAFPairedDevice state](self, "state")];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end