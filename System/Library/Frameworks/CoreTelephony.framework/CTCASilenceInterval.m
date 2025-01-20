@interface CTCASilenceInterval
+ (BOOL)supportsSecureCoding;
- (CTCASilenceInterval)initWithCoder:(id)a3;
- (NSDate)endsAt;
- (NSDate)startsAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEndsAt:(id)a3;
- (void)setStartsAt:(id)a3;
@end

@implementation CTCASilenceInterval

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCASilenceInterval *)self startsAt];
  [v3 appendFormat:@", startsAt=%@", v4];

  v5 = [(CTCASilenceInterval *)self endsAt];
  [v3 appendFormat:@", endsAt=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCASilenceInterval *)self startsAt];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setStartsAt:v7];

  v8 = [(CTCASilenceInterval *)self endsAt];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setEndsAt:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCASilenceInterval *)self startsAt];
  [v6 encodeObject:v4 forKey:@"startsAt"];

  v5 = [(CTCASilenceInterval *)self endsAt];
  [v6 encodeObject:v5 forKey:@"endsAt"];
}

- (CTCASilenceInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCASilenceInterval;
  v5 = [(CTCASilenceInterval *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startsAt"];
    startsAt = v5->_startsAt;
    v5->_startsAt = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endsAt"];
    endsAt = v5->_endsAt;
    v5->_endsAt = (NSDate *)v8;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endsAt, 0);

  objc_storeStrong((id *)&self->_startsAt, 0);
}

@end