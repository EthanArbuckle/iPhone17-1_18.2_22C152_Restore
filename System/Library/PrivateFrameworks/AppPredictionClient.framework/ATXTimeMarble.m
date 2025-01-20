@interface ATXTimeMarble
+ (BOOL)supportsSecureCoding;
- (ATXTimeMarble)initWithCoder:(id)a3;
- (ATXTimeMarble)initWithSymbolName:(id)a3 colorName:(id)a4 dateComponents:(id)a5 title:(id)a6;
- (NSDate)date;
- (NSDateComponents)dateComponents;
- (NSString)colorName;
- (NSString)symbolName;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeMarble

- (ATXTimeMarble)initWithSymbolName:(id)a3 colorName:(id)a4 dateComponents:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)ATXTimeMarble;
  v14 = [(ATXTimeMarble *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    symbolName = v14->_symbolName;
    v14->_symbolName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    colorName = v14->_colorName;
    v14->_colorName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    dateComponents = v14->_dateComponents;
    v14->_dateComponents = (NSDateComponents *)v19;

    uint64_t v21 = [v13 copy];
    title = v14->_title;
    v14->_title = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeMarble)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponents"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];

  v9 = [(ATXTimeMarble *)self initWithSymbolName:v5 colorName:v6 dateComponents:v7 title:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  symbolName = self->_symbolName;
  id v5 = a3;
  [v5 encodeObject:symbolName forKey:@"symbolName"];
  [v5 encodeObject:self->_colorName forKey:@"colorName"];
  [v5 encodeObject:self->_dateComponents forKey:@"dateComponents"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

- (NSDate)date
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(ATXTimeMarble *)self dateComponents];
  id v5 = [v3 dateFromComponents:v4];

  return (NSDate *)v5;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);

  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end