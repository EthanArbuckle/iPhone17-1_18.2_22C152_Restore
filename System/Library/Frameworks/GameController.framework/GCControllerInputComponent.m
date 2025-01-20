@interface GCControllerInputComponent
@end

@implementation GCControllerInputComponent

id __101___GCControllerInputComponent_initWithIdentifier_templateFacadeParameters_templateElementParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass")), "initWithParameters:", v2);

  return v3;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke(uint64_t a1)
{
  v180 = objc_opt_new();
  uint64_t v176 = a1;
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 elementMappings];
    v4 = [v3 allValues];

    v249[0] = _NSConcreteStackBlock;
    v249[1] = 3221225472;
    v249[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2;
    v249[3] = &unk_26D22D008;
    v249[4] = *(void *)(v176 + 40);
    v5 = objc_msgSend(v4, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, v249);

    v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_96_1];

    v203 = objc_opt_new();
    v204 = objc_opt_new();
    long long v248 = 0u;
    long long v247 = 0u;
    long long v246 = 0u;
    long long v245 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v245 objects:v257 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v246;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v246 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v245 + 1) + 8 * i);
          v12 = [v11 elementKey];
          v13 = [v11 mappingKey];
          v14 = [v203 objectForKeyedSubscript:v12];
          v15 = v14;
          if (!v14) {
            v14 = &__NSArray0__struct;
          }
          v16 = [v14 arrayByAddingObject:v11];
          [v203 setObject:v16 forKeyedSubscript:v12];

          v17 = [v204 objectForKeyedSubscript:v13];
          v18 = v17;
          if (!v17) {
            v17 = &__NSArray0__struct;
          }
          v19 = [v17 arrayByAddingObject:v11];
          [v204 setObject:v19 forKeyedSubscript:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v245 objects:v257 count:16];
      }
      while (v8);
    }

    v206 = objc_opt_new();
    v205 = objc_opt_new();
    long long v244 = 0u;
    long long v243 = 0u;
    long long v242 = 0u;
    long long v241 = 0u;
    id v20 = *(id *)(*(void *)(v176 + 40) + 40);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v241 objects:v256 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v242;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v242 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v241 + 1) + 8 * j);
          v25 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v24);
          [v206 setObject:v24 forKey:v25];

          v26 = (void *)[v24 copy];
          v27 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v26);
          [v205 setObject:v26 forKey:v27];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v241 objects:v256 count:16];
      }
      while (v21);
    }

    long long v240 = 0u;
    long long v239 = 0u;
    long long v238 = 0u;
    long long v237 = 0u;
    obuint64_t j = v7;
    uint64_t v199 = [obj countByEnumeratingWithState:&v237 objects:v255 count:16];
    if (v199)
    {
      uint64_t v198 = *(void *)v238;
      do
      {
        for (uint64_t k = 0; k != v199; ++k)
        {
          if (*(void *)v238 != v198) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v237 + 1) + 8 * k);
          v30 = [v29 elementKey];
          v31 = [v206 objectForKeyedSubscript:v30];

          v32 = [v29 mappingKey];
          v207 = [v205 objectForKeyedSubscript:v32];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = v207;
                v200 = v31;
                v34 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v33);
                v35 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v200);
                char v36 = [v34 isEqualToString:v35];

                if ((v36 & 1) == 0)
                {
                  uint64_t v195 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventUpValueField]((uint64_t)v200);
                  uint64_t v193 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventRightValueField]((uint64_t)v200);
                  uint64_t v191 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventDownValueField]((uint64_t)v200);
                  uint64_t v189 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventLeftValueField]((uint64_t)v200);
                  uint64_t v187 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventUpValueField]((uint64_t)v33);
                  uint64_t v185 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventRightValueField]((uint64_t)v33);
                  uint64_t v183 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventDownValueField]((uint64_t)v33);
                  uint64_t v181 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventLeftValueField]((uint64_t)v33);
                  v37 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v200);
                  v38 = [v204 objectForKey:v37];
                  v39 = +[NSPredicate predicateWithBlock:&__block_literal_global_104_0];
                  v40 = [v38 filteredArrayUsingPredicate:v39];
                  BOOL v179 = [v40 count] != 0;

                  v41 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v33);
                  v42 = [v203 objectForKey:v41];
                  LODWORD(v38) = [v42 count] == 0;

                  if (v38)
                  {
                    v108 = -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v33);
                    v109 = -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v200);
                    v110 = [v108 setByAddingObjectsFromSet:v109];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setXySources:](v33, v110);

                    v111 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v33);
                    v112 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v200);
                    v113 = [v111 setByAddingObjectsFromSet:v112];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setXSources:](v33, v113);

                    v114 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v33);
                    v115 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v200);
                    v116 = [v114 setByAddingObjectsFromSet:v115];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setYSources:](v33, v116);

                    v117 = -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v33);
                    v118 = -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v200);
                    v119 = [v117 setByAddingObjectsFromSet:v118];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setUpSources:](v33, v119);

                    v120 = -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v33);
                    v121 = -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v200);
                    v122 = [v120 setByAddingObjectsFromSet:v121];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setRightSources:](v33, v122);

                    v123 = -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v33);
                    v124 = -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v200);
                    v125 = [v123 setByAddingObjectsFromSet:v124];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setDownSources:](v33, v125);

                    v126 = -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v33);
                    v127 = -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v200);
                    v128 = [v126 setByAddingObjectsFromSet:v127];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setLeftSources:](v33, v128);

                    v236[0] = _NSConcreteStackBlock;
                    v236[1] = 3221225472;
                    v236[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3;
                    v236[3] = &__block_descriptor_97_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
                    v236[4] = v187;
                    v236[5] = v195;
                    v236[6] = v185;
                    v236[7] = v193;
                    v236[8] = v183;
                    v236[9] = v191;
                    v60 = v236;
                    v236[10] = v181;
                    v236[11] = v189;
                  }
                  else
                  {
                    v178 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v33);
                    v43 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v33);
                    v44 = [v206 objectForKeyedSubscript:v43];
                    v45 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v44);
                    if ([v178 isEqual:v45])
                    {
                      v46 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v33);
                      v47 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v33);
                      v48 = [v206 objectForKeyedSubscript:v47];
                      v49 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v48);
                      int v177 = [v46 isEqual:v49];

                      if (v177)
                      {
                        -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v200);
                        v50 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v33, v50);

                        -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v200);
                        v51 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputElementParameters setSymbol:](v33, v51);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v200);
                        v52 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setXySources:](v33, v52);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v200);
                        v53 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setXSources:](v33, v53);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v200);
                        v54 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setYSources:](v33, v54);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v200);
                        v55 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setUpSources:](v33, v55);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v200);
                        v56 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setRightSources:](v33, v56);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v200);
                        v57 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setDownSources:](v33, v57);

                        -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v200);
                        v58 = (char *)objc_claimAutoreleasedReturnValue();
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setLeftSources:](v33, v58);

                        char v59 = -[_GCDevicePhysicalInputDirectionPadElementParameters isAnalog]((BOOL)v200);
                        -[_GCDevicePhysicalInputDirectionPadElementParameters setAnalog:]((uint64_t)v33, v59);
                        v235[0] = _NSConcreteStackBlock;
                        v235[1] = 3221225472;
                        v235[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_4;
                        v235[3] = &__block_descriptor_97_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
                        v235[4] = v195;
                        v235[5] = v187;
                        v235[6] = v193;
                        v235[7] = v185;
                        v235[8] = v191;
                        v235[9] = v183;
                        v60 = v235;
                        v235[10] = v189;
                        v235[11] = v181;
                        goto LABEL_59;
                      }
                    }
                    else
                    {
                    }
                    v129 = -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v33);
                    v130 = -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v200);
                    v131 = [v129 setByAddingObjectsFromSet:v130];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setXySources:](v33, v131);

                    v132 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v33);
                    v133 = -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v200);
                    v134 = [v132 setByAddingObjectsFromSet:v133];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setXSources:](v33, v134);

                    v135 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v33);
                    v136 = -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v200);
                    v137 = [v135 setByAddingObjectsFromSet:v136];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setYSources:](v33, v137);

                    v138 = -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v33);
                    v139 = -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v200);
                    v140 = [v138 setByAddingObjectsFromSet:v139];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setUpSources:](v33, v140);

                    v141 = -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v33);
                    v142 = -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v200);
                    v143 = [v141 setByAddingObjectsFromSet:v142];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setRightSources:](v33, v143);

                    v144 = -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v33);
                    v145 = -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v200);
                    v146 = [v144 setByAddingObjectsFromSet:v145];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setDownSources:](v33, v146);

                    v147 = -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v33);
                    v148 = -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v200);
                    v149 = [v147 setByAddingObjectsFromSet:v148];
                    -[_GCDevicePhysicalInputDirectionPadElementParameters setLeftSources:](v33, v149);

                    v234[0] = _NSConcreteStackBlock;
                    v234[1] = 3221225472;
                    v234[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_5;
                    v234[3] = &__block_descriptor_97_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
                    v234[4] = v187;
                    v234[5] = v195;
                    v234[6] = v185;
                    v234[7] = v193;
                    v234[8] = v183;
                    v234[9] = v191;
                    v60 = v234;
                    v234[10] = v181;
                    v234[11] = v189;
                  }
