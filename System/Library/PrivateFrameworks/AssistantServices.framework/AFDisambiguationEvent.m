@interface AFDisambiguationEvent
+ (BOOL)supportsSecureCoding;
- (AFDisambiguationEvent)initWithCoder:(id)a3;
- (NSDate)date;
- (NSString)itemIdentifier;
- (id)description;
- (int64_t)selectionType;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setSelectionType:(int64_t)a3;
@end

@implementation AFDisambiguationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_selectionType = a3;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (id)description
{
  unint64_t selectionType = self->_selectionType;
  if (selectionType > 2) {
    v3 = @"Unknown";
  }
  else {
    v3 = off_1E59254F0[selectionType];
  }
  return (id)[NSString stringWithFormat:@"Identifier: %@, Selection Type: %@, Date: %@", self->_itemIdentifier, v3, self->_date];
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"_itemIdentifier"];
  [v5 encodeInteger:self->_selectionType forKey:@"_selectionType"];
  [v5 encodeObject:self->_date forKey:@"_date"];
}

- (AFDisambiguationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFDisambiguationEvent;
  id v5 = [(AFDisambiguationEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    v5->_unint64_t selectionType = [v4 decodeIntegerForKey:@"_selectionType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end