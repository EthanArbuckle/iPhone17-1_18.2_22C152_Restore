@interface CAFProminenceInformation
- (CAFProminenceInformation)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)userVisibleLabel;
- (NSString)userVisibleValue;
- (id)description;
- (unint64_t)prominenceLevel;
- (unsigned)color;
- (unsigned)sortOrder;
@end

@implementation CAFProminenceInformation

- (CAFProminenceInformation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAFProminenceInformation;
  v5 = [(CAFProminenceInformation *)&v19 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"color"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v5->_color = [v7 unsignedCharValue];
    objc_opt_class();
    id v8 = [v4 objectForKey:@"prominenceLevel"];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    v5->_prominenceLevel = [v9 unsignedLongLongValue];
    objc_opt_class();
    id v10 = [v4 objectForKey:@"sortOrder"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    v5->_sortOrder = [v11 unsignedCharValue];
    objc_opt_class();
    id v12 = [v4 objectForKey:@"userVisibleLabel"];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      v13 = (NSString *)v12;
    }
    else {
      v13 = 0;
    }

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v13;

    objc_opt_class();
    id v15 = [v4 objectForKey:@"userVisibleValue"];
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
      v16 = (NSString *)v15;
    }
    else {
      v16 = 0;
    }

    userVisibleValue = v5->_userVisibleValue;
    v5->_userVisibleValue = v16;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v13[5] = *MEMORY[0x263EF8340];
  v12[0] = @"color";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFProminenceInformation color](self, "color"));
  v13[0] = v3;
  v12[1] = @"prominenceLevel";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CAFProminenceInformation prominenceLevel](self, "prominenceLevel"));
  v13[1] = v4;
  v12[2] = @"sortOrder";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFProminenceInformation sortOrder](self, "sortOrder"));
  v13[2] = v5;
  v12[3] = @"userVisibleLabel";
  id v6 = [(CAFProminenceInformation *)self userVisibleLabel];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v13[3] = v7;
  v12[4] = @"userVisibleValue";
  id v8 = [(CAFProminenceInformation *)self userVisibleValue];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF9D0] null];
  }
  v13[4] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  if (!v8) {

  }
  if (!v6) {
  return (NSDictionary *)v10;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(CAFProminenceInformation *)self color];
  unint64_t v6 = [(CAFProminenceInformation *)self prominenceLevel];
  unsigned int v7 = [(CAFProminenceInformation *)self sortOrder];
  id v8 = [(CAFProminenceInformation *)self userVisibleLabel];
  id v9 = [(CAFProminenceInformation *)self userVisibleValue];
  id v10 = [v3 stringWithFormat:@"<%@: %p { %@: %hhu, %@: %llu, %@: %hhu, %@: %@, %@: %@ }>", v4, self, @"color", v5, @"prominenceLevel", v6, @"sortOrder", v7, @"userVisibleLabel", v8, @"userVisibleValue", v9];

  return v10;
}

- (unsigned)color
{
  return self->_color;
}

- (unint64_t)prominenceLevel
{
  return self->_prominenceLevel;
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (NSString)userVisibleValue
{
  return self->_userVisibleValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleValue, 0);
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
}

@end