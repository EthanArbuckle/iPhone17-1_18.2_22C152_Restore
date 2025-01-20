@interface ATXTimeEventAction
+ (BOOL)supportsSecureCoding;
- (ATXTimeEventAction)initWithCoder:(id)a3;
- (ATXTimeEventAction)initWithTitle:(id)a3 compactTitle:(id)a4 identifier:(id)a5 symbolName:(id)a6 colorName:(id)a7 options:(unint64_t)a8;
- (NSString)colorName;
- (NSString)compactTitle;
- (NSString)identifier;
- (NSString)symbolName;
- (NSString)title;
- (id)compactTitleUsingETAIfPossibleWithMinutes:(double)a3 style:(int64_t)a4;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeEventAction

- (ATXTimeEventAction)initWithTitle:(id)a3 compactTitle:(id)a4 identifier:(id)a5 symbolName:(id)a6 colorName:(id)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ATXTimeEventAction;
  v19 = [(ATXTimeEventAction *)&v32 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    title = v19->_title;
    v19->_title = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    compactTitle = v19->_compactTitle;
    v19->_compactTitle = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    symbolName = v19->_symbolName;
    v19->_symbolName = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    colorName = v19->_colorName;
    v19->_colorName = (NSString *)v28;

    v19->_options = a8;
    v30 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  symbolName = self->_symbolName;
  id v5 = a3;
  [v5 encodeObject:symbolName forKey:@"symbol"];
  [v5 encodeObject:self->_colorName forKey:@"symbolColorName"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_compactTitle forKey:@"compactTitle"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_options forKey:@"options"];
}

- (ATXTimeEventAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compactTitle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolColorName"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"options"];

  v11 = [(ATXTimeEventAction *)self initWithTitle:v5 compactTitle:v6 identifier:v7 symbolName:v8 colorName:v9 options:v10];
  return v11;
}

- (id)compactTitleUsingETAIfPossibleWithMinutes:(double)a3 style:(int64_t)a4
{
  if (a3 < 1.0 || (self->_options & 2) == 0)
  {
    v9 = [(ATXTimeEventAction *)self compactTitle];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setMinute:(uint64_t)a3];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    [v8 setUnitsStyle:a4];
    v9 = [v8 stringFromDateComponents:v7];
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)compactTitle
{
  return self->_compactTitle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_compactTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end