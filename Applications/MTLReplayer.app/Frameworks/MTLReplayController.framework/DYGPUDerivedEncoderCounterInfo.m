@interface DYGPUDerivedEncoderCounterInfo
+ (BOOL)supportsSecureCoding;
- (DYGPUDerivedEncoderCounterInfo)init;
- (DYGPUDerivedEncoderCounterInfo)initWithCoder:(id)a3;
- (NSArray)derivedCounterNames;
- (NSData)derivedCounters;
- (NSData)encoderInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateEncoderDerivedData:(id)a3;
- (void)_enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDerivedCounterNames:(id)a3;
- (void)setDerivedCounters:(id)a3;
- (void)setEncoderInfos:(id)a3;
@end

@implementation DYGPUDerivedEncoderCounterInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoderInfos, 0);
  objc_storeStrong((id *)&self->_derivedCounters, 0);

  objc_storeStrong((id *)&self->_derivedCounterNames, 0);
}

- (void)setEncoderInfos:(id)a3
{
}

- (NSData)encoderInfos
{
  return self->_encoderInfos;
}

- (void)setDerivedCounters:(id)a3
{
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setDerivedCounterNames:(id)a3
{
}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)_enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  v9 = (void (**)(id, uint64_t, void, NSUInteger))a4;
  v6 = [(NSData *)self->_encoderInfos bytes];
  v7 = [(NSData *)self->_derivedCounters bytes];
  NSUInteger v8 = [(NSArray *)self->_derivedCounterNames count];
  ((void (**)(id, uint64_t, char *, NSUInteger))v9)[2](v9, (uint64_t)v6 + 48 * a3, &v7[8 * v8 * a3], v8);
}

- (void)_enumerateEncoderDerivedData:(id)a3
{
  v11 = (void (**)(id, void, char *, char *, NSUInteger))a3;
  v4 = [(NSData *)self->_encoderInfos bytes];
  v5 = [(NSData *)self->_derivedCounters bytes];
  unsigned int v6 = [(NSData *)self->_encoderInfos length];
  NSUInteger v7 = [(NSArray *)self->_derivedCounterNames count];
  if (v6 >= 0x30)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    if (v6 / 0x30 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v6 / 0x30;
    }
    do
    {
      v11[2](v11, v9++, v4, v5, v8);
      v5 += 8 * v8;
      v4 += 48;
    }
    while (v10 != v9);
  }
}

- (DYGPUDerivedEncoderCounterInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYGPUDerivedEncoderCounterInfo;
  v2 = [(DYGPUDerivedEncoderCounterInfo *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_derivedCounterNames forKey:@"derivedCounterNames"];
  [v4 encodeObject:self->_derivedCounters forKey:@"derivedCounters"];
  [v4 encodeObject:self->_encoderInfos forKey:@"encoderInfos"];
}

- (DYGPUDerivedEncoderCounterInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DYGPUDerivedEncoderCounterInfo;
  v5 = [(DYGPUDerivedEncoderCounterInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    NSUInteger v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"derivedCounterNames"];
    derivedCounterNames = v5->_derivedCounterNames;
    v5->_derivedCounterNames = (NSArray *)v9;

    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"derivedCounters"];
    derivedCounters = v5->_derivedCounters;
    v5->_derivedCounters = (NSData *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"encoderInfos"];
    encoderInfos = v5->_encoderInfos;
    v5->_encoderInfos = (NSData *)v17;

    v19 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = [(DYGPUDerivedEncoderCounterInfo *)self derivedCounterNames];
  id v6 = [v5 copy];
  [v4 setDerivedCounterNames:v6];

  uint64_t v7 = [(DYGPUDerivedEncoderCounterInfo *)self derivedCounters];
  id v8 = [v7 copy];
  [v4 setDerivedCounters:v8];

  uint64_t v9 = [(DYGPUDerivedEncoderCounterInfo *)self encoderInfos];
  id v10 = [v9 copy];
  [v4 setEncoderInfos:v10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end