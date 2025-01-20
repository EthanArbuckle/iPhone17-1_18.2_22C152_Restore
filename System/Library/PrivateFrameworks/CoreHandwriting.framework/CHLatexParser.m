@interface CHLatexParser
- (BOOL)parseNormalizedLatex;
- (CHGrammar)grammar;
- (CHLatexParser)initWithGrammar:(id)a3 parseNormalizedLatex:(BOOL)a4;
- (id)_initializeParseTableForNormalizedLatex:(id)a3;
- (id)_initializeParseTableForPlainText:(id)a3;
- (id)_joinNumbers:(id)a3;
- (id)parseLatex:(id)a3;
- (id)parseLatex:(id)a3 outCorrectedLatex:(id *)a4;
@end

@implementation CHLatexParser

- (CHLatexParser)initWithGrammar:(id)a3 parseNormalizedLatex:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHLatexParser;
  v8 = [(CHLatexParser *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_grammar, a3);
    v9->_parseNormalizedLatex = a4;
  }

  return v9;
}

- (id)_initializeParseTableForNormalizedLatex:(id)a3
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  id v224 = a3;
  v3 = [CHParseTable alloc];
  uint64_t v9 = objc_msgSend_count(v224, v4, v5, v6, v7, v8);
  v15 = objc_msgSend_grammar(self, v10, v11, v12, v13, v14);
  v21 = objc_msgSend_nonTerminals(v15, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  id v225 = (id)objc_msgSend_initWithInputLength_grammarSize_(v3, v28, v9, v27, v29, v30);

  id v221 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  objc_msgSend_setMaximumFractionDigits_(v221, v31, 9, v32, v33, v34);
  objc_msgSend_setRoundingMode_(v221, v35, 6, v36, v37, v38);
  uint64_t v228 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v224, v39, v40, v41, v42, v43); ++i)
  {
    v48 = objc_msgSend_objectAtIndexedSubscript_(v224, v44, i, v45, v46, v47);
    uint64_t v227 = objc_msgSend_length(v48, v49, v50, v51, v52, v53);
    uint64_t v222 = objc_msgSend_length(v48, v54, v55, v56, v57, v58);
    v223 = objc_msgSend_numberFromString_(v221, v59, (uint64_t)v48, v60, v61, v62);
    if (v223)
    {
      v68 = [CHTerminal alloc];
      v71 = objc_msgSend_initWithName_inputRange_(v68, v69, (uint64_t)v48, v228, v227, v70);
      v72 = [CHNonTerminal alloc];
      v75 = objc_msgSend_initWithName_leftNode_rightNode_(v72, v73, @"Number", (uint64_t)v71, 0, v74);
      v76 = [CHParseTableCell alloc];
      inited = objc_msgSend_initNonTerminal_range_(v76, v77, (uint64_t)v75, i, 1, v78);
      v80 = [CHProductionRule alloc];
      v84 = objc_msgSend_initWithLeftNode_rightNode_(v80, v81, @"Number", (uint64_t)v48, v82, v83);
      objc_msgSend_setRule_(inited, v85, (uint64_t)v84, v86, v87, v88);

      objc_msgSend_setTerminal_(inited, v89, (uint64_t)v71, v90, v91, v92);
      objc_msgSend_setProbability_(inited, v93, v94, v95, v96, v97, 1.0);
      v98 = [CHParseTree alloc];
      v104 = objc_msgSend_grammar(self, v99, v100, v101, v102, v103);
      v109 = objc_msgSend_initWithGrammar_(v98, v105, (uint64_t)v104, v106, v107, v108);
      objc_msgSend_setParseTree_(inited, v110, (uint64_t)v109, v111, v112, v113);

      v119 = objc_msgSend_parseTree(inited, v114, v115, v116, v117, v118);
      objc_msgSend_setRoot_(v119, v120, (uint64_t)v75, v121, v122, v123);

      objc_msgSend_addCell_(v225, v124, (uint64_t)inited, v125, v126, v127);
    }
    else
    {
      long long v232 = 0u;
      long long v233 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      v128 = objc_msgSend_grammar(self, v63, v64, v65, v66, v67);
      v71 = objc_msgSend_terminalProductions(v128, v129, v130, v131, v132, v133);

      uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v134, (uint64_t)&v230, (uint64_t)v234, 16, v135);
      if (v141)
      {
        uint64_t v142 = *(void *)v231;
        do
        {
          for (uint64_t j = 0; j != v141; ++j)
          {
            if (*(void *)v231 != v142) {
              objc_enumerationMutation(v71);
            }
            v144 = *(void **)(*((void *)&v230 + 1) + 8 * j);
            v145 = objc_msgSend_rightNode1(v144, v136, v137, v138, v139, v140);
            int isEqualToString = objc_msgSend_isEqualToString_(v145, v146, (uint64_t)v48, v147, v148, v149);

            if (isEqualToString)
            {
              objc_msgSend_probability(v144, v136, v137, v138, v139, v140);
              double v152 = v151;
              if (v151 > 0.0)
              {
                v153 = [CHTerminal alloc];
                v159 = objc_msgSend_rightNode1(v144, v154, v155, v156, v157, v158);
                v162 = objc_msgSend_initWithName_inputRange_(v153, v160, (uint64_t)v159, v228, v227, v161);

                v163 = [CHNonTerminal alloc];
                v169 = objc_msgSend_leftNode(v144, v164, v165, v166, v167, v168);
                v172 = objc_msgSend_initWithName_leftNode_rightNode_(v163, v170, (uint64_t)v169, (uint64_t)v162, 0, v171);

                v173 = [CHParseTableCell alloc];
                v176 = objc_msgSend_initNonTerminal_range_(v173, v174, (uint64_t)v172, i, 1, v175);
                objc_msgSend_setRule_(v176, v177, (uint64_t)v144, v178, v179, v180);
                objc_msgSend_setTerminal_(v176, v181, (uint64_t)v162, v182, v183, v184);
                objc_msgSend_setProbability_(v176, v185, v186, v187, v188, v189, v152);
                v190 = [CHParseTree alloc];
                v196 = objc_msgSend_grammar(self, v191, v192, v193, v194, v195);
                v201 = objc_msgSend_initWithGrammar_(v190, v197, (uint64_t)v196, v198, v199, v200);
                objc_msgSend_setParseTree_(v176, v202, (uint64_t)v201, v203, v204, v205);

                v211 = objc_msgSend_parseTree(v176, v206, v207, v208, v209, v210);
                objc_msgSend_setRoot_(v211, v212, (uint64_t)v172, v213, v214, v215);

                objc_msgSend_addCell_(v225, v216, (uint64_t)v176, v217, v218, v219);
              }
            }
          }
          uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v136, (uint64_t)&v230, (uint64_t)v234, 16, v140);
        }
        while (v141);
      }
    }

    v228 += v222;
  }

  return v225;
}

