@interface HRERecommendationEngine
- (HRERankConfidenceController)rankingController;
- (HRERecommendationEngine)init;
- (HRETemplateRecommendationGenerator)templateSource;
- (NSArray)templates;
- (NSMutableArray)recommendationSources;
- (id)_sourcesEnabledWithOptions:(unint64_t)a3;
- (id)generateRecommendationsForHome:(id)a3 options:(unint64_t)a4;
- (id)generateRecommendationsForServiceLikeItems:(id)a3 accessoryTypeGroup:(id)a4 inHome:(id)a5 options:(unint64_t)a6;
- (id)generateRecommendationsForServiceLikeItems:(id)a3 inHome:(id)a4 options:(unint64_t)a5;
- (id)recommendationsForAccessoryTypeGroup:(id)a3 inHome:(id)a4 options:(unint64_t)a5;
- (void)setRankingController:(id)a3;
- (void)setRecommendationSources:(id)a3;
- (void)setTemplateSource:(id)a3;
- (void)setTemplates:(id)a3;
@end

@implementation HRERecommendationEngine

- (HRERecommendationEngine)init
{
  v12.receiver = self;
  v12.super_class = (Class)HRERecommendationEngine;
  v2 = [(HRERecommendationEngine *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    [(HRERecommendationEngine *)v2 setRecommendationSources:v3];

    v4 = +[HRETemplateRecommendationGenerator allAvailableTemplates];
    v5 = [[HRETemplateRecommendationGenerator alloc] initWithTemplates:v4];
    [(HRERecommendationEngine *)v2 setTemplateSource:v5];

    v6 = [(HRERecommendationEngine *)v2 recommendationSources];
    v7 = [(HRERecommendationEngine *)v2 templateSource];
    [v6 addObject:v7];

    v8 = [(HRERecommendationEngine *)v2 recommendationSources];
    v9 = objc_alloc_init(HREActionSetDerivingRecommendationGenerator);
    [v8 addObject:v9];

    v10 = objc_alloc_init(HRERankConfidenceController);
    [(HRERecommendationEngine *)v2 setRankingController:v10];
  }
  return v2;
}

- (id)generateRecommendationsForHome:(id)a3 options:(unint64_t)a4
{
  return [(HRERecommendationEngine *)self generateRecommendationsForServiceLikeItems:0 inHome:a3 options:a4];
}

- (id)recommendationsForAccessoryTypeGroup:(id)a3 inHome:(id)a4 options:(unint64_t)a5
{
  return [(HRERecommendationEngine *)self generateRecommendationsForServiceLikeItems:0 accessoryTypeGroup:a3 inHome:a4 options:a5];
}

- (id)generateRecommendationsForServiceLikeItems:(id)a3 inHome:(id)a4 options:(unint64_t)a5
{
  return [(HRERecommendationEngine *)self generateRecommendationsForServiceLikeItems:a3 accessoryTypeGroup:0 inHome:a4 options:a5];
}

- (id)generateRecommendationsForServiceLikeItems:(id)a3 accessoryTypeGroup:(id)a4 inHome:(id)a5 options:(unint64_t)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v12 name];
    v15 = [v12 uniqueIdentifier];
    *(_DWORD *)buf = 138413058;
    v38 = v14;
    __int16 v39 = 2112;
    v40 = v15;
    __int16 v41 = 2048;
    unint64_t v42 = a6;
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl(&dword_237B6D000, v13, OS_LOG_TYPE_DEFAULT, "Generating recommendations in home: <%@, %@>, options: %lu, serviceLikeItems: %@", buf, 0x2Au);
  }
  if (objc_msgSend(v12, "hf_currentUserIsRestrictedGuest"))
  {
    v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v12 currentUser];
      v18 = objc_msgSend(v17, "hf_prettyDescription");
      *(_DWORD *)buf = 136315394;
      v38 = "-[HRERecommendationEngine generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:]";
      __int16 v39 = 2112;
      v40 = v18;
      _os_log_impl(&dword_237B6D000, v16, OS_LOG_TYPE_DEFAULT, "(%s) Restricted guest should NOT get any recommendations. currentUser = %@", buf, 0x16u);
    }
    v19 = (void *)MEMORY[0x263F58190];
    id v20 = (id)objc_opt_new();
    v21 = [v19 futureWithResult:v20];
  }
  else
  {
    v22 = [(HRERecommendationEngine *)self _sourcesEnabledWithOptions:a6];
    v23 = [(HRERecommendationEngine *)self recommendationSources];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke;
    v35[3] = &unk_264CF4570;
    id v36 = v22;
    id v20 = v22;
    objc_msgSend(v23, "na_each:", v35);

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_6;
    v30[3] = &unk_264CF4598;
    id v31 = v12;
    id v32 = v10;
    id v33 = v11;
    unint64_t v34 = a6;
    v24 = objc_msgSend(v20, "na_map:", v30);
    v25 = [MEMORY[0x263F58190] combineAllFutures:v24];
    v26 = [v25 flatMap:&__block_literal_global_11];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_3;
    v29[3] = &unk_264CF45E0;
    v29[4] = self;
    v21 = [v26 flatMap:v29];
    id v27 = (id)[v21 addCompletionBlock:&__block_literal_global_13];
  }

  return v21;
}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_237B6D000, v4, OS_LOG_TYPE_DEFAULT, "%@ is disabled", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_6(void *a1, void *a2)
{
  return [a2 recommendationsForHome:a1[4] withServiceLikeItems:a1[5] accessoryTypeGroup:a1[6] options:a1[7]];
}

