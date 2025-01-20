@interface CTQoSLinkCharacteristics
+ (BOOL)supportsSecureCoding;
- (CTQoSLinkCharacteristics)init;
- (CTQoSLinkCharacteristics)initWithCoder:(id)a3;
- (NSNumber)bitRateGuaranteedDL;
- (NSNumber)bitRateGuaranteedUL;
- (NSNumber)bitRateMaxDL;
- (NSNumber)bitRateMaxUL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBitRateGuaranteedDL:(id)a3;
- (void)setBitRateGuaranteedUL:(id)a3;
- (void)setBitRateMaxDL:(id)a3;
- (void)setBitRateMaxUL:(id)a3;
@end

@implementation CTQoSLinkCharacteristics

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTQoSLinkCharacteristics *)self bitRateMaxUL];
  [v3 appendFormat:@", bitRateMaxUL=%@", v4];

  v5 = [(CTQoSLinkCharacteristics *)self bitRateMaxDL];
  [v3 appendFormat:@", bitRateMaxDL=%@", v5];

  v6 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedUL];
  [v3 appendFormat:@", bitRateGuaranteedUL=%@", v6];

  v7 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedDL];
  [v3 appendFormat:@", bitRateGuaranteedDL=%@", v7];

  return v3;
}

- (CTQoSLinkCharacteristics)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTQoSLinkCharacteristics;
  return [(CTQoSLinkCharacteristics *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTQoSLinkCharacteristics *)self bitRateMaxUL];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBitRateMaxUL:v7];

  v8 = [(CTQoSLinkCharacteristics *)self bitRateMaxDL];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBitRateMaxDL:v9];

  v10 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedUL];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setBitRateGuaranteedUL:v11];

  v12 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedDL];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBitRateGuaranteedDL:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTQoSLinkCharacteristics *)self bitRateMaxUL];
  [v4 encodeObject:v5 forKey:@"bitRateMaxUL"];

  v6 = [(CTQoSLinkCharacteristics *)self bitRateMaxDL];
  [v4 encodeObject:v6 forKey:@"bitRateMaxDL"];

  v7 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedUL];
  [v4 encodeObject:v7 forKey:@"bitRateGuaranteedUL"];

  id v8 = [(CTQoSLinkCharacteristics *)self bitRateGuaranteedDL];
  [v4 encodeObject:v8 forKey:@"bitRateGuaranteedDL"];
}

- (CTQoSLinkCharacteristics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTQoSLinkCharacteristics;
  v5 = [(CTQoSLinkCharacteristics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateMaxUL"];
    bitRateMaxUL = v5->_bitRateMaxUL;
    v5->_bitRateMaxUL = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateMaxDL"];
    bitRateMaxDL = v5->_bitRateMaxDL;
    v5->_bitRateMaxDL = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateGuaranteedUL"];
    bitRateGuaranteedUL = v5->_bitRateGuaranteedUL;
    v5->_bitRateGuaranteedUL = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitRateGuaranteedDL"];
    bitRateGuaranteedDL = v5->_bitRateGuaranteedDL;
    v5->_bitRateGuaranteedDL = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)bitRateMaxUL
{
  return self->_bitRateMaxUL;
}

- (void)setBitRateMaxUL:(id)a3
{
}

- (NSNumber)bitRateMaxDL
{
  return self->_bitRateMaxDL;
}

- (void)setBitRateMaxDL:(id)a3
{
}

- (NSNumber)bitRateGuaranteedUL
{
  return self->_bitRateGuaranteedUL;
}

- (void)setBitRateGuaranteedUL:(id)a3
{
}

- (NSNumber)bitRateGuaranteedDL
{
  return self->_bitRateGuaranteedDL;
}

- (void)setBitRateGuaranteedDL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitRateGuaranteedDL, 0);
  objc_storeStrong((id *)&self->_bitRateGuaranteedUL, 0);
  objc_storeStrong((id *)&self->_bitRateMaxDL, 0);

  objc_storeStrong((id *)&self->_bitRateMaxUL, 0);
}

@end