@interface BMRule
+ (BOOL)supportsSecureCoding;
- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6;
- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10;
- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10 uniqueDaysLastWeek:(unint64_t)a11 uniqueDaysTotal:(unint64_t)a12;
- (BMRule)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)antecedent;
- (NSSet)consequent;
- (double)confidence;
- (double)conviction;
- (double)lift;
- (double)rulePowerFactor;
- (double)support;
- (id)description;
- (unint64_t)absoluteAntecedentSupport;
- (unint64_t)absoluteConsequentSupport;
- (unint64_t)absoluteSupport;
- (unint64_t)basketCount;
- (unint64_t)hash;
- (unint64_t)uniqueDaysLastWeek;
- (unint64_t)uniqueDaysTotal;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMRule

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6
{
  return [(BMRule *)self initWithAntecedent:a3 consequent:a4 support:0 confidence:0 basketCount:0 absoluteSupport:0 absoluteAntecedentSupport:a5 absoluteConsequentSupport:a6];
}

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10
{
  return [(BMRule *)self initWithAntecedent:a3 consequent:a4 support:a7 confidence:a8 basketCount:a9 absoluteSupport:a10 absoluteAntecedentSupport:a5 absoluteConsequentSupport:a6 uniqueDaysLastWeek:0 uniqueDaysTotal:0];
}

- (BMRule)initWithAntecedent:(id)a3 consequent:(id)a4 support:(double)a5 confidence:(double)a6 basketCount:(unint64_t)a7 absoluteSupport:(unint64_t)a8 absoluteAntecedentSupport:(unint64_t)a9 absoluteConsequentSupport:(unint64_t)a10 uniqueDaysLastWeek:(unint64_t)a11 uniqueDaysTotal:(unint64_t)a12
{
  id v21 = a3;
  id v22 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMRule;
  v23 = [(BMRule *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_antecedent, a3);
    objc_storeStrong((id *)&v24->_consequent, a4);
    v24->_support = a5;
    v24->_confidence = a6;
    v24->_basketCount = a7;
    v24->_absoluteSupport = a8;
    v24->_absoluteAntecedentSupport = a9;
    v24->_absoluteConsequentSupport = a10;
    v24->_uniqueDaysLastWeek = a11;
    v24->_uniqueDaysTotal = a12;
  }

  return v24;
}

- (double)lift
{
  double v3 = (double)[(BMRule *)self absoluteAntecedentSupport];
  double v4 = v3 / (double)[(BMRule *)self basketCount];
  double v5 = (double)[(BMRule *)self absoluteConsequentSupport];
  double v6 = v5 / (double)[(BMRule *)self basketCount];
  [(BMRule *)self support];
  return v7 / (v4 * v6);
}

- (double)conviction
{
  double v3 = (double)[(BMRule *)self absoluteConsequentSupport];
  double v4 = 1.0 - v3 / (double)[(BMRule *)self basketCount];
  [(BMRule *)self confidence];
  return v4 / (1.0 - v5);
}

- (double)rulePowerFactor
{
  [(BMRule *)self support];
  double v4 = v3;
  [(BMRule *)self confidence];
  return v4 * v5;
}

