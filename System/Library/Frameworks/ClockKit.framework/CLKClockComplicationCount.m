@interface CLKClockComplicationCount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWidget;
- (CLKClockComplicationCount)initWithApplicationIdentifier:(id)a3 countOnFace:(int64_t)a4 isWidget:(BOOL)a5;
- (CLKClockComplicationCount)initWithCoder:(id)a3;
- (NSString)applicationIdentifier;
- (id)description;
- (id)mergedWith:(id)a3;
- (int64_t)countOnFace;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKClockComplicationCount

- (CLKClockComplicationCount)initWithApplicationIdentifier:(id)a3 countOnFace:(int64_t)a4 isWidget:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKClockComplicationCount;
  v9 = [(CLKClockComplicationCount *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    applicationIdentifier = v9->_applicationIdentifier;
    v9->_applicationIdentifier = (NSString *)v10;

    v9->_countOnFace = a4;
    v9->_widget = a5;
  }

  return v9;
}

- (id)mergedWith:(id)a3
{
  v4 = a3;
  v5 = objc_alloc_init(CLKClockComplicationCount);
  objc_storeStrong((id *)&v5->_applicationIdentifier, self->_applicationIdentifier);
  v5->_countOnFace = self->_countOnFace + v4[3];
  int v6 = *((unsigned __int8 *)v4 + 8);

  if (v6) {
    BOOL widget = 1;
  }
  else {
    BOOL widget = self->_widget;
  }
  v5->_BOOL widget = widget;

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_applicationIdentifier];
  id v5 = (id)[v3 appendInteger:self->_countOnFace];
  id v6 = (id)[v3 appendBool:self->_widget];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CLKClockComplicationCount *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_applicationIdentifier isEqualToString:v4->_applicationIdentifier]
      && self->_countOnFace == v4->_countOnFace
      && self->_widget == v4->_widget;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_applicationIdentifier withName:@"applicationIdentifier"];
  id v4 = (id)[v3 appendInteger:self->_countOnFace withName:@"countOnFace"];
  id v5 = (id)[v3 appendBool:self->_widget withName:@"widget"];
  id v6 = [v3 build];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeInteger:self->_countOnFace forKey:@"countOnFace"];
  [v5 encodeBool:self->_widget forKey:@"widget"];
}

- (CLKClockComplicationCount)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKClockComplicationCount;
  id v5 = [(CLKClockComplicationCount *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    v5->_countOnFace = [v4 decodeIntegerForKey:@"countOnFace"];
    v5->_BOOL widget = [v4 decodeBoolForKey:@"widget"];
  }

  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int64_t)countOnFace
{
  return self->_countOnFace;
}

- (BOOL)isWidget
{
  return self->_widget;
}

- (void).cxx_destruct
{
}

@end