- (id)_initializeParseTableForPlainText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CHParseTable alloc];
  uint64_t v11 = objc_msgSend_length(v4, v6, v7, v8, v9, v10);
  uint64_t v17 = objc_msgSend_grammar(self, v12, v13, v14, v15, v16);
  uint64_t v23 = objc_msgSend_nonTerminals(v17, v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_initWithInputLength_grammarSize_(v5, v30, v11, v29, v31, v32);

  uint64_t v39 = objc_msgSend_length(v4, v34, v35, v36, v37, v38);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C4B05B1C;
  v45[3] = &unk_1E64E3BD0;
  v45[4] = self;
  id v40 = v33;
  id v46 = v40;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v4, v41, 0, v39, 2, (uint64_t)v45);
  uint64_t v42 = v46;
  id v43 = v40;

  return v43;
}

- (id)_joinNumbers:(id)a3
{
  id v3 = a3;
  uint64_t v9 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_componentsSeparatedByCharactersInSet_(v3, v10, (uint64_t)v9, v11, v12, v13);

  uint64_t v20 = objc_msgSend_string(MEMORY[0x1E4F28E78], v15, v16, v17, v18, v19);
  if (objc_msgSend_count(v14, v21, v22, v23, v24, v25))
  {
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v14, v26, 0, v27, v28, v29);
    objc_msgSend_appendString_(v20, v31, (uint64_t)v30, v32, v33, v34);

    for (unint64_t i = 1; ; ++i)
    {
      if (i >= objc_msgSend_count(v14, v35, v36, v37, v38, v39)) {
        goto LABEL_10;
      }
      uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v14, v41, i, v42, v43, v44);
      if ((sub_1C4B06068(v45) & 1) == 0) {
        break;
      }
      uint64_t v50 = objc_msgSend_objectAtIndexedSubscript_(v14, v46, i - 1, v47, v48, v49);
      char v51 = sub_1C4B06068(v50);

      if ((v51 & 1) == 0) {
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v56 = objc_msgSend_objectAtIndexedSubscript_(v14, v52, i, v53, v54, v55);
      objc_msgSend_appendString_(v20, v57, (uint64_t)v56, v58, v59, v60);
    }
LABEL_8:
    objc_msgSend_appendString_(v20, v52, @" ", v53, v54, v55);
    goto LABEL_9;
  }
