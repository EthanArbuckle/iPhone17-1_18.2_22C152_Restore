@interface DIAttributeImageCaptureRequirements
+ (BOOL)supportsSecureCoding;
- (BOOL)liveliness;
- (DIAttributeImageCaptureRequirements)init;
- (DIAttributeImageCaptureRequirements)initWithCoder:(id)a3;
- (DIAttributeImageCaptureRequirements)initWithImageCaptureRequirements:(id)a3;
- (NSArray)supportedEncoding;
- (NSNumber)compressionRatio;
- (NSNumber)maximumCompressionRatio;
- (NSString)userMessage;
- (id)description;
- (unint64_t)maxRetakeCount;
- (unint64_t)minBorderPadding;
- (unint64_t)minHeight;
- (unint64_t)minWidth;
- (unint64_t)preferredHeight;
- (unint64_t)preferredWidth;
- (unint64_t)ratioHeight;
- (unint64_t)ratioWidth;
- (unint64_t)selection;
- (unint64_t)timeout;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressionRatio:(id)a3;
- (void)setLiveliness:(BOOL)a3;
- (void)setMaxRetakeCount:(unint64_t)a3;
- (void)setMaximumCompressionRatio:(id)a3;
- (void)setMinBorderPadding:(unint64_t)a3;
- (void)setMinHeight:(unint64_t)a3;
- (void)setMinWidth:(unint64_t)a3;
- (void)setPreferredHeight:(unint64_t)a3;
- (void)setPreferredWidth:(unint64_t)a3;
- (void)setRatioHeight:(unint64_t)a3;
- (void)setRatioWidth:(unint64_t)a3;
- (void)setSelection:(unint64_t)a3;
- (void)setSupportedEncoding:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setUserMessage:(id)a3;
@end

@implementation DIAttributeImageCaptureRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeInteger:self->_selection forKey:@"selection"];
  [v5 encodeInteger:self->_minHeight forKey:@"minHeight"];
  [v5 encodeInteger:self->_minWidth forKey:@"minWidth"];
  [v5 encodeInteger:self->_preferredHeight forKey:@"preferredHeight"];
  [v5 encodeInteger:self->_preferredWidth forKey:@"preferredWidth"];
  [v5 encodeInteger:self->_ratioHeight forKey:@"ratioHeight"];
  [v5 encodeInteger:self->_ratioWidth forKey:@"ratioWidth"];
  [v5 encodeInteger:self->_minBorderPadding forKey:@"minBorderPadding"];
  [v5 encodeObject:self->_supportedEncoding forKey:@"supportedEncoding"];
  [v5 encodeObject:self->_userMessage forKey:@"userMessage"];
  [v5 encodeBool:self->_liveliness forKey:@"liveliness"];
  [v5 encodeInteger:self->_timeout forKey:@"timeout"];
  [v5 encodeInteger:self->_maxRetakeCount forKey:@"maxRetakeCount"];

  os_unfair_lock_unlock(p_lock);
}

- (DIAttributeImageCaptureRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIAttributeImageCaptureRequirements *)self init];
  if (v5)
  {
    v5->_selection = [v4 decodeIntegerForKey:@"selection"];
    v5->_minHeight = [v4 decodeIntegerForKey:@"minHeight"];
    v5->_minWidth = [v4 decodeIntegerForKey:@"minWidth"];
    v5->_preferredHeight = [v4 decodeIntegerForKey:@"preferredHeight"];
    v5->_preferredWidth = [v4 decodeIntegerForKey:@"preferredWidth"];
    v5->_ratioHeight = [v4 decodeIntegerForKey:@"ratioHeight"];
    v5->_ratioWidth = [v4 decodeIntegerForKey:@"ratioWidth"];
    v5->_minBorderPadding = [v4 decodeIntegerForKey:@"minBorderPadding"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedEncoding"];
    supportedEncoding = v5->_supportedEncoding;
    v5->_supportedEncoding = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userMessage"];
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v11;

    v5->_liveliness = [v4 decodeBoolForKey:@"liveliness"];
    v5->_timeout = [v4 decodeIntegerForKey:@"timeout"];
    v5->_maxRetakeCount = [v4 decodeIntegerForKey:@"maxRetakeCount"];
  }

  return v5;
}

- (DIAttributeImageCaptureRequirements)initWithImageCaptureRequirements:(id)a3
{
  id v4 = a3;
  id v5 = [(DIAttributeImageCaptureRequirements *)self init];
  if (v5)
  {
    v5->_selection = [v4 selection];
    v5->_minHeight = [v4 minHeight];
    v5->_minWidth = [v4 minWidth];
    v5->_preferredHeight = [v4 preferredHeight];
    v5->_preferredWidth = [v4 preferredWidth];
    v5->_ratioHeight = [v4 ratioHeight];
    v5->_ratioWidth = [v4 ratioWidth];
    v5->_minBorderPadding = [v4 minBorderPadding];
    id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v7 = [v4 supportedEncoding];
    uint64_t v8 = [v6 initWithArray:v7 copyItems:1];
    supportedEncoding = v5->_supportedEncoding;
    v5->_supportedEncoding = (NSArray *)v8;

    uint64_t v10 = [v4 userMessage];
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v10;

    v5->_liveliness = [v4 liveliness];
    v5->_timeout = [v4 timeout];
    v5->_maxRetakeCount = [v4 maxRetakeCount];
  }

  return v5;
}

