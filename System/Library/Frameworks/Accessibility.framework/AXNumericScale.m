@interface AXNumericScale
+ (id)linearScaleWithLowerBound:(double)a3 upperBound:(double)a4;
+ (id)lnScaleWithLowerBound:(double)a3 upperBound:(double)a4;
+ (id)log10ScaleWithLowerBound:(double)a3 upperBound:(double)a4;
- (AXNumericScale)init;
- (AXNumericScale)initWithLowerBound:(double)a3 upperBound:(double)a4 apply:(id)a5 invert:(id)a6;
- (double)lowerBound;
- (double)upperBound;
- (id)apply;
- (id)invert;
- (void)init;
- (void)setApply:(id)a3;
- (void)setInvert:(id)a3;
- (void)setLowerBound:(double)a3;
- (void)setUpperBound:(double)a3;
@end

@implementation AXNumericScale

- (AXNumericScale)init
{
  v3 = AXAudioGraphLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AXNumericScale init](v3);
  }

  return [(AXNumericScale *)self initWithLowerBound:0 upperBound:0 apply:0.0 invert:0.0];
}

- (AXNumericScale)initWithLowerBound:(double)a3 upperBound:(double)a4 apply:(id)a5 invert:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AXNumericScale;
  v12 = [(AXNumericScale *)&v19 init];
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
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_383 upperBound:&__block_literal_global_385 apply:a3 invert:a4];

  return v4;
}

+ (id)log10ScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_387 upperBound:&__block_literal_global_389 apply:a3 invert:a4];

  return v4;
}

+ (id)lnScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:&__block_literal_global_391 upperBound:&__block_literal_global_393 apply:a3 invert:a4];

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

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213B3D000, log, OS_LOG_TYPE_ERROR, "Don't call -[AXNumericScale init], use -initWithLowerBound:upperBound:apply:invert instead", v1, 2u);
}

@end