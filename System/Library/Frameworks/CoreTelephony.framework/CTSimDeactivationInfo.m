@interface CTSimDeactivationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSimDeactivationInfo)initWithCoder:(id)a3;
- (NSMutableArray)events;
- (NSString)homePlmn;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEvents:(id)a3;
- (void)setHomePlmn:(id)a3;
@end

@implementation CTSimDeactivationInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSimDeactivationInfo *)self homePlmn];
  [v3 appendFormat:@", homePlmn=%@", v4];

  v5 = [(CTSimDeactivationInfo *)self events];
  [v3 appendFormat:@", events=%@", v5];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  homePlmn = self->_homePlmn;
  id v5 = a3;
  [v5 encodeObject:homePlmn forKey:@"homePlmn"];
  [v5 encodeObject:self->_events forKey:@"events"];
}

- (CTSimDeactivationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSimDeactivationInfo;
  id v5 = [(CTSimDeactivationInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homePlmn"];
    homePlmn = v5->_homePlmn;
    v5->_homePlmn = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSMutableArray *)v11;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTSimDeactivationInfo *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(CTSimDeactivationInfo *)v4 events],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      uint64_t v6 = [(CTSimDeactivationInfo *)self homePlmn];
      v7 = [(CTSimDeactivationInfo *)v4 homePlmn];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(CTSimDeactivationInfo *)self events];
        uint64_t v9 = [(CTSimDeactivationInfo *)v4 events];
        char v10 = [v8 isEqualToArray:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)homePlmn
{
  return self->_homePlmn;
}

- (void)setHomePlmn:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_homePlmn, 0);
}

@end