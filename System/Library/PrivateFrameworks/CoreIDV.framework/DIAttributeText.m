@interface DIAttributeText
+ (BOOL)supportsSecureCoding;
- (BOOL)isNumeric;
- (BOOL)isSecureText;
- (BOOL)isSecureVisibleText;
- (BOOL)useLuhnCheck;
- (DIAttributeText)init;
- (DIAttributeText)initWithCoder:(id)a3;
- (NSString)defaultValue;
- (NSString)displayFormatPlaceholder;
- (NSString)getCurrentValue;
- (id)description;
- (id)displayFormatPaddingCharacters;
- (id)submissionString;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDisplayFormatPlaceholder:(id)a3;
- (void)setIsNumeric:(BOOL)a3;
- (void)setIsSecureText:(BOOL)a3;
- (void)setIsSecureVisibleText:(BOOL)a3;
- (void)setLuhnCheck:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
@end

@implementation DIAttributeText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeText;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minLength, @"minLength", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_maxLength forKey:@"maxLength"];
  [v4 encodeBool:self->_isSecureText forKey:@"isSecureText"];
  [v4 encodeBool:self->_isSecureVisibleText forKey:@"isSecureVisibleText"];
  [v4 encodeBool:self->_isNumeric forKey:@"isNumeric"];
  [v4 encodeBool:self->_luhnCheck forKey:@"useLuhnCheck"];
  [v4 encodeObject:self->_displayFormatPlaceholder forKey:@"displayFormatPlaceHolder"];

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeText)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIAttributeText;
  objc_super v5 = [(DIAttribute *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_minLength = [v4 decodeIntegerForKey:@"minLength"];
    v5->_maxLength = [v4 decodeIntegerForKey:@"maxLength"];
    v5->_isSecureText = [v4 decodeBoolForKey:@"isSecureText"];
    v5->_isSecureVisibleText = [v4 decodeBoolForKey:@"isSecureVisibleText"];
    v5->_isNumeric = [v4 decodeBoolForKey:@"isNumeric"];
    v5->_luhnCheck = [v4 decodeBoolForKey:@"useLuhnCheck"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayFormatPlaceHolder"];
    displayFormatPlaceholder = v5->_displayFormatPlaceholder;
    v5->_displayFormatPlaceholder = (NSString *)v6;
  }
  return v5;
}

- (DIAttributeText)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeText;
  v2 = [(DIAttribute *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DIAttribute *)v2 setAttributeType:1];
    v3->_minLength = 0;
    v3->_maxLength = 0;
    v3->_isSecureText = 0;
    v3->_isSecureVisibleText = 0;
    v3->_isNumeric = 0;
    v3->_luhnCheck = 0;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSString, "_newZStringWithString:");
    v6.receiver = self;
    v6.super_class = (Class)DIAttributeText;
    [(DIAttribute *)&v6 setCurrentValue:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIAttributeText;
    -[DIAttribute setCurrentValue:](&v5, sel_setCurrentValue_);
  }
}

- (void)setDefaultValue:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSString, "_newZStringWithString:");
    v6.receiver = self;
    v6.super_class = (Class)DIAttributeText;
    [(DIAttribute *)&v6 setDefaultValue:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIAttributeText;
    -[DIAttribute setDefaultValue:](&v5, sel_setDefaultValue_);
  }
}

- (void)setMinLength:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_minLength = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMaxLength:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_maxLength = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSecureText:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isSecureText = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSecureVisibleText:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isSecureVisibleText = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsNumeric:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isNumeric = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setLuhnCheck:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_luhnCheck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayFormatPlaceholder:(id)a3
{
  objc_super v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_displayFormatPlaceholder != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    displayFormatPlaceholder = self->_displayFormatPlaceholder;
    self->_displayFormatPlaceholder = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeText;
  v2 = [(DIAttribute *)&v4 getCurrentValue];
  return (NSString *)v2;
}

- (NSString)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeText;
  v2 = [(DIAttribute *)&v4 defaultValue];
  return (NSString *)v2;
}

