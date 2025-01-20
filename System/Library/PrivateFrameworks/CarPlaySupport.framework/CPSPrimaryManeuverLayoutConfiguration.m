@interface CPSPrimaryManeuverLayoutConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSAttributedString)attributedInstruction;
- (NSString)instruction;
- (UIImage)junctionImage;
- (UIImage)symbolImage;
- (double)height;
- (id)_layoutString;
- (id)description;
- (unint64_t)layout;
- (void)setAttributedInstruction:(id)a3;
- (void)setHeight:(double)a3;
- (void)setInstruction:(id)a3;
- (void)setJunctionImage:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setSymbolImage:(id)a3;
@end

@implementation CPSPrimaryManeuverLayoutConfiguration

- (id)description
{
  v16 = self;
  SEL v15 = a2;
  v6 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)CPSPrimaryManeuverLayoutConfiguration;
  id v7 = [(CPSPrimaryManeuverLayoutConfiguration *)&v14 description];
  id v8 = [(CPSPrimaryManeuverLayoutConfiguration *)v16 _layoutString];
  v9 = [(CPSPrimaryManeuverLayoutConfiguration *)v16 symbolImage];
  [(CPSPrimaryManeuverLayoutConfiguration *)v16 height];
  uint64_t v10 = v2;
  v11 = [(CPSPrimaryManeuverLayoutConfiguration *)v16 attributedInstruction];
  char v12 = 0;
  if (v11)
  {
    v5 = v11;
  }
  else
  {
    v13 = [(CPSPrimaryManeuverLayoutConfiguration *)v16 instruction];
    char v12 = 1;
    v5 = (NSAttributedString *)v13;
  }
  id v17 = (id)[v6 stringWithFormat:@"%@ [layout: %@, image: %@, height: %f, instruction: %@]", v7, v8, v9, v10, v5];
  if (v12) {

  }
  v3 = v17;

  return v3;
}

- (id)_layoutString
{
  unint64_t v2 = [(CPSPrimaryManeuverLayoutConfiguration *)self layout];
  if (v2)
  {
    unint64_t v4 = v2;
    char v3 = 1;
  }
  else
  {
    unint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3)
  {
    v6 = &stru_26DEE39C0;
  }
  else
  {
    switch(v4)
    {
      case 0uLL:
        v6 = @"Undefined";
        break;
      case 1uLL:
        v6 = @"Full";
        break;
      case 2uLL:
        v6 = @"FullWideImage";
        break;
      case 3uLL:
        v6 = @"JunctionViewNoInstruction";
        break;
      case 4uLL:
        v6 = @"JunctionViewNoInstructionWideImage";
        break;
      case 5uLL:
        v6 = @"NoJunctionView";
        break;
      case 6uLL:
        v6 = @"NoJunctionViewWideImage";
        break;
      case 7uLL:
        v6 = @"FullInstructionNextToSymbol";
        break;
      case 8uLL:
        v6 = @"MinimalWide";
        break;
      case 9uLL:
        v6 = @"Minimal";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = [(CPSPrimaryManeuverLayoutConfiguration *)v5 isEqualToConfiguration:location[0]];
    }
    else {
      char v6 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = [(CPSPrimaryManeuverLayoutConfiguration *)v23 layout];
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  char v5 = 0;
  if (v4 == [location[0] layout])
  {
    [(CPSPrimaryManeuverLayoutConfiguration *)v23 height];
    [location[0] height];
    char v5 = 0;
    if (BSFloatEqualToFloat())
    {
      v21 = [(CPSPrimaryManeuverLayoutConfiguration *)v23 instruction];
      char v20 = 1;
      id v19 = (id)[location[0] instruction];
      char v18 = 1;
      char v5 = 0;
      if (-[NSString isEqualToString:](v21, "isEqualToString:"))
      {
        id v17 = [(CPSPrimaryManeuverLayoutConfiguration *)v23 attributedInstruction];
        char v16 = 1;
        id v15 = (id)[location[0] attributedInstruction];
        char v14 = 1;
        char v5 = 0;
        if (-[NSAttributedString isEqualToAttributedString:](v17, "isEqualToAttributedString:"))
        {
          v13 = [(CPSPrimaryManeuverLayoutConfiguration *)v23 symbolImage];
          char v12 = 1;
          id v11 = (id)[location[0] symbolImage];
          char v10 = 1;
          char v5 = 0;
          if (-[UIImage isEqual:](v13, "isEqual:"))
          {
            v9 = [(CPSPrimaryManeuverLayoutConfiguration *)v23 junctionImage];
            char v8 = 1;
            id v7 = (id)[location[0] junctionImage];
            char v6 = 1;
            char v5 = -[UIImage isEqual:](v9, "isEqual:");
          }
        }
      }
    }
  }
  char v24 = v5 & 1;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {
  if (v14)
  }

  if (v16) {
  if (v18)
  }

  if (v20) {
  objc_storeStrong(location, 0);
  }
  return v24 & 1;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
}

- (NSAttributedString)attributedInstruction
{
  return self->_attributedInstruction;
}

- (void)setAttributedInstruction:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
}

- (UIImage)junctionImage
{
  return self->_junctionImage;
}

- (void)setJunctionImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end