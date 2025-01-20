@interface OSLogMessageComponent
+ (BOOL)supportsSecureCoding;
- (NSData)argumentDataValue;
- (NSNumber)argumentNumberValue;
- (NSString)argumentStringValue;
- (NSString)formatSubstring;
- (NSString)placeholder;
- (OSLogMessageComponent)initWithCoder:(id)a3;
- (OSLogMessageComponent)initWithDecomposedMessage:(id)a3 atIndex:(unint64_t)a4;
- (OSLogMessageComponentArgumentCategory)argumentCategory;
- (double)argumentDoubleValue;
- (int64_t)argumentInt64Value;
- (uint64_t)argumentUInt64Value;
- (void)encodeWithCoder:(id)a3;
- (void)fillWithData:(id)a3;
- (void)fillWithScalar:(id)a3;
- (void)fillWithString:(id)a3;
- (void)setArgumentDataValue:(id)a3;
- (void)setArgumentNumberValue:(id)a3;
- (void)setArgumentStringValue:(id)a3;
- (void)setFormatSubstring:(id)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation OSLogMessageComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentStringValue, 0);
  objc_storeStrong((id *)&self->_argumentNumberValue, 0);
  objc_storeStrong((id *)&self->_argumentDataValue, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong((id *)&self->_formatSubstring, 0);
}

- (uint64_t)argumentUInt64Value
{
  return self->_argumentUInt64Value;
}

- (void)setArgumentStringValue:(id)a3
{
}

- (NSString)argumentStringValue
{
  return self->_argumentStringValue;
}

- (void)setArgumentNumberValue:(id)a3
{
}

- (NSNumber)argumentNumberValue
{
  return self->_argumentNumberValue;
}

- (int64_t)argumentInt64Value
{
  return self->_argumentInt64Value;
}

- (double)argumentDoubleValue
{
  return self->_argumentDoubleValue;
}

- (void)setArgumentDataValue:(id)a3
{
}

- (NSData)argumentDataValue
{
  return self->_argumentDataValue;
}

- (OSLogMessageComponentArgumentCategory)argumentCategory
{
  return self->_argumentCategory;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setFormatSubstring:(id)a3
{
}

- (NSString)formatSubstring
{
  return self->_formatSubstring;
}

- (OSLogMessageComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatSubstring"];
  formatSubstring = self->_formatSubstring;
  self->_formatSubstring = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholder"];
  placeholder = self->_placeholder;
  self->_placeholder = v7;

  int64_t v9 = [v4 decodeIntegerForKey:@"argumentCategory"];
  self->_argumentCategory = v9;
  switch(v9)
  {
    case 1:
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentDataValue"];
      argumentDataValue = self->_argumentDataValue;
      self->_argumentDataValue = v10;
      goto LABEL_8;
    case 2:
      [v4 decodeDoubleForKey:@"argumentDoubleValue"];
      self->_argumentDoubleValue = v12;
      objc_msgSend(NSNumber, "numberWithDouble:");
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      int64_t v14 = [v4 decodeInt64ForKey:@"argumentInt64Value"];
      self->_argumentInt64Value = v14;
      v13 = [NSNumber numberWithLongLong:v14];
      goto LABEL_7;
    case 4:
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentStringValue"];
      argumentDataValue = self->_argumentStringValue;
      self->_argumentStringValue = v15;
      goto LABEL_8;
    case 5:
      v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentUInt64Value"];
      self->_argumentUInt64Value = [v16 unsignedLongLongValue];

      v13 = [NSNumber numberWithUnsignedLongLong:self->_argumentUInt64Value];
LABEL_7:
      argumentDataValue = self->_argumentNumberValue;
      self->_argumentNumberValue = v13;
LABEL_8:

      break;
    default:
      break;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(OSLogMessageComponent *)self formatSubstring];
  [v8 encodeObject:v4 forKey:@"formatSubstring"];

  v5 = [(OSLogMessageComponent *)self placeholder];
  [v8 encodeObject:v5 forKey:@"placeholder"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[OSLogMessageComponent argumentCategory](self, "argumentCategory"), @"argumentCategory");
  switch([(OSLogMessageComponent *)self argumentCategory])
  {
    case OSLogMessageComponentArgumentCategoryData:
      v6 = [(OSLogMessageComponent *)self argumentDataValue];
      v7 = @"argumentDataValue";
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryDouble:
      [(OSLogMessageComponent *)self argumentDoubleValue];
      objc_msgSend(v8, "encodeDouble:forKey:", @"argumentDoubleValue");
      break;
    case OSLogMessageComponentArgumentCategoryInt64:
      objc_msgSend(v8, "encodeInt64:forKey:", -[OSLogMessageComponent argumentInt64Value](self, "argumentInt64Value"), @"argumentInt64Value");
      break;
    case OSLogMessageComponentArgumentCategoryString:
      v6 = [(OSLogMessageComponent *)self argumentStringValue];
      v7 = @"argumentStringValue";
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryUInt64:
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[OSLogMessageComponent argumentUInt64Value](self, "argumentUInt64Value"));
      v7 = @"argumentUInt64Value";
LABEL_7:
      [v8 encodeObject:v6 forKey:v7];

      break;
    default:
      break;
  }
}

