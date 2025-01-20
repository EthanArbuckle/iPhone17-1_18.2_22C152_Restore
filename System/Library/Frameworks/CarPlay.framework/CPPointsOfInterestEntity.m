@interface CPPointsOfInterestEntity
+ (BOOL)supportsSecureCoding;
- (CPPointsOfInterestEntity)initWithCoder:(id)a3;
- (CPPointsOfInterestEntity)initWithTitle:(id)a3 pointsOfInterest:(id)a4;
- (NSArray)pointsOfInterest;
- (NSString)title;
- (id)objectForIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPointsOfInterest:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CPPointsOfInterestEntity

- (CPPointsOfInterestEntity)initWithTitle:(id)a3 pointsOfInterest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPPointsOfInterestEntity;
  v8 = [(CPEntity *)&v12 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_pointsOfInterest, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointsOfInterestEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPPointsOfInterestEntity;
  v5 = [(CPEntity *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointsOfInterestEntityTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"CPPointsOfInterestEntityPointsOfInterest"];
    pointsOfInterest = v5->_pointsOfInterest;
    v5->_pointsOfInterest = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPPointsOfInterestEntity;
  id v4 = a3;
  [(CPEntity *)&v7 encodeWithCoder:v4];
  v5 = [(CPPointsOfInterestEntity *)self title];
  [v4 encodeObject:v5 forKey:@"CPPointsOfInterestEntityTitle"];

  uint64_t v6 = [(CPPointsOfInterestEntity *)self pointsOfInterest];
  [v4 encodeObject:v6 forKey:@"CPPointsOfInterestEntityPointsOfInterest"];
}

- (id)objectForIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(CPPointsOfInterestEntity *)self pointsOfInterest];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 primaryButton];
        objc_super v12 = v11;
        if (v11)
        {
          v13 = [v11 identifier];
          char v14 = [v13 isEqual:v4];

          if (v14)
          {
            v16 = v12;
            goto LABEL_15;
          }
        }
        v15 = [v10 secondaryButton];
        v16 = v15;
        if (v15)
        {
          v17 = [v15 identifier];
          int v18 = [v17 isEqual:v4];

          if (v18)
          {

            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)pointsOfInterest
{
  return self->_pointsOfInterest;
}

- (void)setPointsOfInterest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointsOfInterest, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end