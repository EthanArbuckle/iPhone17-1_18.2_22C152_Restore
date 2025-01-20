@interface CHGrammar
- (CHGrammar)initWithFile:(id)a3;
- (NSCharacterSet)characterSet;
- (NSSet)nonTerminals;
- (NSSet)terminals;
- (NSString)file;
- (id)description;
- (id)getProductionRuleByKey:(id)a3;
- (id)nonTerminalProductions;
- (id)terminalProductions;
- (id)terminalst;
@end

@implementation CHGrammar

- (CHGrammar)initWithFile:(id)a3
{
  uint64_t v415 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13 = (CHGrammar *)objc_msgSend_init(self, v6, v7, v8, v9, v10);
  if (v13)
  {
    id v408 = 0;
    v14 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v11, (uint64_t)v5, 4, (uint64_t)&v408, v12);
    id v15 = v408;
    if (v15)
    {
      v16 = v15;
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v17 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v414 = v16;
        _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_ERROR, "Error while reading the grammar file:\n %@", buf, 0xCu);
      }
    }
    else
    {
      id v391 = v5;
      objc_storeStrong((id *)&v13->_file, a3);
      uint64_t v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21, v22);
      terminalProductions = v13->_terminalProductions;
      v13->_terminalProductions = (NSMutableArray *)v23;

      uint64_t v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
      nonTerminalProductions = v13->_nonTerminalProductions;
      v13->_nonTerminalProductions = (NSMutableArray *)v30;

      uint64_t v37 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v32, v33, v34, v35, v36);
      productionsByKey = v13->_productionsByKey;
      v13->_productionsByKey = (NSMutableDictionary *)v37;

      v392 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v39, v40, v41, v42, v43);
      unint64_t v44 = 0x1E4F28000uLL;
      v50 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], v45, v46, v47, v48, v49);
      v390 = v14;
      v17 = objc_msgSend_componentsSeparatedByCharactersInSet_(v14, v51, (uint64_t)v50, v52, v53, v54);

      if (objc_msgSend_count(v17, v55, v56, v57, v58, v59))
      {
        uint64_t v65 = 0;
        v393 = v17;
        objc_msgSend_objectAtIndexedSubscript_(v17, v60, 0, v62, v63, v64);
        while (1)
          v102 = {;
          v108 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v103, v104, v105, v106, v107);
          v113 = objc_msgSend_stringByTrimmingCharactersInSet_(v102, v109, (uint64_t)v108, v110, v111, v112);

          if (objc_msgSend_length(v113, v114, v115, v116, v117, v118))
          {
            v124 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v119, v120, v121, v122, v123);
            v129 = objc_msgSend_stringByTrimmingCharactersInSet_(v113, v125, (uint64_t)v124, v126, v127, v128);
            char hasPrefix = objc_msgSend_hasPrefix_(v129, v130, @"//", v131, v132, v133);

            if ((hasPrefix & 1) == 0)
            {
              v139 = objc_msgSend_componentsSeparatedByString_(v113, v135, @"->", v136, v137, v138);
              v144 = objc_msgSend_objectAtIndexedSubscript_(v139, v140, 0, v141, v142, v143);
              v150 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v145, v146, v147, v148, v149);
              v155 = objc_msgSend_stringByTrimmingCharactersInSet_(v144, v151, (uint64_t)v150, v152, v153, v154);

              v394 = v139;
              v160 = objc_msgSend_objectAtIndexedSubscript_(v139, v156, 1, v157, v158, v159);
              v166 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v161, v162, v163, v164, v165);
              v171 = objc_msgSend_stringByTrimmingCharactersInSet_(v160, v167, (uint64_t)v166, v168, v169, v170);

              v176 = objc_msgSend_componentsSeparatedByString_(v171, v172, @"%|", v173, v174, v175);
              v181 = objc_msgSend_objectAtIndexedSubscript_(v176, v177, 0, v178, v179, v180);
              v187 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v182, v183, v184, v185, v186);
              v192 = objc_msgSend_stringByTrimmingCharactersInSet_(v181, v188, (uint64_t)v187, v189, v190, v191);

              v198 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v193, v194, v195, v196, v197);
              v395 = v192;
              v203 = objc_msgSend_componentsSeparatedByCharactersInSet_(v192, v199, (uint64_t)v198, v200, v201, v202);

              double v214 = 1.0;
              if ((unint64_t)objc_msgSend_count(v176, v204, v205, v206, v207, v208) >= 2)
              {
                v215 = objc_msgSend_objectAtIndexedSubscript_(v176, v209, 1, v211, v212, v213);
                v221 = objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 2952), v216, v217, v218, v219, v220);
                v226 = objc_msgSend_stringByTrimmingCharactersInSet_(v215, v222, (uint64_t)v221, v223, v224, v225);

                objc_msgSend_doubleValue(v226, v227, v228, v229, v230, v231);
                double v214 = v232;

                unint64_t v44 = 0x1E4F28000;
              }
              if (objc_msgSend_count(v203, v209, v210, v211, v212, v213) == 1)
              {
                v66 = [CHProductionRule alloc];
                v71 = objc_msgSend_objectAtIndexedSubscript_(v203, v67, 0, v68, v69, v70);
                v75 = objc_msgSend_initWithLeftNode_rightNode_probability_(v66, v72, (uint64_t)v155, (uint64_t)v71, v73, v74, v214);

                v81 = objc_msgSend_key(v75, v76, v77, v78, v79, v80);
                v86 = objc_msgSend_objectForKeyedSubscript_(v13->_productionsByKey, v82, (uint64_t)v81, v83, v84, v85);

                if (!v86)
                {
                  objc_msgSend_setObject_forKeyedSubscript_(v13->_productionsByKey, v87, (uint64_t)v75, (uint64_t)v81, v89, v90);
                  objc_msgSend_addObject_(v13->_terminalProductions, v269, (uint64_t)v75, v270, v271, v272);
                }
                v91 = objc_msgSend_objectAtIndexedSubscript_(v203, v87, 0, v88, v89, v90);
                objc_msgSend_addObject_(v392, v92, (uint64_t)v91, v93, v94, v95);

                v17 = v393;
                v96 = v394;
                unint64_t v44 = 0x1E4F28000uLL;
              }
              else if (objc_msgSend_count(v203, v233, v234, v235, v236, v237) == 2)
              {
                v238 = [CHProductionRule alloc];
                v243 = objc_msgSend_objectAtIndexedSubscript_(v203, v239, 0, v240, v241, v242);
                v248 = objc_msgSend_objectAtIndexedSubscript_(v203, v244, 1, v245, v246, v247);
                v75 = objc_msgSend_initWithLeftNode_rightNode1_rightNode2_probability_(v238, v249, (uint64_t)v155, (uint64_t)v243, (uint64_t)v248, v250, v214);

                v256 = objc_msgSend_key(v75, v251, v252, v253, v254, v255);
                v261 = objc_msgSend_objectForKeyedSubscript_(v13->_productionsByKey, v257, (uint64_t)v256, v258, v259, v260);

                if (!v261)
                {
                  objc_msgSend_setObject_forKeyedSubscript_(v13->_productionsByKey, v262, (uint64_t)v75, (uint64_t)v256, v263, v264);
                  objc_msgSend_addObject_(v13->_nonTerminalProductions, v265, (uint64_t)v75, v266, v267, v268);
                }

                v17 = v393;
                v96 = v394;
                unint64_t v44 = 0x1E4F28000;
              }
              else
              {
                v17 = v393;
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v96 = v394;
                v75 = (id)qword_1EA3C9F98;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C492D000, v75, OS_LOG_TYPE_ERROR, "Error: Unexpected number of elements on the right side of a production rule.", buf, 2u);
                }
              }
            }
          }

          if (++v65 >= (unint64_t)objc_msgSend_count(v17, v97, v98, v99, v100, v101)) {
            break;
          }
          objc_msgSend_objectAtIndexedSubscript_(v17, v60, v65, v62, v63, v64);
        }
      }
      uint64_t v273 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v60, v61, v62, v63, v64);
      nonTerminals = v13->_nonTerminals;
      v13->_nonTerminals = (NSMutableSet *)v273;

      long long v406 = 0u;
      long long v407 = 0u;
      long long v404 = 0u;
      long long v405 = 0u;
      v275 = v13->_nonTerminalProductions;
      uint64_t v278 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v276, (uint64_t)&v404, (uint64_t)v412, 16, v277);
      if (v278)
      {
        uint64_t v284 = v278;
        uint64_t v285 = *(void *)v405;
        do
        {
          for (uint64_t i = 0; i != v284; ++i)
          {
            if (*(void *)v405 != v285) {
              objc_enumerationMutation(v275);
            }
            v287 = *(void **)(*((void *)&v404 + 1) + 8 * i);
            v288 = v13->_nonTerminals;
            v289 = objc_msgSend_leftNode(v287, v279, v280, v281, v282, v283);
            objc_msgSend_addObject_(v288, v290, (uint64_t)v289, v291, v292, v293);

            v294 = v13->_nonTerminals;
            v300 = objc_msgSend_rightNode1(v287, v295, v296, v297, v298, v299);
            objc_msgSend_addObject_(v294, v301, (uint64_t)v300, v302, v303, v304);

            v305 = v13->_nonTerminals;
            v311 = objc_msgSend_rightNode2(v287, v306, v307, v308, v309, v310);
            objc_msgSend_addObject_(v305, v312, (uint64_t)v311, v313, v314, v315);
          }
          uint64_t v284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v279, (uint64_t)&v404, (uint64_t)v412, 16, v283);
        }
        while (v284);
      }

      uint64_t v321 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v316, v317, v318, v319, v320);
      terminals = v13->_terminals;
      v13->_terminals = (NSMutableSet *)v321;

      long long v402 = 0u;
      long long v403 = 0u;
      long long v400 = 0u;
      long long v401 = 0u;
      v323 = v13->_terminalProductions;
      uint64_t v326 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v324, (uint64_t)&v400, (uint64_t)v411, 16, v325);
      v14 = v392;
      if (v326)
      {
        uint64_t v332 = v326;
        uint64_t v333 = *(void *)v401;
        do
        {
          for (uint64_t j = 0; j != v332; ++j)
          {
            if (*(void *)v401 != v333) {
              objc_enumerationMutation(v323);
            }
            v335 = *(void **)(*((void *)&v400 + 1) + 8 * j);
            v336 = v13->_nonTerminals;
            v337 = objc_msgSend_leftNode(v335, v327, v328, v329, v330, v331);
            objc_msgSend_addObject_(v336, v338, (uint64_t)v337, v339, v340, v341);

            v342 = v13->_terminals;
            v348 = objc_msgSend_rightNode1(v335, v343, v344, v345, v346, v347);
            objc_msgSend_addObject_(v342, v349, (uint64_t)v348, v350, v351, v352);
          }
          uint64_t v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v327, (uint64_t)&v400, (uint64_t)v411, 16, v331);
        }
        while (v332);
      }

      v358 = objc_msgSend_string(MEMORY[0x1E4F28E78], v353, v354, v355, v356, v357);
      v362 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v359, @"self", 1, v360, v361);
      v410 = v362;
      v366 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v363, (uint64_t)&v410, 1, v364, v365);
      v371 = objc_msgSend_sortedArrayUsingDescriptors_(v392, v367, (uint64_t)v366, v368, v369, v370);

      long long v398 = 0u;
      long long v399 = 0u;
      long long v396 = 0u;
      long long v397 = 0u;
      id v372 = v371;
      uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v373, (uint64_t)&v396, (uint64_t)v409, 16, v374);
      if (v375)
      {
        uint64_t v380 = v375;
        uint64_t v381 = *(void *)v397;
        do
        {
          for (uint64_t k = 0; k != v380; ++k)
          {
            if (*(void *)v397 != v381) {
              objc_enumerationMutation(v372);
            }
            objc_msgSend_appendString_(v358, v376, *(void *)(*((void *)&v396 + 1) + 8 * k), v377, v378, v379);
          }
          uint64_t v380 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v376, (uint64_t)&v396, (uint64_t)v409, 16, v379);
        }
        while (v380);
      }

      uint64_t v387 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v383, (uint64_t)v358, v384, v385, v386);
      characterSet = v13->_characterSet;
      v13->_characterSet = (NSCharacterSet *)v387;

      v16 = v390;
      id v5 = v391;
    }
  }
  return v13;
}

