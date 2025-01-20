@interface CHLatexParseTree
- (id)_evaluationRecursive:(id)a3 withVariables:(id)a4;
- (id)_functionRepresentationRecursive:(id)a3;
- (id)_latexRepresentationRecursive:(id)a3;
- (id)evaluateOpExpPriority:(id)a3;
- (id)evaluateVerticalMath:(id)a3;
- (id)evaluation;
- (id)evaluationWithVariables:(id)a3;
- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4;
- (id)functionRepresentation;
- (id)latexRepresentation;
@end

@implementation CHLatexParseTree

- (id)latexRepresentation
{
  v7 = objc_msgSend_root(self, a2, v2, v3, v4, v5);
  v12 = objc_msgSend__latexRepresentationRecursive_(self, v8, (uint64_t)v7, v9, v10, v11);

  return v12;
}

- (id)_latexRepresentationRecursive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9))
  {
    v15 = objc_msgSend_name(v4, v10, v11, v12, v13, v14);
    goto LABEL_30;
  }
  id v16 = v4;
  v22 = objc_msgSend_rightNode(v16, v17, v18, v19, v20, v21);

  v28 = objc_msgSend_leftNode(v16, v23, v24, v25, v26, v27);
  v15 = objc_msgSend__latexRepresentationRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);

  if (v22)
  {
    v38 = objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v43 = objc_msgSend__latexRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);

    if ((objc_msgSend_hasSuffix_(v15, v44, @"{", v45, v46, v47) & 1) != 0
      || (objc_msgSend_hasPrefix_(v43, v48, @"}", v49, v50, v51) & 1) != 0
      || (objc_msgSend_hasSuffix_(v15, v48, @"("), v49, v50, v51 & 1) != 0
      || objc_msgSend_hasPrefix_(v43, v48, @""), v49, v50, v51))
    {
      v52 = &stru_1F20141C8;
      if (objc_msgSend_hasPrefix_(v43, v48, @"{", v49, v50, v51)) {
        goto LABEL_14;
      }
    }
    else
    {
      v52 = @" ";
      if (objc_msgSend_hasPrefix_(v43, v48, @"{", v49, v50, v51)) {
        goto LABEL_14;
      }
    }
    if ((objc_msgSend_hasSuffix_(v15, v53, @"}", v55, v56, v57) & 1) == 0
      && (objc_msgSend_hasPrefix_(v43, v53, @"("), v55, v56, v57 & 1) == 0
      && !objc_msgSend_hasSuffix_(v15, v53, @""), v55, v56, v57))
    {
      goto LABEL_21;
    }
LABEL_14:
    v58 = objc_msgSend_rightNode(v16, v53, v54, v55, v56, v57);
    v64 = objc_msgSend_name(v58, v59, v60, v61, v62, v63);
    if ((objc_msgSend_isEqualToString_(v64, v65, @"ScriptArgs", v66, v67, v68) & 1) == 0)
    {
      v74 = objc_msgSend_rightNode(v16, v69, v70, v71, v72, v73);
      v80 = objc_msgSend_name(v74, v75, v76, v77, v78, v79);
      if ((objc_msgSend_isEqualToString_(v80, v81, @"ScriptArg", v82, v83, v84) & 1) == 0)
      {
        v141 = objc_msgSend_rightNode(v16, v85, v86, v87, v88, v89);
        v95 = objc_msgSend_name(v141, v90, v91, v92, v93, v94);
        if ((objc_msgSend_isEqualToString_(v95, v96, @"TwoArgs", v97, v98, v99) & 1) == 0)
        {
          v139 = objc_msgSend_rightNode(v16, v100, v101, v102, v103, v104);
          v138 = objc_msgSend_name(v139, v129, v130, v131, v132, v133);
          char isEqualToString = objc_msgSend_isEqualToString_(v138, v134, @"Arg", v135, v136, v137);

          if ((isEqualToString & 1) == 0)
          {
LABEL_21:
            if ((objc_msgSend_isEqualToString_(v15, v53, @"_", v55, v56, v57) & 1) != 0
              || (objc_msgSend_isEqualToString_(v15, v105, @"^", v107, v108, v109) & 1) != 0
              || (objc_msgSend_hasPrefix_(v43, v105, @"_", v107, v108, v109) & 1) != 0
              || objc_msgSend_hasPrefix_(v43, v105, @"^", v107, v108, v109))
            {
              v52 = &stru_1F20141C8;
            }
            v110 = objc_msgSend_rightNode(v16, v105, v106, v107, v108, v109);
            v116 = objc_msgSend_name(v110, v111, v112, v113, v114, v115);
            int v121 = objc_msgSend_isEqualToString_(v116, v117, @"Fact", v118, v119, v120);

            v126 = &stru_1F20141C8;
            if (!v121) {
              v126 = v52;
            }
            uint64_t v127 = objc_msgSend_stringWithFormat_(NSString, v122, @"%@%@%@", v123, v124, v125, v15, v126, v43);

            v15 = (void *)v127;
            goto LABEL_29;
          }
LABEL_20:
          v52 = &stru_1F20141C8;
          goto LABEL_21;
        }
      }
    }

    goto LABEL_20;
  }
LABEL_29:

LABEL_30:
  return v15;
}

- (id)functionRepresentation
{
  uint64_t v11 = objc_msgSend_evaluationWithVariables_(self, a2, (uint64_t)&unk_1F203D148, v2, v3, v4);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1F203D170, v8, v9, v10);
    if (v12)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1F203D198, v8, v9, v10);
      uint64_t v14 = 0;
      v15 = 0;
      if (!v13) {
        goto LABEL_10;
      }
    }
  }
  id v16 = objc_msgSend_evaluation(self, v6, v7, v8, v9, v10);

  if (v16)
  {
    v15 = 0;
  }
  else
  {
    v22 = objc_msgSend_root(self, v17, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend__functionRepresentationRecursive_(self, v23, (uint64_t)v22, v24, v25, v26);
    v15 = objc_msgSend_lowercaseString(v27, v28, v29, v30, v31, v32);
  }
  uint64_t v14 = (void *)v13;
LABEL_10:
  id v33 = v15;

  return v33;
}

