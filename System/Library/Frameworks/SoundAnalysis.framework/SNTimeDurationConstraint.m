@interface SNTimeDurationConstraint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CMTimeRange)durationRange;
- (NSArray)enumeratedDurations;
- (SNTimeDurationConstraint)initWithCoder:(id)a3;
- (SNTimeDurationConstraint)initWithDurationRange:(CMTimeRange *)durationRange;
- (SNTimeDurationConstraint)initWithEnumeratedDurations:(NSArray *)enumeratedDurations;
- (SNTimeDurationConstraint)initWithImpl:(id)a3;
- (SNTimeDurationConstraintType)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)impl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNTimeDurationConstraint

- (SNTimeDurationConstraint)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNTimeDurationConstraint;
  v6 = [(SNTimeDurationConstraint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (SNTimeDurationConstraint)initWithEnumeratedDurations:(NSArray *)enumeratedDurations
{
  v4 = enumeratedDurations;
  v9.receiver = self;
  v9.super_class = (Class)SNTimeDurationConstraint;
  id v5 = [(SNTimeDurationConstraint *)&v9 init];
  if (v5)
  {
    v6 = [[_SNTimeDurationConstraint alloc] initWithEnumeratedDurations:v4];
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (SNTimeDurationConstraint)initWithDurationRange:(CMTimeRange *)durationRange
{
  v11.receiver = self;
  v11.super_class = (Class)SNTimeDurationConstraint;
  v4 = [(SNTimeDurationConstraint *)&v11 init];
  if (v4)
  {
    id v5 = [_SNTimeDurationConstraint alloc];
    long long v6 = *(_OWORD *)&durationRange->start.epoch;
    v10[0] = *(_OWORD *)&durationRange->start.value;
    v10[1] = v6;
    v10[2] = *(_OWORD *)&durationRange->duration.timescale;
    uint64_t v7 = [(_SNTimeDurationConstraint *)v5 initWithDurationRange:v10];
    impl = v4->_impl;
    v4->_impl = (_SNTimeDurationConstraint *)v7;

    if (!v4->_impl)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SNTimeDurationConstraint *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(_SNTimeDurationConstraint *)self->_impl isEqual:v5->_impl];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(_SNTimeDurationConstraint *)self->_impl copyWithZone:a3];
  uint64_t v7 = (void *)[v5 initWithImpl:v6];

  return v7;
}

- (unint64_t)hash
{
  return MEMORY[0x1F4181798](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNTimeDurationConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNTimeDurationConstraint;
  id v5 = [(SNTimeDurationConstraint *)&v10 init];
  id v6 = v5;
  if (!v4
    || v5
    && (uint64_t v7 = [[_SNTimeDurationConstraint alloc] initWithCoder:v4], impl = v6->_impl, v6->_impl = v7, impl, !v6->_impl))
  {

    id v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_impl, sel_encodeWithCoder_);
  }
}

- (SNTimeDurationConstraintType)type
{
  return [(_SNTimeDurationConstraint *)self->_impl type];
}

- (NSArray)enumeratedDurations
{
  return (NSArray *)MEMORY[0x1F4181798](self->_impl, sel_enumeratedDurations);
}

- (CMTimeRange)durationRange
{
  result = (CMTimeRange *)self->_impl;
  if (result) {
    return (CMTimeRange *)MEMORY[0x1F4181798](result, sel_durationRange);
  }
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end