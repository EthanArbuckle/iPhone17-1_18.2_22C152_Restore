@interface CHSWidgetRateLimit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRateLimit)initWithCoder:(id)a3;
- (CHSWidgetRateLimit)initWithMaximumRefreshes:(unint64_t)a3 perWindow:(double)a4;
- (NSString)description;
- (double)window;
- (unint64_t)hash;
- (unint64_t)maximumRefreshes;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRateLimit

- (CHSWidgetRateLimit)initWithMaximumRefreshes:(unint64_t)a3 perWindow:(double)a4
{
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CHSWidgetRateLimit.m", 23, @"Invalid parameter not satisfying: %@", @"maximum > 0" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CHSWidgetRateLimit.m", 24, @"Invalid parameter not satisfying: %@", @"window > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRateLimit;
  result = [(CHSWidgetRateLimit *)&v11 init];
  if (result)
  {
    result->_maximum = a3;
    result->_windowInSeconds = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_windowInSeconds - self->_maximum + 8 * self->_maximum;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSWidgetRateLimit *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_maximum == v4->_maximum
      && self->_windowInSeconds == v4->_windowInSeconds;
  }

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CHSWidgetRateLimit_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

void __51__CHSWidgetRateLimit_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 8)];
  id v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  id v4 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(*(void *)(a1 + 40) + 16)];
  id v5 = (id)objc_msgSend(v4, "appendObject:withName:");
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:LODWORD(self->_maximum) forKey:@"maximum"];
  [v4 encodeDouble:@"window" forKey:self->_windowInSeconds];
}

- (CHSWidgetRateLimit)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeInt32ForKey:@"maximum"];
  [v4 decodeDoubleForKey:@"window"];
  id v6 = -[CHSWidgetRateLimit initWithMaximumRefreshes:perWindow:](self, "initWithMaximumRefreshes:perWindow:", v5);

  return v6;
}

- (unint64_t)maximumRefreshes
{
  return self->_maximum;
}

- (double)window
{
  return self->_windowInSeconds;
}

@end