- (id)_functionRepresentationRecursive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9))
  {
    v15 = objc_msgSend_name(v4, v10, v11, v12, v13, v14);
    goto LABEL_26;
  }
  id v16 = v4;
  v22 = objc_msgSend_rightNode(v16, v17, v18, v19, v20, v21);

  v28 = objc_msgSend_leftNode(v16, v23, v24, v25, v26, v27);
  v15 = objc_msgSend__functionRepresentationRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);

  if (v22)
  {
    v38 = objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v43 = objc_msgSend__functionRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);

    uint64_t v49 = objc_msgSend_name(v16, v44, v45, v46, v47, v48);
    int isEqualToString = objc_msgSend_isEqualToString_(v49, v50, @"Arg", v51, v52, v53);

    if (isEqualToString)
    {
      uint64_t v60 = v43;
LABEL_22:
      v65 = v60;
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v66 = objc_msgSend_name(v16, v55, v56, v57, v58, v59);
    int v71 = objc_msgSend_isEqualToString_(v66, v67, @"ExpRArgCurly", v68, v69, v70);

    if (v71)
    {
      uint64_t v60 = v15;
      goto LABEL_22;
    }
    uint64_t v77 = objc_msgSend_leftNode(v16, v72, v73, v74, v75, v76);
    uint64_t v83 = objc_msgSend_name(v77, v78, v79, v80, v81, v82);
    int isEqual = objc_msgSend_isEqual_(v83, v84, @"Sqrt", v85, v86, v87);

    if (isEqual)
    {
      objc_msgSend_stringWithFormat_(NSString, v89, @"sqrt(%@)", v91, v92, v93, v43);
LABEL_21:
      uint64_t v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    uint64_t v94 = objc_msgSend_leftNode(v16, v89, v90, v91, v92, v93);
    v100 = objc_msgSend_name(v94, v95, v96, v97, v98, v99);
    int v105 = objc_msgSend_isEqual_(v100, v101, @"Sin", v102, v103, v104);

    if (v105)
    {
      objc_msgSend_stringWithFormat_(NSString, v106, @"sin(%@)", v108, v109, v110, v43);
      goto LABEL_21;
    }
    v111 = objc_msgSend_leftNode(v16, v106, v107, v108, v109, v110);
    v117 = objc_msgSend_name(v111, v112, v113, v114, v115, v116);
    int v122 = objc_msgSend_isEqual_(v117, v118, @"Cos", v119, v120, v121);

    if (v122)
    {
      objc_msgSend_stringWithFormat_(NSString, v123, @"cos(%@)", v125, v126, v127, v43);
      goto LABEL_21;
    }
    v128 = objc_msgSend_leftNode(v16, v123, v124, v125, v126, v127);
    v134 = objc_msgSend_name(v128, v129, v130, v131, v132, v133);
    int v139 = objc_msgSend_isEqual_(v134, v135, @"Tan", v136, v137, v138);

    if (v139)
    {
      objc_msgSend_stringWithFormat_(NSString, v140, @"tan(%@)", v142, v143, v144, v43);
      goto LABEL_21;
    }
    v145 = objc_msgSend_leftNode(v16, v140, v141, v142, v143, v144);
    v151 = objc_msgSend_name(v145, v146, v147, v148, v149, v150);
    int v156 = objc_msgSend_isEqual_(v151, v152, @"Arctan", v153, v154, v155);

    if (v156)
    {
      objc_msgSend_stringWithFormat_(NSString, v157, @"atan(%@)", v159, v160, v161, v43);
      goto LABEL_21;
    }
    v163 = objc_msgSend_leftNode(v16, v157, v158, v159, v160, v161);
    v169 = objc_msgSend_name(v163, v164, v165, v166, v167, v168);
    int v174 = objc_msgSend_isEqualToString_(v169, v170, @"Frac", v171, v172, v173);

    v180 = objc_msgSend_rightNode(v16, v175, v176, v177, v178, v179);
    v186 = v180;
    if (v174)
    {
      v187 = objc_msgSend_leftNode(v180, v181, v182, v183, v184, v185);
      v192 = objc_msgSend__functionRepresentationRecursive_(self, v188, (uint64_t)v187, v189, v190, v191);

      v198 = objc_msgSend_rightNode(v186, v193, v194, v195, v196, v197);
      v203 = objc_msgSend__functionRepresentationRecursive_(self, v199, (uint64_t)v198, v200, v201, v202);

      objc_msgSend_stringWithFormat_(NSString, v204, @"(%@)/(%@)", v205, v206, v207, v192, v203);
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    v208 = objc_msgSend_name(v180, v181, v182, v183, v184, v185);
    int v213 = objc_msgSend_isEqualToString_(v208, v209, @"ScriptArg", v210, v211, v212);

    if (v213)
    {
      v219 = objc_msgSend_rightNode(v16, v214, v215, v216, v217, v218);
      v225 = objc_msgSend_leftNode(v219, v220, v221, v222, v223, v224);
      v231 = objc_msgSend_name(v225, v226, v227, v228, v229, v230);
      int v236 = objc_msgSend_isEqualToString_(v231, v232, @"Sup", v233, v234, v235);

      if (v236)
      {
        v242 = objc_msgSend_rightNode(v219, v237, v238, v239, v240, v241);
        v247 = objc_msgSend__functionRepresentationRecursive_(self, v243, (uint64_t)v242, v244, v245, v246);

        objc_msgSend_stringWithFormat_(NSString, v248, @"pow(%@,%@)", v249, v250, v251, v15, v247);
        v65 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
    }
    v252 = NSString;
    v253 = objc_msgSend_leftNode(v16, v214, v215, v216, v217, v218);
    v259 = objc_msgSend_name(v253, v254, v255, v256, v257, v258);
    v265 = objc_msgSend_rightNode(v16, v260, v261, v262, v263, v264);
    v271 = objc_msgSend_name(v265, v266, v267, v268, v269, v270);
    v276 = objc_msgSend_stringWithFormat_(v252, v272, @"%@ %@", v273, v274, v275, v259, v271);

    v282 = objc_msgSend_leftNode(v16, v277, v278, v279, v280, v281);
    v288 = objc_msgSend_name(v282, v283, v284, v285, v286, v287);
    if ((objc_msgSend_isEqualToString_(v288, v289, @"ClosedExp", v290, v291, v292) & 1) == 0)
    {
      v298 = objc_msgSend_rightNode(v16, v293, v294, v295, v296, v297);
      v304 = objc_msgSend_name(v298, v299, v300, v301, v302, v303);
      if ((objc_msgSend_isEqualToString_(v304, v305, @"ClosedExp", v306, v307, v308) & 1) == 0
        && (objc_msgSend_isEqualToString_(v276, v309, @"Number Variable", v310, v311, v312) & 1) == 0
        && (objc_msgSend_isEqualToString_(v276, v313, @"Variable Number", v314, v315, v316) & 1) == 0)
      {
        char v326 = objc_msgSend_isEqualToString_(v276, v317, @"Variable Variable", v318, v319, v320);

        if ((v326 & 1) == 0)
        {
          uint64_t v325 = objc_msgSend_stringByAppendingString_(v15, v321, (uint64_t)v43, v322, v323, v324);
          goto LABEL_42;
        }
LABEL_41:
        uint64_t v325 = objc_msgSend_stringWithFormat_(NSString, v321, @"(%@)*(%@)", v322, v323, v324, v15, v43);
LABEL_42:
        v65 = (__CFString *)v325;

        goto LABEL_23;
      }
    }
    goto LABEL_41;
  }
  if ((objc_msgSend_isEqualToString_(v15, v33, @"\\cdot", v35, v36, v37) & 1) == 0
    && (objc_msgSend_isEqualToString_(v15, v61, @"\\times", v62, v63, v64) & 1) == 0)
  {
    goto LABEL_25;
  }
  v65 = @"*";
LABEL_24:

  v15 = v65;
LABEL_25:

LABEL_26:
  return v15;
}

- (id)evaluation
{
  return (id)objc_msgSend_evaluationWithVariables_caseSensitive_(self, a2, 0, 1, v2, v3);
}

- (id)evaluationWithVariables:(id)a3
{
  return (id)objc_msgSend_evaluationWithVariables_caseSensitive_(self, a2, (uint64_t)a3, 1, v3, v4);
}

- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4
{
  self->__caseSensitive = a4;
  id v5 = a3;
  uint64_t v11 = objc_msgSend_root(self, v6, v7, v8, v9, v10);
  v15 = objc_msgSend__evaluationRecursive_withVariables_(self, v12, (uint64_t)v11, (uint64_t)v5, v13, v14);

  if (objc_msgSend_isEqualToString_(v15, v16, @"STOP", v17, v18, v19))
  {
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v25 = objc_msgSend_evaluateOpExpPriority_(self, v20, (uint64_t)v15, v21, v22, v23);

    uint64_t v31 = objc_msgSend_formatter(self, v26, v27, v28, v29, v30);
    uint64_t v24 = objc_msgSend_numberFromString_(v31, v32, v25, v33, v34, v35);

    v15 = (void *)v25;
  }

  return v24;
}

- (id)_evaluationRecursive:(id)a3 withVariables:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v14 = objc_msgSend_rightNode(v8, v9, v10, v11, v12, v13);

  if (v14)
  {
    uint64_t v20 = objc_msgSend_leftNode(v8, v15, v16, v17, v18, v19);
    objc_msgSend__evaluationRecursive_withVariables_(self, v21, (uint64_t)v20, (uint64_t)v7, v22, v23);
    uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v24, v25, @"STOP", v26, v27, v28))
    {
      uint64_t v24 = v24;
      uint64_t v34 = v24;
      goto LABEL_17;
    }
    uint64_t v81 = objc_msgSend_rightNode(v8, v29, v30, v31, v32, v33);
    uint64_t v70 = objc_msgSend__evaluationRecursive_withVariables_(self, v82, (uint64_t)v81, (uint64_t)v7, v83, v84);

    if (objc_msgSend_isEqualToString_(v70, v85, @"STOP", v86, v87, v88)) {
      goto LABEL_14;
    }
    uint64_t v94 = objc_msgSend_leftNode(v8, v89, v90, v91, v92, v93);
    v100 = objc_msgSend_name(v94, v95, v96, v97, v98, v99);
    if (objc_msgSend_isEqualToString_(v100, v101, @"LPar", v102, v103, v104)) {
      goto LABEL_11;
    }
    uint64_t v115 = objc_msgSend_leftNode(v8, v105, v106, v107, v108, v109);
    uint64_t v121 = objc_msgSend_name(v115, v116, v117, v118, v119, v120);
    int isEqualToString = objc_msgSend_isEqualToString_(v121, v122, @"LeftPar", v123, v124, v125);

    if (isEqualToString) {
      goto LABEL_14;
    }
    v151 = objc_msgSend_name(v8, v127, v128, v129, v130, v131);
    int v156 = objc_msgSend_isEqualToString_(v151, v152, @"TwoArgs", v153, v154, v155);

    if (v156)
    {
LABEL_30:
      objc_msgSend_stringWithFormat_(NSString, v157, @"%@ %@", v159, v160, v161, v24, v70);
      uint64_t v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v162 = objc_msgSend_name(v8, v157, v158, v159, v160, v161);
    if (objc_msgSend_isEqualToString_(v162, v163, @"OpExp", v164, v165, v166))
    {
LABEL_24:

      goto LABEL_30;
    }
    uint64_t v194 = objc_msgSend_rightNode(v8, v167, v168, v169, v170, v171);
    uint64_t v200 = objc_msgSend_name(v194, v195, v196, v197, v198, v199);
    int v205 = objc_msgSend_isEqualToString_(v200, v201, @"OpExp", v202, v203, v204);

    if (v205) {
      goto LABEL_30;
    }
    uint64_t v207 = objc_msgSend_rightNode(v8, v157, v206, v159, v160, v161);
    int v213 = objc_msgSend_name(v207, v208, v209, v210, v211, v212);
    int v218 = objc_msgSend_isEqualToString_(v213, v214, @"ScriptArg", v215, v216, v217);

    if (v218)
    {
      uint64_t v224 = objc_msgSend_rightNode(v8, v219, v220, v221, v222, v223);
      uint64_t v230 = objc_msgSend_leftNode(v224, v225, v226, v227, v228, v229);
      int v236 = objc_msgSend_name(v230, v231, v232, v233, v234, v235);
      int v241 = objc_msgSend_isEqualToString_(v236, v237, @"Sup", v238, v239, v240);

      if (v241)
      {
        v247 = objc_msgSend_rightNode(v224, v242, v243, v244, v245, v246);
        uint64_t v251 = objc_msgSend__evaluationRecursive_withVariables_(self, v248, (uint64_t)v247, (uint64_t)v7, v249, v250);

        uint64_t v257 = objc_msgSend_formatter(self, v252, v253, v254, v255, v256);
        uint64_t v262 = objc_msgSend_numberFromString_(v257, v258, (uint64_t)v24, v259, v260, v261);
        objc_msgSend_doubleValue(v262, v263, v264, v265, v266, v267);
        long double v269 = v268;

        uint64_t v275 = objc_msgSend_formatter(self, v270, v271, v272, v273, v274);
        uint64_t v280 = objc_msgSend_numberFromString_(v275, v276, (uint64_t)v251, v277, v278, v279);
        objc_msgSend_doubleValue(v280, v281, v282, v283, v284, v285);
        long double v287 = v286;

        double v288 = pow(v269, v287);
        uint64_t v294 = objc_msgSend_formatter(self, v289, v290, v291, v292, v293);
        uint64_t v300 = objc_msgSend_numberWithDouble_(NSNumber, v295, v296, v297, v298, v299, v288);
        objc_msgSend_stringFromNumber_(v294, v301, (uint64_t)v300, v302, v303, v304);
        uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_171:
        goto LABEL_16;
      }
LABEL_170:
      uint64_t v34 = @"STOP";
      goto LABEL_171;
    }
    uint64_t v94 = objc_msgSend_leftNode(v8, v219, v220, v221, v222, v223);
    v100 = objc_msgSend_name(v94, v305, v306, v307, v308, v309);
    if (objc_msgSend_isEqualToString_(v100, v310, @"LPar", v311, v312, v313))
    {
LABEL_11:

LABEL_14:
      uint64_t v132 = v70;
LABEL_15:
      uint64_t v34 = v132;
      goto LABEL_16;
    }
    uint64_t v319 = objc_msgSend_leftNode(v8, v314, v315, v316, v317, v318);
    uint64_t v325 = objc_msgSend_name(v319, v320, v321, v322, v323, v324);
    if (objc_msgSend_isEqualToString_(v325, v326, @"LeftPar", v327, v328, v329))
    {
LABEL_42:

      goto LABEL_11;
    }
    v1641 = objc_msgSend_leftNode(v8, v330, v331, v332, v333, v334);
    v340 = objc_msgSend_name(v1641, v335, v336, v337, v338, v339);
    if (objc_msgSend_isEqualToString_(v340, v341, @"LCurly", v342, v343, v344))
    {
LABEL_41:

      goto LABEL_42;
    }
    v1639 = objc_msgSend_leftNode(v8, v345, v346, v347, v348, v349);
    v1638 = objc_msgSend_name(v1639, v350, v351, v352, v353, v354);
    if (objc_msgSend_isEqualToString_(v1638, v355, @"LeftCurly", v356, v357, v358))
    {
LABEL_40:

      goto LABEL_41;
    }
    v1637 = objc_msgSend_leftNode(v8, v359, v360, v361, v362, v363);
    v1636 = objc_msgSend_name(v1637, v364, v365, v366, v367, v368);
    if (objc_msgSend_isEqualToString_(v1636, v369, @"LBrack", v370, v371, v372))
    {

      goto LABEL_40;
    }
    v1635 = objc_msgSend_leftNode(v8, v373, v374, v375, v376, v377);
    v1634 = objc_msgSend_name(v1635, v378, v379, v380, v381, v382);
    if (objc_msgSend_isEqualToString_(v1634, v383, @"LeftBrack", v384, v385, v386))
    {
      char v1633 = 1;
    }
    else
    {
      v1632 = objc_msgSend_leftNode(v8, v387, v388, v389, v390, v391);
      v1631 = objc_msgSend_name(v1632, v392, v393, v394, v395, v396);
      if (objc_msgSend_isEqualToString_(v1631, v397, @"LAbs", v398, v399, v400))
      {
        char v1633 = 1;
      }
      else
      {
        v1630 = objc_msgSend_leftNode(v8, v401, v402, v403, v404, v405);
        v1629 = objc_msgSend_name(v1630, v406, v407, v408, v409, v410);
        if (objc_msgSend_isEqualToString_(v1629, v411, @"LeftAbs", v412, v413, v414))
        {
          char v1633 = 1;
        }
        else
        {
          v1628 = objc_msgSend_leftNode(v8, v415, v416, v417, v418, v419);
          v1627 = objc_msgSend_name(v1628, v420, v421, v422, v423, v424);
          if (objc_msgSend_isEqualToString_(v1627, v425, @"LAngle", v426, v427, v428))
          {
            char v1633 = 1;
          }
          else
          {
            v1626 = objc_msgSend_leftNode(v8, v429, v430, v431, v432, v433);
            v1625 = objc_msgSend_name(v1626, v434, v435, v436, v437, v438);
            if (objc_msgSend_isEqualToString_(v1625, v439, @"LeftAngle", v440, v441, v442))
            {
              char v1633 = 1;
            }
            else
            {
              v1624 = objc_msgSend_leftNode(v8, v443, v444, v445, v446, v447);
              v1623 = objc_msgSend_name(v1624, v448, v449, v450, v451, v452);
              if (objc_msgSend_isEqualToString_(v1623, v453, @"LFloor", v454, v455, v456))
              {
                char v1633 = 1;
              }
              else
              {
                v1622 = objc_msgSend_leftNode(v8, v457, v458, v459, v460, v461);
                v1621 = objc_msgSend_name(v1622, v462, v463, v464, v465, v466);
                if (objc_msgSend_isEqualToString_(v1621, v467, @"LeftFloor", v468, v469, v470))
                {
                  char v1633 = 1;
                }
                else
                {
                  v1620 = objc_msgSend_leftNode(v8, v471, v472, v473, v474, v475);
                  v1619 = objc_msgSend_name(v1620, v476, v477, v478, v479, v480);
                  if (objc_msgSend_isEqualToString_(v1619, v481, @"LCeil", v482, v483, v484))
                  {
                    char v1633 = 1;
                  }
                  else
                  {
                    v1618 = objc_msgSend_leftNode(v8, v485, v486, v487, v488, v489);
                    v1617 = objc_msgSend_name(v1618, v490, v491, v492, v493, v494);
                    char v1633 = objc_msgSend_isEqualToString_(v1617, v495, @"LeftCeil", v496, v497, v498);
                  }
                }
              }
            }
          }
        }
      }
    }

    if (v1633) {
      goto LABEL_14;
    }
    v504 = objc_msgSend_name(v8, v499, v500, v501, v502, v503);
    if (objc_msgSend_isEqualToString_(v504, v505, @"ExpRPar", v506, v507, v508)) {
      goto LABEL_77;
    }
    v514 = objc_msgSend_name(v8, v509, v510, v511, v512, v513);
    if (objc_msgSend_isEqualToString_(v514, v515, @"ExpRightPar", v516, v517, v518))
    {
LABEL_76:

LABEL_77:
      goto LABEL_78;
    }
    v524 = objc_msgSend_name(v8, v519, v520, v521, v522, v523);
    if (objc_msgSend_isEqualToString_(v524, v525, @"ExpRCurly", v526, v527, v528))
    {
LABEL_75:

      goto LABEL_76;
    }
    v534 = objc_msgSend_name(v8, v529, v530, v531, v532, v533);
    if (objc_msgSend_isEqualToString_(v534, v535, @"ExpRightCurly", v536, v537, v538))
    {
LABEL_74:

      goto LABEL_75;
    }
    v544 = objc_msgSend_name(v8, v539, v540, v541, v542, v543);
    if (objc_msgSend_isEqualToString_(v544, v545, @"ExpRAngle", v546, v547, v548))
    {

      goto LABEL_74;
    }
    v1640 = objc_msgSend_name(v8, v549, v550, v551, v552, v553);
    char v1642 = objc_msgSend_isEqualToString_(v1640, v558, @"ExpRightAngle", v559, v560, v561);

    if (v1642) {
      goto LABEL_78;
    }
    v563 = objc_msgSend_name(v8, v554, v562, v555, v556, v557);
    if (objc_msgSend_isEqualToString_(v563, v564, @"ExpRAbs", v565, v566, v567))
    {

LABEL_83:
      v584 = objc_msgSend_formatter(self, v573, v574, v575, v576, v577);
      v589 = objc_msgSend_evaluateOpExpPriority_(self, v585, (uint64_t)v24, v586, v587, v588);
      v594 = objc_msgSend_numberFromString_(v584, v590, (uint64_t)v589, v591, v592, v593);
      objc_msgSend_doubleValue(v594, v595, v596, v597, v598, v599);
      double v601 = v600;

      v607 = objc_msgSend_formatter(self, v602, v603, v604, v605, v606);
      objc_msgSend_numberWithDouble_(NSNumber, v608, v609, v610, v611, v612, fabs(v601));
      v613 = LABEL_84:;
      objc_msgSend_stringFromNumber_(v607, v614, (uint64_t)v613, v615, v616, v617);
      uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v578 = objc_msgSend_name(v8, v568, v569, v570, v571, v572);
    int v583 = objc_msgSend_isEqualToString_(v578, v579, @"ExpRightAbs", v580, v581, v582);

    if (v583) {
      goto LABEL_83;
    }
    v618 = objc_msgSend_name(v8, v573, v574, v575, v576, v577);
    if (objc_msgSend_isEqualToString_(v618, v619, @"ExpRFloor", v620, v621, v622))
    {

LABEL_88:
      v639 = objc_msgSend_formatter(self, v628, v629, v630, v631, v632);
      v644 = objc_msgSend_evaluateOpExpPriority_(self, v640, (uint64_t)v24, v641, v642, v643);
      v649 = objc_msgSend_numberFromString_(v639, v645, (uint64_t)v644, v646, v647, v648);
      objc_msgSend_doubleValue(v649, v650, v651, v652, v653, v654);
      double v656 = v655;

      v607 = objc_msgSend_formatter(self, v657, v658, v659, v660, v661);
      objc_msgSend_numberWithDouble_(NSNumber, v662, v663, v664, v665, v666, floor(v656));
      goto LABEL_84;
    }
    v633 = objc_msgSend_name(v8, v623, v624, v625, v626, v627);
    int v638 = objc_msgSend_isEqualToString_(v633, v634, @"ExpRightFloor", v635, v636, v637);

    if (v638) {
      goto LABEL_88;
    }
    v667 = objc_msgSend_name(v8, v628, v629, v630, v631, v632);
    if (objc_msgSend_isEqualToString_(v667, v668, @"ExpRCeil", v669, v670, v671))
    {

LABEL_92:
      v688 = objc_msgSend_formatter(self, v677, v678, v679, v680, v681);
      v693 = objc_msgSend_evaluateOpExpPriority_(self, v689, (uint64_t)v24, v690, v691, v692);
      v698 = objc_msgSend_numberFromString_(v688, v694, (uint64_t)v693, v695, v696, v697);
      objc_msgSend_doubleValue(v698, v699, v700, v701, v702, v703);
      double v705 = v704;

      v607 = objc_msgSend_formatter(self, v706, v707, v708, v709, v710);
      objc_msgSend_numberWithDouble_(NSNumber, v711, v712, v713, v714, v715, ceil(v705));
      goto LABEL_84;
    }
    v682 = objc_msgSend_name(v8, v672, v673, v674, v675, v676);
    int v687 = objc_msgSend_isEqualToString_(v682, v683, @"ExpRightCeil", v684, v685, v686);

    if (v687) {
      goto LABEL_92;
    }
    v716 = objc_msgSend_name(v8, v677, v678, v679, v680, v681);
    int v721 = objc_msgSend_isEqualToString_(v716, v717, @"Arg", v718, v719, v720);

    if (v721) {
      goto LABEL_14;
    }
    v727 = objc_msgSend_name(v8, v722, v723, v724, v725, v726);
    int v732 = objc_msgSend_isEqualToString_(v727, v728, @"ExpRArgCurly", v729, v730, v731);

    if (v732)
    {
LABEL_78:
      objc_msgSend_evaluateOpExpPriority_(self, v554, (uint64_t)v24, v555, v556, v557);
      uint64_t v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v162 = objc_msgSend_name(v8, v554, v733, v555, v556, v557);
    if (objc_msgSend_isEqualToString_(v162, v734, @"TwoArgs", v735, v736, v737)) {
      goto LABEL_24;
    }
    v743 = objc_msgSend_name(v8, v738, v739, v740, v741, v742);
    if (objc_msgSend_isEqualToString_(v743, v744, @"ScriptArg", v745, v746, v747))
    {

      goto LABEL_24;
    }
    v753 = objc_msgSend_name(v8, v748, v749, v750, v751, v752);
    char v758 = objc_msgSend_isEqualToString_(v753, v754, @"ScriptArgs", v755, v756, v757);

    if (v758) {
      goto LABEL_30;
    }
    v760 = objc_msgSend_rightNode(v8, v157, v759, v159, v160, v161);
    v766 = objc_msgSend_name(v760, v761, v762, v763, v764, v765);
    int v771 = objc_msgSend_isEqualToString_(v766, v767, @"Eq", v768, v769, v770);

    if (v771)
    {
      uint64_t v132 = v24;
      goto LABEL_15;
    }
    v777 = objc_msgSend_leftNode(v8, v772, v773, v774, v775, v776);
    v783 = objc_msgSend_name(v777, v778, v779, v780, v781, v782);
    int v788 = objc_msgSend_isEqualToString_(v783, v784, @"Frac", v785, v786, v787);

    if (v788)
    {
      uint64_t v224 = objc_msgSend_rightNode(v8, v789, v790, v791, v792, v793);
      v799 = objc_msgSend_leftNode(v224, v794, v795, v796, v797, v798);
      v803 = objc_msgSend__evaluationRecursive_withVariables_(self, v800, (uint64_t)v799, (uint64_t)v7, v801, v802);

      v809 = objc_msgSend_rightNode(v224, v804, v805, v806, v807, v808);
      v813 = objc_msgSend__evaluationRecursive_withVariables_(self, v810, (uint64_t)v809, (uint64_t)v7, v811, v812);

      uint64_t v34 = @"STOP";
      if ((objc_msgSend_isEqualToString_(v803, v814, @"STOP", v815, v816, v817) & 1) == 0
        && (objc_msgSend_isEqualToString_(v813, v818, @"STOP", v819, v820, v821) & 1) == 0)
      {
        v827 = objc_msgSend_formatter(self, v822, v823, v824, v825, v826);
        v832 = objc_msgSend_numberFromString_(v827, v828, (uint64_t)v803, v829, v830, v831);
        objc_msgSend_doubleValue(v832, v833, v834, v835, v836, v837);
        double v839 = v838;

        v845 = objc_msgSend_formatter(self, v840, v841, v842, v843, v844);
        v850 = objc_msgSend_numberFromString_(v845, v846, (uint64_t)v813, v847, v848, v849);
        objc_msgSend_doubleValue(v850, v851, v852, v853, v854, v855);
        double v857 = v856;

        v863 = objc_msgSend_formatter(self, v858, v859, v860, v861, v862);
        v869 = objc_msgSend_numberWithDouble_(NSNumber, v864, v865, v866, v867, v868, v839 / v857);
        objc_msgSend_stringFromNumber_(v863, v870, (uint64_t)v869, v871, v872, v873);
        uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_171;
    }
    v874 = objc_msgSend_leftNode(v8, v789, v790, v791, v792, v793);
    v880 = objc_msgSend_name(v874, v875, v876, v877, v878, v879);
    int v885 = objc_msgSend_isEqualToString_(v880, v881, @"Sqrt", v882, v883, v884);

    if (v885)
    {
      v891 = objc_msgSend_formatter(self, v886, v887, v888, v889, v890);
      v896 = objc_msgSend_numberFromString_(v891, v892, (uint64_t)v70, v893, v894, v895);
      objc_msgSend_doubleValue(v896, v897, v898, v899, v900, v901);
      double v903 = v902;

      v607 = objc_msgSend_formatter(self, v904, v905, v906, v907, v908);
      objc_msgSend_numberWithDouble_(NSNumber, v909, v910, v911, v912, v913, sqrt(v903));
      goto LABEL_84;
    }
    v914 = objc_msgSend_leftNode(v8, v886, v887, v888, v889, v890);
    v920 = objc_msgSend_name(v914, v915, v916, v917, v918, v919);
    int v925 = objc_msgSend_isEqualToString_(v920, v921, @"Sin", v922, v923, v924);

    if (v925)
    {
      v931 = objc_msgSend_formatter(self, v926, v927, v928, v929, v930);
      v936 = objc_msgSend_numberFromString_(v931, v932, (uint64_t)v70, v933, v934, v935);
      objc_msgSend_doubleValue(v936, v937, v938, v939, v940, v941);
      long double v943 = v942;

      v607 = objc_msgSend_formatter(self, v944, v945, v946, v947, v948);
      v949 = NSNumber;
      double v955 = sin(v943);
LABEL_119:
      objc_msgSend_numberWithDouble_(v949, v950, v951, v952, v953, v954, v955);
      goto LABEL_84;
    }
    v956 = objc_msgSend_leftNode(v8, v926, v927, v928, v929, v930);
    v962 = objc_msgSend_name(v956, v957, v958, v959, v960, v961);
    int v967 = objc_msgSend_isEqualToString_(v962, v963, @"Cos", v964, v965, v966);

    if (v967)
    {
      v973 = objc_msgSend_formatter(self, v968, v969, v970, v971, v972);
      v978 = objc_msgSend_numberFromString_(v973, v974, (uint64_t)v70, v975, v976, v977);
      objc_msgSend_doubleValue(v978, v979, v980, v981, v982, v983);
      long double v985 = v984;

      v607 = objc_msgSend_formatter(self, v986, v987, v988, v989, v990);
      v949 = NSNumber;
      double v955 = cos(v985);
      goto LABEL_119;
    }
    v991 = objc_msgSend_leftNode(v8, v968, v969, v970, v971, v972);
    v997 = objc_msgSend_name(v991, v992, v993, v994, v995, v996);
    int v1002 = objc_msgSend_isEqualToString_(v997, v998, @"Tan", v999, v1000, v1001);

    if (v1002)
    {
      v1008 = objc_msgSend_formatter(self, v1003, v1004, v1005, v1006, v1007);
      v1013 = objc_msgSend_numberFromString_(v1008, v1009, (uint64_t)v70, v1010, v1011, v1012);
      objc_msgSend_doubleValue(v1013, v1014, v1015, v1016, v1017, v1018);
      double v1020 = v1019;

      v607 = objc_msgSend_formatter(self, v1021, v1022, v1023, v1024, v1025);
      v949 = NSNumber;
      double v1026 = v1020;
LABEL_118:
      double v955 = tan(v1026);
      goto LABEL_119;
    }
    v1027 = objc_msgSend_leftNode(v8, v1003, v1004, v1005, v1006, v1007);
    v1033 = objc_msgSend_name(v1027, v1028, v1029, v1030, v1031, v1032);
    int v1038 = objc_msgSend_isEqualToString_(v1033, v1034, @"Arctan", v1035, v1036, v1037);

    if (v1038)
    {
      v1044 = objc_msgSend_formatter(self, v1039, v1040, v1041, v1042, v1043);
      v1049 = objc_msgSend_numberFromString_(v1044, v1045, (uint64_t)v70, v1046, v1047, v1048);
      objc_msgSend_doubleValue(v1049, v1050, v1051, v1052, v1053, v1054);
      long double v1056 = v1055;

      v607 = objc_msgSend_formatter(self, v1057, v1058, v1059, v1060, v1061);
      v949 = NSNumber;
      double v955 = atan(v1056);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1039, @"\\cot", v1041, v1042, v1043))
    {
      v1067 = objc_msgSend_formatter(self, v1062, v1063, v1064, v1065, v1066);
      v1072 = objc_msgSend_numberFromString_(v1067, v1068, (uint64_t)v70, v1069, v1070, v1071);
      objc_msgSend_doubleValue(v1072, v1073, v1074, v1075, v1076, v1077);
      double v1079 = v1078;

      v607 = objc_msgSend_formatter(self, v1080, v1081, v1082, v1083, v1084);
      v949 = NSNumber;
      double v1026 = 1.57079633 - v1079;
      goto LABEL_118;
    }
    if (objc_msgSend_isEqualToString_(v24, v1062, @"\\arcsin", v1064, v1065, v1066))
    {
      v1090 = objc_msgSend_formatter(self, v1085, v1086, v1087, v1088, v1089);
      v1095 = objc_msgSend_numberFromString_(v1090, v1091, (uint64_t)v70, v1092, v1093, v1094);
      objc_msgSend_doubleValue(v1095, v1096, v1097, v1098, v1099, v1100);
      long double v1102 = v1101;

      v607 = objc_msgSend_formatter(self, v1103, v1104, v1105, v1106, v1107);
      v949 = NSNumber;
      double v955 = asin(v1102);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1085, @"\\arccos", v1087, v1088, v1089))
    {
      v1113 = objc_msgSend_formatter(self, v1108, v1109, v1110, v1111, v1112);
      v1118 = objc_msgSend_numberFromString_(v1113, v1114, (uint64_t)v70, v1115, v1116, v1117);
      objc_msgSend_doubleValue(v1118, v1119, v1120, v1121, v1122, v1123);
      long double v1125 = v1124;

      v607 = objc_msgSend_formatter(self, v1126, v1127, v1128, v1129, v1130);
      v949 = NSNumber;
      double v955 = acos(v1125);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1108, @"\\sinh", v1110, v1111, v1112))
    {
      v1136 = objc_msgSend_formatter(self, v1131, v1132, v1133, v1134, v1135);
      v1141 = objc_msgSend_numberFromString_(v1136, v1137, (uint64_t)v70, v1138, v1139, v1140);
      objc_msgSend_doubleValue(v1141, v1142, v1143, v1144, v1145, v1146);
      long double v1148 = v1147;

      v607 = objc_msgSend_formatter(self, v1149, v1150, v1151, v1152, v1153);
      v949 = NSNumber;
      double v955 = sinh(v1148);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1131, @"\\cosh", v1133, v1134, v1135))
    {
      v1159 = objc_msgSend_formatter(self, v1154, v1155, v1156, v1157, v1158);
      v1164 = objc_msgSend_numberFromString_(v1159, v1160, (uint64_t)v70, v1161, v1162, v1163);
      objc_msgSend_doubleValue(v1164, v1165, v1166, v1167, v1168, v1169);
      long double v1171 = v1170;

      v607 = objc_msgSend_formatter(self, v1172, v1173, v1174, v1175, v1176);
      v949 = NSNumber;
      double v955 = cosh(v1171);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1154, @"\\tanh", v1156, v1157, v1158))
    {
      v1182 = objc_msgSend_formatter(self, v1177, v1178, v1179, v1180, v1181);
      v1187 = objc_msgSend_numberFromString_(v1182, v1183, (uint64_t)v70, v1184, v1185, v1186);
      objc_msgSend_doubleValue(v1187, v1188, v1189, v1190, v1191, v1192);
      long double v1194 = v1193;

      v607 = objc_msgSend_formatter(self, v1195, v1196, v1197, v1198, v1199);
      v949 = NSNumber;
      double v955 = tanh(v1194);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1177, @"\\coth", v1179, v1180, v1181))
    {
      v1205 = objc_msgSend_formatter(self, v1200, v1201, v1202, v1203, v1204);
      v1210 = objc_msgSend_numberFromString_(v1205, v1206, (uint64_t)v70, v1207, v1208, v1209);
      objc_msgSend_doubleValue(v1210, v1211, v1212, v1213, v1214, v1215);
      long double v1217 = v1216;

      v607 = objc_msgSend_formatter(self, v1218, v1219, v1220, v1221, v1222);
      v949 = NSNumber;
      double v955 = 1.0 / tanh(v1217);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1200, @"\\exp", v1202, v1203, v1204))
    {
      v1228 = objc_msgSend_formatter(self, v1223, v1224, v1225, v1226, v1227);
      v1233 = objc_msgSend_numberFromString_(v1228, v1229, (uint64_t)v70, v1230, v1231, v1232);
      objc_msgSend_doubleValue(v1233, v1234, v1235, v1236, v1237, v1238);
      long double v1240 = v1239;

      v607 = objc_msgSend_formatter(self, v1241, v1242, v1243, v1244, v1245);
      v949 = NSNumber;
      double v955 = exp(v1240);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1223, @"\\log", v1225, v1226, v1227))
    {
      v1251 = objc_msgSend_formatter(self, v1246, v1247, v1248, v1249, v1250);
      v1256 = objc_msgSend_numberFromString_(v1251, v1252, (uint64_t)v70, v1253, v1254, v1255);
      objc_msgSend_doubleValue(v1256, v1257, v1258, v1259, v1260, v1261);
      long double v1263 = v1262;

      v607 = objc_msgSend_formatter(self, v1264, v1265, v1266, v1267, v1268);
      v949 = NSNumber;
      double v955 = log10(v1263);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1246, @"\\ln", v1248, v1249, v1250))
    {
      v1274 = objc_msgSend_formatter(self, v1269, v1270, v1271, v1272, v1273);
      v1279 = objc_msgSend_numberFromString_(v1274, v1275, (uint64_t)v70, v1276, v1277, v1278);
      objc_msgSend_doubleValue(v1279, v1280, v1281, v1282, v1283, v1284);
      long double v1286 = v1285;

      v607 = objc_msgSend_formatter(self, v1287, v1288, v1289, v1290, v1291);
      v949 = NSNumber;
      double v955 = log(v1286);
      goto LABEL_119;
    }
    if (objc_msgSend_isEqualToString_(v24, v1269, @"\\lg", v1271, v1272, v1273))
    {
      v1297 = objc_msgSend_formatter(self, v1292, v1293, v1294, v1295, v1296);
      v1302 = objc_msgSend_numberFromString_(v1297, v1298, (uint64_t)v70, v1299, v1300, v1301);
      objc_msgSend_doubleValue(v1302, v1303, v1304, v1305, v1306, v1307);
      long double v1309 = v1308;

      v607 = objc_msgSend_formatter(self, v1310, v1311, v1312, v1313, v1314);
      v949 = NSNumber;
      double v955 = log2(v1309);
      goto LABEL_119;
    }
    v1315 = objc_msgSend_leftNode(v8, v1292, v1293, v1294, v1295, v1296);
    v1321 = objc_msgSend_name(v1315, v1316, v1317, v1318, v1319, v1320);
    if (objc_msgSend_isEqualToString_(v1321, v1322, @"UnOp", v1323, v1324, v1325))
    {
      int v1330 = objc_msgSend_isEqualToString_(v24, v1326, @"-", v1327, v1328, v1329);

      if (v1330)
      {
        v1336 = objc_msgSend_formatter(self, v1331, v1332, v1333, v1334, v1335);
        v1341 = objc_msgSend_numberFromString_(v1336, v1337, (uint64_t)v70, v1338, v1339, v1340);
        objc_msgSend_doubleValue(v1341, v1342, v1343, v1344, v1345, v1346);
        double v1348 = v1347;

        v607 = objc_msgSend_formatter(self, v1349, v1350, v1351, v1352, v1353);
        objc_msgSend_numberWithDouble_(NSNumber, v1354, v1355, v1356, v1357, v1358, -v1348);
        goto LABEL_84;
      }
    }
    else
    {
    }
    v1359 = objc_msgSend_rightNode(v8, v1331, v1332, v1333, v1334, v1335);
    v1365 = objc_msgSend_name(v1359, v1360, v1361, v1362, v1363, v1364);
    int v1370 = objc_msgSend_isEqualToString_(v1365, v1366, @"Fact", v1367, v1368, v1369);

    if (v1370)
    {
      v1376 = objc_msgSend_formatter(self, v1371, v1372, v1373, v1374, v1375);
      v1381 = objc_msgSend_numberFromString_(v1376, v1377, (uint64_t)v24, v1378, v1379, v1380);
      objc_msgSend_doubleValue(v1381, v1382, v1383, v1384, v1385, v1386);
      double v1388 = v1387;

      v607 = objc_msgSend_formatter(self, v1389, v1390, v1391, v1392, v1393);
      v949 = NSNumber;
      double v955 = tgamma(v1388 + 1.0);
      goto LABEL_119;
    }
    v1394 = NSString;
    v1395 = objc_msgSend_leftNode(v8, v1371, v1372, v1373, v1374, v1375);
    v1401 = objc_msgSend_name(v1395, v1396, v1397, v1398, v1399, v1400);
    v1407 = objc_msgSend_rightNode(v8, v1402, v1403, v1404, v1405, v1406);
    v1413 = objc_msgSend_name(v1407, v1408, v1409, v1410, v1411, v1412);
    uint64_t v224 = objc_msgSend_stringWithFormat_(v1394, v1414, @"%@ %@", v1415, v1416, v1417, v1401, v1413);

    v1423 = objc_msgSend_leftNode(v8, v1418, v1419, v1420, v1421, v1422);
    v1429 = objc_msgSend_name(v1423, v1424, v1425, v1426, v1427, v1428);
    if (objc_msgSend_isEqualToString_(v1429, v1430, @"ClosedExp", v1431, v1432, v1433)) {
      goto LABEL_152;
    }
    v1439 = objc_msgSend_rightNode(v8, v1434, v1435, v1436, v1437, v1438);
    v1445 = objc_msgSend_name(v1439, v1440, v1441, v1442, v1443, v1444);
    if ((objc_msgSend_isEqualToString_(v1445, v1446, @"ClosedExp", v1447, v1448, v1449) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1450, @"Number Variable", v1451, v1452, v1453) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1454, @"Variable Number", v1455, v1456, v1457) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1458, @"Variable Variable", v1459, v1460, v1461) & 1) != 0)
    {

LABEL_152:
LABEL_153:
      v1471 = objc_msgSend_formatter(self, v1466, v1467, v1468, v1469, v1470);
      v1476 = objc_msgSend_numberFromString_(v1471, v1472, (uint64_t)v24, v1473, v1474, v1475);
      objc_msgSend_doubleValue(v1476, v1477, v1478, v1479, v1480, v1481);
      double v1483 = v1482;

      v1489 = objc_msgSend_formatter(self, v1484, v1485, v1486, v1487, v1488);
      v1494 = objc_msgSend_numberFromString_(v1489, v1490, (uint64_t)v70, v1491, v1492, v1493);
      objc_msgSend_doubleValue(v1494, v1495, v1496, v1497, v1498, v1499);
      double v1501 = v1500;

      v1507 = objc_msgSend_formatter(self, v1502, v1503, v1504, v1505, v1506);
      v1513 = objc_msgSend_numberWithDouble_(NSNumber, v1508, v1509, v1510, v1511, v1512, v1483 * v1501);
      objc_msgSend_stringFromNumber_(v1507, v1514, (uint64_t)v1513, v1515, v1516, v1517);
      uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_171;
    }
    char v1643 = objc_msgSend_isEqualToString_(v224, v1462, @"Variable VarVar", v1463, v1464, v1465);

    if (v1643) {
      goto LABEL_153;
    }
    v1518 = objc_msgSend_name(v8, v1466, v1467, v1468, v1469, v1470);
    if (objc_msgSend_isEqualToString_(v1518, v1519, @"EntriesHLine", v1520, v1521, v1522))
    {

      v1528 = v24;
      goto LABEL_169;
    }
    v1529 = objc_msgSend_name(v8, v1523, v1524, v1525, v1526, v1527);
    int v1534 = objc_msgSend_isEqualToString_(v1529, v1530, @"NumberLinebreak", v1531, v1532, v1533);

    if (v1534)
    {
      v1528 = v24;
      goto LABEL_169;
    }
    v1540 = objc_msgSend_leftNode(v8, v1535, v1536, v1537, v1538, v1539);
    v1546 = objc_msgSend_name(v1540, v1541, v1542, v1543, v1544, v1545);
    if (objc_msgSend_isEqualToString_(v1546, v1547, @"OpenVerticalMath", v1548, v1549, v1550))
    {

      v1528 = v70;
      goto LABEL_169;
    }
    v1556 = objc_msgSend_name(v8, v1551, v1552, v1553, v1554, v1555);
    int v1561 = objc_msgSend_isEqualToString_(v1556, v1557, @"AndNumberLinebreak", v1558, v1559, v1560);

    if (!v1561)
    {
      v1567 = objc_msgSend_name(v8, v1562, v1563, v1564, v1565, v1566);
      int v1572 = objc_msgSend_isEqualToString_(v1567, v1568, @"Entries", v1569, v1570, v1571);

      if (v1572) {
        goto LABEL_166;
      }
      v1578 = objc_msgSend_name(v8, v1573, v1574, v1575, v1576, v1577);
      int v1583 = objc_msgSend_isEqualToString_(v1578, v1579, @"Entry", v1580, v1581, v1582);

      if (!v1583)
      {
        v1601 = objc_msgSend_rightNode(v8, v1584, v1585, v1586, v1587, v1588);
        v1607 = objc_msgSend_name(v1601, v1602, v1603, v1604, v1605, v1606);
        int v1612 = objc_msgSend_isEqualToString_(v1607, v1608, @"CloseVerticalMath", v1609, v1610, v1611);

        if (!v1612) {
          goto LABEL_170;
        }
        objc_msgSend_evaluateVerticalMath_(self, v1613, (uint64_t)v24, v1614, v1615, v1616);
        v1528 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_169:
        uint64_t v34 = v1528;
        goto LABEL_171;
      }
      v1589 = objc_msgSend_leftNode(v8, v1584, v1585, v1586, v1587, v1588);
      v1595 = objc_msgSend_name(v1589, v1590, v1591, v1592, v1593, v1594);
      int v1600 = objc_msgSend_isEqualToString_(v1595, v1596, @"Op", v1597, v1598, v1599);

      if (v1600)
      {
LABEL_166:
        objc_msgSend_stringWithFormat_(NSString, v1573, @"%@ %@", v1575, v1576, v1577, v24, v70);
        v1528 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_169;
      }
    }
    v1528 = v70;
    goto LABEL_169;
  }
  uint64_t v35 = objc_msgSend_name(v8, v15, v16, v17, v18, v19);
  int v40 = objc_msgSend_isEqualToString_(v35, v36, @"Variable", v37, v38, v39);

  if (!v40)
  {
    objc_msgSend_leftNode(v8, v41, v42, v43, v44, v45);
    uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getStringValue(v24, v110, v111, v112, v113, v114);
    uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  BOOL caseSensitive = self->__caseSensitive;
  uint64_t v47 = objc_msgSend_leftNode(v8, v41, v42, v43, v44, v45);
  objc_msgSend_name(v47, v48, v49, v50, v51, v52);
  uint64_t v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v53;
  if (!caseSensitive)
  {
    uint64_t v59 = objc_msgSend_lowercaseString(v53, v54, v55, v56, v57, v58);

    uint64_t v24 = (__CFString *)v59;
  }

  uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v7, v60, (uint64_t)v24, v61, v62, v63);

  if (v64)
  {
    uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v7, v65, (uint64_t)v24, v67, v68, v69);
    uint64_t v76 = objc_msgSend_formatter(self, v71, v72, v73, v74, v75);
    objc_msgSend_stringFromNumber_(v76, v77, (uint64_t)v70, v78, v79, v80);
    uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  v134 = objc_msgSend_leftNode(v8, v65, v66, v67, v68, v69);
  v140 = objc_msgSend_name(v134, v135, v136, v137, v138, v139);
  int v145 = objc_msgSend_isEqualToString_(v140, v141, @"e", v142, v143, v144);

  if (v145)
  {
    objc_msgSend_stringWithFormat_(NSString, v146, @"%0.9f", v148, v149, v150, 0x4005BF0A8B145769);
LABEL_27:
    uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  uint64_t v172 = objc_msgSend_leftNode(v8, v146, v147, v148, v149, v150);
  uint64_t v178 = objc_msgSend_name(v172, v173, v174, v175, v176, v177);
  uint64_t v184 = objc_msgSend_lowercaseString(v178, v179, v180, v181, v182, v183);
  int v189 = objc_msgSend_isEqualToString_(v184, v185, @"\\pi", v186, v187, v188);

  if (v189)
  {
    objc_msgSend_stringWithFormat_(NSString, v190, @"%0.9f", v191, v192, v193, 0x400921FB54442D18);
    goto LABEL_27;
  }
  uint64_t v34 = @"STOP";
LABEL_17:

  return v34;
}

