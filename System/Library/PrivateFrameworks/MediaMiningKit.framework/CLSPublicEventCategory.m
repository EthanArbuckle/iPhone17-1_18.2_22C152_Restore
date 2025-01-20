@interface CLSPublicEventCategory
+ (BOOL)supportsSecureCoding;
+ (NSString)appleEvents;
+ (NSString)artsAndMuseums;
+ (NSString)businessAndTechnology;
+ (NSString)community;
+ (NSString)dance;
+ (NSString)educational;
+ (NSString)familyEvents;
+ (NSString)festivalsAndFairs;
+ (NSString)musicConcerts;
+ (NSString)nightLife;
+ (NSString)sports;
+ (NSString)theater;
+ (NSString)tours;
- (CLSPublicEventCategory)initWithCategory:(id)a3;
- (CLSPublicEventCategory)initWithCoder:(id)a3;
- (NSArray)localizedSubcategories;
- (NSString)category;
- (NSString)localizedName;
- (id)description;
- (unint64_t)levelForLocalizedSubcategory:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedSubcategories:(id)a3;
@end

@implementation CLSPublicEventCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubcategories, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)setLocalizedSubcategories:(id)a3
{
}

- (NSArray)localizedSubcategories
{
  return self->_localizedSubcategories;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)category
{
  return self->_category;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSPublicEventCategory;
  v4 = [(CLSPublicEventCategory *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ category: %@, localizedName: %@, subcategory: %@", v4, self->_category, self->_localizedName, self->_localizedSubcategories];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  category = self->_category;
  id v5 = a3;
  [v5 encodeObject:category forKey:@"category"];
  [v5 encodeObject:self->_localizedName forKey:@"localizedName"];
  [v5 encodeObject:self->_localizedSubcategories forKey:@"localizedSubcategories"];
}

- (CLSPublicEventCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  v6 = [(CLSPublicEventCategory *)self initWithCategory:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"localizedSubcategories"];
    localizedSubcategories = v6->_localizedSubcategories;
    v6->_localizedSubcategories = (NSArray *)v12;
  }
  return v6;
}

- (unint64_t)levelForLocalizedSubcategory:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSPublicEventCategory *)self localizedSubcategories];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (CLSPublicEventCategory)initWithCategory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSPublicEventCategory;
  unint64_t v6 = [(CLSPublicEventCategory *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_category, a3);
  }

  return v7;
}

+ (NSString)appleEvents
{
  return (NSString *)(id)*MEMORY[0x1E4F641D8];
}

+ (NSString)tours
{
  return (NSString *)(id)*MEMORY[0x1E4F64238];
}

+ (NSString)familyEvents
{
  return (NSString *)(id)*MEMORY[0x1E4F64208];
}

+ (NSString)educational
{
  return (NSString *)(id)*MEMORY[0x1E4F64200];
}

+ (NSString)community
{
  return (NSString *)(id)*MEMORY[0x1E4F641F0];
}

+ (NSString)businessAndTechnology
{
  return (NSString *)(id)*MEMORY[0x1E4F641E8];
}

+ (NSString)sports
{
  return (NSString *)(id)*MEMORY[0x1E4F64228];
}

+ (NSString)artsAndMuseums
{
  return (NSString *)(id)*MEMORY[0x1E4F641E0];
}

+ (NSString)festivalsAndFairs
{
  return (NSString *)(id)*MEMORY[0x1E4F64210];
}

+ (NSString)dance
{
  return (NSString *)(id)*MEMORY[0x1E4F641F8];
}

+ (NSString)theater
{
  return (NSString *)(id)*MEMORY[0x1E4F64230];
}

+ (NSString)nightLife
{
  return (NSString *)(id)*MEMORY[0x1E4F64220];
}

+ (NSString)musicConcerts
{
  return (NSString *)(id)*MEMORY[0x1E4F64218];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end