id __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x263EFFA08] setWithArray:a2];
  id v3 = (void *)MEMORY[0x263F58190];
  v4 = objc_msgSend(v2, "na_setByFlattening");
  int v5 = [v3 futureWithResult:v4];

  return v5;
}

id __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 rankingController];
  id v6 = [v5 rankRecommendationsFromSet:v4];

  uint64_t v7 = [v2 futureWithResult:v6];

  return v7;
}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_237B6D000, v7, OS_LOG_TYPE_DEFAULT, "Generated recommendations:", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(v4, "na_each:", &__block_literal_global_17);
    v8 = HFLogForCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    LOWORD(v12) = 0;
    v9 = "Finished generating recommendations";
    id v10 = v8;
    uint32_t v11 = 2;
    goto LABEL_9;
  }
  if (v5)
  {
    v8 = HFLogForCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    int v12 = 138412290;
    v13 = v6;
    v9 = "Failed to generate recommendations with error: %@";
    id v10 = v8;
    uint32_t v11 = 12;
LABEL_9:
    _os_log_impl(&dword_237B6D000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
LABEL_11:
}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_237B6D000, v3, OS_LOG_TYPE_DEFAULT, "\t\t%@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)templates
{
  id v2 = [(HRERecommendationEngine *)self templateSource];
  id v3 = [v2 templates];

  return (NSArray *)v3;
}

- (void)setTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(HRERecommendationEngine *)self templateSource];
  [v5 setTemplates:v4];
}

- (id)_sourcesEnabledWithOptions:(unint64_t)a3
{
  id v4 = [(HRERecommendationEngine *)self recommendationSources];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HRERecommendationEngine__sourcesEnabledWithOptions___block_invoke;
  v7[3] = &__block_descriptor_40_e35_B16__0___HRERecommendationSource__8l;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

BOOL __54__HRERecommendationEngine__sourcesEnabledWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return ([a2 disablingOptions] & v2) == 0;
}

- (NSMutableArray)recommendationSources
{
  return self->_recommendationSources;
}

- (void)setRecommendationSources:(id)a3
{
}

- (HRERankConfidenceController)rankingController
{
  return self->_rankingController;
}

- (void)setRankingController:(id)a3
{
}

- (HRETemplateRecommendationGenerator)templateSource
{
  return self->_templateSource;
}

- (void)setTemplateSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSource, 0);
  objc_storeStrong((id *)&self->_rankingController, 0);

  objc_storeStrong((id *)&self->_recommendationSources, 0);
}

@end