- (id)evaluateOpExpPriority:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_componentsSeparatedByString_(v4, v5, @" ", v6, v7, v8);
  v15 = objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);

  if (objc_msgSend_count(v15, v16, v17, v18, v19, v20) != 1)
  {
    if (objc_msgSend_count(v15, v21, v22, v23, v24, v25))
    {
      if ((unint64_t)objc_msgSend_count(v15, v27, v28, v29, v30, v31) >= 2)
      {
        unint64_t v37 = 1;
        while (1)
        {
          uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v15, v32, v37, v34, v35, v36);
          if (objc_msgSend_isEqualToString_(v38, v39, @"\\times", v40, v41, v42)) {
            goto LABEL_9;
          }
          uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v15, v43, v37, v44, v45, v46);
          if (objc_msgSend_isEqualToString_(v47, v48, @"\\cdot", v49, v50, v51)) {
            break;
          }
          uint64_t v132 = objc_msgSend_objectAtIndexedSubscript_(v15, v52, v37, v53, v54, v55);
          char isEqualToString = objc_msgSend_isEqualToString_(v132, v133, @"\\ast", v134, v135, v136);

          if (isEqualToString) {
            goto LABEL_10;
          }
          uint64_t v138 = objc_msgSend_objectAtIndexedSubscript_(v15, v56, v37, v58, v59, v60);
          if (objc_msgSend_isEqualToString_(v138, v139, @"/", v140, v141, v142)) {
            goto LABEL_18;
          }
          uint64_t v147 = objc_msgSend_objectAtIndexedSubscript_(v15, v143, v37, v144, v145, v146);
          if (objc_msgSend_isEqualToString_(v147, v148, @"\\div", v149, v150, v151))
          {

LABEL_18:
LABEL_19:
            uint64_t v161 = objc_msgSend_formatter(self, v156, v157, v158, v159, v160);
            uint64_t v62 = v37 - 1;
            uint64_t v166 = objc_msgSend_objectAtIndexedSubscript_(v15, v162, v37 - 1, v163, v164, v165);
            uint64_t v171 = objc_msgSend_numberFromString_(v161, v167, (uint64_t)v166, v168, v169, v170);
            objc_msgSend_doubleValue(v171, v172, v173, v174, v175, v176);
            double v178 = v177;

            uint64_t v184 = objc_msgSend_formatter(self, v179, v180, v181, v182, v183);
            int v189 = objc_msgSend_objectAtIndexedSubscript_(v15, v185, v37 + 1, v186, v187, v188);
            uint64_t v194 = objc_msgSend_numberFromString_(v184, v190, (uint64_t)v189, v191, v192, v193);
            objc_msgSend_doubleValue(v194, v195, v196, v197, v198, v199);
            double v201 = v200;

            double v106 = v178 / v201;
            goto LABEL_11;
          }
          uint64_t v202 = objc_msgSend_objectAtIndexedSubscript_(v15, v152, v37, v153, v154, v155);
          char v207 = objc_msgSend_isEqualToString_(v202, v203, @":", v204, v205, v206);

          if (v207) {
            goto LABEL_19;
          }
          v208 = objc_msgSend_objectAtIndexedSubscript_(v15, v156, v37, v158, v159, v160);
          int v213 = objc_msgSend_isEqualToString_(v208, v209, @"^", v210, v211, v212);

          if (!v213) {
            goto LABEL_12;
          }
          v214 = objc_msgSend_formatter(self, v127, v128, v129, v130, v131);
          uint64_t v62 = v37 - 1;
          v219 = objc_msgSend_objectAtIndexedSubscript_(v15, v215, v37 - 1, v216, v217, v218);
          uint64_t v224 = objc_msgSend_numberFromString_(v214, v220, (uint64_t)v219, v221, v222, v223);
          objc_msgSend_doubleValue(v224, v225, v226, v227, v228, v229);
          long double v231 = v230;

          v237 = objc_msgSend_formatter(self, v232, v233, v234, v235, v236);
          v242 = objc_msgSend_objectAtIndexedSubscript_(v15, v238, v37 + 1, v239, v240, v241);
          v247 = objc_msgSend_numberFromString_(v237, v243, (uint64_t)v242, v244, v245, v246);
          objc_msgSend_doubleValue(v247, v248, v249, v250, v251, v252);
          long double v254 = v253;

          double v106 = pow(v231, v254);
LABEL_11:
          objc_msgSend_removeObjectsInRange_(v15, v103, v62, 3, v104, v105);
          uint64_t v112 = objc_msgSend_formatter(self, v107, v108, v109, v110, v111);
          uint64_t v118 = objc_msgSend_numberWithDouble_(NSNumber, v113, v114, v115, v116, v117, v106);
          uint64_t v123 = objc_msgSend_stringFromNumber_(v112, v119, (uint64_t)v118, v120, v121, v122);

          objc_msgSend_insertObject_atIndex_(v15, v124, (uint64_t)v123, v62, v125, v126);
          v37 -= 2;

LABEL_12:
          v37 += 2;
          if (v37 >= objc_msgSend_count(v15, v127, v128, v129, v130, v131)) {
            goto LABEL_23;
          }
        }

LABEL_9:
LABEL_10:
        uint64_t v61 = objc_msgSend_formatter(self, v56, v57, v58, v59, v60);
        uint64_t v62 = v37 - 1;
        uint64_t v67 = objc_msgSend_objectAtIndexedSubscript_(v15, v63, v37 - 1, v64, v65, v66);
        uint64_t v72 = objc_msgSend_numberFromString_(v61, v68, (uint64_t)v67, v69, v70, v71);
        objc_msgSend_doubleValue(v72, v73, v74, v75, v76, v77);
        double v79 = v78;

        uint64_t v85 = objc_msgSend_formatter(self, v80, v81, v82, v83, v84);
        uint64_t v90 = objc_msgSend_objectAtIndexedSubscript_(v15, v86, v37 + 1, v87, v88, v89);
        v95 = objc_msgSend_numberFromString_(v85, v91, (uint64_t)v90, v92, v93, v94);
        objc_msgSend_doubleValue(v95, v96, v97, v98, v99, v100);
        double v102 = v101;

        double v106 = v79 * v102;
        goto LABEL_11;
      }