- (void)fillWithData:(id)a3
{
  id v4 = [a3 objectRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_argumentCategory = 4;
    [(OSLogMessageComponent *)self setArgumentStringValue:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_argumentCategory = 1;
      [(OSLogMessageComponent *)self setArgumentDataValue:v4];
    }
    else
    {
      self->_argumentCategory = 0;
    }
  }
}

- (void)fillWithString:(id)a3
{
  self->_argumentCategory = 4;
  id v4 = [a3 objectRepresentation];
  [(OSLogMessageComponent *)self setArgumentStringValue:v4];
}

- (void)fillWithScalar:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 scalarCategory];
  if (v4 == 3)
  {
    self->_argumentCategory = 2;
    [v8 doubleValue];
    v5 = v8;
    self->_argumentDoubleValue = v6;
  }
  else
  {
    if (v4 == 2)
    {
      self->_argumentCategory = 3;
      self->_argumentInt64Value = [v8 int64Value];
    }
    else if (v4 == 1)
    {
      self->_argumentCategory = 5;
      self->_argumentUInt64Value = [v8 unsignedInt64Value];
    }
    else
    {
      self->_argumentCategory = 0;
    }
    v5 = v8;
  }
  v7 = [v5 objectRepresentation];
  [(OSLogMessageComponent *)self setArgumentNumberValue:v7];
}

- (OSLogMessageComponent)initWithDecomposedMessage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OSLogMessageComponent;
  v7 = [(OSLogMessageComponent *)&v20 init];
  if (v7)
  {
    uint64_t v8 = [v6 literalPrefixAtIndex:a4];
    int64_t v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_1F37C6C60;
    }
    [(OSLogMessageComponent *)v7 setFormatSubstring:v10];

    v11 = [v6 placeholderAtIndex:a4];
    uint64_t v12 = [v11 rawString];
    v13 = (void *)v12;
    if (v12) {
      int64_t v14 = (__CFString *)v12;
    }
    else {
      int64_t v14 = &stru_1F37C6C60;
    }
    [(OSLogMessageComponent *)v7 setPlaceholder:v14];

    if (v11)
    {
      v15 = [v6 argumentAtIndex:a4];
      v16 = v15;
      if (v15 && ![v15 availability])
      {
        uint64_t v19 = [v16 category];
        switch(v19)
        {
          case 3:
            [(OSLogMessageComponent *)v7 fillWithData:v16];
            break;
          case 2:
            [(OSLogMessageComponent *)v7 fillWithString:v16];
            break;
          case 1:
            [(OSLogMessageComponent *)v7 fillWithScalar:v16];
            break;
        }
      }
    }
    v17 = v7;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end