LABEL_59:
                  *((unsigned char *)v60 + 96) = v179;
                  v150 = (void *)[v60 copy];
                  v151 = (void *)MEMORY[0x223C6E420]();
                  [v180 addObject:v151];
                }
                goto LABEL_61;
              }
            }
            v33 = _gc_log_device_physicalinput();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v252 = v31;
              __int16 v253 = 2112;
              v254 = v207;
              v69 = v33;
              v70 = "#WARNING Can not implement dpad remapping from '%@' -> '%@'.";
LABEL_38:
              _os_log_debug_impl(&dword_220998000, v69, OS_LOG_TYPE_DEBUG, v70, buf, 0x16u);
            }
          }
          else
          {
            v61 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v207);
            v62 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v31);
            char v63 = [v61 isEqualToString:v62];

            if (v63) {
              goto LABEL_62;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v64 = v31;
              v33 = -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v64);
              v196 = -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v64);
              BOOL v182 = -[_GCDevicePhysicalInputButtonElementParameters isAnalog]((BOOL)v64);
              double v65 = -[_GCDevicePhysicalInputButtonElementParameters pressedThreshold]((uint64_t)v64);
              float v66 = *(float *)&v65;
              -[_GCDevicePhysicalInputButtonElementParameters sources](v64);
              id v201 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v192 = -[_GCDevicePhysicalInputButtonElementParameters eventPressedValueField]((uint64_t)v64);
              v67 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v64);

              v68 = [v204 objectForKey:v67];
              uint64_t v190 = [v68 count];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v33 = _gc_log_device_physicalinput();
                if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_61;
                }
                *(_DWORD *)buf = 138412546;
                v252 = v31;
                __int16 v253 = 2112;
                v254 = v207;
                v69 = v33;
                v70 = "#WARNING Can not implement remapping from unknown '%@' -> '%@'.";
                goto LABEL_38;
              }
              v71 = v31;
              v72 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v71);
              v73 = [v72 anyObject];
              v33 = [v73 elementLocalizedName];

              v74 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v71);
              v75 = [v74 anyObject];
              v196 = [v75 symbol];

              -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v71);
              id v201 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v192 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters eventPressedValueField]((uint64_t)v71);
              v67 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v71);
              v68 = [v204 objectForKey:v67];
              v76 = +[NSPredicate predicateWithBlock:&__block_literal_global_110];

              v77 = [v68 filteredArrayUsingPredicate:v76];
              uint64_t v190 = [v77 count];

              BOOL v182 = 0;
              float v66 = 0.0;
            }

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v78 = v207;
              v194 = -[_GCDevicePhysicalInputButtonElementParameters sources](v78);
              uint64_t v184 = -[_GCDevicePhysicalInputButtonElementParameters eventPressedValueField]((uint64_t)v78);
              v79 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v78);
              v80 = [v203 objectForKey:v79];
              uint64_t v81 = [v80 count];

              v232[0] = _NSConcreteStackBlock;
              v232[1] = 3221225472;
              v232[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_111;
              v232[3] = &unk_26D22D070;
              v82 = v78;
              v233 = v82;
              v83 = (void (**)(void, void))MEMORY[0x223C6E420](v232);
              v230[0] = _NSConcreteStackBlock;
              v230[1] = 3221225472;
              v230[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_113;
              v230[3] = &unk_26D22D098;
              v84 = v82;
              id v231 = v84;
              v186 = (void (**)(void *, NSObject *))MEMORY[0x223C6E420](v230);
              v228[0] = _NSConcreteStackBlock;
              v228[1] = 3221225472;
              v228[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3_115;
              v228[3] = &unk_26D22D0C0;
              v85 = v84;
              id v229 = v85;
              v188 = (void (**)(void *, void *))MEMORY[0x223C6E420](v228);
              v226[0] = _NSConcreteStackBlock;
              v226[1] = 3221225472;
              v226[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_4_117;
              v226[3] = &unk_26D22B0D0;
              v86 = v85;
              id v227 = v86;
              v87 = (void (**)(void *, void))MEMORY[0x223C6E420](v226);
              v224[0] = _NSConcreteStackBlock;
              v224[1] = 3221225472;
              v224[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_5_119;
              v224[3] = &unk_26D22D0E8;
              v88 = v86;
              id v225 = v88;
              v89 = (void (**)(void, float))MEMORY[0x223C6E420](v224);
              v221[0] = _NSConcreteStackBlock;
              v221[1] = 3221225472;
              v221[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_6;
              v221[3] = &unk_26D22D110;
              id v222 = v88;
              id v223 = v206;
              v90 = v88;
              v91 = (unsigned int (**)(void))MEMORY[0x223C6E420](v221);

              v92 = &v229;
              v93 = &v231;
              v94 = (id *)&v233;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v104 = _gc_log_device_physicalinput();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v252 = v31;
                  __int16 v253 = 2112;
                  v254 = v207;
                  _os_log_debug_impl(&dword_220998000, v104, OS_LOG_TYPE_DEBUG, "#WARNING Can not implement remapping from '%@' -> unknown '%@'.", buf, 0x16u);
                }

                goto LABEL_61;
              }
              v95 = v207;
              v194 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v95);
              uint64_t v184 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters eventPressedValueField]((uint64_t)v95);
              v96 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v95);
              v97 = [v203 objectForKey:v96];
              v98 = +[NSPredicate predicateWithBlock:&__block_literal_global_124_0];
              v99 = [v97 filteredArrayUsingPredicate:v98];
              uint64_t v81 = [v99 count];

              v219[0] = _NSConcreteStackBlock;
              v219[1] = 3221225472;
              v219[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_8;
              v219[3] = &unk_26D22D070;
              v100 = v95;
              v220 = v100;
              v83 = (void (**)(void, void))MEMORY[0x223C6E420](v219);
              v216[0] = _NSConcreteStackBlock;
              v216[1] = 3221225472;
              v216[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_13;
              v216[3] = &unk_26D22D110;
              v217 = v100;
              id v218 = v206;
              v101 = v100;
              v91 = (unsigned int (**)(void))MEMORY[0x223C6E420](v216);
              v92 = &v218;
              v93 = (id *)&v217;
              v94 = (id *)&v220;
              v186 = (void (**)(void *, NSObject *))&__block_literal_global_126_0;
              v188 = (void (**)(void *, void *))&__block_literal_global_128_0;
              v87 = (void (**)(void *, void))&__block_literal_global_130;
              v89 = (void (**)(void, float))&__block_literal_global_132_1;
            }

            if (v81)
            {
              if (v91[2](v91))
              {
                v186[2](v186, v33);
                v188[2](v188, v196);
                ((void (**)(void, id))v83)[2](v83, v201);
                ((void (**)(void *, BOOL))v87)[2](v87, v182);
                v89[2](v89, v66);
                v214[0] = _NSConcreteStackBlock;
                v214[1] = 3221225472;
                v214[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_135;
                v214[3] = &__block_descriptor_49_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
                v214[4] = v192;
                v214[5] = v184;
                v102 = v214;
              }
              else
              {
                v105 = [v194 setByAddingObjectsFromSet:v201];
                ((void (**)(void, void *))v83)[2](v83, v105);

                v213[0] = _NSConcreteStackBlock;
                v213[1] = 3221225472;
                v213[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3_136;
                v213[3] = &__block_descriptor_49_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
                v213[4] = v184;
                v213[5] = v192;
                v102 = v213;
              }
            }
            else
            {
              v103 = [v194 setByAddingObjectsFromSet:v201];
              ((void (**)(void, void *))v83)[2](v83, v103);

              v215[0] = _NSConcreteStackBlock;
              v215[1] = 3221225472;
              v215[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke_133;
              v215[3] = &__block_descriptor_49_e51_v24__0____GCGamepadEvent__8___GCGamepadEventImpl_16l;
              v215[4] = v184;
              v215[5] = v192;
              v102 = v215;
            }
            *((unsigned char *)v102 + 48) = v190 != 0;
            v106 = (void *)[v102 copy];
            v107 = (void *)MEMORY[0x223C6E420]();
            [v180 addObject:v107];
          }
LABEL_61:

LABEL_62:
        }
        uint64_t v199 = [obj countByEnumeratingWithState:&v237 objects:v255 count:16];
      }
      while (v199);
    }

    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    id v202 = obj;
    uint64_t v152 = [v202 countByEnumeratingWithState:&v209 objects:v250 count:16];
    if (v152)
    {
      uint64_t v208 = *(void *)v210;
      do
      {
        for (uint64_t m = 0; m != v152; ++m)
        {
          if (*(void *)v210 != v208) {
            objc_enumerationMutation(v202);
          }
          v154 = *(void **)(*((void *)&v209 + 1) + 8 * m);
          v155 = [v154 elementKey];
          v156 = [v206 objectForKeyedSubscript:v155];

          v157 = [v154 mappingKey];
          v158 = [v205 objectForKeyedSubscript:v157];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v159 = v158;
                id v160 = v154;
                if ([v160 invertHorizontally])
                {
                  uint64_t v161 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventRightValueField]((uint64_t)v159);
                  uint64_t v162 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventLeftValueField]((uint64_t)v159);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventLeftValueField:]((uint64_t)v159, v161);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventRightValueField:]((uint64_t)v159, v162);
                }
                if ([v160 invertVertically])
                {
                  uint64_t v163 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventUpValueField]((uint64_t)v159);
                  uint64_t v164 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventDownValueField]((uint64_t)v159);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventUpValueField:]((uint64_t)v159, v164);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventDownValueField:]((uint64_t)v159, v163);
                }
                if ([v160 swapAxes])
                {
                  uint64_t v165 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventUpValueField]((uint64_t)v159);
                  uint64_t v166 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventRightValueField]((uint64_t)v159);
                  uint64_t v167 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventDownValueField]((uint64_t)v159);
                  uint64_t v168 = -[_GCDevicePhysicalInputDirectionPadElementParameters eventLeftValueField]((uint64_t)v159);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventLeftValueField:]((uint64_t)v159, v167);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventRightValueField:]((uint64_t)v159, v165);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventUpValueField:]((uint64_t)v159, v166);
                  -[_GCDevicePhysicalInputDirectionPadElementParameters setEventDownValueField:]((uint64_t)v159, v168);
                }
              }
            }
          }
        }
        uint64_t v152 = [v202 countByEnumeratingWithState:&v209 objects:v250 count:16];
      }
      while (v152);
    }

    v169 = [v205 allValues];
  }
  else
  {
    v169 = 0;
  }
  v170 = objc_msgSend(v169, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_139);
  v171 = +[NSSet setWithArray:v170];

  id v172 = *(id *)(v176 + 40);
  objc_sync_enter(v172);
  objc_storeStrong((id *)(*(void *)(v176 + 40) + 48), *(id *)(v176 + 32));
  uint64_t v173 = [v180 copy];
  uint64_t v174 = *(void *)(v176 + 40);
  v175 = *(void **)(v174 + 56);
  *(void *)(v174 + 56) = v173;

  -[_GCDevicePhysicalInput updateWithElements:](*(_GCDevicePhysicalInput **)(v176 + 48), v171);
  objc_sync_exit(v172);
}