LABEL_23:
      if (objc_msgSend_count(v15, v32, v33, v34, v35, v36) != 1)
      {
        if ((objc_msgSend_count(v15, v255, v256, v257, v258, v259) & 1) == 0) {
          goto LABEL_25;
        }
        if ((unint64_t)objc_msgSend_count(v15, v260, v261, v262, v263, v264) >= 2)
        {
          uint64_t v265 = @"STOP";
          do
          {
            uint64_t v293 = objc_msgSend_formatter(self, v255, v266, v257, v258, v259);
            uint64_t v298 = objc_msgSend_objectAtIndexedSubscript_(v15, v294, 0, v295, v296, v297);
            uint64_t v303 = objc_msgSend_numberFromString_(v293, v299, (uint64_t)v298, v300, v301, v302);
            objc_msgSend_doubleValue(v303, v304, v305, v306, v307, v308);
            double v310 = v309;

            uint64_t v316 = objc_msgSend_formatter(self, v311, v312, v313, v314, v315);
            uint64_t v321 = objc_msgSend_objectAtIndexedSubscript_(v15, v317, 2, v318, v319, v320);
            char v326 = objc_msgSend_numberFromString_(v316, v322, (uint64_t)v321, v323, v324, v325);
            objc_msgSend_doubleValue(v326, v327, v328, v329, v330, v331);
            double v333 = v332;

            uint64_t v338 = objc_msgSend_objectAtIndexedSubscript_(v15, v334, 1, v335, v336, v337);
            LODWORD(v321) = objc_msgSend_isEqualToString_(v338, v339, @"+", v340, v341, v342);

            if (v321)
            {
              double v267 = v310 + v333;
            }
            else
            {
              uint64_t v347 = objc_msgSend_objectAtIndexedSubscript_(v15, v343, 1, v344, v345, v346);
              int v352 = objc_msgSend_isEqualToString_(v347, v348, @"-", v349, v350, v351);

              if (!v352) {
                goto LABEL_35;
              }
              double v267 = v310 - v333;
            }
            objc_msgSend_removeObjectsInRange_(v15, v343, 0, 3, v345, v346);
            uint64_t v273 = objc_msgSend_formatter(self, v268, v269, v270, v271, v272);
            uint64_t v279 = objc_msgSend_numberWithDouble_(NSNumber, v274, v275, v276, v277, v278, v267);
            uint64_t v284 = objc_msgSend_stringFromNumber_(v273, v280, (uint64_t)v279, v281, v282, v283);

            objc_msgSend_insertObject_atIndex_(v15, v285, (uint64_t)v284, 0, v286, v287);
          }
          while ((unint64_t)objc_msgSend_count(v15, v288, v289, v290, v291, v292) > 1);
        }
      }
      objc_msgSend_objectAtIndexedSubscript_(v15, v255, 0, v257, v258, v259);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
