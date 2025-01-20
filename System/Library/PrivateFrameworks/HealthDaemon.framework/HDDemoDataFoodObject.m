@interface HDDemoDataFoodObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDDemoDataFoodObject)initWithBrandName:(id)a3 genericName:(id)a4 foodType:(int64_t)a5 nutritionFacts:(id)a6;
- (HDDemoDataFoodObject)initWithCoder:(id)a3;
- (NSDictionary)nutritionFacts;
- (NSString)brandName;
- (NSString)genericName;
- (double)recommendedNumServings;
- (id)description;
- (int64_t)foodType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBrandName:(id)a3;
- (void)setFoodType:(int64_t)a3;
- (void)setGenericName:(id)a3;
- (void)setNutritionFacts:(id)a3;
- (void)setRecommendedNumServings:(double)a3;
@end

@implementation HDDemoDataFoodObject

- (HDDemoDataFoodObject)initWithBrandName:(id)a3 genericName:(id)a4 foodType:(int64_t)a5 nutritionFacts:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDDemoDataFoodObject;
  v14 = [(HDDemoDataFoodObject *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_brandName, a3);
    objc_storeStrong((id *)&v15->_genericName, a4);
    v15->_foodType = a5;
    v15->_recommendedNumServings = 1.0;
    objc_storeStrong((id *)&v15->_nutritionFacts, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  brandName = self->_brandName;
  genericName = self->_genericName;
  v6 = NSStringFromHDDemoDataFoodType(self->_foodType);
  v7 = [v3 stringWithFormat:@"Brand name: %@\nGeneric name: %@\nFood type: %@\nRecommend Serving: %.1f\nNutrion facts: %@", brandName, genericName, v6, *(void *)&self->_recommendedNumServings, self->_nutritionFacts];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataFoodObject)initWithCoder:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDDemoDataFoodObject;
  v5 = [(HDDemoDataFoodObject *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataFoodObjectBrandNameKey"];
    brandName = v5->_brandName;
    v5->_brandName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDemoDataFoodObjectGenericNameKey"];
    genericName = v5->_genericName;
    v5->_genericName = (NSString *)v8;

    v5->_foodType = [v4 decodeIntegerForKey:@"HDDemoDataFoodObjectFoodTypeKey"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    id v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HDDemoDataFoodObjectNutritionFactsKey"];
    nutritionFacts = v5->_nutritionFacts;
    v5->_nutritionFacts = (NSDictionary *)v13;

    [v4 decodeDoubleForKey:@"HDDemoDataFoodObjectRecommendedServingsKey"];
    v5->_recommendedNumServings = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  brandName = self->_brandName;
  id v5 = a3;
  [v5 encodeObject:brandName forKey:@"HDDemoDataFoodObjectBrandNameKey"];
  [v5 encodeObject:self->_genericName forKey:@"HDDemoDataFoodObjectGenericNameKey"];
  [v5 encodeInteger:self->_foodType forKey:@"HDDemoDataFoodObjectFoodTypeKey"];
  [v5 encodeObject:self->_nutritionFacts forKey:@"HDDemoDataFoodObjectNutritionFactsKey"];
  [v5 encodeDouble:@"HDDemoDataFoodObjectRecommendedServingsKey" forKey:self->_recommendedNumServings];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HDDemoDataFoodObject *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      uint64_t v8 = v7;
      char v9 = 0;
      if (!self || !v7) {
        goto LABEL_26;
      }
      v10 = [(HDDemoDataFoodObject *)self brandName];
      if (v10
        || ([(HDDemoDataFoodObject *)v8 brandName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(HDDemoDataFoodObject *)self brandName];
        id v11 = [(HDDemoDataFoodObject *)v8 brandName];
        char v12 = [v4 isEqualToString:v11];

        if (v10)
        {
LABEL_13:

          uint64_t v13 = [(HDDemoDataFoodObject *)self genericName];
          if (v13
            || ([(HDDemoDataFoodObject *)v8 genericName],
                (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v14 = [(HDDemoDataFoodObject *)self genericName];
            double v15 = [(HDDemoDataFoodObject *)v8 genericName];
            char v33 = [v14 isEqualToString:v15];

            if (v13)
            {
LABEL_19:

              v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDDemoDataFoodObject foodType](self, "foodType"));
              objc_super v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDDemoDataFoodObject foodType](v8, "foodType"));
              char v18 = [v16 isEqualToNumber:v17];

              v19 = [(HDDemoDataFoodObject *)self nutritionFacts];
              if (v19
                || ([(HDDemoDataFoodObject *)v8 nutritionFacts],
                    (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                [(HDDemoDataFoodObject *)self nutritionFacts];
                char v20 = v18;
                v22 = char v21 = v12;
                v23 = [(HDDemoDataFoodObject *)v8 nutritionFacts];
                char v24 = [v22 isEqualToDictionary:v23];

                char v12 = v21;
                char v18 = v20;
                if (v19)
                {
LABEL_25:

                  v25 = NSNumber;
                  [(HDDemoDataFoodObject *)self recommendedNumServings];
                  v26 = objc_msgSend(v25, "numberWithDouble:");
                  v27 = NSNumber;
                  [(HDDemoDataFoodObject *)v8 recommendedNumServings];
                  v28 = objc_msgSend(v27, "numberWithDouble:");
                  char v29 = [v26 isEqualToNumber:v28];

                  char v9 = v12 & v33 & v24 & v18 & v29;
LABEL_26:

                  goto LABEL_27;
                }
              }
              else
              {
                v32 = 0;
                char v24 = 1;
              }

              goto LABEL_25;
            }
          }
          else
          {
            char v33 = 1;
          }

          goto LABEL_19;
        }
      }
      else
      {
        char v12 = 1;
      }

      goto LABEL_13;
    }
    char v9 = 0;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(HDDemoDataFoodObject *)self brandName];
  uint64_t v4 = [v3 hash];
  id v5 = [(HDDemoDataFoodObject *)self genericName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HDDemoDataFoodObject *)self nutritionFacts];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v8 + 32 * [(HDDemoDataFoodObject *)self foodType];
  [(HDDemoDataFoodObject *)self recommendedNumServings];
  unint64_t v11 = v6 ^ (v9 + (unint64_t)v10);

  return v11;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (void)setBrandName:(id)a3
{
}

- (NSString)genericName
{
  return self->_genericName;
}

- (void)setGenericName:(id)a3
{
}

- (int64_t)foodType
{
  return self->_foodType;
}

- (void)setFoodType:(int64_t)a3
{
  self->_foodType = a3;
}

- (NSDictionary)nutritionFacts
{
  return self->_nutritionFacts;
}

- (void)setNutritionFacts:(id)a3
{
}

- (double)recommendedNumServings
{
  return self->_recommendedNumServings;
}

- (void)setRecommendedNumServings:(double)a3
{
  self->_recommendedNumServings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nutritionFacts, 0);
  objc_storeStrong((id *)&self->_genericName, 0);

  objc_storeStrong((id *)&self->_brandName, 0);
}

@end