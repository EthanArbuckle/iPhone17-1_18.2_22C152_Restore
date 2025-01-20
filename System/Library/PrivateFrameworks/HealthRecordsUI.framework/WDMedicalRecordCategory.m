@interface WDMedicalRecordCategory
- (HKUIMetricColors)categoryMetricColors;
- (NSArray)sampleTypes;
- (NSDictionary)additionalPredicatesForCategory;
- (NSString)displayImageName;
- (NSString)displayName;
- (UIImage)displayImage;
- (WDMedicalRecordCategory)initWithDictionary:(id)a3;
- (int64_t)categoryType;
- (void)setAdditionalPredicatesForCategory:(id)a3;
- (void)setCategoryMetricColors:(id)a3;
- (void)setCategoryType:(int64_t)a3;
- (void)setDisplayImage:(id)a3;
- (void)setDisplayImageName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSampleTypes:(id)a3;
@end

@implementation WDMedicalRecordCategory

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (HKUIMetricColors)categoryMetricColors
{
  return self->_categoryMetricColors;
}

- (NSDictionary)additionalPredicatesForCategory
{
  return self->_additionalPredicatesForCategory;
}

- (WDMedicalRecordCategory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordCategory;
  v5 = [(WDMedicalRecordCategory *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"HKMedicalRecordCategoryTypeIdentifer"];
    -[WDMedicalRecordCategory setCategoryType:](v5, "setCategoryType:", [v6 integerValue]);

    v7 = [v4 objectForKeyedSubscript:@"WDMedicalRecordCategoryMetricColors"];
    [(WDMedicalRecordCategory *)v5 setCategoryMetricColors:v7];

    v8 = [v4 objectForKeyedSubscript:@"WDMedicalRecordCategoryDisplayName"];
    [(WDMedicalRecordCategory *)v5 setDisplayName:v8];

    v9 = [v4 objectForKeyedSubscript:@"WDMedicalRecordCategoryDisplayImageName"];
    [(WDMedicalRecordCategory *)v5 setDisplayImageName:v9];

    uint64_t v10 = [(WDMedicalRecordCategory *)v5 displayImageName];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v13 = objc_msgSend(v12, "hkui_isRunningInApp");

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E4FB1818];
        v15 = [(WDMedicalRecordCategory *)v5 displayImageName];
        v16 = HKHealthUIFrameworkBundle();
        v17 = [v14 imageNamed:v15 inBundle:v16 compatibleWithTraitCollection:0];
        [(WDMedicalRecordCategory *)v5 setDisplayImage:v17];
      }
    }
    v18 = [v4 objectForKeyedSubscript:@"WDMedicalRecordCategorySampleTypes"];
    [(WDMedicalRecordCategory *)v5 setSampleTypes:v18];

    v19 = [v4 objectForKeyedSubscript:@"WDMedicalRecordCategoryAdditionalPredicates"];
    [(WDMedicalRecordCategory *)v5 setAdditionalPredicatesForCategory:v19];
  }
  return v5;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (void)setCategoryMetricColors:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setDisplayImageName:(id)a3
{
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (void)setDisplayImage:(id)a3
{
}

- (void)setSampleTypes:(id)a3
{
}

- (void)setAdditionalPredicatesForCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicatesForCategory, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_categoryMetricColors, 0);
}

@end