@interface SKKeyframeSequence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToSequence:(id)a3;
- (CGFloat)getKeyframeTimeForIndex:(NSUInteger)index;
- (Class)_valueClass;
- (NSUInteger)count;
- (SKCKeyframeSequence)_createSKCKeyframeSequence;
- (SKInterpolationMode)interpolationMode;
- (SKKeyframeSequence)init;
- (SKKeyframeSequence)initWithCapacity:(NSUInteger)numItems;
- (SKKeyframeSequence)initWithCoder:(NSCoder *)aDecoder;
- (SKKeyframeSequence)initWithCount:(unint64_t)a3;
- (SKKeyframeSequence)initWithKeyframeValues:(NSArray *)values times:(NSArray *)times;
- (SKRepeatMode)repeatMode;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getKeyframeValueForIndex:(NSUInteger)index;
- (id)sampleAtTime:(CGFloat)time;
- (void)_dirtySKCKeyframeSequence;
- (void)addKeyframeValue:(id)value time:(CGFloat)time;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllKeyframes;
- (void)removeKeyframeAtIndex:(NSUInteger)index;
- (void)removeLastKeyframe;
- (void)setInterpolationMode:(SKInterpolationMode)interpolationMode;
- (void)setKeyframeTime:(CGFloat)time forIndex:(NSUInteger)index;
- (void)setKeyframeValue:(id)value forIndex:(NSUInteger)index;
- (void)setKeyframeValue:(id)value time:(CGFloat)time forIndex:(NSUInteger)index;
- (void)setRepeatMode:(SKRepeatMode)repeatMode;
@end

@implementation SKKeyframeSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKKeyframeSequence)init
{
  return [(SKKeyframeSequence *)self initWithCapacity:0];
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKKeyframeSequence *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SKKeyframeSequence alloc];
  values = self->_values;
  times = self->_times;

  return [(SKKeyframeSequence *)v4 initWithKeyframeValues:values times:times];
}

- (SKKeyframeSequence)initWithCoder:(NSCoder *)aDecoder
{
  v17[4] = *MEMORY[0x263EF8340];
  v4 = aDecoder;
  v16.receiver = self;
  v16.super_class = (Class)SKKeyframeSequence;
  v5 = [(SKKeyframeSequence *)&v16 init];
  if (v5)
  {
    [(SKKeyframeSequence *)v5 setInterpolationMode:[(NSCoder *)v4 decodeIntegerForKey:@"_interpolationMode"]];
    [(SKKeyframeSequence *)v5 setRepeatMode:[(NSCoder *)v4 decodeIntegerForKey:@"_repeatMode"]];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
    [v6 addObjectsFromArray:v7];

    v8 = [(NSCoder *)v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [(NSCoder *)v4 decodeObjectOfClasses:v6 forKey:@"_values"];
    values = v5->_values;
    v5->_values = (NSMutableArray *)v9;

    uint64_t v11 = [(NSCoder *)v4 decodeObjectOfClasses:v6 forKey:@"_times"];
    times = v5->_times;
    v5->_times = (NSMutableArray *)v11;

    v5->_cKeyframeSequence = 0;
    uint64_t v13 = [(NSMutableArray *)v5->_values count];
    if (v13 != [(NSMutableArray *)v5->_times count])
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"'values' and 'times'  arrays must have equal counts"];

      v14 = 0;
      goto LABEL_6;
    }
    v5->_count = [(NSMutableArray *)v5->_values count];
  }
  v14 = v5;
LABEL_6:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKKeyframeSequence interpolationMode](self, "interpolationMode"), @"_interpolationMode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKKeyframeSequence repeatMode](self, "repeatMode"), @"_repeatMode");
  [v4 encodeObject:self->_values forKey:@"_values"];
  [v4 encodeObject:self->_times forKey:@"_times"];
}

- (SKKeyframeSequence)initWithCapacity:(NSUInteger)numItems
{
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:numItems];
  v7 = [(SKKeyframeSequence *)self initWithKeyframeValues:v5 times:v6];

  return v7;
}

