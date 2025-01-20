@interface GEOComposedRouteAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_accessibilityTransitArtworkTextForDataList:(id)a3;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityTransitArtworkText;
@end

@implementation GEOComposedRouteAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GEOComposedRoute";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTransitArtworkText
{
  v3 = objc_opt_class();
  v4 = [(GEOComposedRouteAccessibility *)self routePlanningArtworks];
  v5 = [v3 _accessibilityTransitArtworkTextForDataList:v4];

  return v5;
}

+ (id)_accessibilityTransitArtworkTextForDataList:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = a3;
  uint64_t v36 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  v3 = 0;
  if (v36)
  {
    unint64_t v4 = 0x265123000uLL;
    uint64_t v35 = *(void *)v54;
    v5 = @"MKServerFormattedStringParameters";
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v54 != v35)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v37 = v6;
        v8 = *(void **)(*((void *)&v53 + 1) + 8 * v6);
        if (objc_msgSend(v3, "length", v32, v33))
        {
          v32 = accessibilityLocalizedString(@"TRANSIT_ARTWORK_SEPARATOR");
          v33 = @"__AXStringForVariablesSentinel";
          uint64_t v9 = __AXStringForVariables();

          v3 = (void *)v9;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v39 = v8;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v40)
          {
            uint64_t v10 = *(void *)v50;
            uint64_t v38 = *(void *)v50;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v50 != v10) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v41 = v11;
                v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v47 = 0u;
                  long long v48 = 0u;
                  long long v45 = 0u;
                  long long v46 = 0u;
                  id v44 = v12;
                  uint64_t v13 = [v44 countByEnumeratingWithState:&v45 objects:v57 count:16];
                  if (v13)
                  {
                    uint64_t v14 = v13;
                    uint64_t v15 = *(void *)v46;
                    do
                    {
                      for (uint64_t i = 0; i != v14; ++i)
                      {
                        if (*(void *)v46 != v15) {
                          objc_enumerationMutation(v44);
                        }
                        v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                        if (objc_msgSend(v17, "conformsToProtocol:", *(void *)(v4 + 2480), v32))
                        {
                          v18 = [v17 accessibilityText];
                          if (![v18 length] && objc_msgSend(v17, "artworkSourceType") == 3)
                          {
                            v19 = (objc_class *)MEMORY[0x24564E2A0](v5);
                            uint64_t v20 = MEMORY[0x24564E2A0](@"MKServerFormattedString");
                            if (v19)
                            {
                              v21 = (objc_class *)v20;
                              if (v20)
                              {
                                v42 = (void *)[[v19 alloc] initWithInstructionsDistanceDetailLevel:0 variableOverrides:0];
                                id v22 = [v21 alloc];
                                v23 = [v17 textDataSource];
                                [v23 text];
                                v24 = v43 = v3;
                                v25 = (void *)[v22 initWithGeoServerString:v24 parameters:v42];

                                v26 = [v25 multiPartAttributedStringWithAttributes:MEMORY[0x263EFFA78]];
                                v27 = [v26 attributedString];
                                [v27 string];
                                uint64_t v29 = v28 = v5;

                                v3 = v43;
                                unint64_t v4 = 0x265123000;

                                v18 = (void *)v29;
                                v5 = v28;
                              }
                            }
                          }
                          if ([v18 length])
                          {
                            v32 = v18;
                            v33 = @"__AXStringForVariablesSentinel";
                            v30 = __AXStringForVariables();

                            if ([v17 hasRoutingIncidentBadge])
                            {
                              v32 = accessibilityLocalizedString(@"TRANSIT_INCIDENT");
                              v33 = @"__AXStringForVariablesSentinel";
                              v3 = __AXStringForVariables();
                            }
                            else
                            {
                              v3 = v30;
                            }
                          }
                        }
                        else
                        {
                          v32 = v17;
                          _AXAssert();
                        }
                      }
                      uint64_t v14 = [v44 countByEnumeratingWithState:&v45 objects:v57 count:16];
                    }
                    while (v14);
                  }

                  uint64_t v10 = v38;
                }
                else
                {
                  v32 = v12;
                  _AXAssert();
                }
                uint64_t v11 = v41 + 1;
              }
              while (v41 + 1 != v40);
              uint64_t v40 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }
            while (v40);
          }
        }
        else
        {
          v32 = v8;
          _AXAssert();
        }
        uint64_t v6 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v36);
  }

  return v3;
}

@end