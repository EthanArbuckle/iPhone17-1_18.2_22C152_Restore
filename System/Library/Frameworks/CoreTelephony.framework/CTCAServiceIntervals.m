@interface CTCAServiceIntervals
+ (BOOL)supportsSecureCoding;
- (BOOL)atStart;
- (CTCAServiceIntervals)initWithCoder:(id)a3;
- (NSArray)changesAt;
- (NSDate)endsAt;
- (NSDate)startsAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAtStart:(BOOL)a3;
- (void)setChangesAt:(id)a3;
- (void)setEndsAt:(id)a3;
- (void)setStartsAt:(id)a3;
@end

@implementation CTCAServiceIntervals

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCAServiceIntervals *)self startsAt];
  [v3 appendFormat:@", startsAt=%@", v4];

  v5 = [(CTCAServiceIntervals *)self endsAt];
  [v3 appendFormat:@", endsAt=%@", v5];

  BOOL v6 = [(CTCAServiceIntervals *)self atStart];
  v7 = "out";
  if (v6) {
    v7 = "in";
  }
  [v3 appendFormat:@", atStart=%s", v7];
  v8 = [(CTCAServiceIntervals *)self changesAt];
  [v3 appendFormat:@", changesAt=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v6 = [(CTCAServiceIntervals *)self startsAt];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setStartsAt:v7];

  v8 = [(CTCAServiceIntervals *)self endsAt];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setEndsAt:v9];

  objc_msgSend(v5, "setAtStart:", -[CTCAServiceIntervals atStart](self, "atStart"));
  v10 = [(CTCAServiceIntervals *)self changesAt];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setChangesAt:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CTCAServiceIntervals *)self startsAt];
  [v7 encodeObject:v4 forKey:@"startsAt"];

  v5 = [(CTCAServiceIntervals *)self endsAt];
  [v7 encodeObject:v5 forKey:@"endsAt"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CTCAServiceIntervals atStart](self, "atStart"), @"atStart");
  BOOL v6 = [(CTCAServiceIntervals *)self changesAt];
  [v7 encodeObject:v6 forKey:@"changesAt"];
}

- (CTCAServiceIntervals)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTCAServiceIntervals;
  v5 = [(CTCAServiceIntervals *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startsAt"];
    startsAt = v5->_startsAt;
    v5->_startsAt = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endsAt"];
    endsAt = v5->_endsAt;
    v5->_endsAt = (NSDate *)v8;

    v5->_atStart = [v4 decodeBoolForKey:@"atStart"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"changesAt"];
    changesAt = v5->_changesAt;
    v5->_changesAt = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)startsAt
{
  return self->_startsAt;
}

- (void)setStartsAt:(id)a3
{
}

- (NSDate)endsAt
{
  return self->_endsAt;
}

- (void)setEndsAt:(id)a3
{
}

- (BOOL)atStart
{
  return self->_atStart;
}

- (void)setAtStart:(BOOL)a3
{
  self->_atStart = a3;
}

- (NSArray)changesAt
{
  return self->_changesAt;
}

- (void)setChangesAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesAt, 0);
  objc_storeStrong((id *)&self->_endsAt, 0);

  objc_storeStrong((id *)&self->_startsAt, 0);
}

@end