- (SKKeyframeSequence)initWithKeyframeValues:(NSArray *)values times:(NSArray *)times
{
  id v6 = values;
  v7 = times;
  v16.receiver = self;
  v16.super_class = (Class)SKKeyframeSequence;
  v8 = [(SKKeyframeSequence *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [(NSArray *)v6 count];
    if (v9 != [(NSArray *)v7 count])
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"'values' and 'times'  arrays must have equal counts"];
      v14 = 0;
      goto LABEL_6;
    }
    v8->_count = v9;
    uint64_t v10 = [(NSArray *)v6 mutableCopy];
    uint64_t v11 = v8->_values;
    v8->_values = (NSMutableArray *)v10;

    uint64_t v12 = [(NSArray *)v7 mutableCopy];
    uint64_t v13 = v8->_times;
    v8->_times = (NSMutableArray *)v12;

    *(int64x2_t *)&v8->_interpolationMode = vdupq_n_s64(1uLL);
    v8->_cKeyframeSequence = 0;
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (NSUInteger)count
{
  return self->_count;
}

- (void)setInterpolationMode:(SKInterpolationMode)interpolationMode
{
  self->_interpolationMode = interpolationMode;
  [(SKKeyframeSequence *)self _dirtySKCKeyframeSequence];
}

- (SKInterpolationMode)interpolationMode
{
  return self->_interpolationMode;
}

- (void)setRepeatMode:(SKRepeatMode)repeatMode
{
  self->_repeatMode = repeatMode;
  [(SKKeyframeSequence *)self _dirtySKCKeyframeSequence];
}

- (SKRepeatMode)repeatMode
{
  return self->_repeatMode;
}

- (void)addKeyframeValue:(id)value time:(CGFloat)time
{
  id v6 = value;
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  id v9 = v6;
  [(NSMutableArray *)self->_values addObject:v6];
  times = self->_times;
  v8 = [NSNumber numberWithDouble:time];
  [(NSMutableArray *)times addObject:v8];

  self->_count = [(NSMutableArray *)self->_values count];
}

- (void)removeLastKeyframe
{
  self->_count = [(NSMutableArray *)self->_values count];
}

- (void)removeAllKeyframes
{
  self->_count = [(NSMutableArray *)self->_values count];
}

- (void)removeKeyframeAtIndex:(NSUInteger)index
{
  self->_count = [(NSMutableArray *)self->_values count];
}

- (void)setKeyframeValue:(id)value forIndex:(NSUInteger)index
{
  id v6 = value;
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  id v7 = v6;
  [(NSMutableArray *)self->_values replaceObjectAtIndex:index withObject:v6];
  [(SKKeyframeSequence *)self _dirtySKCKeyframeSequence];
}

- (void)setKeyframeTime:(CGFloat)time forIndex:(NSUInteger)index
{
  times = self->_times;
  id v7 = [NSNumber numberWithDouble:time];
  [(NSMutableArray *)times replaceObjectAtIndex:index withObject:v7];

  [(SKKeyframeSequence *)self _dirtySKCKeyframeSequence];
}

- (void)setKeyframeValue:(id)value time:(CGFloat)time forIndex:(NSUInteger)index
{
  id v8 = value;
  -[SKKeyframeSequence setKeyframeValue:forIndex:](self, "setKeyframeValue:forIndex:");
  [(SKKeyframeSequence *)self setKeyframeTime:index forIndex:time];
  [(SKKeyframeSequence *)self _dirtySKCKeyframeSequence];
}

- (id)getKeyframeValueForIndex:(NSUInteger)index
{
  uint64_t v3 = [(NSMutableArray *)self->_values objectAtIndex:index];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (Class)_valueClass
{
  if (self->_count)
  {
    v2 = [(NSMutableArray *)self->_values objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v3 = objc_opt_class();
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (Class)v3;
}

- (SKCKeyframeSequence)_createSKCKeyframeSequence
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)self->_count >= 1)
  {
    uint64_t v3 = [(NSMutableArray *)self->_values objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v5 = self->_values;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (!v6) {
        goto LABEL_22;
      }
      uint64_t v7 = *(void *)v14;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
          if (!v6)
          {
LABEL_22:

            if (isKindOfClass) {
              operator new();
            }
            operator new();
          }
          goto LABEL_5;
        }
      }
      NSLog(&cfstr_AllValuesInASk.isa, v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(&cfstr_Skkeyframesequ.isa);
LABEL_28:

        return 0;
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v5 = self->_values;
      uint64_t v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (!v9) {
        goto LABEL_22;
      }
      uint64_t v10 = *(void *)v18;
LABEL_16:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (!v9) {
            goto LABEL_22;
          }
          goto LABEL_16;
        }
      }
      NSLog(&cfstr_AllValuesInASk.isa);
    }

    goto LABEL_28;
  }
  return 0;
}

