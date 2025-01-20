@interface DOCTransitionUtils
+ (void)performZoomTransitionInContainer:(id)a3 withSourceView:(id)a4 destinationView:(id)a5 duration:(double)a6 alterativeView:(id)a7 thumbnail:(id)a8 thumbnailStyle:(unint64_t)a9 location:(CGRect)a10 presenting:(BOOL)a11 fadingSource:(BOOL)a12 completion:(id)a13;
@end

@implementation DOCTransitionUtils

+ (void)performZoomTransitionInContainer:(id)a3 withSourceView:(id)a4 destinationView:(id)a5 duration:(double)a6 alterativeView:(id)a7 thumbnail:(id)a8 thumbnailStyle:(unint64_t)a9 location:(CGRect)a10 presenting:(BOOL)a11 fadingSource:(BOOL)a12 completion:(id)a13
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  char v18 = a9;
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  id v27 = a7;
  id v28 = a8;
  id v220 = a13;
  if (!v28)
  {
    [v24 center];
    double x = v29 + -20.0;
    [v24 center];
    double y = v30 + -20.0;
    double height = 40.0;
    double width = 40.0;
  }
  v31 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v28];
  [v31 setContentMode:1];
  objc_msgSend(v31, "setFrame:", x, y, width, height);
  [v31 setAccessibilityIgnoresInvertColors:1];
  if (v18)
  {
    id v32 = v27;
    if ((v18 & 2) != 0)
    {
      v13 = [MEMORY[0x263F82B60] mainScreen];
      [v13 scale];
      double v33 = 1.0 / v34;
    }
    else
    {
      double v33 = 1.0;
    }
    v35 = [v31 layer];
    [v35 setBorderWidth:v33];

    if ((v18 & 2) != 0) {
    [v31 frame];
    }
    double v37 = v36;
    [v31 frame];
    if (v37 >= v38) {
      double v39 = v37;
    }
    else {
      double v39 = v38;
    }
    double v40 = v39 * 6.0 * 0.0078125 + -1.0;
    if (v40 >= 3.0) {
      double v41 = v40;
    }
    else {
      double v41 = 3.0;
    }
    v42 = [v31 layer];
    [v42 setCornerRadius:v41];

    uint64_t v43 = *MEMORY[0x263F15A20];
    v44 = [v31 layer];
    [v44 setCornerCurve:v43];

    id v45 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.121568627];
    uint64_t v46 = [v45 CGColor];
    v47 = [v31 layer];
    [v47 setBorderColor:v46];

    [v31 setClipsToBounds:1];
    id v27 = v32;
  }
  [v24 addSubview:v31];
  double v222 = a6;
  v221 = v27;
  if (v27)
  {
    v48 = [v27 snapshotViewAfterScreenUpdates:1];
    [v27 bounds];
    objc_msgSend(v27, "convertRect:toView:", v24);
    objc_msgSend(v48, "setFrame:");
    [v24 addSubview:v48];
    [v27 setAlpha:0.0];
  }
  else
  {
    v48 = 0;
  }
  long long v49 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v293 = *MEMORY[0x263F000D0];
  long long v294 = v49;
  long long v295 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v292.a = v293;
  *(_OWORD *)&v292.c = v49;
  *(_OWORD *)&v292.tdouble x = v295;
  *(_OWORD *)&v291.a = v293;
  *(_OWORD *)&v291.c = v49;
  *(_OWORD *)&v291.tdouble x = v295;
  long long v288 = v293;
  long long v289 = v49;
  long long v290 = v295;
  *(_OWORD *)&v287.a = v293;
  *(_OWORD *)&v287.c = v49;
  *(_OWORD *)&v287.tdouble x = v295;
  long long v227 = v49;
  long long v229 = v293;
  *(_OWORD *)&v286.a = v293;
  *(_OWORD *)&v286.c = v49;
  long long v225 = v295;
  *(_OWORD *)&v286.tdouble x = v295;
  v50 = [v24 traitCollection];
  [v50 displayScale];
  double v52 = v51;

  if (a11)
  {
    if (v48)
    {
      [v48 frame];
      CGFloat v54 = v53;
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      [v31 frame];
      CGFloat v63 = DOCAdaptSizeToRect(0, v54, v56, v58, v60, v61, v62, v52);
      double v65 = v64;
      double v67 = v66;
      objc_msgSend(v48, "frame", v63);
      uint64_t v219 = v68;
      uint64_t v214 = v69;
      [v31 frame];
      uint64_t v71 = v70;
      uint64_t v73 = v72;
      double v75 = v74;
      double v224 = v76;
      double v218 = 0.0;
      if (a12) {
        double v77 = 0.0;
      }
      else {
        double v77 = 1.0;
      }
      double v216 = 1.0;
      double v217 = v77;
      [v31 center];
      double v79 = v78;
      [v48 center];
      CGFloat v81 = v79 - v80;
      [v31 center];
      double v83 = v82;
      [v48 center];
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tdouble x = v295;
      CGAffineTransformTranslate(&v286, &v285, v81, v83 - v84);
      CGAffineTransform v284 = v286;
      double v85 = v67;
      CGAffineTransformScale(&v285, &v284, v75 / v65, v75 / v65);
      CGAffineTransform v286 = v285;
      [v48 frame];
      double v213 = v65;
      double v87 = v86 - v65;
      uint64_t v88 = v73;
      uint64_t v89 = v71;
      CGFloat v90 = v87 * 0.5;
      [v48 frame];
      CGAffineTransform v284 = v286;
      CGAffineTransformTranslate(&v285, &v284, v90, (v91 - v67) * 0.5);
      CGAffineTransform v286 = v285;
    }
    else
    {
      [v25 frame];
      CGFloat v125 = v124;
      CGFloat v127 = v126;
      CGFloat v129 = v128;
      CGFloat v131 = v130;
      [v31 frame];
      CGFloat v134 = DOCAdaptSizeToRect(0, v125, v127, v129, v131, v132, v133, v52);
      double v136 = v135;
      double v138 = v137;
      objc_msgSend(v25, "frame", v134);
      uint64_t v219 = v139;
      uint64_t v214 = v140;
      [v31 frame];
      uint64_t v142 = v141;
      uint64_t v144 = v143;
      double v75 = v145;
      double v224 = v146;
      double v218 = 0.0;
      if (a12) {
        double v147 = 0.0;
      }
      else {
        double v147 = 1.0;
      }
      double v216 = 1.0;
      double v217 = v147;
      [v31 center];
      double v149 = v148;
      [v26 center];
      CGFloat v151 = v149 - v150;
      [v31 center];
      double v153 = v152;
      [v26 center];
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tdouble x = v295;
      CGFloat v155 = v151;
      double v85 = v138;
      CGAffineTransformTranslate(&v292, &v285, v155, v153 - v154);
      CGAffineTransform v284 = v292;
      CGAffineTransformScale(&v285, &v284, v75 / v136, v75 / v136);
      CGAffineTransform v292 = v285;
      [v26 frame];
      double v213 = v136;
      double v157 = v156 - v136;
      uint64_t v88 = v144;
      uint64_t v89 = v142;
      CGFloat v158 = v157 * 0.5;
      [v26 frame];
      CGAffineTransform v284 = v292;
      CGAffineTransformTranslate(&v285, &v284, v158, (v159 - v138) * 0.5);
      CGAffineTransform v292 = v285;
    }
    double v215 = 0.0;
  }
  else
  {
    [v31 frame];
    uint64_t v219 = v92;
    double v213 = v94;
    uint64_t v214 = v93;
    double v95 = v94;
    double v212 = v96;
    if (v48)
    {
      [v48 frame];
      CGFloat v98 = v97;
      CGFloat v100 = v99;
      CGFloat v102 = v101;
      CGFloat v104 = v103;
      [v31 frame];
      CGFloat v107 = DOCAdaptSizeToRect(0, v98, v100, v102, v104, v105, v106, v52);
      double v75 = v108;
      double v110 = v109;
      objc_msgSend(v48, "frame", v107);
      uint64_t v89 = v111;
      uint64_t v88 = v112;
      double v217 = 0.0;
      double v215 = 1.0;
      if (a12) {
        double v113 = 0.0;
      }
      else {
        double v113 = 1.0;
      }
      double v218 = v113;
      [v31 center];
      double v115 = v114;
      [v48 center];
      CGFloat v117 = v115 - v116;
      [v31 center];
      double v119 = v118;
      [v48 center];
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tdouble x = v295;
      CGAffineTransformTranslate(&v287, &v285, v117, v119 - v120);
      CGAffineTransform v284 = v287;
      CGAffineTransformScale(&v285, &v284, v95 / v75, v95 / v75);
      CGAffineTransform v287 = v285;
      [v48 frame];
      CGFloat v122 = (v121 - v75) * 0.5;
      [v48 frame];
      double v224 = v110;
      CGAffineTransform v284 = v287;
      CGAffineTransformTranslate(&v285, &v284, v122, (v123 - v110) * 0.5);
      CGAffineTransform v287 = v285;
    }
    else
    {
      [v26 frame];
      CGFloat v161 = v160;
      CGFloat v163 = v162;
      CGFloat v165 = v164;
      CGFloat v167 = v166;
      [v31 frame];
      CGFloat v170 = DOCAdaptSizeToRect(0, v161, v163, v165, v167, v168, v169, v52);
      double v75 = v171;
      double v173 = v172;
      objc_msgSend(v26, "frame", v170);
      uint64_t v89 = v174;
      uint64_t v88 = v175;
      double v217 = 0.0;
      double v215 = 1.0;
      if (a12) {
        double v176 = 0.0;
      }
      else {
        double v176 = 1.0;
      }
      double v218 = v176;
      [v31 center];
      double v178 = v177;
      [v26 center];
      CGFloat v180 = v178 - v179;
      [v31 center];
      double v182 = v181;
      [v26 center];
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tdouble x = v295;
      CGAffineTransformTranslate(&v291, &v285, v180, v182 - v183);
      CGAffineTransform v284 = v291;
      CGAffineTransformScale(&v285, &v284, v95 / v75, v95 / v75);
      CGAffineTransform v291 = v285;
      [v26 frame];
      CGFloat v185 = (v184 - v75) * 0.5;
      [v26 frame];
      double v224 = v173;
      CGAffineTransform v284 = v291;
      CGAffineTransformTranslate(&v285, &v284, v185, (v186 - v173) * 0.5);
      CGAffineTransform v291 = v285;
    }
    double v216 = 0.0;
    double v85 = v212;
  }
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  BOOL v188 = IsReduceMotionEnabled;
  v223 = v28;
  if (IsReduceMotionEnabled)
  {
    long long v288 = v229;
    long long v289 = v227;
    long long v290 = v225;
    *(_OWORD *)&v291.a = v229;
    *(_OWORD *)&v291.c = v227;
    *(_OWORD *)&v291.tdouble x = v225;
    *(_OWORD *)&v292.a = v229;
    *(_OWORD *)&v292.c = v227;
    *(_OWORD *)&v292.tdouble x = v225;
    long long v293 = v229;
    long long v294 = v227;
    long long v295 = v225;
    uint64_t v189 = v219;
    if (a11)
    {
      CGAffineTransform v286 = v287;
      double v85 = v224;
      double v190 = v75;
      uint64_t v191 = v88;
      uint64_t v189 = v89;
    }
    else
    {
      CGAffineTransform v287 = v286;
      double v224 = v85;
      double v75 = v213;
      uint64_t v88 = v214;
      double v190 = v213;
      uint64_t v191 = v214;
      uint64_t v89 = v219;
    }
  }
  else
  {
    uint64_t v189 = v219;
    uint64_t v191 = v88;
    double v190 = v75;
    double v75 = v213;
    uint64_t v88 = v214;
  }
  v264[0] = MEMORY[0x263EF8330];
  v264[1] = 3221225472;
  v264[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke;
  v264[3] = &unk_2641B1EB8;
  BOOL v283 = a11;
  id v192 = v31;
  id v265 = v192;
  id v230 = v24;
  id v266 = v230;
  uint64_t v270 = v189;
  uint64_t v271 = v88;
  double v272 = v75;
  double v273 = v85;
  id v193 = v25;
  id v267 = v193;
  uint64_t v274 = 0x3FF0000000000000;
  id v194 = v26;
  id v268 = v194;
  double v275 = v217;
  double v276 = v215;
  id v195 = v48;
  long long v278 = v293;
  long long v279 = v294;
  long long v280 = v295;
  CGAffineTransform v281 = v291;
  CGAffineTransform v282 = v287;
  id v269 = v195;
  double v277 = v216;
  v196 = (void (**)(void))MEMORY[0x21668E400](v264);
  v246[0] = MEMORY[0x263EF8330];
  v246[1] = 3221225472;
  v246[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_2;
  v246[3] = &unk_2641B1EE0;
  id v197 = v192;
  id v247 = v197;
  uint64_t v251 = v89;
  uint64_t v252 = v191;
  double v253 = v190;
  double v254 = v224;
  id v198 = v195;
  id v248 = v198;
  double v255 = v215;
  id v199 = v193;
  id v249 = v199;
  double v256 = v218;
  id v200 = v194;
  id v250 = v200;
  uint64_t v257 = 0x3FF0000000000000;
  double v258 = v216;
  CGAffineTransform v259 = v286;
  CGAffineTransform v260 = v292;
  long long v262 = v289;
  long long v263 = v290;
  long long v261 = v288;
  v201 = (void *)MEMORY[0x21668E400](v246);
  v239[0] = MEMORY[0x263EF8330];
  v239[1] = 3221225472;
  v239[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_3;
  v239[3] = &unk_2641B1F08;
  id v228 = v199;
  id v240 = v228;
  id v202 = v197;
  id v241 = v202;
  id v203 = v198;
  id v242 = v203;
  id v226 = v200;
  id v243 = v226;
  id v204 = v221;
  id v244 = v204;
  id v205 = v220;
  id v245 = v205;
  v206 = (void *)MEMORY[0x21668E400](v239);
  v196[2](v196);
  v207 = (void *)MEMORY[0x263F82E00];
  if (v188)
  {
    v233[0] = MEMORY[0x263EF8330];
    v233[1] = 3221225472;
    v233[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_6;
    v233[3] = &unk_2641B1080;
    v208 = &v234;
    id v234 = v201;
    v231[0] = MEMORY[0x263EF8330];
    v231[1] = 3221225472;
    v231[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_7;
    v231[3] = &unk_2641B1F30;
    v209 = &v232;
    v232 = v206;
    id v210 = v206;
    [v207 animateWithDuration:v233 animations:v231 completion:v222];
  }
  else
  {
    v237[0] = MEMORY[0x263EF8330];
    v237[1] = 3221225472;
    v237[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_4;
    v237[3] = &unk_2641B1080;
    v208 = &v238;
    id v238 = v201;
    v235[0] = MEMORY[0x263EF8330];
    v235[1] = 3221225472;
    v235[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_5;
    v235[3] = &unk_2641B1F30;
    v209 = &v236;
    v236 = v206;
    id v211 = v206;
    [v207 _animateUsingSpringWithDuration:0 delay:v237 options:v235 mass:v222 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
  }
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 280))
  {
    [*(id *)(a1 + 40) center];
    objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  [*(id *)(a1 + 48) setAlpha:*(double *)(a1 + 104)];
  [*(id *)(a1 + 56) setAlpha:*(double *)(a1 + 112)];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 120)];
  [*(id *)(a1 + 64) setAlpha:*(double *)(a1 + 128)];
  long long v2 = *(_OWORD *)(a1 + 152);
  v8[0] = *(_OWORD *)(a1 + 136);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 168);
  [*(id *)(a1 + 48) setTransform:v8];
  long long v3 = *(_OWORD *)(a1 + 200);
  v7[0] = *(_OWORD *)(a1 + 184);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 216);
  [*(id *)(a1 + 56) setTransform:v7];
  long long v4 = *(_OWORD *)(a1 + 248);
  v6[0] = *(_OWORD *)(a1 + 232);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 264);
  return [*(id *)(a1 + 64) setTransform:v6];
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 96)];
  [*(id *)(a1 + 48) setAlpha:*(double *)(a1 + 104)];
  [*(id *)(a1 + 56) setAlpha:*(double *)(a1 + 112)];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 120)];
  long long v2 = *(_OWORD *)(a1 + 144);
  v8[0] = *(_OWORD *)(a1 + 128);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 160);
  [*(id *)(a1 + 40) setTransform:v8];
  long long v3 = *(_OWORD *)(a1 + 192);
  v7[0] = *(_OWORD *)(a1 + 176);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 208);
  [*(id *)(a1 + 48) setTransform:v7];
  long long v4 = *(_OWORD *)(a1 + 240);
  v6[0] = *(_OWORD *)(a1 + 224);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 256);
  return [*(id *)(a1 + 56) setTransform:v6];
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  long long v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v9[0] = *MEMORY[0x263F000D0];
  long long v6 = v9[0];
  v9[1] = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v5 = v10;
  [v2 setTransform:v9];
  long long v3 = *(void **)(a1 + 56);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  [v3 setTransform:v8];
  [*(id *)(a1 + 64) setAlpha:1.0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end