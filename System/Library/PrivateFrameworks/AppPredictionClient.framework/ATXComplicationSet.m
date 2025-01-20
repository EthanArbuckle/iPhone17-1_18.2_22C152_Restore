@interface ATXComplicationSet
+ (BOOL)supportsSecureCoding;
- (ATXComplicationSet)initWithCoder:(id)a3;
- (ATXComplicationSet)initWithComplications:(id)a3;
- (ATXComplicationSet)initWithComplications:(id)a3 localizedTitle:(id)a4;
- (NSArray)complications;
- (NSString)localizedTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXComplicationSet

- (ATXComplicationSet)initWithComplications:(id)a3
{
  return [(ATXComplicationSet *)self initWithComplications:a3 localizedTitle:&stru_1EFD9B408];
}

- (ATXComplicationSet)initWithComplications:(id)a3 localizedTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXComplicationSet;
  v9 = [(ATXComplicationSet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_complications, a3);
    objc_storeStrong((id *)&v10->_localizedTitle, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ATXComplicationSet *)self complications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendString:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplicationSet)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"complicationsSet"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"title"];

  v10 = [(ATXComplicationSet *)self initWithComplications:v8 localizedTitle:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXComplicationSet *)self complications];
  [v4 encodeObject:v5 forKey:@"complicationsSet"];

  id v6 = [(ATXComplicationSet *)self localizedTitle];
  [v4 encodeObject:v6 forKey:@"title"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[ATXComplicationSet allocWithZone:](ATXComplicationSet, "allocWithZone:");
  id v6 = [(ATXComplicationSet *)self complications];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(ATXComplicationSet *)self localizedTitle];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(ATXComplicationSet *)v5 initWithComplications:v7 localizedTitle:v9];

  return v10;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_complications, 0);
}

@end