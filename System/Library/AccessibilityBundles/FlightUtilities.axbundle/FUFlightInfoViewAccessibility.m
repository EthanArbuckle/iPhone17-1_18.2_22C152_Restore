@interface FUFlightInfoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)setFlight:(id)a3;
@end

@implementation FUFlightInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FUFlightInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"leg", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightLeg", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"flightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"flight", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"leg", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelAirlineName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelFlightCode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelStatusTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelStatus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureCity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureCode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureInfo1", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureInfo2", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalCity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalCode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalInfo1", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalInfo2", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDepartureDelay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelArrivalDelay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDurationTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDurationValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelDurationComplete", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelBaggageClaimTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightInfoView", @"labelBaggageClaimValue", "@", 0);
}

- (void)setFlight:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FUFlightInfoViewAccessibility;
  [(FUFlightInfoViewAccessibility *)&v4 setFlight:a3];
  [(FUFlightInfoViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityElements
{
  id v3 = [(FUFlightInfoViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v3)
  {
    objc_super v4 = [MEMORY[0x263EFF980] array];
    char v235 = 0;
    objc_opt_class();
    v5 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"flight"];
    v6 = __UIAccessibilityCastAsClass();

    char v235 = 0;
    objc_opt_class();
    v7 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"leg"];
    v205 = __UIAccessibilityCastAsClass();

    v8 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:self];
    uint64_t v203 = *MEMORY[0x263F1CF48];
    -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v8, "setAccessibilityTraits:");
    v9 = NSString;
    v10 = accessibilityLocalizedString(@"flight.code.label");
    v11 = [v6 airline];
    v12 = [v11 name];
    v13 = [v6 flightCode];
    v14 = objc_msgSend(v9, "stringWithFormat:", v10, v12, v13);
    [(UIAccessibilityFrameRecalculatingElement *)v8 setAccessibilityLabel:v14];

    v234[0] = MEMORY[0x263EF8330];
    v234[1] = 3221225472;
    v234[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke;
    v234[3] = &unk_2651215B0;
    v234[4] = self;
    [(UIAccessibilityFrameRecalculatingElement *)v8 setCalculateFrame:v234];
    [v4 addObject:v8];
    char v235 = 0;
    objc_opt_class();
    v15 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelStatus"];
    v16 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    char v235 = 0;
    objc_opt_class();
    v17 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelStatusTitle"];
    v18 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    v19 = [v18 text];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      v21 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:self];
      [(UIAccessibilityFrameRecalculatingElement *)v21 setAccessibilityTraits:v203];
      v22 = [(FUFlightInfoViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"labelStatusTitle, labelStatus"];
      [(UIAccessibilityFrameRecalculatingElement *)v21 setAccessibilityLabel:v22];

      v231[0] = MEMORY[0x263EF8330];
      v231[1] = 3221225472;
      v231[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_2;
      v231[3] = &unk_2651215D8;
      id v232 = v16;
      id v233 = v18;
      [(UIAccessibilityFrameRecalculatingElement *)v21 setCalculateFrame:v231];
      [v4 addObject:v21];
    }
    v195 = v18;
    v196 = v16;
    v23 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:self];
    uint64_t v24 = *MEMORY[0x263F1CEE8];
    v202 = v23;
    [(UIAccessibilityFrameRecalculatingElement *)v23 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    char v235 = 0;
    objc_opt_class();
    v25 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureCity"];
    v26 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    char v235 = 0;
    objc_opt_class();
    v27 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureCode"];
    v28 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    v204 = v4;
    char v235 = 0;
    objc_opt_class();
    v29 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureInfo1"];
    v30 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    uint64_t v199 = v24;
    v193 = v8;
    v194 = v6;
    char v235 = 0;
    objc_opt_class();
    v31 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureInfo2"];
    v32 = __UIAccessibilityCastAsClass();

    if (v235) {
      goto LABEL_71;
    }
    v226[0] = MEMORY[0x263EF8330];
    v226[1] = 3221225472;
    v226[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_3;
    v226[3] = &unk_265121600;
    id v33 = v26;
    id v227 = v33;
    id v34 = v28;
    id v228 = v34;
    id v35 = v30;
    id v229 = v35;
    id v36 = v32;
    id v230 = v36;
    [(UIAccessibilityFrameRecalculatingElement *)v202 setCalculateFrame:v226];
    v37 = v204;
    v192 = v33;
    v189 = v36;
    v190 = v35;
    if (!v205)
    {
      objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v33, v34, v35, v36);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = MEMORY[0x24564CD50]();
LABEL_26:
      v191 = v34;

      [(UIAccessibilityFrameRecalculatingElement *)v202 setAccessibilityLabel:v43];
      v59 = accessibilityLocalizedString(@"flight.departure.location.hint");
      [(UIAccessibilityFrameRecalculatingElement *)v202 setAccessibilityHint:v59];

      [v37 addObject:v202];
      char v235 = 0;
      objc_opt_class();
      v60 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"flightButton"];
      v61 = __UIAccessibilityCastAsClass();

      if (v235) {
        goto LABEL_71;
      }
      v62 = accessibilityLocalizedString(@"flight.overview.label");
      [v61 setAccessibilityLabel:v62];

      v63 = accessibilityLocalizedString(@"flight.overview.hint");
      [v61 setAccessibilityHint:v63];

      [v37 axSafelyAddObject:v61];
      v201 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:self];
      [(UIAccessibilityFrameRecalculatingElement *)v201 setAccessibilityTraits:v199];
      char v235 = 0;
      objc_opt_class();
      v64 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelArrivalCity"];
      v65 = __UIAccessibilityCastAsClass();

      if (v235) {
        goto LABEL_71;
      }
      v188 = (void *)v43;
      char v235 = 0;
      objc_opt_class();
      v66 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelArrivalCode"];
      v67 = __UIAccessibilityCastAsClass();

      if (v235) {
        goto LABEL_71;
      }
      char v235 = 0;
      objc_opt_class();
      v68 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelArrivalInfo1"];
      v69 = __UIAccessibilityCastAsClass();

      if (v235) {
        goto LABEL_71;
      }
      char v235 = 0;
      objc_opt_class();
      v70 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelArrivalInfo2"];
      v71 = __UIAccessibilityCastAsClass();

      if (v235) {
        goto LABEL_71;
      }
      v221[0] = MEMORY[0x263EF8330];
      v221[1] = 3221225472;
      v221[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_4;
      v221[3] = &unk_265121600;
      id v72 = v65;
      id v222 = v72;
      id v73 = v67;
      id v223 = v73;
      id v74 = v69;
      id v224 = v74;
      id v75 = v71;
      id v225 = v75;
      [(UIAccessibilityFrameRecalculatingElement *)v201 setCalculateFrame:v221];
      v76 = v205;
      v186 = v73;
      v187 = v72;
      v184 = v75;
      v185 = v74;
      if (!v205)
      {
        objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v72, v73, v74, v75);
        id v82 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v83 = MEMORY[0x24564CD50]();
        unint64_t v81 = 0x265121000;
        goto LABEL_45;
      }
      v77 = [v205 arrival];
      v78 = [v77 airport];
      v79 = [v78 name];
      v80 = v79;
      unint64_t v81 = 0x265121000uLL;
      if (v79)
      {
        id v82 = v79;
      }
      else
      {
        v84 = [v205 arrival];
        v85 = [v84 airport];
        id v82 = [v85 IATACode];

        v76 = v205;
      }

      v86 = [v76 arrival];
      v87 = [v86 terminal];
      uint64_t v88 = [v87 length];

      v89 = [v76 arrival];
      v90 = [v89 gate];
      uint64_t v91 = [v90 length];

      v92 = NSString;
      if (v88)
      {
        if (v91)
        {
          v93 = accessibilityLocalizedString(@"flight.arrival.location.label");
          v94 = [v76 arrival];
          v95 = [v94 gate];
          v96 = [v76 arrival];
          v97 = [v96 terminal];
          uint64_t v83 = objc_msgSend(v92, "stringWithFormat:", v93, v95, v97, v82);

          v37 = v204;
LABEL_43:

LABEL_44:
LABEL_45:

          v183 = (void *)v83;
          [(UIAccessibilityFrameRecalculatingElement *)v201 setAccessibilityLabel:v83];
          v99 = accessibilityLocalizedString(@"flight.arrival.location.hint");
          [(UIAccessibilityFrameRecalculatingElement *)v201 setAccessibilityHint:v99];

          [v37 addObject:v201];
          v100 = (void *)[objc_alloc(*(Class *)(v81 + 1288)) initWithAccessibilityContainer:self];
          [v100 setAccessibilityTraits:v203];
          char v235 = 0;
          objc_opt_class();
          v101 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureTitle"];
          v102 = __UIAccessibilityCastAsClass();

          if (!v235)
          {
            char v235 = 0;
            objc_opt_class();
            v103 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureDate"];
            v104 = __UIAccessibilityCastAsClass();

            if (!v235)
            {
              v182 = v61;
              char v235 = 0;
              objc_opt_class();
              v200 = self;
              v105 = [(FUFlightInfoViewAccessibility *)self safeValueForKey:@"labelDepartureDelay"];
              v106 = __UIAccessibilityCastAsClass();

              if (!v235)
              {
                v217[0] = MEMORY[0x263EF8330];
                v217[1] = 3221225472;
                v217[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_5;
                v217[3] = &unk_265121628;
                id v107 = v102;
                id v218 = v107;
                id v180 = v104;
                id v219 = v180;
                id v108 = v106;
                id v220 = v108;
                v198 = v100;
                [v100 setCalculateFrame:v217];
                v109 = [v205 departure];
                v110 = [v109 time];
                v111 = [v110 date];
                v112 = [v205 departure];
                v113 = [v112 airport];
                v114 = [v113 timeZone];
                uint64_t v115 = AXDateStringForFormatWithTimeZone();

                uint64_t v116 = [v205 status];
                v117 = NSString;
                if (v116 == 6)
                {
                  v118 = accessibilityLocalizedString(@"flight.departure.schedule.cancel.label");
                  uint64_t v119 = objc_msgSend(v117, "stringWithFormat:", v118, v115);
                }
                else
                {
                  v118 = accessibilityLocalizedString(@"flight.departure.schedule.label");
                  v120 = [v107 text];
                  v121 = objc_msgSend(v117, "stringWithFormat:", v118, v120, v115);
                  v169 = [v108 text];
                  uint64_t v119 = __UIAXStringForVariables();
                }
                v178 = (void *)v115;
                v179 = v108;
                v181 = v107;

                v177 = (void *)v119;
                [v198 setAccessibilityLabel:v119];
                [v204 addObject:v198];
                v122 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:v200];
                [(UIAccessibilityFrameRecalculatingElement *)v122 setAccessibilityTraits:v203];
                char v235 = 0;
                objc_opt_class();
                v123 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelArrivalTitle"];
                v124 = __UIAccessibilityCastAsClass();

                if (!v235)
                {
                  char v235 = 0;
                  objc_opt_class();
                  v125 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelArrivalDate"];
                  v126 = __UIAccessibilityCastAsClass();

                  if (!v235)
                  {
                    char v235 = 0;
                    objc_opt_class();
                    v127 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelArrivalDelay"];
                    v128 = __UIAccessibilityCastAsClass();

                    if (!v235)
                    {
                      v213[0] = MEMORY[0x263EF8330];
                      v213[1] = 3221225472;
                      v213[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_6;
                      v213[3] = &unk_265121628;
                      id v129 = v124;
                      id v214 = v129;
                      id v175 = v126;
                      id v215 = v175;
                      id v130 = v128;
                      id v216 = v130;
                      v197 = v122;
                      [(UIAccessibilityFrameRecalculatingElement *)v122 setCalculateFrame:v213];
                      v131 = [v205 arrival];
                      v132 = [v131 time];
                      v133 = [v132 date];
                      v134 = [v205 arrival];
                      v135 = [v134 airport];
                      v136 = [v135 timeZone];
                      v137 = AXDateStringForFormatWithTimeZone();

                      uint64_t v138 = [v205 status];
                      v139 = NSString;
                      v176 = v129;
                      if (v138 == 6)
                      {
                        v140 = accessibilityLocalizedString(@"flight.arrival.schedule.cancel.label");
                        uint64_t v141 = objc_msgSend(v139, "stringWithFormat:", v140, v137);
                      }
                      else
                      {
                        v140 = accessibilityLocalizedString(@"flight.arrival.schedule.label");
                        v142 = [v129 text];
                        v143 = objc_msgSend(v139, "stringWithFormat:", v140, v142, v137);
                        v170 = [v130 text];
                        uint64_t v141 = __UIAXStringForVariables();
                      }
                      [(UIAccessibilityFrameRecalculatingElement *)v197 setAccessibilityLabel:v141];
                      [v204 addObject:v197];
                      v144 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:v200];
                      [(UIAccessibilityFrameRecalculatingElement *)v144 setAccessibilityTraits:v203];
                      char v235 = 0;
                      objc_opt_class();
                      v145 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelDurationTitle"];
                      v146 = __UIAccessibilityCastAsClass();

                      if (!v235)
                      {
                        v173 = (void *)v141;
                        v174 = v130;
                        char v235 = 0;
                        objc_opt_class();
                        v147 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelDurationValue"];
                        v148 = __UIAccessibilityCastAsClass();

                        if (!v235)
                        {
                          char v235 = 0;
                          objc_opt_class();
                          v149 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"labelDurationComplete"];
                          v150 = __UIAccessibilityCastAsClass();

                          if (!v235)
                          {
                            v209[0] = MEMORY[0x263EF8330];
                            v209[1] = 3221225472;
                            v209[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_7;
                            v209[3] = &unk_265121628;
                            id v172 = v146;
                            id v210 = v172;
                            id v171 = v148;
                            id v211 = v171;
                            id v151 = v150;
                            id v212 = v151;
                            [(UIAccessibilityFrameRecalculatingElement *)v144 setCalculateFrame:v209];
                            v152 = [v151 text];
                            v153 = v152;
                            id v3 = v204;
                            if (v152)
                            {
                              id v154 = v152;
                              v155 = v200;
                            }
                            else
                            {
                              v156 = NSString;
                              v157 = accessibilityLocalizedString(@"flight.duration.label");
                              v155 = v200;
                              v158 = [(FUFlightInfoViewAccessibility *)v200 safeValueForKey:@"leg"];
                              [v158 safeTimeIntervalForKey:@"duration"];
                              v159 = AXDurationStringForDuration();
                              objc_msgSend(v156, "stringWithFormat:", v157, v159);
                              id v154 = (id)objc_claimAutoreleasedReturnValue();

                              id v3 = v204;
                            }

                            [(UIAccessibilityFrameRecalculatingElement *)v144 setAccessibilityLabel:v154];
                            [v3 addObject:v144];
                            v160 = [[UIAccessibilityFrameRecalculatingElement alloc] initWithAccessibilityContainer:v155];
                            [(UIAccessibilityFrameRecalculatingElement *)v160 setAccessibilityTraits:v203];
                            char v235 = 0;
                            objc_opt_class();
                            v161 = [(FUFlightInfoViewAccessibility *)v155 safeValueForKey:@"labelBaggageClaimTitle"];
                            v162 = __UIAccessibilityCastAsClass();

                            if (!v235)
                            {
                              char v235 = 0;
                              objc_opt_class();
                              v163 = [(FUFlightInfoViewAccessibility *)v155 safeValueForKey:@"labelBaggageClaimValue"];
                              v164 = __UIAccessibilityCastAsClass();

                              if (!v235)
                              {
                                v206[0] = MEMORY[0x263EF8330];
                                v206[1] = 3221225472;
                                v206[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_8;
                                v206[3] = &unk_2651215D8;
                                id v207 = v162;
                                id v208 = v164;
                                id v165 = v164;
                                id v166 = v162;
                                [(UIAccessibilityFrameRecalculatingElement *)v160 setCalculateFrame:v206];
                                v167 = __UIAXStringForVariables();
                                [(UIAccessibilityFrameRecalculatingElement *)v160 setAccessibilityLabel:v167, v165, @"__AXStringForVariablesSentinel"];

                                [v3 addObject:v160];
                                [(FUFlightInfoViewAccessibility *)v155 _accessibilitySetRetainedValue:v3 forKey:*MEMORY[0x263F81490]];

                                goto LABEL_66;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_71:
          abort();
        }
        v93 = accessibilityLocalizedString(@"flight.arrival.location.label.nogate");
        v94 = [v76 arrival];
        uint64_t v98 = [v94 terminal];
      }
      else
      {
        if (!v91)
        {
          v93 = accessibilityLocalizedString(@"flight.arrival.location.label.noterminal");
          uint64_t v83 = objc_msgSend(v92, "stringWithFormat:", v93, v82);
          goto LABEL_44;
        }
        v93 = accessibilityLocalizedString(@"flight.arrival.location.label.noterminal.gate");
        v94 = [v76 arrival];
        uint64_t v98 = [v94 gate];
      }
      v95 = (void *)v98;
      uint64_t v83 = objc_msgSend(v92, "stringWithFormat:", v93, v98, v82);
      goto LABEL_43;
    }
    v38 = [v205 departure];
    v39 = [v38 airport];
    v40 = [v39 name];
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      v44 = [v205 departure];
      v45 = [v44 airport];
      id v42 = [v45 IATACode];

      v37 = v204;
    }

    v46 = [v205 departure];
    v47 = [v46 terminal];
    uint64_t v48 = [v47 length];

    v49 = [v205 departure];
    v50 = [v49 gate];
    uint64_t v51 = [v50 length];

    v52 = NSString;
    if (v48)
    {
      if (v51)
      {
        v53 = accessibilityLocalizedString(@"flight.departure.location.label");
        v54 = [v205 departure];
        v55 = [v54 gate];
        v56 = [v205 departure];
        v57 = [v56 terminal];
        uint64_t v43 = objc_msgSend(v52, "stringWithFormat:", v53, v55, v57, v42);

        v37 = v204;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v53 = accessibilityLocalizedString(@"flight.departure.location.label.nogate");
      v54 = [v205 departure];
      uint64_t v58 = [v54 terminal];
    }
    else
    {
      if (!v51)
      {
        v53 = accessibilityLocalizedString(@"flight.departure.location.label.noterminal");
        uint64_t v43 = objc_msgSend(v52, "stringWithFormat:", v53, v42);
        goto LABEL_25;
      }
      v53 = accessibilityLocalizedString(@"flight.departure.location.label.noterminal.gate");
      v54 = [v205 departure];
      uint64_t v58 = [v54 gate];
    }
    v55 = (void *)v58;
    uint64_t v43 = objc_msgSend(v52, "stringWithFormat:", v53, v58, v42);
    goto LABEL_24;
  }
LABEL_66:

  return v3;
}

double __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"labelAirlineName"];
  [v2 accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [*(id *)(a1 + 32) safeValueForKey:@"labelFlightCode"];
  [v11 accessibilityFrame];
  double v16 = UnionExcludingEmptyRects(v4, v6, v8, v10, v12, v13, v14, v15);

  return v16;
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [*(id *)(a1 + 40) accessibilityFrame];

  return UnionExcludingEmptyRects(v3, v5, v7, v9, v10, v11, v12, v13);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_3(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v37 = v3;
  CGFloat v38 = v2;
  CGFloat v35 = v5;
  CGFloat v36 = v4;
  [a1[5] accessibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [a1[6] accessibilityFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [a1[7] accessibilityFrame];
  CGFloat v26 = UnionExcludingEmptyRects(v15, v17, v19, v21, v22, v23, v24, v25);
  CGFloat v33 = UnionExcludingEmptyRects(v7, v9, v11, v13, v26, v27, v28, v29);

  return UnionExcludingEmptyRects(v38, v37, v36, v35, v33, v30, v31, v32);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_4(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v37 = v3;
  CGFloat v38 = v2;
  CGFloat v35 = v5;
  CGFloat v36 = v4;
  [a1[5] accessibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [a1[6] accessibilityFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [a1[7] accessibilityFrame];
  CGFloat v26 = UnionExcludingEmptyRects(v15, v17, v19, v21, v22, v23, v24, v25);
  CGFloat v33 = UnionExcludingEmptyRects(v7, v9, v11, v13, v26, v27, v28, v29);

  return UnionExcludingEmptyRects(v38, v37, v36, v35, v33, v30, v31, v32);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_5(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1[5] accessibilityFrame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a1[6] accessibilityFrame];
  CGFloat v25 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);

  return UnionExcludingEmptyRects(v3, v5, v7, v9, v25, v22, v23, v24);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_6(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1[5] accessibilityFrame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a1[6] accessibilityFrame];
  CGFloat v25 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);

  return UnionExcludingEmptyRects(v3, v5, v7, v9, v25, v22, v23, v24);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_7(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1[5] accessibilityFrame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a1[6] accessibilityFrame];
  CGFloat v25 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);

  return UnionExcludingEmptyRects(v3, v5, v7, v9, v25, v22, v23, v24);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [*(id *)(a1 + 40) accessibilityFrame];

  return UnionExcludingEmptyRects(v3, v5, v7, v9, v10, v11, v12, v13);
}

@end