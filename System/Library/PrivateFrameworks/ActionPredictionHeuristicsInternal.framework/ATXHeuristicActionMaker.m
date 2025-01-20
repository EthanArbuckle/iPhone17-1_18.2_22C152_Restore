@interface ATXHeuristicActionMaker
+ (BOOL)supportsSecureCoding;
- (ATXActionCriteria)criteria;
- (ATXHeuristicActionMaker)initWithCoder:(id)a3;
- (NSString)heuristic;
- (NSString)subtitle;
- (NSString)title;
- (id)action;
- (void)encodeWithCoder:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setHeuristic:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ATXHeuristicActionMaker

- (id)action
{
  v3 = [(ATXHeuristicActionMaker *)self _makeAction];
  v4 = v3;
  if (self->_criteria) {
    objc_msgSend(v3, "setCriteria:");
  }
  if (self->_heuristic) {
    objc_msgSend(v4, "setHeuristic:");
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicActionMaker)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicActionMaker;
  v5 = [(ATXHeuristicActionMaker *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criteria"];
    criteria = v5->_criteria;
    v5->_criteria = (ATXActionCriteria *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heuristic"];
    heuristic = v5->_heuristic;
    v5->_heuristic = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  criteria = self->_criteria;
  id v5 = a3;
  [v5 encodeObject:criteria forKey:@"criteria"];
  [v5 encodeObject:self->_heuristic forKey:@"heuristic"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
}

- (ATXActionCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (void)setHeuristic:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end