id __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v22 = [v3 elementKey];
  v4 = [v3 mappingKey];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {

    uint64_t v9 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v21 = v3;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      v13 = -[_GCDevicePhysicalInputElementParameters aliases](v12);
      int v14 = [v13 containsObject:v22];

      if (v14)
      {
        uint64_t v15 = -[_GCDevicePhysicalInputElementParameters identifier](v12);

        uint64_t v9 = (void *)v15;
      }
      v16 = -[_GCDevicePhysicalInputElementParameters aliases](v12);
      int v17 = [v16 containsObject:v4];

      if (v17)
      {
        uint64_t v18 = -[_GCDevicePhysicalInputElementParameters identifier](v12);

        uint64_t v8 = v18;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v7);

  if (!v9)
  {
    uint64_t v9 = v8;
    id v3 = v21;
LABEL_17:
    uint64_t v8 = _gc_log_device_physicalinput();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_cold_1();
    }
    goto LABEL_19;
  }
  id v3 = v21;
  if (v8)
  {
    v19 = (void *)[v21 copy];
    [v19 setElementKey:v9];
    [v19 setMappingKey:v8];
    goto LABEL_20;
  }
  uint64_t v8 = _gc_log_device_physicalinput();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_cold_2();
  }
LABEL_19:
  v19 = 0;