- (NSSet)nonTerminals
{
  return (NSSet *)self->_nonTerminals;
}

- (id)terminalst
{
  return self->_terminals;
}

- (id)terminalProductions
{
  return self->_terminalProductions;
}

- (id)nonTerminalProductions
{
  return self->_nonTerminalProductions;
}

- (id)getProductionRuleByKey:(id)a3
{
  return (id)objc_msgSend_valueForKey_(self->_productionsByKey, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)description
{
  uint64_t v3 = NSString;
  v59.receiver = self;
  v59.super_class = (Class)CHGrammar;
  uint64_t v4 = [(CHGrammar *)&v59 description];
  uint64_t v10 = objc_msgSend_terminals(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_nonTerminals(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_terminalProductions(self, v29, v30, v31, v32, v33);
  uint64_t v40 = objc_msgSend_count(v34, v35, v36, v37, v38, v39);
  uint64_t v46 = objc_msgSend_nonTerminalProductions(self, v41, v42, v43, v44, v45);
  uint64_t v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_stringWithFormat_(v3, v53, @"%@: terminals=%lu, non-terminals=%lu, rules=%lu", v54, v55, v56, v4, v16, v28, v52 + v40);

  return v57;
}

- (NSSet)terminals
{
  return &self->_terminals->super;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (NSString)file
{
  return self->_file;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_nonTerminals, 0);
  objc_storeStrong((id *)&self->_terminals, 0);
  objc_storeStrong((id *)&self->_productionsByKey, 0);
  objc_storeStrong((id *)&self->_nonTerminalProductions, 0);
  objc_storeStrong((id *)&self->_terminalProductions, 0);
}

@end