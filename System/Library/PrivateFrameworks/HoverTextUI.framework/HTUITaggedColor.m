@interface HTUITaggedColor
+ (BOOL)supportsSecureCoding;
+ (id)color:(id)a3 identifier:(id)a4;
+ (id)makeFromData:(id)a3;
+ (id)makeFromData:(id)a3 withOpacity:(double)a4;
+ (id)userPickableColors;
- (BOOL)isEqual:(id)a3;
- (HTUITaggedColor)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)localizedName;
- (UIColor)color;
- (id)dataRepresentation;
- (unint64_t)hash;
- (void)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HTUITaggedColor

+ (id)color:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HTUITaggedColor);
  [(HTUITaggedColor *)v7 setColor:v6];

  [(HTUITaggedColor *)v7 setIdentifier:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HTUITaggedColor *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  id v6 = [(HTUITaggedColor *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (HTUITaggedColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HTUITaggedColor;
  id v5 = [(HTUITaggedColor *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(HTUITaggedColor *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    [(HTUITaggedColor *)v5 setColor:v7];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(HTUITaggedColor *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HTUITaggedColor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)localizedName
{
  v2 = [(HTUITaggedColor *)self identifier];
  if ([v2 isEqual:@"red"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorRed";
LABEL_31:
    id v4 = HTUILocString(v3);
    goto LABEL_32;
  }
  if ([v2 isEqual:@"green"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorGreen";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"blue"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorBlue";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"orange"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorOrange";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"yellow"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorYellow";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"pink"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorPink";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"purple"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorPurple";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"teal"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorTeal";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"indigo"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorIndigo";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"brown"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorBrown";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"mint"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorMint";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"cyan"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorCyan";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"gray"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorGray";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"white"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorWhite";
    goto LABEL_31;
  }
  if ([v2 isEqual:@"black"])
  {
    unint64_t v3 = @"AXHoverTextTaggedColorBlack";
    goto LABEL_31;
  }
  id v4 = 0;
LABEL_32:

  return (NSString *)v4;
}

- (id)dataRepresentation
{
  id v6 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(HTUITaggedColor *)(uint64_t)v3 dataRepresentation];
    }
  }

  return v2;
}

+ (id)makeFromData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(HTUITaggedColor);
    id v9 = 0;
    id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];

    id v6 = v9;
    [(HTUITaggedColor *)v4 setColor:v5];

    if (v6)
    {
      char v7 = AXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[HTUITaggedColor makeFromData:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)makeFromData:(id)a3 withOpacity:(double)a4
{
  return +[HTUITaggedColor makeFromData:](HTUITaggedColor, "makeFromData:", a3, a4);
}

+ (id)userPickableColors
{
  v34[15] = *MEMORY[0x263EF8340];
  v33 = [MEMORY[0x263F825C8] blackColor];
  v32 = +[HTUITaggedColor color:v33 identifier:@"black"];
  v34[0] = v32;
  v31 = [MEMORY[0x263F825C8] whiteColor];
  v30 = +[HTUITaggedColor color:v31 identifier:@"white"];
  v34[1] = v30;
  v29 = [MEMORY[0x263F825C8] colorWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  v28 = +[HTUITaggedColor color:v29 identifier:@"gray"];
  v34[2] = v28;
  v27 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.270588235 blue:0.22745098 alpha:1.0];
  v26 = +[HTUITaggedColor color:v27 identifier:@"red"];
  v34[3] = v26;
  v25 = [MEMORY[0x263F825C8] colorWithRed:0.196078431 green:0.843137255 blue:0.294117647 alpha:1.0];
  v24 = +[HTUITaggedColor color:v25 identifier:@"green"];
  v34[4] = v24;
  v23 = [MEMORY[0x263F825C8] colorWithRed:0.0392156863 green:0.517647059 blue:1.0 alpha:1.0];
  v22 = +[HTUITaggedColor color:v23 identifier:@"blue"];
  v34[5] = v22;
  v21 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.839215686 blue:0.0392156863 alpha:1.0];
  v20 = +[HTUITaggedColor color:v21 identifier:@"orange"];
  v34[6] = v20;
  v19 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:159.0 blue:0.0392156863 alpha:1.0];
  v18 = +[HTUITaggedColor color:v19 identifier:@"yellow"];
  v34[7] = v18;
  v17 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.215686275 blue:0.37254902 alpha:1.0];
  v16 = +[HTUITaggedColor color:v17 identifier:@"pink"];
  v34[8] = v16;
  v15 = [MEMORY[0x263F825C8] colorWithRed:0.749019608 green:0.352941176 blue:0.949019608 alpha:1.0];
  v14 = +[HTUITaggedColor color:v15 identifier:@"purple"];
  v34[9] = v14;
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.250980392 green:0.784313725 blue:0.878431373 alpha:1.0];
  id v3 = +[HTUITaggedColor color:v2 identifier:@"teal"];
  v34[10] = v3;
  id v4 = [MEMORY[0x263F825C8] colorWithRed:0.368627451 green:0.360784314 blue:0.901960784 alpha:1.0];
  id v5 = +[HTUITaggedColor color:v4 identifier:@"indigo"];
  v34[11] = v5;
  id v6 = [MEMORY[0x263F825C8] colorWithRed:0.674509804 green:0.556862745 blue:0.407843137 alpha:1.0];
  char v7 = +[HTUITaggedColor color:v6 identifier:@"brown"];
  v34[12] = v7;
  v8 = [MEMORY[0x263F825C8] colorWithRed:0.388235294 green:0.901960784 blue:0.88627451 alpha:1.0];
  id v9 = +[HTUITaggedColor color:v8 identifier:@"mint"];
  v34[13] = v9;
  v10 = [MEMORY[0x263F825C8] colorWithRed:0.392156863 green:0.823529412 blue:1.0 alpha:1.0];
  v11 = +[HTUITaggedColor color:v10 identifier:@"cyan"];
  v34[14] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:15];

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

- (void)dataRepresentation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22695C000, a2, OS_LOG_TYPE_ERROR, "Failed to encode HTUITaggedColor. %@", (uint8_t *)&v2, 0xCu);
}

+ (void)makeFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22695C000, a2, OS_LOG_TYPE_ERROR, "Failed to decode HTUITaggedColor. %@", (uint8_t *)&v2, 0xCu);
}

@end