LABEL_20:

  return v19;
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 remappingOrder];
  if (v6 <= (int)[v5 remappingOrder])
  {
    int v8 = [v4 remappingOrder];
    uint64_t v7 = v8 < (int)[v5 remappingOrder];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_101(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v21 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v21 floatValueForElement:v5];
  float v8 = v7;
  [v6 floatValueForElement:*(void *)(a1 + 40)];
  if (v8 >= *(float *)&v9) {
    *(float *)&double v9 = v8;
  }
  [v21 setFloatValue:*(void *)(a1 + 32) forElement:v9];
  [v21 floatValueForElement:*(void *)(a1 + 48)];
  float v11 = v10;
  [v6 floatValueForElement:*(void *)(a1 + 56)];
  if (v11 >= *(float *)&v12) {
    *(float *)&double v12 = v11;
  }
  [v21 setFloatValue:*(void *)(a1 + 48) forElement:v12];
  [v21 floatValueForElement:*(void *)(a1 + 64)];
  float v14 = v13;
  [v6 floatValueForElement:*(void *)(a1 + 72)];
  if (v14 >= *(float *)&v15) {
    *(float *)&double v15 = v14;
  }
  [v21 setFloatValue:*(void *)(a1 + 64) forElement:v15];
  [v21 floatValueForElement:*(void *)(a1 + 80)];
  float v17 = v16;
  [v6 floatValueForElement:*(void *)(a1 + 88)];
  float v19 = v18;

  if (v17 >= v19) {
    *(float *)&double v20 = v17;
  }
  else {
    *(float *)&double v20 = v19;
  }
  [v21 setFloatValue:*(void *)(a1 + 80) forElement:v20];
  if (!*(unsigned char *)(a1 + 96))
  {
    [v21 setFloatValue:*(void *)(a1 + 40) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 56) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 72) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 88) forElement:0.0];
  }
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 floatValueForElement:v5];
  objc_msgSend(v10, "setFloatValue:forElement:", *(void *)(a1 + 40));
  [v6 floatValueForElement:*(void *)(a1 + 48)];
  objc_msgSend(v10, "setFloatValue:forElement:", *(void *)(a1 + 56));
  [v6 floatValueForElement:*(void *)(a1 + 64)];
  objc_msgSend(v10, "setFloatValue:forElement:", *(void *)(a1 + 72));
  [v6 floatValueForElement:*(void *)(a1 + 80)];
  int v8 = v7;

  LODWORD(v9) = v8;
  [v10 setFloatValue:*(void *)(a1 + 88) forElement:v9];
  if (!*(unsigned char *)(a1 + 96))
  {
    [v10 setFloatValue:*(void *)(a1 + 32) forElement:0.0];
    [v10 setFloatValue:*(void *)(a1 + 48) forElement:0.0];
    [v10 setFloatValue:*(void *)(a1 + 64) forElement:0.0];
    [v10 setFloatValue:*(void *)(a1 + 80) forElement:0.0];
  }
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v21 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v21 floatValueForElement:v5];
  float v8 = v7;
  [v6 floatValueForElement:*(void *)(a1 + 40)];
  if (v8 >= *(float *)&v9) {
    *(float *)&double v9 = v8;
  }
  [v21 setFloatValue:*(void *)(a1 + 32) forElement:v9];
  [v21 floatValueForElement:*(void *)(a1 + 48)];
  float v11 = v10;
  [v6 floatValueForElement:*(void *)(a1 + 56)];
  if (v11 >= *(float *)&v12) {
    *(float *)&double v12 = v11;
  }
  [v21 setFloatValue:*(void *)(a1 + 48) forElement:v12];
  [v21 floatValueForElement:*(void *)(a1 + 64)];
  float v14 = v13;
  [v6 floatValueForElement:*(void *)(a1 + 72)];
  if (v14 >= *(float *)&v15) {
    *(float *)&double v15 = v14;
  }
  [v21 setFloatValue:*(void *)(a1 + 64) forElement:v15];
  [v21 floatValueForElement:*(void *)(a1 + 80)];
  float v17 = v16;
  [v6 floatValueForElement:*(void *)(a1 + 88)];
  float v19 = v18;

  if (v17 >= v19) {
    *(float *)&double v20 = v17;
  }
  else {
    *(float *)&double v20 = v19;
  }
  [v21 setFloatValue:*(void *)(a1 + 80) forElement:v20];
  if (!*(unsigned char *)(a1 + 96))
  {
    [v21 setFloatValue:*(void *)(a1 + 40) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 56) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 72) forElement:0.0];
    [v21 setFloatValue:*(void *)(a1 + 88) forElement:0.0];
  }
}

