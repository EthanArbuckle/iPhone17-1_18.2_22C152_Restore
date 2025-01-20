@interface HRETemplateRecommendationGenerator
+ (id)allAvailableTemplates;
- (Class)generationProcessClass;
- (HRETemplateRecommendationGenerator)initWithTemplates:(id)a3;
- (NSArray)templates;
- (id)_filterTemplates:(id)a3 options:(unint64_t)a4;
- (unint64_t)disablingOptions;
- (void)setTemplates:(id)a3;
- (void)setupProcess:(id)a3;
@end

@implementation HRETemplateRecommendationGenerator

- (HRETemplateRecommendationGenerator)initWithTemplates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRETemplateRecommendationGenerator;
  v6 = [(HREStandardAsyncRecommendationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templates, a3);
  }

  return v7;
}

- (unint64_t)disablingOptions
{
  return 8;
}

- (id)_filterTemplates:(id)a3 options:(unint64_t)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HRETemplateRecommendationGenerator__filterTemplates_options___block_invoke;
  v6[3] = &__block_descriptor_35_e21_B16__0__HRETemplate_8l;
  BOOL v7 = (a4 & 2) != 0;
  char v8 = a4 & 1;
  BOOL v9 = (a4 & 4) != 0;
  v4 = objc_msgSend(a3, "na_filter:", v6);

  return v4;
}

BOOL __63__HRETemplateRecommendationGenerator__filterTemplates_options___block_invoke(unsigned char *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && a1[32] || (v5 & 1) != 0 && a1[33] || (v6 & 1) != 0 && a1[34];
}

- (void)setupProcess:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HRETemplateRecommendationGenerator;
  [(HREStandardAsyncRecommendationSource *)&v17 setupProcess:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  char v8 = [v5 home];
  BOOL v9 = [v8 rooms];
  v10 = (void *)[v9 mutableCopy];

  v11 = [v5 home];
  v12 = [v11 roomForEntireHome];

  if (v12)
  {
    v13 = [v5 home];
    v14 = [v13 roomForEntireHome];
    [v10 addObject:v14];
  }
  [v7 setRooms:v10];
  v15 = [(HRETemplateRecommendationGenerator *)self templates];
  v16 = -[HRETemplateRecommendationGenerator _filterTemplates:options:](self, "_filterTemplates:options:", v15, [v5 options]);
  [v7 setActiveTemplates:v16];
}

- (Class)generationProcessClass
{
  return (Class)objc_opt_class();
}

+ (id)allAvailableTemplates
{
  if (qword_268944BE8 != -1) {
    dispatch_once(&qword_268944BE8, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_4;

  return v2;
}

void __59__HRETemplateRecommendationGenerator_allAvailableTemplates__block_invoke()
{
  v13[11] = *MEMORY[0x263EF8340];
  v12 = objc_alloc_init(HREArriveHomeTemplate);
  v13[0] = v12;
  v0 = objc_alloc_init(HREGoodNightTemplate);
  v13[1] = v0;
  v1 = objc_alloc_init(HREGoodMorningTemplate);
  v13[2] = v1;
  v2 = objc_alloc_init(HRELeaveHomeTemplate);
  v13[3] = v2;
  id v3 = objc_alloc_init(HREAutoArriveHomeTemplate);
  v13[4] = v3;
  id v4 = objc_alloc_init(HREAutoLeaveHomeTemplate);
  v13[5] = v4;
  id v5 = objc_alloc_init(HREAutoLightsOnUnlockTemplate);
  v13[6] = v5;
  char v6 = objc_alloc_init(HRELockWhenDoorClosedTemplate);
  v13[7] = v6;
  id v7 = objc_alloc_init(HREMotionSensorLightsTemplate);
  v13[8] = v7;
  char v8 = objc_alloc_init(HRELightsAllOffContextActionTemplate);
  v13[9] = v8;
  BOOL v9 = objc_alloc_init(HREMediaPauseAllContextActionTemplate);
  v13[10] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:11];
  v11 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v10;
}

- (NSArray)templates
{
  return self->_templates;
}

- (void)setTemplates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end