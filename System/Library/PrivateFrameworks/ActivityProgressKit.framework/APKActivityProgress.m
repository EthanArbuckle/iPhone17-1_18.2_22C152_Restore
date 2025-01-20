@interface APKActivityProgress
+ (BOOL)supportsSecureCoding;
- (APKActivityProgress)initWithCoder:(id)a3;
- (APKActivityProgress)initWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4 cancelled:(BOOL)a5 shouldHideProgressUI:(BOOL)a6;
- (APKActivityProgress)initWithProgress:(id)a3;
- (BOOL)cancelled;
- (BOOL)shouldHideProgressUI;
- (id)ns;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setShouldHideProgressUI:(BOOL)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation APKActivityProgress

- (APKActivityProgress)initWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4 cancelled:(BOOL)a5 shouldHideProgressUI:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)APKActivityProgress;
  result = [(APKActivityProgress *)&v11 init];
  if (result)
  {
    result->_completedUnitCount = a3;
    result->_totalUnitCount = a4;
    result->_cancelled = a5;
    result->_shouldHideProgressUI = a6;
  }
  return result;
}

- (APKActivityProgress)initWithProgress:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HideProgressCircleInUI"];

  uint64_t v7 = [v4 completedUnitCount];
  uint64_t v8 = [v4 totalUnitCount];
  uint64_t v9 = [v4 isCancelled];

  v10 = -[APKActivityProgress initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:](self, "initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:", v7, v8, v9, [v6 BOOLValue]);
  return v10;
}

- (id)ns
{
  v3 = objc_msgSend(MEMORY[0x263F08AB8], "progressWithTotalUnitCount:", -[APKActivityProgress totalUnitCount](self, "totalUnitCount"));
  objc_msgSend(v3, "setCompletedUnitCount:", -[APKActivityProgress completedUnitCount](self, "completedUnitCount"));
  if ([(APKActivityProgress *)self cancelled]) {
    [v3 cancel];
  }
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[APKActivityProgress shouldHideProgressUI](self, "shouldHideProgressUI"));
  [v3 setUserInfoObject:v4 forKey:@"HideProgressCircleInUI"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[APKActivityProgress completedUnitCount](self, "completedUnitCount"), @"completedUnitCount");
  objc_msgSend(v4, "encodeInt64:forKey:", -[APKActivityProgress totalUnitCount](self, "totalUnitCount"), @"totalUnitCount");
  objc_msgSend(v4, "encodeBool:forKey:", -[APKActivityProgress cancelled](self, "cancelled"), @"cancelled");
  objc_msgSend(v4, "encodeBool:forKey:", -[APKActivityProgress shouldHideProgressUI](self, "shouldHideProgressUI"), @"shouldHideProgressUI");
}

- (APKActivityProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"completedUnitCount"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"totalUnitCount"];
  uint64_t v7 = [v4 decodeBoolForKey:@"cancelled"];
  uint64_t v8 = [v4 decodeBoolForKey:@"shouldHideProgressUI"];

  return [(APKActivityProgress *)self initWithCompletedUnitCount:v5 totalUnitCount:v6 cancelled:v7 shouldHideProgressUI:v8];
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)shouldHideProgressUI
{
  return self->_shouldHideProgressUI;
}

- (void)setShouldHideProgressUI:(BOOL)a3
{
  self->_shouldHideProgressUI = a3;
}

@end