LABEL_10:

  return v20;
}

- (id)parseLatex:(id)a3
{
  uint64_t v5 = objc_msgSend_parseLatex_outCorrectedLatex_(self, a2, (uint64_t)a3, 0, v3, v4);
  return v5;
}

- (id)parseLatex:(id)a3 outCorrectedLatex:(id *)a4
{
  uint64_t v573 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v523 = self;
  objc_msgSend__joinNumbers_(self, v7, (uint64_t)v6, v8, v9, v10);
  id v509 = (id)objc_claimAutoreleasedReturnValue();

  if (a4) {
    *a4 = v509;
  }
  v504 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v16, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_componentsSeparatedByCharactersInSet_(v509, v22, (uint64_t)v21, v23, v24, v25);

  v563 = 0;
  __p = 0;
  v564 = 0;
  v560 = 0;
  v559 = 0;
  v561 = 0;
  long long v555 = 0u;
  long long v556 = 0u;
  long long v557 = 0u;
  long long v558 = 0u;
  obuint64_t j = v26;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v555, (uint64_t)v572, 16, v28);
  if (v34)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v521 = *(void *)v556;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        while (1)
        {
          if (*(void *)v556 != v521) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void **)(*((void *)&v555 + 1) + 8 * i);
          if (objc_msgSend_length(v38, v29, v30, v31, v32, v33)) {
            break;
          }
          ++v36;
          if (++i == v34) {
            goto LABEL_47;
          }
        }
        uint64_t v39 = objc_msgSend_length(v38, v29, v30, v31, v32, v33);
        uint64_t v45 = v39;
        id v46 = v563;
        if (v563 < v564)
        {
          *(void *)v563 = v36;
          *((void *)v46 + 1) = v39;
          uint64_t v47 = v46 + 16;
          goto LABEL_28;
        }
        uint64_t v48 = (char *)__p;
        uint64_t v49 = (v563 - (unsigned char *)__p) >> 4;
        unint64_t v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v51 = v564 - (unsigned char *)__p;
        if ((v564 - (unsigned char *)__p) >> 3 > v50) {
          unint64_t v50 = v51 >> 3;
        }
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          if (v52 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v53 = (char *)operator new(16 * v52);
          uint64_t v54 = &v53[16 * v49];
          *(void *)uint64_t v54 = v36;
          *((void *)v54 + 1) = v45;
          uint64_t v55 = v54;
          if (v46 == v48)
          {
LABEL_26:
            uint64_t v47 = v54 + 16;
            __p = v55;
            v564 = &v53[16 * v52];
            if (!v46) {
              goto LABEL_28;
            }
LABEL_27:
            operator delete(v46);
            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v53 = 0;
          uint64_t v54 = (char *)(16 * v49);
          *(void *)uint64_t v54 = v36;
          *((void *)v54 + 1) = v45;
          uint64_t v55 = (char *)(16 * v49);
          if (v46 == v48) {
            goto LABEL_26;
          }
        }
        do
        {
          *((_OWORD *)v55 - 1) = *((_OWORD *)v46 - 1);
          v55 -= 16;
          v46 -= 16;
        }
        while (v46 != v48);
        id v46 = (char *)__p;
        uint64_t v47 = v54 + 16;
        __p = v55;
        v564 = &v53[16 * v52];
        if (v46) {
          goto LABEL_27;
        }
LABEL_28:
        v563 = v47;
        uint64_t v56 = objc_msgSend_length(v38, v40, v41, v42, v43, v44);
        uint64_t v62 = v56;
        v63 = v560;
        if (v560 < (void *)v561)
        {
          void *v560 = v35;
          v63[1] = v56;
          uint64_t v64 = v63 + 2;
          goto LABEL_46;
        }
        uint64_t v65 = v559;
        uint64_t v66 = ((char *)v560 - (unsigned char *)v559) >> 4;
        unint64_t v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 60) {
          sub_1C494A220();
        }
        uint64_t v68 = v561 - (unsigned char *)v559;
        if ((v561 - (unsigned char *)v559) >> 3 > v67) {
          unint64_t v67 = v68 >> 3;
        }
        if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v69 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v69 = v67;
        }
        if (v69)
        {
          if (v69 >> 60) {
            sub_1C4949AA8();
          }
          uint64_t v70 = (char *)operator new(16 * v69);
          v71 = &v70[16 * v66];
          *(void *)v71 = v35;
          *((void *)v71 + 1) = v62;
          v72 = v71;
          if (v63 == v65)
          {
LABEL_44:
            uint64_t v64 = v71 + 16;
            v559 = v72;
            v561 = &v70[16 * v69];
            if (!v63) {
              goto LABEL_46;
            }
LABEL_45:
            operator delete(v63);
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v70 = 0;
          v71 = (char *)(16 * v66);
          *(void *)v71 = v35;
          *((void *)v71 + 1) = v62;
          v72 = (char *)(16 * v66);
          if (v63 == v65) {
            goto LABEL_44;
          }
        }
        do
        {
          *((_OWORD *)v72 - 1) = *((_OWORD *)v63 - 1);
          v72 -= 16;
          v63 -= 2;
        }
        while (v63 != v65);
        v63 = v559;
        uint64_t v64 = v71 + 16;
        v559 = v72;
        v561 = &v70[16 * v69];
        if (v63) {
          goto LABEL_45;
        }
LABEL_46:
        v560 = v64;
        uint64_t v73 = objc_msgSend_length(v38, v57, v58, v59, v60, v61);
        v35 += objc_msgSend_length(v38, v74, v75, v76, v77, v78);
        v36 += v73 + 1;
      }
