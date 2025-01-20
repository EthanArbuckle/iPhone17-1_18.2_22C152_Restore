@interface ATXFreeMomentsResponse
+ (BOOL)supportsSecureCoding;
- (ATXFreeMomentsResponse)initWithCoder:(id)a3;
- (ATXFreeMomentsResponse)initWithFreeMoments:(id)a3;
- (NSArray)freeMoments;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXFreeMomentsResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMomentsResponse)initWithFreeMoments:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFreeMomentsResponse;
  v5 = [(ATXFreeMomentsResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    freeMoments = v5->_freeMoments;
    v5->_freeMoments = (NSArray *)v6;
  }
  return v5;
}

- (ATXFreeMomentsResponse)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = [v4 setWithObject:objc_opt_class()];
  v7 = [v5 decodeArrayOfObjectsOfClasses:v6 forKey:@"freeMoments"];

  if (v7)
  {
    self = [(ATXFreeMomentsResponse *)self initWithFreeMoments:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXFreeMomentsResponse *)self freeMoments];
  [v4 encodeObject:v5 forKey:@"freeMoments"];
}

- (NSArray)freeMoments
{
  return self->_freeMoments;
}

- (void).cxx_destruct
{
}

@end