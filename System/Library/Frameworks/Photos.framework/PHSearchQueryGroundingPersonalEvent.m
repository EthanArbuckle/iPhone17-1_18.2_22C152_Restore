@interface PHSearchQueryGroundingPersonalEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)momentUUIDs;
- (NSString)meaningLabel;
- (PHSearchQueryGroundingPersonalEvent)initWithCoder:(id)a3;
- (PHSearchQueryGroundingPersonalEvent)initWithMeaningLabel:(id)a3 momentUUIDs:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHSearchQueryGroundingPersonalEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentUUIDs, 0);

  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

- (NSArray)momentUUIDs
{
  return self->_momentUUIDs;
}

- (NSString)meaningLabel
{
  return self->_meaningLabel;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PHSearchQueryGroundingPersonalEvent *)self meaningLabel];
  v5 = [(PHSearchQueryGroundingPersonalEvent *)self momentUUIDs];
  v6 = [v3 stringWithFormat:@"(meaningLabel:%@, momentUUIDs:%@)", v4, v5];

  return v6;
}

- (PHSearchQueryGroundingPersonalEvent)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQueryGroundingPersonalEventMeaningLabelPropertyText"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PHSearchQueryGroundingPersonalEventMomentUUIDsPropertyText"];

  v10 = [(PHSearchQueryGroundingPersonalEvent *)self initWithMeaningLabel:v5 momentUUIDs:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  meaningLabel = self->_meaningLabel;
  id v5 = a3;
  [v5 encodeObject:meaningLabel forKey:@"PHSearchQueryGroundingPersonalEventMeaningLabelPropertyText"];
  [v5 encodeObject:self->_momentUUIDs forKey:@"PHSearchQueryGroundingPersonalEventMomentUUIDsPropertyText"];
}

- (PHSearchQueryGroundingPersonalEvent)initWithMeaningLabel:(id)a3 momentUUIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSearchQueryGroundingPersonalEvent;
  v9 = [(PHSearchQueryGroundingPersonalEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_meaningLabel, a3);
    objc_storeStrong((id *)&v10->_momentUUIDs, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end