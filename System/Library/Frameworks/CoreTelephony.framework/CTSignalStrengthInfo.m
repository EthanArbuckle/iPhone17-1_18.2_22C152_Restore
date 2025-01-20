@interface CTSignalStrengthInfo
+ (BOOL)supportsSecureCoding;
- (CTSignalStrengthInfo)initWithCoder:(id)a3;
- (NSNumber)bars;
- (NSNumber)displayBars;
- (NSNumber)maxDisplayBars;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBars:(id)a3;
- (void)setDisplayBars:(id)a3;
- (void)setMaxDisplayBars:(id)a3;
@end

@implementation CTSignalStrengthInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSignalStrengthInfo *)self bars];
  [v3 appendFormat:@", bars=%@", v4];

  v5 = [(CTSignalStrengthInfo *)self displayBars];
  [v3 appendFormat:@", displayBars=%@", v5];

  v6 = [(CTSignalStrengthInfo *)self maxDisplayBars];
  [v3 appendFormat:@", maxDisplayBars=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSignalStrengthInfo *)self bars];
  v6 = (void *)[v5 copy];
  [v4 setBars:v6];

  v7 = [(CTSignalStrengthInfo *)self displayBars];
  v8 = (void *)[v7 copy];
  [v4 setDisplayBars:v8];

  v9 = [(CTSignalStrengthInfo *)self maxDisplayBars];
  v10 = (void *)[v9 copy];
  [v4 setMaxDisplayBars:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSignalStrengthInfo *)self bars];
  [v4 encodeObject:v5 forKey:@"bars"];

  v6 = [(CTSignalStrengthInfo *)self displayBars];
  [v4 encodeObject:v6 forKey:@"display_bars"];

  id v7 = [(CTSignalStrengthInfo *)self maxDisplayBars];
  [v4 encodeObject:v7 forKey:@"max_display_bars"];
}

- (CTSignalStrengthInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSignalStrengthInfo;
  v5 = [(CTSignalStrengthInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bars"];
    bars = v5->_bars;
    v5->_bars = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_bars"];
    displayBars = v5->_displayBars;
    v5->_displayBars = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"max_display_bars"];
    maxDisplayBars = v5->_maxDisplayBars;
    v5->_maxDisplayBars = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)bars
{
  return self->_bars;
}

- (void)setBars:(id)a3
{
}

- (NSNumber)displayBars
{
  return self->_displayBars;
}

- (void)setDisplayBars:(id)a3
{
}

- (NSNumber)maxDisplayBars
{
  return self->_maxDisplayBars;
}

- (void)setMaxDisplayBars:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDisplayBars, 0);
  objc_storeStrong((id *)&self->_displayBars, 0);

  objc_storeStrong((id *)&self->_bars, 0);
}

@end