BOOL __50___GCControllerInputComponent_setSettingsProfile___block_invoke_108(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_111(uint64_t a1, char *a2)
{
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_113(uint64_t a1, char *a2)
{
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3_115(uint64_t a1, char *a2)
{
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_4_117(uint64_t a1, char a2)
{
  return -[_GCDevicePhysicalInputButtonElementParameters setAnalog:](*(void *)(a1 + 32), a2);
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_5_119(uint64_t a1, float a2)
{
  return -[_GCDevicePhysicalInputButtonElementParameters setPressedThreshold:](*(void *)(a1 + 32), a2);
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v3 = -[_GCDevicePhysicalInputElementParameters identifier]((uint64_t)v1);
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v1 isEqual:v4];

  return v5;
}

BOOL __50___GCControllerInputComponent_setSettingsProfile___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_8(uint64_t a1, char *a2)
{
}

uint64_t __50___GCControllerInputComponent_setSettingsProfile___block_invoke_13(uint64_t a1)
{
  id v2 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](*(void **)(a1 + 32));
  id v3 = *(void **)(a1 + 40);
  id v4 = -[_GCDevicePhysicalInputElementParameters identifier](*(void *)(a1 + 32));
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v5);
  uint64_t v7 = [v2 isEqual:v6];

  return v7;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v12 floatValueForElement:v5];
  float v8 = v7;
  [v6 floatValueForElement:*(void *)(a1 + 40)];
  float v10 = v9;

  if (v8 >= v10) {
    *(float *)&double v11 = v8;
  }
  else {
    *(float *)&double v11 = v10;
  }
  [v12 setFloatValue:*(void *)(a1 + 32) forElement:v11];
  if (!*(unsigned char *)(a1 + 48)) {
    [v12 setFloatValue:*(void *)(a1 + 40) forElement:0.0];
  }
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_135(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 floatValueForElement:*(void *)(a1 + 32)];
  objc_msgSend(v5, "setFloatValue:forElement:", *(void *)(a1 + 40));
  if (!*(unsigned char *)(a1 + 48)) {
    [v5 setFloatValue:*(void *)(a1 + 32) forElement:0.0];
  }
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_3_136(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v12 floatValueForElement:v5];
  float v8 = v7;
  [v6 floatValueForElement:*(void *)(a1 + 40)];
  float v10 = v9;

  if (v8 >= v10) {
    *(float *)&double v11 = v8;
  }
  else {
    *(float *)&double v11 = v10;
  }
  [v12 setFloatValue:*(void *)(a1 + 32) forElement:v11];
  if (!*(unsigned char *)(a1 + 48)) {
    [v12 setFloatValue:*(void *)(a1 + 40) forElement:0.0];
  }
}

id __50___GCControllerInputComponent_setSettingsProfile___block_invoke_4_137(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass")), "initWithParameters:", v2);

  return v3;
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_26();
  OUTLINED_FUNCTION_1_22(&dword_220998000, v0, v1, "Ignoring mapping %@.  No element for source alias '%{public}@'.");
}

void __50___GCControllerInputComponent_setSettingsProfile___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0_26();
  OUTLINED_FUNCTION_1_22(&dword_220998000, v0, v1, "Ignoring mapping %@.  No element for destination alias '%{public}@'.");
}

@end