- (DIAttributeImageCaptureRequirements)init
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImageCaptureRequirements;
  result = [(DIAttributeImageCaptureRequirements *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setSelection:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_selection = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinHeight:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinWidth:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredHeight:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_preferredHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredWidth:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_preferredWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRatioHeight:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ratioHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRatioWidth:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ratioWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinBorderPadding:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minBorderPadding = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setCompressionRatio:(id)a3
{
  id v6 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_compressionRatio != v6)
  {
    id v4 = (NSNumber *)[(NSNumber *)v6 copyWithZone:0];
    compressionRatio = self->_compressionRatio;
    self->_compressionRatio = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaximumCompressionRatio:(id)a3
{
  id v6 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_maximumCompressionRatio != v6)
  {
    id v4 = (NSNumber *)[(NSNumber *)v6 copyWithZone:0];
    maximumCompressionRatio = self->_maximumCompressionRatio;
    self->_maximumCompressionRatio = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUserMessage:(id)a3
{
  id v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_userMessage != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    userMessage = self->_userMessage;
    self->_userMessage = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportedEncoding:(id)a3
{
  id v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_supportedEncoding != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    supportedEncoding = self->_supportedEncoding;
    self->_supportedEncoding = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLiveliness:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_liveliness = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setTimeout:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_timeout = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMaxRetakeCount:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_maxRetakeCount = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)selection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t selection = self->_selection;
  os_unfair_lock_unlock(p_lock);
  return selection;
}

- (unint64_t)minHeight
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t minHeight = self->_minHeight;
  os_unfair_lock_unlock(p_lock);
  return minHeight;
}

- (unint64_t)minWidth
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t minWidth = self->_minWidth;
  os_unfair_lock_unlock(p_lock);
  return minWidth;
}

- (unint64_t)preferredHeight
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t preferredHeight = self->_preferredHeight;
  os_unfair_lock_unlock(p_lock);
  return preferredHeight;
}

- (unint64_t)preferredWidth
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t preferredWidth = self->_preferredWidth;
  os_unfair_lock_unlock(p_lock);
  return preferredWidth;
}

- (unint64_t)ratioHeight
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t ratioHeight = self->_ratioHeight;
  os_unfair_lock_unlock(p_lock);
  return ratioHeight;
}

- (unint64_t)ratioWidth
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t ratioWidth = self->_ratioWidth;
  os_unfair_lock_unlock(p_lock);
  return ratioWidth;
}

- (unint64_t)minBorderPadding
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t minBorderPadding = self->_minBorderPadding;
  os_unfair_lock_unlock(p_lock);
  return minBorderPadding;
}

- (NSNumber)compressionRatio
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_compressionRatio;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maximumCompressionRatio
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_maximumCompressionRatio;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)userMessage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_userMessage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)supportedEncoding
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_supportedEncoding;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)liveliness
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_liveliness;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)timeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t timeout = self->_timeout;
  os_unfair_lock_unlock(p_lock);
  return timeout;
}

- (unint64_t)maxRetakeCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t maxRetakeCount = self->_maxRetakeCount;
  os_unfair_lock_unlock(p_lock);
  return maxRetakeCount;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", @"selection: '%lu'; ", self->_selection);
  objc_msgSend(v3, "appendFormat:", @"minHeight: '%lu'; ", self->_minHeight);
  objc_msgSend(v3, "appendFormat:", @"minWidth: '%lu'; ", self->_minWidth);
  objc_msgSend(v3, "appendFormat:", @"preferredHeight: '%lu'; ", self->_preferredHeight);
  objc_msgSend(v3, "appendFormat:", @"preferredWidth: '%lu'; ", self->_preferredWidth);
  objc_msgSend(v3, "appendFormat:", @"ratioHeight: '%lu'; ", self->_ratioHeight);
  objc_msgSend(v3, "appendFormat:", @"ratioWidth: '%lu'; ", self->_ratioWidth);
  objc_msgSend(v3, "appendFormat:", @"minBorderPadding: '%lu'; ", self->_minBorderPadding);
  [v3 appendFormat:@"supportedEncoding: ["];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_supportedEncoding;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"]; "];
  [v3 appendFormat:@"userMessage: '%@'; ", self->_userMessage];
  if (self->_liveliness) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 appendFormat:@"liveliness: '%@'; ", v9];
  objc_msgSend(v3, "appendFormat:", @"timeout: '%lu'; ", self->_timeout);
  objc_msgSend(v3, "appendFormat:", @"maxRetakeCount: '%lu'; ", self->_maxRetakeCount);
  os_unfair_lock_unlock(&self->_lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumCompressionRatio, 0);
  objc_storeStrong((id *)&self->_compressionRatio, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_supportedEncoding, 0);
}

@end