- (id)description
{
  id v19 = (id)NSString;
  v18 = [(BMRule *)self antecedent];
  double v3 = [(BMRule *)self consequent];
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMRule absoluteSupport](self, "absoluteSupport"));
  double v5 = NSNumber;
  [(BMRule *)self support];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMRule *)self confidence];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = NSNumber;
  [(BMRule *)self lift];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = NSNumber;
  [(BMRule *)self conviction];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = NSNumber;
  [(BMRule *)self rulePowerFactor];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMRule uniqueDaysLastWeek](self, "uniqueDaysLastWeek"));
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMRule uniqueDaysTotal](self, "uniqueDaysTotal"));
  id v20 = [v19 stringWithFormat:@"{%@}->{%@}, absolute support: %@, support: %@, confidence: %@, lift: %@, conviction: %@, rulePowerFactor: %@, uniqueDaysLastWeek: %@, uniqueDaysTotal: %@", v18, v3, v4, v6, v8, v10, v12, v14, v15, v16];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v5 = v4;
  double v6 = [v5 antecedent];
  double v7 = [(BMRule *)self antecedent];
  if (![v6 isEqualToSet:v7]) {
    goto LABEL_8;
  }
  v8 = [v5 consequent];
  v9 = [(BMRule *)self consequent];
  if (![v8 isEqualToSet:v9]
    || ([v5 support], double v11 = v10, -[BMRule support](self, "support"), v11 != v12))
  {

LABEL_8:
    goto LABEL_9;
  }
  [v5 confidence];
  double v14 = v13;
  [(BMRule *)self confidence];
  double v16 = v15;

  if (v14 != v16)
  {
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (unint64_t)hash
{
  double v3 = [(BMRule *)self antecedent];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMRule *)self consequent];
  uint64_t v6 = [v5 hash] ^ v4;
  [(BMRule *)self support];
  unint64_t v8 = v6 ^ vcvtd_n_u64_f64(v7, 0x40uLL);
  [(BMRule *)self confidence];
  unint64_t v10 = v8 ^ vcvtd_n_u64_f64(v9, 0x40uLL);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMRule)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  double v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v31 = [v5 decodeObjectOfClasses:v7 forKey:@"antecedent"];

  unint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  unint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v29 = [v5 decodeObjectOfClasses:v10 forKey:@"consequent"];

  v30 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"support"];
  [v30 doubleValue];
  double v12 = v11;
  v28 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  [v28 doubleValue];
  double v14 = v13;
  v27 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"basketCount"];
  uint64_t v26 = [v27 unsignedLongValue];
  double v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"absoluteSupport"];
  uint64_t v25 = [v15 unsignedLongValue];
  double v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"absoluteAntecedentSupport"];
  uint64_t v17 = [v16 unsignedLongValue];
  v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"absoluteConsequentSupport"];
  uint64_t v19 = [v18 unsignedLongValue];
  id v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueDaysLastWeek"];
  uint64_t v21 = [v20 unsignedLongValue];
  id v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueDaysTotal"];

  v23 = (BMRule *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", v31, v29, v26, v25, v17, v19, v12, v14, v21, objc_msgSend(v22, "unsignedLongValue"));
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  antecedent = self->_antecedent;
  id v5 = a3;
  [v5 encodeObject:antecedent forKey:@"antecedent"];
  [v5 encodeObject:self->_consequent forKey:@"consequent"];
  uint64_t v6 = [NSNumber numberWithDouble:self->_support];
  [v5 encodeObject:v6 forKey:@"support"];

  double v7 = [NSNumber numberWithDouble:self->_confidence];
  [v5 encodeObject:v7 forKey:@"confidence"];

  unint64_t v8 = [NSNumber numberWithUnsignedLong:self->_basketCount];
  [v5 encodeObject:v8 forKey:@"basketCount"];

  uint64_t v9 = [NSNumber numberWithUnsignedLong:self->_absoluteSupport];
  [v5 encodeObject:v9 forKey:@"absoluteSupport"];

  unint64_t v10 = [NSNumber numberWithUnsignedLong:self->_absoluteAntecedentSupport];
  [v5 encodeObject:v10 forKey:@"absoluteAntecedentSupport"];

  double v11 = [NSNumber numberWithUnsignedLong:self->_absoluteConsequentSupport];
  [v5 encodeObject:v11 forKey:@"absoluteConsequentSupport"];

  double v12 = [NSNumber numberWithUnsignedLong:self->_uniqueDaysLastWeek];
  [v5 encodeObject:v12 forKey:@"uniqueDaysLastWeek"];

  id v13 = [NSNumber numberWithUnsignedLong:self->_uniqueDaysTotal];
  [v5 encodeObject:v13 forKey:@"uniqueDaysTotal"];
}

- (NSSet)antecedent
{
  return self->_antecedent;
}

- (NSSet)consequent
{
  return self->_consequent;
}

- (double)support
{
  return self->_support;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)basketCount
{
  return self->_basketCount;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (unint64_t)absoluteAntecedentSupport
{
  return self->_absoluteAntecedentSupport;
}

- (unint64_t)absoluteConsequentSupport
{
  return self->_absoluteConsequentSupport;
}

- (unint64_t)uniqueDaysLastWeek
{
  return self->_uniqueDaysLastWeek;
}

- (unint64_t)uniqueDaysTotal
{
  return self->_uniqueDaysTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consequent, 0);

  objc_storeStrong((id *)&self->_antecedent, 0);
}

@end