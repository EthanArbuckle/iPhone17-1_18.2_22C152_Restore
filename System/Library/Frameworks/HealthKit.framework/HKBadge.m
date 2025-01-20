@interface HKBadge
+ (BOOL)supportsSecureCoding;
+ (HKBadge)errorBadge;
+ (HKBadge)indicatorBadge;
+ (HKBadge)zeroBadge;
+ (id)badgeFromKeyValueRepresentation:(id)a3;
+ (id)numberBadgeWithCount:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isErrorBadge;
- (BOOL)isIndicatorBadge;
- (BOOL)isNumberBadge;
- (BOOL)isZeroBadge;
- (HKBadge)initWithCoder:(id)a3;
- (HKBadge)initWithType:(int64_t)a3 count:(int64_t)a4;
- (NSNumber)keyValueRepresentation;
- (NSObject)value;
- (NSString)stringValue;
- (id)badgeByAggregatingWithBadge:(id)a3;
- (id)badgeByIncrementingByCount:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKBadge

- (HKBadge)initWithType:(int64_t)a3 count:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKBadge;
  result = [(HKBadge *)&v7 init];
  if (result)
  {
    result->_count = a4;
    result->_type = a3;
  }
  return result;
}

+ (HKBadge)zeroBadge
{
  return (HKBadge *)[a1 numberBadgeWithCount:0];
}

+ (HKBadge)indicatorBadge
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:0 count:0];

  return (HKBadge *)v2;
}

+ (HKBadge)errorBadge
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:2 count:0];

  return (HKBadge *)v2;
}

+ (id)numberBadgeWithCount:(int64_t)a3
{
  if (a3 < 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HKBadge.m", 48, @"Invalid parameter not satisfying: %@", @"count >= 0" object file lineNumber description];
  }
  v5 = (void *)[objc_alloc((Class)a1) initWithType:1 count:a3];

  return v5;
}

- (id)badgeByAggregatingWithBadge:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = v4;
  if (-[HKBadge isErrorBadge](v5, "isErrorBadge") || [v6 isErrorBadge])
  {
    objc_super v7 = +[HKBadge errorBadge];
    goto LABEL_4;
  }
  if ([(HKBadge *)v5 isZeroBadge]) {
    goto LABEL_10;
  }
  if ([v6 isZeroBadge]) {
    goto LABEL_12;
  }
  if ([(HKBadge *)v5 isIndicatorBadge])
  {
LABEL_10:
    objc_super v7 = v6;
    goto LABEL_4;
  }
  if ([v6 isIndicatorBadge])
  {
LABEL_12:
    objc_super v7 = v5;
  }
  else
  {
    if (!-[HKBadge isNumberBadge](v5, "isNumberBadge") || ([v6 isNumberBadge] & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", "HKBadge * _Nonnull _aggregateBadges(HKBadge * _Nonnull __strong, HKBadge * _Nonnull __strong)");
      [v10 handleFailureInFunction:v11, @"HKBadge.m", 190, @"Invalid parameter not satisfying: %@", @"badge1.isNumberBadge && badge2.isNumberBadge" file lineNumber description];
    }
    objc_super v7 = +[HKBadge numberBadgeWithCount:v6[1] + v5->_count];
  }
LABEL_4:
  v8 = v7;

  return v8;
}

- (id)badgeByIncrementingByCount:(int64_t)a3
{
  if (a3 < 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKBadge.m", 57, @"Invalid parameter not satisfying: %@", @"count >= 0" object file lineNumber description];
  }
  v5 = [(HKBadge *)self type];
  if (v5 == (HKBadge *)2)
  {
LABEL_6:
    v5 = self;
    goto LABEL_8;
  }
  if (v5 != (HKBadge *)1)
  {
    if (v5) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v5 = +[HKBadge numberBadgeWithCount:self->_count + a3];
LABEL_8:

  return v5;
}

- (id)description
{
  int64_t v3 = [(HKBadge *)self type];
  if (v3 == 1)
  {
    if ([(HKBadge *)self isZeroBadge])
    {
      id v4 = @"none";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%zd", self->_count);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (v3 == 2)
  {
    id v4 = @"error";
  }
  else
  {
    id v4 = @"indicator";
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKBadge *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if ([(HKBadge *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    uint64_t v6 = [(HKBadge *)v5 type];
    if (v6 == [(HKBadge *)self type])
    {
      objc_super v7 = [(HKBadge *)v5 value];
      v8 = [(HKBadge *)self value];
      BOOL v9 = v7 == v8;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKBadge *)self type];
  id v4 = [(HKBadge *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKBadge type](self, "type"), @"type");
  [v4 encodeInteger:self->_count forKey:@"count"];
}

- (HKBadge)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"count"];

  objc_super v7 = 0;
  if (v5 <= 2 && (v6 & 0x8000000000000000) == 0)
  {
    self = [(HKBadge *)self initWithType:v5 count:v6];
    objc_super v7 = self;
  }

  return v7;
}

- (BOOL)isErrorBadge
{
  return [(HKBadge *)self type] == 2;
}

- (BOOL)isIndicatorBadge
{
  return [(HKBadge *)self type] == 0;
}

- (BOOL)isNumberBadge
{
  return [(HKBadge *)self type] == 1;
}

- (BOOL)isZeroBadge
{
  BOOL v3 = [(HKBadge *)self isNumberBadge];
  if (v3) {
    LOBYTE(v3) = self->_count == 0;
  }
  return v3;
}

- (NSObject)value
{
  int64_t v3 = [(HKBadge *)self type];
  if (v3 == 1)
  {
    if ([(HKBadge *)self isZeroBadge])
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [NSNumber numberWithInteger:self->_count];
    }
  }
  else if (v3 == 2)
  {
    id v4 = @"!";
  }
  else
  {
    id v4 = &stru_1EEC60288;
  }

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)stringValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(HKBadge *)self value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
LABEL_6:
      unint64_t v5 = v4;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 stringValue];
      goto LABEL_6;
    }
    _HKInitializeLogging();
    uint64_t v6 = HKLogNotifications;
    if (os_log_type_enabled((os_log_t)HKLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      BOOL v9 = v3;
      __int16 v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Invalid badge value %{public}@ for %{public}@.", (uint8_t *)&v8, 0x16u);
    }
  }
  unint64_t v5 = 0;
LABEL_10:

  return (NSString *)v5;
}

- (NSNumber)keyValueRepresentation
{
  int64_t v3 = [(HKBadge *)self type];
  if (v3 == 1)
  {
    id v4 = [NSNumber numberWithInteger:self->_count];
  }
  else if (v3)
  {
    id v4 = &unk_1EECE3668;
  }
  else
  {
    id v4 = &unk_1EECE3680;
  }

  return (NSNumber *)v4;
}

+ (id)badgeFromKeyValueRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = +[HKBadge zeroBadge];
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    uint64_t v6 = v5;
    if (v5 > -3)
    {
      if (v5 == -1)
      {
        id v8 = +[HKBadge indicatorBadge];
      }
      else
      {
        if (v5 == -2) {
          +[HKBadge errorBadge];
        }
        else {
        id v8 = +[HKBadge numberBadgeWithCount:v5];
        }
      }
      goto LABEL_6;
    }
    _HKInitializeLogging();
    objc_super v7 = HKLogNotifications;
    if (os_log_type_enabled((os_log_t)HKLogNotifications, OS_LOG_TYPE_ERROR)) {
      +[HKBadge(KeyValueEntitySupport) badgeFromKeyValueRepresentation:](v6, v7);
    }
  }
  id v8 = v4;
LABEL_6:
  BOOL v9 = v8;

  return v9;
}

@end