- (unint64_t)minLength
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t minLength = self->_minLength;
  os_unfair_lock_unlock(p_lock);
  return minLength;
}

- (unint64_t)maxLength
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  unint64_t maxLength = self->_maxLength;
  os_unfair_lock_unlock(p_lock);
  return maxLength;
}

- (BOOL)isSecureText
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isSecureText;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSecureVisibleText
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isSecureVisibleText;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isNumeric
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isNumeric;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)useLuhnCheck
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_luhnCheck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)displayFormatPlaceholder
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_displayFormatPlaceholder;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_26C5761E0];
  v13.receiver = self;
  v13.super_class = (Class)DIAttributeText;
  objc_super v4 = [(DIAttribute *)&v13 description];
  [v3 appendFormat:@"%@", v4];

  os_unfair_lock_lock(&self->super._lock);
  if (self->_isNumeric) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  [v3 appendFormat:@"isNumeric: '%@'; ", v5];
  if (self->_isSecureVisibleText) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  [v3 appendFormat:@"isSecureVisibleText: '%@'; ", v6];
  if (self->_isSecureText) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"isSecureText: '%@'; ", v7];
  objc_msgSend(v3, "appendFormat:", @"maxLength: '%lu'; ", self->_maxLength);
  objc_msgSend(v3, "appendFormat:", @"minLength: '%lu'; ", self->_minLength);
  if (self->_luhnCheck) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@"luhnCheck: '%@'; ", v8];
  if (self->_isSecureVisibleText)
  {
    os_unfair_lock_unlock(&self->super._lock);
LABEL_16:
    [v3 appendString:@"defaultValue: '[REDACTED]'; "];
    [v3 appendString:@"currentValue: '[REDACTED]'; "];
    goto LABEL_17;
  }
  BOOL isSecureText = self->_isSecureText;
  os_unfair_lock_unlock(&self->super._lock);
  if (isSecureText) {
    goto LABEL_16;
  }
  v11 = [(DIAttributeText *)self defaultValue];
  [v3 appendFormat:@"defaultValue: '%@'; ", v11];

  v12 = [(DIAttributeText *)self getCurrentValue];
  [v3 appendFormat:@"currentValue: '%@'; ", v12];

LABEL_17:
  [v3 appendFormat:@">"];
  return v3;
}

- (id)displayFormatPaddingCharacters
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [(DIAttributeText *)self displayFormatPlaceholder];
  uint64_t v5 = [v4 length];

  if (v5 == 1)
  {
    objc_super v6 = [(DIAttribute *)self displayFormat];
    if ([v6 length])
    {
      do
      {
        v7 = [v6 substringToIndex:1];
        v8 = [(DIAttributeText *)self displayFormatPlaceholder];
        if ([v7 isEqualToString:v8])
        {
        }
        else
        {
          char v9 = [v3 containsObject:v7];

          if ((v9 & 1) == 0) {
            [v3 addObject:v7];
          }
        }
        v10 = [v6 substringFromIndex:1];

        objc_super v6 = v10;
      }
      while ([v10 length]);
    }
    else
    {
      v10 = v6;
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [&unk_26C57CD70 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(&unk_26C57CD70);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v16 = [(DIAttribute *)self displayFormat];
          int v17 = [v16 containsString:v15];

          if (v17) {
            [v3 addObject:v15];
          }
        }
        uint64_t v12 = [&unk_26C57CD70 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v18;
}

- (id)submissionString
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(DIAttributeText *)self getCurrentValue];
  objc_super v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (v5)
  {
    objc_super v6 = [(DIAttribute *)self displayFormat];

    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v7 = [(DIAttributeText *)self displayFormatPaddingCharacters];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          uint64_t v12 = v5;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v5 = [v12 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v15 + 1) + 8 * v11) withString:&stru_26C5761E0];

            ++v11;
            uint64_t v12 = v5;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
    uint64_t v13 = [v5 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

    uint64_t v5 = (void *)[NSString _newZStringWithString:v13];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end