- (void)_dirtySKCKeyframeSequence
{
  cKeyframeSequence = self->_cKeyframeSequence;
  if (cKeyframeSequence)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(cKeyframeSequence);
    MEMORY[0x21052EA30]();
    self->_cKeyframeSequence = 0;
  }
}

- (id)sampleAtTime:(CGFloat)time
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_cKeyframeSequence) {
    self->_cKeyframeSequence = [(SKKeyframeSequence *)self _createSKCKeyframeSequence];
  }
  v5 = [(SKKeyframeSequence *)self _valueClass];
  if (v5)
  {
    uint64_t v6 = v5;
    if (v5 == (objc_class *)objc_opt_class())
    {
      float v7 = time;
      SKCKeyframeSequence::sample(self->_cKeyframeSequence, v7, v10);
      v5 = [NSNumber numberWithDouble:v10[0]];
    }
    else if (v6 == (objc_class *)objc_opt_class())
    {
      float v8 = time;
      SKCKeyframeSequence::sample(self->_cKeyframeSequence, v8, v10);
      v5 = [MEMORY[0x263F1C550] colorWithRed:v10[0] green:v10[1] blue:v10[2] alpha:v10[3]];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (CGFloat)getKeyframeTimeForIndex:(NSUInteger)index
{
  uint64_t v3 = [(NSMutableArray *)self->_times objectAtIndex:index];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_times, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

- (SKKeyframeSequence)initWithCount:(unint64_t)a3
{
  double v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  for (i = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  {
    float v7 = [MEMORY[0x263EFF9D0] null];
    [v5 addObject:v7];

    float v8 = [NSNumber numberWithDouble:0.0];
    [i addObject:v8];
  }
  uint64_t v9 = [(SKKeyframeSequence *)self initWithKeyframeValues:v5 times:i];

  return v9;
}

- (BOOL)isEqualToSequence:(id)a3
{
  double v4 = (SKKeyframeSequence *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    SKInterpolationMode v5 = [(SKKeyframeSequence *)self interpolationMode];
    if (v5 == [(SKKeyframeSequence *)v4 interpolationMode]
      && (SKRepeatMode v6 = [(SKKeyframeSequence *)self repeatMode],
          v6 == [(SKKeyframeSequence *)v4 repeatMode]))
    {
      unint64_t v7 = 0;
      while ([(NSMutableArray *)self->_values count] > v7)
      {
        if ([(NSMutableArray *)v4->_values count] > v7)
        {
          float v8 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:v7];
          uint64_t v9 = [(NSMutableArray *)v4->_values objectAtIndexedSubscript:v7];
          char v10 = [v8 isEqual:v9];

          ++v7;
          if (v10) {
            continue;
          }
        }
        goto LABEL_8;
      }
      unint64_t v13 = 0;
      do
      {
        unint64_t v14 = [(NSMutableArray *)self->_times count];
        BOOL v11 = v14 <= v13;
        if (v14 <= v13) {
          break;
        }
        if ([(NSMutableArray *)v4->_times count] <= v13) {
          break;
        }
        long long v15 = [(NSMutableArray *)self->_times objectAtIndexedSubscript:v13];
        long long v16 = [(NSMutableArray *)v4->_times objectAtIndexedSubscript:v13];
        char v17 = [v15 isEqualToNumber:v16];

        ++v13;
      }
      while ((v17 & 1) != 0);
    }
    else
    {
LABEL_8:
      BOOL v11 = 0;
    }
  }

  return v11;
}

@end