LABEL_25:
    uint64_t v265 = @"STOP";
    goto LABEL_35;
  }
  uint64_t v26 = (__CFString *)v4;
LABEL_34:
  uint64_t v265 = v26;
LABEL_35:

  return v265;
}

- (id)evaluateVerticalMath:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (qword_1EA3C9320 != -1) {
    dispatch_once(&qword_1EA3C9320, &unk_1F2012E50);
  }
  uint64_t v148 = v8;
  uint64_t v9 = objc_msgSend_componentsSeparatedByString_(v8, v4, @" ", v5, v6, v7);
  v15 = objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v16 = v15;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v149, (uint64_t)v153, 16, v18);
  if (!v19)
  {

    uint64_t v25 = 0;
    goto LABEL_17;
  }
  uint64_t v24 = v19;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = *(void *)v150;
  while (2)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v150 == v27)
      {
        uint64_t v29 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        if (!objc_msgSend_containsObject_((void *)qword_1EA3C9328, v20, (uint64_t)v29, v21, v22, v23)) {
          continue;
        }
      }
      else
      {
        objc_enumerationMutation(v16);
        uint64_t v29 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        if (!objc_msgSend_containsObject_((void *)qword_1EA3C9328, v30, (uint64_t)v29, v31, v32, v33)) {
          continue;
        }
      }
      ++v26;
      uint64_t v34 = v29;

      uint64_t v25 = v34;
    }
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v20, (uint64_t)&v149, (uint64_t)v153, 16, v23);
    if (v24) {
      continue;
    }
    break;
  }

  if (!v26)
  {
LABEL_17:
    uint64_t v40 = @"+";
    goto LABEL_18;
  }
  if (v26 == 1)
  {
    uint64_t v25 = v25;
    uint64_t v40 = v25;
  }
  else
  {
    if (v26 != (unint64_t)(objc_msgSend_count(v16, v35, v36, v37, v38, v39) - 1) >> 1)
    {
      uint64_t v145 = @"STOP";
      goto LABEL_39;
    }
    uint64_t v40 = 0;
  }
