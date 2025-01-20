@interface CLKSimpleProgressProvider
+ (BOOL)supportsSecureCoding;
+ (id)simpleProgressProviderWithProgress:(double)a3;
- (BOOL)_needsUpdates;
- (BOOL)isEqual:(id)a3;
- (CLKSimpleProgressProvider)initWithCoder:(id)a3;
- (double)_progressFractionForNow:(id)a3;
- (double)progress;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation CLKSimpleProgressProvider

+ (id)simpleProgressProviderWithProgress:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setProgress:a3];

  return v4;
}

- (double)_progressFractionForNow:(id)a3
{
  return self->_progress;
}

- (BOOL)_needsUpdates
{
  return 0;
}

- (void)_validate
{
  v2.receiver = self;
  v2.super_class = (Class)CLKSimpleProgressProvider;
  [(CLKProgressProvider *)&v2 _validate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleProgressProvider;
  id result = [(CLKProgressProvider *)&v5 copyWithZone:a3];
  if (result != self) {
    *((void *)result + 7) = *(void *)&self->_progress;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleProgressProvider;
  BOOL v5 = [(CLKProgressProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_progress == v4[7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleProgressProvider;
  double v3 = (double)[(CLKProgressProvider *)&v7 hash];
  id v4 = [NSNumber numberWithDouble:self->_progress];
  unint64_t v5 = (unint64_t)(v3 + (double)(unint64_t)[v4 hash] * 100.0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleProgressProvider;
  id v4 = a3;
  [(CLKProgressProvider *)&v6 encodeWithCoder:v4];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:", self->_progress, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"_progress"];
}

- (CLKSimpleProgressProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleProgressProvider;
  unint64_t v5 = [(CLKProgressProvider *)&v9 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_progress"];
    [v6 floatValue];
    v5->_progress = v7;
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleProgressProvider;
  double v3 = [(CLKProgressProvider *)&v6 JSONObjectRepresentation];
  id v4 = [NSNumber numberWithDouble:self->_progress];
  [v3 setObject:v4 forKeyedSubscript:@"progress"];

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

@end