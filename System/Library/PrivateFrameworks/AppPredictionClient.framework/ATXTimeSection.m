@interface ATXTimeSection
+ (BOOL)supportsSecureCoding;
- (ATXTime)representedTimeRangeEnd;
- (ATXTime)representedTimeRangeStart;
- (ATXTimeSection)initWithCoder:(id)a3;
- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5;
- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5 representedTimeRangeStart:(id)a6 representedTimeRangeEnd:(id)a7;
- (NSArray)rows;
- (NSString)title;
- (unint64_t)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeSection

- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5
{
  return [(ATXTimeSection *)self initWithRows:a3 title:a4 kind:a5 representedTimeRangeStart:0 representedTimeRangeEnd:0];
}

- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5 representedTimeRangeStart:(id)a6 representedTimeRangeEnd:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"ATXTimeSection.m", 31, @"Invalid parameter not satisfying: %@", @"rows" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)ATXTimeSection;
  v17 = [(ATXTimeSection *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    rows = v17->_rows;
    v17->_rows = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    title = v17->_title;
    v17->_title = (NSString *)v20;

    v17->_kind = a5;
    objc_storeStrong((id *)&v17->_representedTimeRangeStart, a6);
    objc_storeStrong((id *)&v17->_representedTimeRangeEnd, a7);
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v7 = self;
  v8 = self;
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, 0);

  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rows"];

  if (v10)
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"kind"];
    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeRangeStart"];
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeRangeEnd"];
    self = [(ATXTimeSection *)self initWithRows:v10 title:v11 kind:v12 representedTimeRangeStart:v13 representedTimeRangeEnd:v14];

    id v15 = self;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  rows = self->_rows;
  id v5 = a3;
  [v5 encodeObject:rows forKey:@"rows"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_representedTimeRangeStart forKey:@"timeRangeStart"];
  [v5 encodeObject:self->_representedTimeRangeEnd forKey:@"timeRangeEnd"];
}

- (NSArray)rows
{
  return self->_rows;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (ATXTime)representedTimeRangeStart
{
  return self->_representedTimeRangeStart;
}

- (ATXTime)representedTimeRangeEnd
{
  return self->_representedTimeRangeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedTimeRangeEnd, 0);
  objc_storeStrong((id *)&self->_representedTimeRangeStart, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_rows, 0);
}

@end