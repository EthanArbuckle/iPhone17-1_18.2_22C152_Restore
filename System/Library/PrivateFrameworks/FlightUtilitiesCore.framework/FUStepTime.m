@interface FUStepTime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FUStepTime)initWithCoder:(id)a3;
- (FUStepTime)initWithType:(unint64_t)a3 date:(id)a4;
- (NSDate)date;
- (double)timeIntervalSinceNow;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FUStepTime

- (FUStepTime)initWithType:(unint64_t)a3 date:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FUStepTime;
  v7 = [(FUStepTime *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(FUStepTime *)v7 setType:a3];
    [(FUStepTime *)v8 setDate:v6];
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = [(FUStepTime *)self type];
  v4 = @"Unknown type";
  if (v3 == 2) {
    v4 = @"Take off / Touch down";
  }
  if (v3 == 1) {
    v5 = @"Gate";
  }
  else {
    v5 = v4;
  }
  id v6 = NSString;
  v7 = [(FUStepTime *)self date];
  v8 = [v6 stringWithFormat:@"%@ (%@)", v7, v5];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t v5 = -[FUStepTime type](self, "type"), v5 == [v4 type]))
  {
    id v6 = [(FUStepTime *)self date];
    v7 = [v4 date];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(FUStepTime *)self date];
      v9 = [v4 date];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[FUStepTime type](self, "type"));
  unint64_t v5 = [(FUStepTime *)self date];
  id v6 = (void *)[v5 copy];
  [v4 setDate:v6];

  return v4;
}

- (double)timeIntervalSinceNow
{
  unint64_t v3 = +[FUUtils testDate];
  id v4 = [(FUStepTime *)self date];
  unint64_t v5 = v4;
  if (v3) {
    [v4 timeIntervalSinceDate:v3];
  }
  else {
    [v4 timeIntervalSinceNow];
  }
  double v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([(FUStepTime *)self type]) {
    objc_msgSend(v6, "encodeInteger:forKey:", -[FUStepTime type](self, "type"), @"type");
  }
  id v4 = [(FUStepTime *)self date];

  if (v4)
  {
    unint64_t v5 = [(FUStepTime *)self date];
    [v6 encodeObject:v5 forKey:@"date"];
  }
}

- (FUStepTime)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FUStepTime;
  unint64_t v5 = [(FUStepTime *)&v9 init];
  if (v5)
  {
    -[FUStepTime setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [(FUStepTime *)v5 setDate:v6];

    double v7 = v5;
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end