LABEL_47:
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v555, (uint64_t)v572, 16, v33);
    }
    while (v34);
  }

  if (objc_msgSend_parseNormalizedLatex(v523, v79, v80, v81, v82, v83))
  {
    uint64_t v508 = objc_msgSend_count(obj, v84, v85, v86, v87, v88);
    uint64_t v97 = objc_msgSend__initializeParseTableForNormalizedLatex_(v523, v89, (uint64_t)obj, v90, v91, v92);
  }
  else
  {
    v98 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v509, v84, @" ", (uint64_t)&stru_1F20141C8, v87, v88);
    uint64_t v508 = objc_msgSend_length(v98, v99, v100, v101, v102, v103);
    uint64_t v97 = objc_msgSend__initializeParseTableForPlainText_(v523, v104, (uint64_t)v98, v105, v106, v107);
  }
  v517 = v97;
  if (v508 >= 2)
  {
    uint64_t v516 = 2;
    do
    {
      uint64_t v267 = 1;
      do
      {
        v496 = objc_msgSend_cellsByRangeForLength_(v97, v93, v267, v94, v95, v96);
        uint64_t v489 = v267;
        v498 = objc_msgSend_cellsByRangeForLength_(v97, v268, v516 - v267, v269, v270, v271);
        long long v553 = 0u;
        long long v554 = 0u;
        long long v551 = 0u;
        long long v552 = 0u;
        id v497 = v496;
        uint64_t v490 = objc_msgSend_countByEnumeratingWithState_objects_count_(v497, v272, (uint64_t)&v551, (uint64_t)v571, 16, v273);
        if (!v490) {
          goto LABEL_186;
        }
        uint64_t v492 = *(void *)v552;
        do
        {
          for (uint64_t j = 0; j != v490; ++j)
          {
            if (*(void *)v552 != v492) {
              objc_enumerationMutation(v497);
            }
            v495 = *(void **)(*((void *)&v551 + 1) + 8 * j);
            v279 = objc_msgSend_firstObject(v495, v274, v275, v276, v277, v278);
            uint64_t v285 = objc_msgSend_inputRange(v279, v280, v281, v282, v283, v284);
            NSUInteger v505 = v286;
            NSUInteger v506 = v285;

            long long v549 = 0u;
            long long v550 = 0u;
            long long v547 = 0u;
            long long v548 = 0u;
            id v501 = v498;
            uint64_t v500 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, v287, (uint64_t)&v547, (uint64_t)v570, 16, v288);
            if (v500)
            {
              uint64_t v502 = *(void *)v548;
              do
              {
                for (uint64_t k = 0; k != v500; ++k)
                {
                  if (*(void *)v548 != v502) {
                    objc_enumerationMutation(v501);
                  }
                  v507 = *(void **)(*((void *)&v547 + 1) + 8 * k);
                  v294 = objc_msgSend_firstObject(v507, length, v290, v291, v292, v293);
                  NSUInteger v300 = objc_msgSend_inputRange(v294, v295, v296, v297, v298, v299);
                  NSUInteger v302 = v301;

                  v575.locatiouint64_t n = v506;
                  v575.length = v505;
                  v576.locatiouint64_t n = v300;
                  v576.length = v302;
                  NSRange v303 = NSUnionRange(v575, v576);
                  length = (const char *)v303.length;
                  if (v303.length == v302 + v505 && v506 <= v300)
                  {
                    long long v545 = 0u;
                    long long v546 = 0u;
                    long long v543 = 0u;
                    long long v544 = 0u;
                    id v494 = v495;
                    uint64_t v491 = objc_msgSend_countByEnumeratingWithState_objects_count_(v494, v305, (uint64_t)&v543, (uint64_t)v569, 16, v306);
                    if (!v491) {
                      goto LABEL_143;
                    }
                    uint64_t v493 = *(void *)v544;
                    while (1)
                    {
                      for (uint64_t m = 0; m != v491; ++m)
                      {
                        if (*(void *)v544 != v493) {
                          objc_enumerationMutation(v494);
                        }
                        v307 = *(void **)(*((void *)&v543 + 1) + 8 * m);
                        long long v539 = 0u;
                        long long v540 = 0u;
                        long long v541 = 0u;
                        long long v542 = 0u;
                        id v511 = v507;
                        uint64_t v513 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v308, (uint64_t)&v539, (uint64_t)v568, 16, v309);
                        if (v513)
                        {
                          uint64_t v512 = *(void *)v540;
                          do
                          {
                            for (uint64_t n = 0; n != v513; ++n)
                            {
                              if (*(void *)v540 != v512) {
                                objc_enumerationMutation(v511);
                              }
                              v522 = *(void **)(*((void *)&v539 + 1) + 8 * n);
                              long long v535 = 0u;
                              long long v536 = 0u;
                              long long v537 = 0u;
                              long long v538 = 0u;
                              v315 = objc_msgSend_grammar(v523, v310, v311, v312, v313, v314);
                              objc_msgSend_nonTerminalProductions(v315, v316, v317, v318, v319, v320);
                              id v518 = (id)objc_claimAutoreleasedReturnValue();

                              uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v518, v321, (uint64_t)&v535, (uint64_t)v567, 16, v322);
                              if (v323)
                              {
                                uint64_t v519 = *(void *)v536;
                                do
                                {
                                  uint64_t v520 = v323;
                                  for (iuint64_t i = 0; ii != v520; ++ii)
                                  {
                                    if (*(void *)v536 != v519) {
                                      objc_enumerationMutation(v518);
                                    }
                                    v330 = *(void **)(*((void *)&v535 + 1) + 8 * ii);
                                    v331 = objc_msgSend_rightNode1(v330, v324, v325, v326, v327, v328);
                                    v337 = objc_msgSend_nonTerminal(v307, v332, v333, v334, v335, v336);
                                    inited = objc_msgSend_name(v337, v338, v339, v340, v341, v342);
                                    if (!objc_msgSend_isEqualToString_(v331, v344, (uint64_t)inited, v345, v346, v347))goto LABEL_176; {
                                    v353 = objc_msgSend_rightNode2(v330, v348, v349, v350, v351, v352);
                                    }
                                    v359 = objc_msgSend_nonTerminal(v522, v354, v355, v356, v357, v358);
                                    v365 = objc_msgSend_name(v359, v360, v361, v362, v363, v364);
                                    int isEqualToString = objc_msgSend_isEqualToString_(v353, v366, (uint64_t)v365, v367, v368, v369);

                                    if (isEqualToString)
                                    {
                                      uint64_t v371 = objc_msgSend_combinations(v307, v324, v325, v326, v327, v328);
                                      if (v371 <= objc_msgSend_combinations(v522, v372, v373, v374, v375, v376)) {
                                        uint64_t v382 = objc_msgSend_combinations(v522, v377, v378, v379, v380, v381);
                                      }
                                      else {
                                        uint64_t v382 = objc_msgSend_combinations(v307, v377, v378, v379, v380, v381);
                                      }
                                      uint64_t v388 = v382;
                                      objc_msgSend_probability(v307, v383, v384, v385, v386, v387);
                                      double v390 = v389;
                                      objc_msgSend_probability(v522, v391, v392, v393, v394, v395);
                                      double v397 = v396;
                                      objc_msgSend_probability(v330, v398, v399, v400, v401, v402);
                                      double v404 = v403;
                                      v410 = objc_msgSend_leftNode(v330, v405, v406, v407, v408, v409);
                                      v331 = objc_msgSend_cellWithLength_range_nonTerminal_(v517, v411, v516, v303.location, v303.length, (uint64_t)v410);

                                      double v417 = v390 * v397 * v404;
                                      if (!v331
                                        || (objc_msgSend_probability(v331, v412, v413, v414, v415, v416), v417 > v418))
                                      {
                                        v419 = [CHNonTerminal alloc];
                                        v425 = objc_msgSend_leftNode(v330, v420, v421, v422, v423, v424);
                                        v431 = objc_msgSend_nonTerminal(v307, v426, v427, v428, v429, v430);
                                        v437 = objc_msgSend_nonTerminal(v522, v432, v433, v434, v435, v436);
                                        v337 = objc_msgSend_initWithName_leftNode_rightNode_(v419, v438, (uint64_t)v425, (uint64_t)v431, (uint64_t)v437, v439);

                                        v440 = [CHParseTableCell alloc];
                                        inited = objc_msgSend_initNonTerminal_range_(v440, v441, (uint64_t)v337, v303.location, v303.length, v442);
                                        objc_msgSend_setRule_(inited, v443, (uint64_t)v330, v444, v445, v446);
                                        objc_msgSend_setCombinations_(inited, v447, v388 + 1, v448, v449, v450);
                                        objc_msgSend_setProbability_(inited, v451, v452, v453, v454, v455, v417);
                                        v456 = [CHParseTree alloc];
                                        v462 = objc_msgSend_grammar(v523, v457, v458, v459, v460, v461);
                                        v467 = objc_msgSend_initWithGrammar_(v456, v463, (uint64_t)v462, v464, v465, v466);
                                        objc_msgSend_setParseTree_(inited, v468, (uint64_t)v467, v469, v470, v471);

                                        v477 = objc_msgSend_parseTree(inited, v472, v473, v474, v475, v476);
                                        objc_msgSend_setRoot_(v477, v478, (uint64_t)v337, v479, v480, v481);

                                        objc_msgSend_addCell_(v517, v482, (uint64_t)inited, v483, v484, v485);
LABEL_176:
                                      }
                                      continue;
                                    }
                                  }
                                  uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v518, v324, (uint64_t)&v535, (uint64_t)v567, 16, v328);
                                }
                                while (v323);
                              }
                            }
                            uint64_t v513 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v310, (uint64_t)&v539, (uint64_t)v568, 16, v314);
                          }
                          while (v513);
                        }
                      }
                      uint64_t v491 = objc_msgSend_countByEnumeratingWithState_objects_count_(v494, v486, (uint64_t)&v543, (uint64_t)v569, 16, v487);
                      if (!v491)
                      {
LABEL_143:

                        break;
                      }
                    }
                  }
                }
                uint64_t v500 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, length, (uint64_t)&v547, (uint64_t)v570, 16, v293);
              }
              while (v500);
            }
          }
          uint64_t v490 = objc_msgSend_countByEnumeratingWithState_objects_count_(v497, v274, (uint64_t)&v551, (uint64_t)v571, 16, v278);
        }
        while (v490);
