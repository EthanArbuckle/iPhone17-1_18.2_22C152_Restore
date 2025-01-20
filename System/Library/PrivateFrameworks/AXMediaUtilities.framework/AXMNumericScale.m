@interface AXMNumericScale
+ (id)linearScaleWithLowerBound:(double)a3 upperBound:(double)a4;
+ (id)lnScaleWithLowerBound:(double)a3 upperBound:(double)a4;
+ (id)log10ScaleWithLowerBound:(double)a3 upperBound:(double)a4;
- (AXMNumericScale)init;
- (AXMNumericScale)initWithLowerBound:(double)a3 upperBound:(double)a4 apply:(id)a5 invert:(id)a6;
- (double)lowerBound;
- (double)upperBound;
- (id)apply;
- (id)invert;
- (void)setApply:(id)a3;
- (void)setInvert:(id)a3;
- (void)setLowerBound:(double)a3;
- (void)setUpperBound:(double)a3;
@end

@implementation AXMNumericScale

- (AXMNumericScale)init
{
  return [(AXMNumericScale *)self initWithLowerBound:0 upperBound:0 apply:0.0 invert:0.0];
}

- (AXMNumericScale)initWithLowerBound:(double)a3 upperBound:(double)a4 apply:(id)a5 invert:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AXMNumericScale;
  v12 = [(AXMNumericScale *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_lowerBound = a3;
    v12->_upperBound = a4;
    uint64_t v14 = [v10 copy];
    id apply = v13->_apply;
    v13->_id apply = (id)v14;

    uint64_t v16 = [v11 copy];
    id invert = v13->_invert;
    v13->_id invert = (id)v16;
  }
  return v13;
}

+ (id)linearScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_553 upperBound:&__block_literal_global_555 apply:a3 invert:a4];

  return v4;
}

+ (id)log10ScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_557 upperBound:&__block_literal_global_559 apply:a3 invert:a4];

  return v4;
}

+ (id)lnScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_561 upperBound:&__block_literal_global_563 apply:a3 invert:a4];

  return v4;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (id)apply
{
  return self->_apply;
}

- (void)setApply:(id)a3
{
}

- (id)invert
{
  return self->_invert;
}

- (void)setInvert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invert, 0);

  objc_storeStrong(&self->_apply, 0);
}

@end