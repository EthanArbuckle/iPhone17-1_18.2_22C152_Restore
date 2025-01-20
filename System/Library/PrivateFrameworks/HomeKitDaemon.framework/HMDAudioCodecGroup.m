@interface HMDAudioCodecGroup
+ (BOOL)supportsSecureCoding;
+ (id)arrayWithCodecs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDAudioCodecGroup)initWithAudioCodecGroup:(unint64_t)a3;
- (HMDAudioCodecGroup)initWithCoder:(id)a3;
- (HMDAudioCodecGroup)initWithTLVData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)codec;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAudioCodecGroup

- (unint64_t)codec
{
  return self->_codec;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDAudioCodecGroup allocWithZone:a3];
  unint64_t v5 = [(HMDAudioCodecGroup *)self codec];
  return [(HMDAudioCodecGroup *)v4 initWithAudioCodecGroup:v5];
}

- (HMDAudioCodecGroup)initWithAudioCodecGroup:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAudioCodecGroup;
  result = [(HMDAudioCodecGroup *)&v5 init];
  if (result) {
    result->_codec = a3;
  }
  return result;
}

- (HMDAudioCodecGroup)initWithTLVData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAudioCodecGroup;
  v3 = [(HAPNumberParser *)&v6 initWithTLVData:a3];
  v4 = v3;
  if (v3) {
    v3->_codec = [(HAPNumberParser *)v3 decodedNumber];
  }
  return v4;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDAudioCodecGroupTypeAsString([(HMDAudioCodecGroup *)self codec]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendFormat:@"\n%@ codec = %@", v6, v8];
}

- (id)description
{
  v2 = NSString;
  v3 = HMDAudioCodecGroupTypeAsString([(HMDAudioCodecGroup *)self codec]);
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAudioCodecGroup *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(HMDAudioCodecGroup *)self codec];
      BOOL v6 = v5 == [(HMDAudioCodecGroup *)v4 codec];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDAudioCodecGroup *)self codec];
  objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDAudioCodecGroup", "codec");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt32:v5 forKey:v6];
}

- (HMDAudioCodecGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAudioCodecGroup;
  unint64_t v5 = [(HMDAudioCodecGroup *)&v8 init];
  if (v5)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "HMDAudioCodecGroup", "codec");
    v5->_codec = (int)[v4 decodeInt32ForKey:v6];
  }
  return v5;
}

+ (id)arrayWithCodecs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [HMDAudioCodecGroup alloc];
        v12 = -[HMDAudioCodecGroup initWithAudioCodecGroup:](v11, "initWithAudioCodecGroup:", objc_msgSend(v10, "unsignedIntegerValue", (void)v14));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end