LABEL_186:

        uint64_t v267 = v489 + 1;
        uint64_t v97 = v517;
      }
      while (v489 + 1 != v516);
    }
    while (v516++ != v508);
  }
  long long v533 = 0u;
  long long v534 = 0u;
  *(_OWORD *)v532 = 0u;
  sub_1C4B07628(v532);
  uint64_t v113 = *((void *)&v534 + 1);
  v114 = (void **)v532[1];
  uint64_t v115 = (void **)v533;
  uint64_t v116 = (void *)(*(void *)((char *)v532[1] + ((((void)v534 + *((void *)&v534 + 1)) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (v534 + BYTE8(v534)));
  *uint64_t v116 = 0;
  v116[1] = v508;
  BOOL v117 = __CFADD__(v113, 1);
  uint64_t v118 = v113 + 1;
  if (v117) {
    goto LABEL_119;
  }
  do
  {
    uint64_t v119 = v533;
    unint64_t v120 = 32 * (v533 - (unint64_t)v532[1]) - 1;
    if ((void *)v533 == v532[1]) {
      unint64_t v120 = 0;
    }
    uint64_t v121 = (uint64_t *)(*(void *)((char *)v532[1] + (((unint64_t)(v534 + v118 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                     + 16 * (v534 + v118 - 1));
    uint64_t v122 = *v121;
    unint64_t v123 = v121[1];
    *((void *)&v534 + 1) = v118 - 1;
    if (v120 - (v118 + (void)v534) + 1 >= 0x200)
    {
      operator delete(*(void **)(v533 - 8));
      *(void *)&long long v533 = v119 - 8;
    }
    id v124 = 0;
    uint64_t v125 = v123;
LABEL_58:
    if (!objc_msgSend_count(v124, v108, v109, v110, v111, v112) && v125 >= 1)
    {
      uint64_t v127 = objc_msgSend_startCellsWithLength_inRange_startSymbol_(v517, v126, v125, v122, v123, @"Expression");

      uint64_t v133 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v128, v129, v130, v131, v132);
      long long v530 = 0u;
      long long v531 = 0u;
      long long v528 = 0u;
      long long v529 = 0u;
      id v134 = v127;
      uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v528, (uint64_t)v566, 16, v136);
      if (!v142) {
        goto LABEL_84;
      }
      uint64_t v143 = *(void *)v529;
      while (1)
      {
        for (juint64_t j = 0; jj != v142; ++jj)
        {
          if (*(void *)v529 != v143) {
            objc_enumerationMutation(v134);
          }
          v145 = *(void **)(*((void *)&v528 + 1) + 8 * jj);
          if (objc_msgSend_parseNormalizedLatex(v523, v137, v138, v139, v140, v141)) {
            uint64_t v151 = objc_msgSend_terminalsRange(v145, v146, v147, v148, v149, v150);
          }
          else {
            uint64_t v151 = objc_msgSend_inputRange(v145, v146, v147, v148, v149, v150);
          }
          if (v560 != v559)
          {
            unint64_t v152 = ((char *)v560 - (unsigned char *)v559) >> 4;
            v153 = (uint64_t *)__p;
            v154 = &v137[v151];
            if (v152 <= 1) {
              unint64_t v152 = 1;
            }
            uint64_t v155 = (char *)v559 + 8;
            uint64_t v156 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v138 = 0x7FFFFFFFFFFFFFFFLL;
            while (1)
            {
              uint64_t v157 = *(v155 - 1);
              if (v151 == v157)
              {
                uint64_t v138 = *v153;
                if (v154 != (const char *)(*v155 + v157)) {
                  goto LABEL_74;
                }
              }
              else if (v154 != (const char *)(*v155 + v157))
              {
                goto LABEL_74;
              }
              uint64_t v156 = v153[1] + *v153;
LABEL_74:
              v153 += 2;
              v155 += 2;
              if (!--v152)
              {
                if (v138 != 0x7FFFFFFFFFFFFFFFLL && v156 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend_setOriginalRange_(v145, v137, v138, v156 - v138, v140, v141);
                  objc_msgSend_addObject_(v133, v158, (uint64_t)v145, v159, v160, v161);
                }
                break;
              }
            }
          }
        }
        uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v528, (uint64_t)v566, 16, v141);
        if (!v142)
        {
LABEL_84:

          id v124 = v133;
          uint64_t v167 = objc_msgSend_count(v124, v162, v163, v164, v165, v166) == 0;

          v125 -= v167;
          goto LABEL_58;
        }
      }
    }
    long long v526 = 0u;
    long long v527 = 0u;
    long long v524 = 0u;
    long long v525 = 0u;
    id v168 = v124;
    uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v524, (uint64_t)v565, 16, v170);
    if (!v176)
    {

      v177 = 0;
LABEL_100:
      v206 = 0;
      goto LABEL_117;
    }
    v177 = 0;
    uint64_t v178 = *(void *)v525;
    do
    {
      for (uint64_t kk = 0; kk != v176; ++kk)
      {
        if (*(void *)v525 != v178) {
          objc_enumerationMutation(v168);
        }
        v181 = *(void **)(*((void *)&v524 + 1) + 8 * kk);
        if (v177)
        {
          objc_msgSend_probability(*(void **)(*((void *)&v524 + 1) + 8 * kk), v171, v172, v173, v174, v175);
          double v183 = v182;
          objc_msgSend_probability(v177, v184, v185, v186, v187, v188);
          if (v183 <= v189) {
            continue;
          }
        }
        id v180 = v181;

        v177 = v180;
      }
      uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v171, (uint64_t)&v524, (uint64_t)v565, 16, v175);
    }
    while (v176);

    if (!v177) {
      goto LABEL_100;
    }
    if (objc_msgSend_parseNormalizedLatex(v523, v190, v191, v192, v193, v194)) {
      uint64_t v200 = [CHLatexParseTree alloc];
    }
    else {
      uint64_t v200 = [CHParseTree alloc];
    }
    v201 = objc_msgSend_grammar(v523, v195, v196, v197, v198, v199);
    v206 = objc_msgSend_initWithGrammar_(v200, v202, (uint64_t)v201, v203, v204, v205);

    v212 = objc_msgSend_nonTerminal(v177, v207, v208, v209, v210, v211);
    objc_msgSend_setRoot_(v206, v213, (uint64_t)v212, v214, v215, v216);

    uint64_t v222 = objc_msgSend_originalRange(v177, v217, v218, v219, v220, v221);
    objc_msgSend_setInputRange_(v206, v223, v222, (uint64_t)v223, v224, v225);
    objc_msgSend_addObject_(v504, v226, (uint64_t)v206, v227, v228, v229);
    if (v125 < v123)
    {
      uint64_t v235 = objc_msgSend_inputRange(v177, v230, v231, v232, v233, v234);
      uint64_t v241 = v235 - v122;
      if (v235 != v122)
      {
        v242 = (char *)v532[1];
        if ((void *)v533 == v532[1]) {
          unint64_t v243 = 0;
        }
        else {
          unint64_t v243 = 32 * (v533 - (unint64_t)v532[1]) - 1;
        }
        uint64_t v244 = *((void *)&v534 + 1);
        unint64_t v245 = *((void *)&v534 + 1) + v534;
        if (v243 == *((void *)&v534 + 1) + (void)v534)
        {
          sub_1C4B07628(v532);
          v242 = (char *)v532[1];
          uint64_t v244 = *((void *)&v534 + 1);
          unint64_t v245 = *((void *)&v534 + 1) + v534;
        }
        v246 = (uint64_t *)(*(void *)&v242[(v245 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v245);
        uint64_t *v246 = v122;
        v246[1] = v241;
        *((void *)&v534 + 1) = v244 + 1;
      }
      uint64_t v247 = objc_msgSend_inputRange(v177, v236, v237, v238, v239, v240);
      v249 = v248;
      uint64_t v254 = objc_msgSend_inputRange(v177, v248, v250, v251, v252, v253);
      unint64_t v256 = v123 + v122 - (v255 + v254);
      if (v123 + v122 != v255 + v254)
      {
        v257 = (char *)v532[1];
        if ((void *)v533 == v532[1]) {
          unint64_t v258 = 0;
        }
        else {
          unint64_t v258 = 32 * (v533 - (unint64_t)v532[1]) - 1;
        }
        uint64_t v259 = *((void *)&v534 + 1);
        unint64_t v260 = *((void *)&v534 + 1) + v534;
        if (v258 == *((void *)&v534 + 1) + (void)v534)
        {
          sub_1C4B07628(v532);
          v257 = (char *)v532[1];
          uint64_t v259 = *((void *)&v534 + 1);
          unint64_t v260 = *((void *)&v534 + 1) + v534;
        }
        v261 = (void *)(*(void *)&v257[(v260 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v260);
        void *v261 = &v249[v247];
        v261[1] = v256;
        *((void *)&v534 + 1) = v259 + 1;
      }
    }
LABEL_117:

    uint64_t v118 = *((void *)&v534 + 1);
  }
  while (*((void *)&v534 + 1));
  v114 = (void **)v532[1];
  uint64_t v115 = (void **)v533;
  uint64_t v97 = v517;
LABEL_119:
  id v262 = v504;
  unint64_t v263 = (char *)v115 - (char *)v114;
  if ((unint64_t)((char *)v115 - (char *)v114) >= 0x11)
  {
    do
    {
      v264 = *v114++;
      operator delete(v264);
      v263 -= 8;
    }
    while (v263 > 0x10);
    v532[1] = v114;
  }
  while (v114 != v115)
  {
    v265 = *v114++;
    operator delete(v265);
  }
  if (v532[0]) {
    operator delete(v532[0]);
  }

  if (v559) {
    operator delete(v559);
  }
  if (__p) {
    operator delete(__p);
  }

  return v262;
}

- (CHGrammar)grammar
{
  return self->_grammar;
}

- (BOOL)parseNormalizedLatex
{
  return self->_parseNormalizedLatex;
}

- (void).cxx_destruct
{
}

@end