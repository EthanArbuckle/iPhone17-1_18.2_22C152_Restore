@interface MEDecodeContext
+ (BOOL)supportsSecureCoding;
- (MEDecodeContext)initWithCoder:(id)a3;
- (MEDecodeContext)initWithDecodeReason:(int64_t)a3;
- (int64_t)decodeReason;
- (void)encodeWithCoder:(id)a3;
- (void)setDecodeReason:(int64_t)a3;
@end

@implementation MEDecodeContext

- (MEDecodeContext)initWithDecodeReason:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MEDecodeContext;
  result = [(MEDecodeContext *)&v5 init];
  if (result) {
    result->_decodeReason = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEDecodeContext decodeReason](self, "decodeReason"), @"EFPropertyKey_decodeReason");
}

- (MEDecodeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MEDecodeContext;
  objc_super v5 = [(MEDecodeContext *)&v7 init];
  if (v5) {
    v5->_decodeReason = [v4 decodeIntegerForKey:@"EFPropertyKey_decodeReason"];
  }

  return v5;
}

- (int64_t)decodeReason
{
  return self->_decodeReason;
}

- (void)setDecodeReason:(int64_t)a3
{
  self->_decodeReason = a3;
}

@end