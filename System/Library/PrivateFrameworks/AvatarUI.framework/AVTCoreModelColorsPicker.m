@interface AVTCoreModelColorsPicker
- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 alwaysShowExtended:(BOOL)a6 colorCategory:(int64_t)a7 destination:(int64_t)a8 pairing:(id)a9 options:(id)a10;
- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 identifier:(id)a6 alwaysShowExtended:(BOOL)a7 colorCategory:(int64_t)a8 destination:(int64_t)a9 pairing:(id)a10 options:(id)a11;
- (AVTCoreModelPairing)pairing;
- (AVTCoreModelPickerOptions)options;
- (BOOL)alwaysShowExtended;
- (BOOL)isEmpty;
- (NSArray)extendedColors;
- (NSArray)primaryColors;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (int64_t)colorCategory;
- (int64_t)destination;
@end

@implementation AVTCoreModelColorsPicker

- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 alwaysShowExtended:(BOOL)a6 colorCategory:(int64_t)a7 destination:(int64_t)a8 pairing:(id)a9 options:(id)a10
{
  BOOL v11 = a6;
  v16 = (void *)MEMORY[0x263F08C38];
  id v17 = a10;
  id v18 = a9;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [v16 UUID];
  v23 = [v22 UUIDString];
  v24 = [(AVTCoreModelColorsPicker *)self initWithTitle:v21 primaryColors:v20 extendedColors:v19 identifier:v23 alwaysShowExtended:v11 colorCategory:a7 destination:a8 pairing:v18 options:v17];

  return v24;
}

- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 identifier:(id)a6 alwaysShowExtended:(BOOL)a7 colorCategory:(int64_t)a8 destination:(int64_t)a9 pairing:(id)a10 options:(id)a11
{
  id v28 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v27 = a10;
  id v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)AVTCoreModelColorsPicker;
  id v20 = [(AVTCoreModelColorsPicker *)&v29 init];
  if (v20)
  {
    uint64_t v21 = [v18 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v28 copy];
    title = v20->_title;
    v20->_title = (NSString *)v23;

    objc_storeStrong((id *)&v20->_primaryColors, a4);
    objc_storeStrong((id *)&v20->_extendedColors, a5);
    v20->_alwaysShowExtended = a7;
    v20->_destination = a9;
    v20->_colorCategory = a8;
    objc_storeStrong((id *)&v20->_pairing, a10);
    objc_storeStrong((id *)&v20->_options, a11);
  }

  return v20;
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)AVTCoreModelColorsPicker;
  v3 = [(AVTCoreModelColorsPicker *)&v17 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelColorsPicker *)self identifier];
  [v4 appendFormat:@" identifier: %@", v5];

  v6 = [(AVTCoreModelColorsPicker *)self title];
  [v4 appendFormat:@" title: %@", v6];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVTCoreModelColorsPicker colorCategory](self, "colorCategory"));
  [v4 appendFormat:@" category: %@", v7];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVTCoreModelColorsPicker destination](self, "destination"));
  [v4 appendFormat:@" destination: %@", v8];

  v9 = [(AVTCoreModelColorsPicker *)self primaryColors];

  if (v9)
  {
    v10 = [(AVTCoreModelColorsPicker *)self primaryColors];
    BOOL v11 = objc_msgSend(v10, "avt_description");
    [v4 appendFormat:@" primary colors: %@", v11];
  }
  v12 = [(AVTCoreModelColorsPicker *)self extendedColors];

  if (v12)
  {
    v13 = [(AVTCoreModelColorsPicker *)self extendedColors];
    v14 = objc_msgSend(v13, "avt_description");
    [v4 appendFormat:@" extended colors: %@", v14];
  }
  if ([(AVTCoreModelColorsPicker *)self alwaysShowExtended]) {
    [v4 appendString:@" alwaysShowExtended"];
  }
  v15 = (void *)[v4 copy];

  return (NSString *)v15;
}

- (BOOL)isEmpty
{
  v3 = [(AVTCoreModelColorsPicker *)self primaryColors];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(AVTCoreModelColorsPicker *)self extendedColors];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (NSArray)primaryColors
{
  return self->_primaryColors;
}

- (NSArray)extendedColors
{
  return self->_extendedColors;
}

- (int64_t)destination
{
  return self->_destination;
}

- (BOOL)alwaysShowExtended
{
  return self->_alwaysShowExtended;
}

- (int64_t)colorCategory
{
  return self->_colorCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedColors, 0);
  objc_storeStrong((id *)&self->_primaryColors, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end