@interface CTCAServicePlotReading
+ (BOOL)supportsSecureCoding;
- (CTCAServicePlotReading)initWithCoder:(id)a3;
- (NSArray)targets;
- (NSDate)at;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAt:(id)a3;
- (void)setTargets:(id)a3;
@end

@implementation CTCAServicePlotReading

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCAServicePlotReading *)self at];
  [v3 appendFormat:@", at=%@", v4];

  v5 = [(CTCAServicePlotReading *)self targets];
  [v3 appendFormat:@", targets=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCAServicePlotReading *)self at];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAt:v7];

  v8 = [(CTCAServicePlotReading *)self targets];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setTargets:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCAServicePlotReading *)self at];
  [v6 encodeObject:v4 forKey:@"at"];

  v5 = [(CTCAServicePlotReading *)self targets];
  [v6 encodeObject:v5 forKey:@"targets"];
}

- (CTCAServicePlotReading)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTCAServicePlotReading;
  v5 = [(CTCAServicePlotReading *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"at"];
    at = v5->_at;
    v5->_at = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"targets"];
    targets = v5->_targets;
    v5->_targets = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)at
{
  return self->_at;
}

- (void)setAt:(id)a3
{
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);

  objc_storeStrong((id *)&self->_at, 0);
}

@end