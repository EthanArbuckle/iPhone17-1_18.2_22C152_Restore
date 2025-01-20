@interface ATXTimeSectionRow
+ (BOOL)supportsSecureCoding;
- (ATXTimeSectionRow)initWithCoder:(id)a3;
- (ATXTimeSectionRow)initWithEvents:(id)a3 accessories:(id)a4 dateComponents:(id)a5 isCurrent:(BOOL)a6 prominence:(int64_t)a7 identifier:(id)a8;
- (BOOL)isCurrent;
- (NSArray)accessories;
- (NSArray)events;
- (NSDateComponents)dateComponents;
- (NSString)identifier;
- (int64_t)prominence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeSectionRow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeSectionRow)initWithEvents:(id)a3 accessories:(id)a4 dateComponents:(id)a5 isCurrent:(BOOL)a6 prominence:(int64_t)a7 identifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"ATXTimeSectionRow.m", 29, @"Invalid parameter not satisfying: %@", @"events" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"ATXTimeSectionRow.m", 30, @"Invalid parameter not satisfying: %@", @"accessories" object file lineNumber description];

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)ATXTimeSectionRow;
  v19 = [(ATXTimeSectionRow *)&v32 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    events = v19->_events;
    v19->_events = (NSArray *)v20;

    uint64_t v22 = [v16 copy];
    accessories = v19->_accessories;
    v19->_accessories = (NSArray *)v22;

    uint64_t v24 = [v17 copy];
    dateComponents = v19->_dateComponents;
    v19->_dateComponents = (NSDateComponents *)v24;

    v19->_isCurrent = a6;
    v19->_prominence = a7;
    uint64_t v26 = [v18 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v26;

    v28 = v19;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  events = self->_events;
  id v5 = a3;
  [v5 encodeObject:events forKey:@"events"];
  [v5 encodeObject:self->_accessories forKey:@"accessories"];
  [v5 encodeObject:self->_dateComponents forKey:@"dateComponents"];
  [v5 encodeBool:self->_isCurrent forKey:@"isCurrent"];
  [v5 encodeInteger:self->_prominence forKey:@"prominence"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (ATXTimeSectionRow)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"events"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"accessories"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponents"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isCurrent"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"prominence"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v11 = [(ATXTimeSectionRow *)self initWithEvents:v5 accessories:v6 dateComponents:v7 isCurrent:v8 prominence:v9 identifier:v10];
  return v11;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (int64_t)prominence
{
  return self->_prominence;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_accessories, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end