LABEL_18:
  uint64_t v41 = objc_msgSend_formatter(self, v35, v36, v37, v38, v39);
  uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(v16, v42, 0, v43, v44, v45);
  uint64_t v51 = objc_msgSend_numberFromString_(v41, v47, (uint64_t)v46, v48, v49, v50);
  objc_msgSend_doubleValue(v51, v52, v53, v54, v55, v56);
  double v58 = v57;

  uint64_t v59 = v40;
  uint64_t v147 = v59;
  if ((unint64_t)objc_msgSend_count(v16, v60, v61, v62, v63, v64) < 2)
  {
LABEL_37:
    uint64_t v77 = objc_msgSend_formatter(self, v65, v66, v67, v68, v69, v147);
    uint64_t v71 = objc_msgSend_numberWithDouble_(NSNumber, v136, v137, v138, v139, v140, v58);
    objc_msgSend_stringFromNumber_(v77, v141, (uint64_t)v71, v142, v143, v144);
    uint64_t v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  uint64_t v70 = 1;
  objc_msgSend_objectAtIndexedSubscript_(v16, v65, 1, v67, v68, v69, v59);
  while (2)
    uint64_t v77 = {;
    if (objc_msgSend_containsObject_((void *)qword_1EA3C9328, v78, (uint64_t)v77, v79, v80, v81))
    {
      uint64_t v71 = v59;
      uint64_t v59 = v77;
LABEL_21:

      if (++v70 >= (unint64_t)objc_msgSend_count(v16, v72, v73, v74, v75, v76)) {
        goto LABEL_37;
      }
      objc_msgSend_objectAtIndexedSubscript_(v16, v65, v70, v67, v68, v69, v147);
      continue;
    }
    break;
  }
  uint64_t v87 = objc_msgSend_formatter(self, v82, v83, v84, v85, v86);
  uint64_t v92 = objc_msgSend_objectAtIndexedSubscript_(v16, v88, v70, v89, v90, v91);
  uint64_t v71 = objc_msgSend_numberFromString_(v87, v93, (uint64_t)v92, v94, v95, v96);

  if (!v71) {
    goto LABEL_44;
  }
  objc_msgSend_doubleValue(v71, v97, v98, v99, v100, v101);
  double v103 = v102;
  if (objc_msgSend_isEqualToString_(v59, v104, @"+", v105, v106, v107))
  {
    double v58 = v58 + v103;
    goto LABEL_21;
  }
  if (objc_msgSend_isEqualToString_(v59, v108, @"-", v109, v110, v111))
  {
    double v58 = v58 - v103;
    goto LABEL_21;
  }
  if ((objc_msgSend_isEqualToString_(v59, v112, @"\\times", v113, v114, v115) & 1) != 0
    || (objc_msgSend_isEqualToString_(v59, v116, @"\\cdot", v117, v118, v119) & 1) != 0
    || objc_msgSend_isEqualToString_(v59, v120, @"\\ast", v121, v122, v123))
  {
    double v58 = v58 * v103;
    goto LABEL_21;
  }
  if ((objc_msgSend_isEqualToString_(v59, v124, @"/", v125, v126, v127) & 1) != 0
    || (objc_msgSend_isEqualToString_(v59, v128, @"\\div", v129, v130, v131) & 1) != 0
    || objc_msgSend_isEqualToString_(v59, v132, @":", v133, v134, v135))
  {
    double v58 = v58 / v103;
    goto LABEL_21;
  }
LABEL_44:
  uint64_t v145 = @"STOP";
LABEL_38:

LABEL_39:
  return v145;
}

@end