@interface CalRoute
+ (BOOL)supportsSecureCoding;
- (CalLocation)end;
- (CalLocation)start;
- (CalRoute)initWithCoder:(id)a3;
- (NSString)route;
- (double)duration;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEnd:(id)a3;
- (void)setRoute:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation CalRoute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CalRoute;
  v5 = [(CalRoute *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
    uint64_t v7 = [v6 copy];
    start = v5->_start;
    v5->_start = (CalLocation *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"end"];
    uint64_t v10 = [v9 copy];
    end = v5->_end;
    v5->_end = (CalLocation *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route"];
    uint64_t v13 = [v12 copy];
    route = v5->_route;
    v5->_route = (NSString *)v13;

    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v15;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  uint64_t v7 = [(CalRoute *)self route];
  [v6 appendFormat:@"\n\troute: %@", v7];

  [(CalRoute *)self duration];
  objc_msgSend(v6, "appendFormat:", @"\n\tduration: %f", v8);
  v9 = [(CalRoute *)self start];
  [v6 appendFormat:@"\n\tstart: %@", v9];

  uint64_t v10 = [(CalRoute *)self end];
  [v6 appendFormat:@"\n\tend: %@", v10];

  return v6;
}

- (NSString)route
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (double)duration
{
  return self->_duration;
}

- (CalLocation)start
{
  return (CalLocation *)objc_getProperty(self, a2, 8, 1);
}

- (CalLocation)end
{
  return (CalLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CalRoute *)self start];
  [v7 encodeObject:v4 forKey:@"start"];

  v5 = [(CalRoute *)self end];
  [v7 encodeObject:v5 forKey:@"end"];

  v6 = [(CalRoute *)self route];
  [v7 encodeObject:v6 forKey:@"route"];

  [(CalRoute *)self duration];
  objc_msgSend(v7, "encodeDouble:forKey:", @"duration");
}

- (void)setStart:(id)a3
{
}

- (void)setEnd:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end