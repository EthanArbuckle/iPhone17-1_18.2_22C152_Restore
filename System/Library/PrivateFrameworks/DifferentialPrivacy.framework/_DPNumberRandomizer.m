@interface _DPNumberRandomizer
+ (id)numberRandomizerWithRange:(unint64_t)a3 epsilon:(double)a4;
- (NSString)description;
- (_DPLaplaceNoiseGenerator)generator;
- (_DPNumberRandomizer)init;
- (_DPNumberRandomizer)initWithRange:(unint64_t)a3 epsilon:(double)a4;
- (double)epsilon;
- (id)randomize:(id)a3;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeNumbers:(id)a3 forKey:(id)a4;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)range;
@end

@implementation _DPNumberRandomizer

- (_DPNumberRandomizer)init
{
  return 0;
}

- (_DPNumberRandomizer)initWithRange:(unint64_t)a3 epsilon:(double)a4
{
  if (isInvalidEpsilon(a4))
  {
    v7 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPNumberRandomizer;
    v8 = [(_DPNumberRandomizer *)&v13 init];
    v9 = v8;
    if (v8)
    {
      v8->_range = a3;
      v8->_epsilon = a4;
      uint64_t v10 = +[_DPLaplaceNoiseGenerator zeroMeanLaplaceNoiseGenerator:(double)a3 / a4];
      generator = v9->_generator;
      v9->_generator = (_DPLaplaceNoiseGenerator *)v10;
    }
    self = v9;
    v7 = self;
  }

  return v7;
}

+ (id)numberRandomizerWithRange:(unint64_t)a3 epsilon:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithRange:a3 epsilon:a4];
  return v4;
}

- (id)randomize:(id)a3
{
  generator = self->_generator;
  id v4 = a3;
  [(_DPLaplaceNoiseGenerator *)generator sample];
  double v6 = v5;
  v7 = NSNumber;
  [v4 doubleValue];
  double v9 = v8;

  return (id)[v7 numberWithDouble:v6 + v9];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { range=%ld ; epsilon=%.16g ; laplaceNoiseGenerator=%@ }",
    v5,
    self->_range,
    *(void *)&self->_epsilon,
  double v6 = self->_generator);

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeNumbers:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v24 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = [(_DPNumberRandomizer *)self randomize:v16];
        v18 = [_DPNumericDataRecord alloc];
        [v16 doubleValue];
        double v20 = v19;
        [v17 doubleValue];
        v22 = [(_DPNumericDataRecord *)v18 initWithKey:v7 clearNumber:0 privateNumber:0 creationDate:v20 submitted:v21 objectId:v10];
        if (v22) {
          [v24 addObject:v22];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  return v24;
}

- (unint64_t)range
{
  return self->_range;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPLaplaceNoiseGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
}

@end