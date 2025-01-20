@interface BCUCoverEffects
+ (CGImage)restrictedImageFrom:(CGImage *)a3 size:(CGSize)a4;
+ (id)_effectIdentifierForEffectIndex:(unint64_t)a3;
+ (id)effectIdentifierForAsset:(id)a3 withEnvironment:(id)a4;
+ (id)effectIdentifierForFilterInfo:(id)a3;
+ (id)effectIdentifierWithRTL:(BOOL)a3 style:(unint64_t)a4 content:(unint64_t)a5 nightMode:(BOOL)a6;
- (BCUCoverEffects)initWithRenderer:(id)a3;
- (BCUCoverEffects)initWithRenderer:(id)a3 mode:(unint64_t)a4;
- (NSArray)bookCoverEffectFilters;
- (NSArray)seriesCoverEffectFilters;
- (NSArray)templateImageFilters;
- (NSArray)templateImageSetFilters;
- (id)bookCoverEffectFilterForEffectIdentifier:(id)a3;
- (unint64_t)mode;
@end

@implementation BCUCoverEffects

+ (id)effectIdentifierWithRTL:(BOOL)a3 style:(unint64_t)a4 content:(unint64_t)a5 nightMode:(BOOL)a6
{
  uint64_t v6 = 6;
  if (!a3) {
    uint64_t v6 = 0;
  }
  return (id)objc_msgSend__effectIdentifierForEffectIndex_(BCUCoverEffects, a2, (v6 + 12 * a4 + 2 * a5) | a6);
}

+ (id)effectIdentifierForAsset:(id)a3 withEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11 = objc_msgSend_coverEffectRTLOverride(v6, v7, v8);
  if (v11)
  {
    v12 = objc_msgSend_coverEffectRTLOverride(v6, v9, v10);
    int v15 = objc_msgSend_BOOLValue(v12, v13, v14);
  }
  else
  {
    int v15 = objc_msgSend_coverEffectRTL(v5, v9, v10);
  }

  uint64_t v18 = objc_msgSend_coverEffectStyle(v5, v16, v17);
  uint64_t v21 = objc_msgSend_coverEffectsContent(v6, v19, v20);
  unsigned int v24 = objc_msgSend_coverEffectsNightMode(v6, v22, v23);
  uint64_t v26 = 6;
  if (!v15) {
    uint64_t v26 = 0;
  }
  v27 = objc_msgSend__effectIdentifierForEffectIndex_(BCUCoverEffects, v25, (v26 + 12 * v18 + 2 * v21) | v24);

  return v27;
}

+ (id)effectIdentifierForFilterInfo:(id)a3
{
  id v3 = a3;
  id v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"BCUCoverEffectsFilterInfoAlternativeAppearanceKey");
  int v8 = objc_msgSend_BOOLValue(v5, v6, v7);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v9, @"BCUCoverEffectsFilterInfoContentRTLKey");

  v12 = objc_msgSend_objectForKeyedSubscript_(v3, v11, @"BCUCoverEffectsFilterInfoCoverEffectStyleKey");

  int v15 = objc_msgSend_intValue(v12, v13, v14);
  uint64_t v17 = 6;
  if (!v10) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = 2;
  if (v8) {
    uint64_t v18 = 3;
  }
  v19 = objc_msgSend__effectIdentifierForEffectIndex_(BCUCoverEffects, v16, v18 + v17 + 12 * v15);

  return v19;
}

+ (id)_effectIdentifierForEffectIndex:(unint64_t)a3
{
  if (qword_2688A74D0 != -1) {
    dispatch_once(&qword_2688A74D0, &unk_26E9DCD08);
  }
  v4 = (void *)*((void *)&xmmword_2688A7350 + a3);
  return v4;
}

+ (CGImage)restrictedImageFrom:(CGImage *)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = objc_msgSend_imageWithCGImage_(MEMORY[0x263F00650], a2, (uint64_t)a3);
  int v8 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v7, @"CIGaussianBlur");
  uint64_t v9 = *MEMORY[0x263F00968];
  objc_msgSend_setValue_forKey_(v8, v10, (uint64_t)v6, *MEMORY[0x263F00968]);
  v13 = objc_msgSend_numberWithDouble_(NSNumber, v11, v12, width * 0.2);
  objc_msgSend_setValue_forKey_(v8, v14, (uint64_t)v13, *MEMORY[0x263F00980]);

  uint64_t v15 = *MEMORY[0x263F009D0];
  uint64_t v17 = objc_msgSend_valueForKey_(v8, v16, *MEMORY[0x263F009D0]);
  v19 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v18, @"CIPixellate");
  objc_msgSend_setValue_forKey_(v19, v20, (uint64_t)v17, v9);
  uint64_t v23 = objc_msgSend_numberWithDouble_(NSNumber, v21, v22, width / 6.0);
  objc_msgSend_setValue_forKey_(v19, v24, (uint64_t)v23, *MEMORY[0x263F00990]);

  v27 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v25, v26, 0.0, 0.0);
  objc_msgSend_setValue_forKey_(v19, v28, (uint64_t)v27, *MEMORY[0x263F00940]);

  v30 = objc_msgSend_valueForKey_(v19, v29, v15);
  v32 = objc_msgSend_contextWithOptions_(MEMORY[0x263F00628], v31, 0);
  CGImage_fromRect = (const void *)objc_msgSend_createCGImage_fromRect_(v32, v33, (uint64_t)v30, 0.0, 0.0, width, height);
  v35 = (CGImage *)CFAutorelease(CGImage_fromRect);

  return v35;
}

- (BCUCoverEffects)initWithRenderer:(id)a3
{
  return (BCUCoverEffects *)objc_msgSend_initWithRenderer_mode_(self, a2, (uint64_t)a3, 0);
}

- (BCUCoverEffects)initWithRenderer:(id)a3 mode:(unint64_t)a4
{
  v295[25] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v292.receiver = self;
  v292.super_class = (Class)BCUCoverEffects;
  int v8 = [(BCUCoverEffects *)&v292 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_renderer, a3);
    v9->_mode = a4;
    if (!a4)
    {
      id v288 = v7;
      if (qword_26AF40220 != -1) {
        dispatch_once(&qword_26AF40220, &unk_26E9DCD48);
      }
      uint64_t v10 = (void *)qword_26AF40228;
      v11 = (void *)qword_26AF40238;
      uint64_t v12 = (void *)qword_26AF40230;
      v13 = (void *)qword_26AF40240;
      uint64_t v14 = (void *)qword_26AF401E8;
      uint64_t v15 = (void *)qword_26AF401F8;
      v16 = (void *)qword_26AF401F0;
      id v291 = (id)qword_26AF40200;
      id v17 = v16;
      id v18 = v15;
      id v19 = v14;
      id v290 = v13;
      id v20 = v12;
      id v21 = v11;
      id v22 = v10;
      uint64_t v23 = [_BCUCoverEffectsBookBinding alloc];
      v281 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v23, v24, @"BCUCoverEffectsIdentifierBookBinding", v9->_renderer, v19, 0, 0, 0);
      v295[0] = v281;
      v25 = [_BCUCoverEffectsBookBinding alloc];
      v279 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v25, v26, @"BCUCoverEffectsIdentifierBookBindingNight", v9->_renderer, v17, 0, 0, 0);
      v295[1] = v279;
      v27 = [_BCUCoverEffectsBookBinding alloc];
      v277 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v27, v28, @"BCUCoverEffectsIdentifierBookBindingWithShadow", v9->_renderer, v19, v22, qword_26AF40248, 0);
      v295[2] = v277;
      v29 = [_BCUCoverEffectsBookBinding alloc];
      v289 = v20;
      v275 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v29, v30, @"BCUCoverEffectsIdentifierBookBindingNightWithShadow", v9->_renderer, v17, v20, qword_26AF40250, 0);
      v295[3] = v275;
      v31 = [_BCUCoverEffectsBookBinding alloc];
      v273 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v31, v32, @"BCUCoverEffectsIdentifierBookBindingShadowOnly", v9->_renderer, 0, v22, qword_26AF40248, 1);
      v295[4] = v273;
      v33 = [_BCUCoverEffectsBookBinding alloc];
      v271 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v33, v34, @"BCUCoverEffectsIdentifierBookBindingNightShadowOnly", v9->_renderer, 0, v20, qword_26AF40250, 1);
      v295[5] = v271;
      v35 = [_BCUCoverEffectsBookBinding alloc];
      v287 = v18;
      v269 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v35, v36, @"BCUCoverEffectsIdentifierBookBindingRTL", v9->_renderer, v18, 0, 0, 0);
      v295[6] = v269;
      v37 = [_BCUCoverEffectsBookBinding alloc];
      v267 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v37, v38, @"BCUCoverEffectsIdentifierBookBindingRTLNight", v9->_renderer, v291, 0, 0, 0);
      v295[7] = v267;
      v39 = [_BCUCoverEffectsBookBinding alloc];
      v286 = v21;
      v265 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v39, v40, @"BCUCoverEffectsIdentifierBookBindingRTLWithShadow", v9->_renderer, v18, v21, qword_26AF40258, 0);
      v295[8] = v265;
      v41 = [_BCUCoverEffectsBookBinding alloc];
      v263 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v41, v42, @"BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow", v9->_renderer, v291, v290, qword_26AF40260, 0);
      v295[9] = v263;
      v43 = [_BCUCoverEffectsBookBinding alloc];
      v261 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v43, v44, @"BCUCoverEffectsIdentifierBookBindingRTLShadowOnly", v9->_renderer, 0, v21, qword_26AF40258, 1);
      v295[10] = v261;
      v45 = [_BCUCoverEffectsBookBinding alloc];
      v259 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v45, v46, @"BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly", v9->_renderer, 0, v290, qword_26AF40260, 1);
      v295[11] = v259;
      v47 = [_BCUCoverEffectsAudiobook alloc];
      v285 = v19;
      v257 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v47, v48, @"BCUCoverEffectsIdentifierAudiobook", v9->_renderer, v19, 0, 0, 0);
      v295[12] = v257;
      v49 = [_BCUCoverEffectsAudiobook alloc];
      v283 = v17;
      v255 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v49, v50, @"BCUCoverEffectsIdentifierAudiobookNight", v9->_renderer, v17, 0, 0, 0);
      v295[13] = v255;
      v51 = [_BCUCoverEffectsAudiobook alloc];
      v284 = v22;
      v253 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v51, v52, @"BCUCoverEffectsIdentifierAudiobookWithShadow", v9->_renderer, v19, v22, qword_26AF40248, 0);
      v295[14] = v253;
      v53 = [_BCUCoverEffectsAudiobook alloc];
      v251 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v53, v54, @"BCUCoverEffectsIdentifierAudiobookNightWithShadow", v9->_renderer, v17, v20, qword_26AF40250, 0);
      v295[15] = v251;
      v55 = [_BCUCoverEffectsAudiobook alloc];
      v57 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v55, v56, @"BCUCoverEffectsIdentifierAudiobookShadowOnly", v9->_renderer, 0, v22, qword_26AF40248, 1);
      v295[16] = v57;
      v58 = [_BCUCoverEffectsAudiobook alloc];
      v60 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v58, v59, @"BCUCoverEffectsIdentifierAudiobookNightShadowOnly", v9->_renderer, 0, v20, qword_26AF40250, 1);
      v295[17] = v60;
      v61 = [_BCUCoverEffectsPDF alloc];
      v63 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v61, v62, @"BCUCoverEffectsIdentifierPDF", v9->_renderer, 1, 0, 0);
      v295[18] = v63;
      v64 = [_BCUCoverEffectsPDF alloc];
      v66 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v64, v65, @"BCUCoverEffectsIdentifierPDFNight", v9->_renderer, 1, 0, 1);
      v295[19] = v66;
      v67 = [_BCUCoverEffectsPDF alloc];
      v69 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v67, v68, @"BCUCoverEffectsIdentifierPDFWithShadow", v9->_renderer, 1, 1, 0);
      v295[20] = v69;
      v70 = [_BCUCoverEffectsPDF alloc];
      v72 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v70, v71, @"BCUCoverEffectsIdentifierPDFNightWithShadow", v9->_renderer, 1, 1, 1);
      v295[21] = v72;
      v73 = [_BCUCoverEffectsPDF alloc];
      v75 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v73, v74, @"BCUCoverEffectsIdentifierPDFShadowOnly", v9->_renderer, 0, 1, 0);
      v295[22] = v75;
      v76 = [_BCUCoverEffectsPDF alloc];
      v78 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v76, v77, @"BCUCoverEffectsIdentifierPDFNightShadowOnly", v9->_renderer, 0, 1, 1);
      v295[23] = v78;
      v79 = [_BCUCoverEffectsIdentity alloc];
      v81 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v79, v80, @"BCUCoverEffectsIdentifierIdentity", v9->_renderer, 0, 0, 0, 0);
      v295[24] = v81;
      uint64_t v83 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v82, (uint64_t)v295, 25);
      bookCoverEffectFilters = v9->_bookCoverEffectFilters;
      v9->_bookCoverEffectFilters = (NSArray *)v83;

      v85 = [_BCUCoverEffectsSeriesStack alloc];
      v87 = objc_msgSend_initWithIdentifier_renderer_(v85, v86, @"BCUCoverEffectsIdentifierSeriesStackDiagonal", v9->_renderer);
      v294[0] = v87;
      v88 = [_BCUCoverEffectsSeriesStack alloc];
      v90 = objc_msgSend_initWithIdentifier_renderer_(v88, v89, @"BCUCoverEffectsIdentifierSeriesStackHorizontal", v9->_renderer);
      v294[1] = v90;
      v91 = [_BCUCoverEffectsSeriesStack alloc];
      v93 = objc_msgSend_initWithIdentifier_renderer_(v91, v92, @"BCUCoverEffectsIdentifierSeriesStackHorizontalRTL", v9->_renderer);
      v294[2] = v93;
      uint64_t v95 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v94, (uint64_t)v294, 3);
      seriesCoverEffectFilters = v9->_seriesCoverEffectFilters;
      v9->_seriesCoverEffectFilters = (NSArray *)v95;

      v97 = [_BCUCoverEffectsBookBinding alloc];
      v282 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v97, v98, @"cover::book::binding::ltr", v9->_renderer, qword_26AF401E8, qword_26AF40228, qword_26AF40248, 0);
      v293[0] = v282;
      v99 = [_BCUCoverEffectsBookBinding alloc];
      v280 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v99, v100, @"cover::book::binding::rtl", v9->_renderer, qword_26AF401F8, qword_26AF40238, qword_26AF40258, 0);
      v293[1] = v280;
      v101 = [_BCUCoverEffectsBookBinding alloc];
      v278 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v101, v102, @"cover::book::binding::ltr::innerStack", v9->_renderer, qword_26AF401E8, qword_26AF40228, qword_26AF40248, 1);
      v293[2] = v278;
      v103 = [_BCUCoverEffectsBookBinding alloc];
      v276 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v103, v104, @"cover::book::binding::rtl::innerStack", v9->_renderer, qword_26AF401F8, qword_26AF40238, qword_26AF40258, 1);
      v293[3] = v276;
      v105 = [_BCUCoverEffectsBookBinding alloc];
      v274 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v105, v106, @"cover::book::binding::ltr::topStack", v9->_renderer, qword_26AF401E8, qword_26AF40248, qword_26AF40248, 0);
      v293[4] = v274;
      v107 = [_BCUCoverEffectsBookBinding alloc];
      v272 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v107, v108, @"cover::book::binding::rtl::topStack", v9->_renderer, qword_26AF401F8, qword_26AF40258, qword_26AF40258, 0);
      v293[5] = v272;
      v109 = [_BCUCoverEffectsBookBinding alloc];
      v270 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v109, v110, @"cover::book::binding::ltr::darkShadow", v9->_renderer, qword_26AF401E8, qword_26AF40230, qword_26AF40250, 0);
      v293[6] = v270;
      v111 = [_BCUCoverEffectsBookBinding alloc];
      v268 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v111, v112, @"cover::book::binding::rtl::darkShadow", v9->_renderer, qword_26AF401F8, qword_26AF40240, qword_26AF40260, 0);
      v293[7] = v268;
      v113 = [_BCUCoverEffectsBookBinding alloc];
      v266 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v113, v114, @"cover::book::binding::ltr::night", v9->_renderer, qword_26AF401F0, qword_26AF40230, qword_26AF40250, 0);
      v293[8] = v266;
      v115 = [_BCUCoverEffectsBookBinding alloc];
      v264 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v115, v116, @"cover::book::binding::rtl::night", v9->_renderer, qword_26AF40200, qword_26AF40240, qword_26AF40260, 0);
      v293[9] = v264;
      v117 = [_BCUCoverEffectsBookBinding alloc];
      v262 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v117, v118, @"cover::book::binding::ltr::night::innerStack", v9->_renderer, qword_26AF401F0, qword_26AF40230, qword_26AF40250, 1);
      v293[10] = v262;
      v119 = [_BCUCoverEffectsBookBinding alloc];
      v260 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v119, v120, @"cover::book::binding::rtl::night::innerStack", v9->_renderer, qword_26AF40200, qword_26AF40230, qword_26AF40250, 1);
      v293[11] = v260;
      v121 = [_BCUCoverEffectsBookBinding alloc];
      v258 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v121, v122, @"cover::book::binding::ltr::night::topStack", v9->_renderer, qword_26AF401F0, qword_26AF40250, qword_26AF40250, 0);
      v293[12] = v258;
      v123 = [_BCUCoverEffectsBookBinding alloc];
      v256 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v123, v124, @"cover::book::binding::rtl::night::topStack", v9->_renderer, qword_26AF40200, qword_26AF40260, qword_26AF40250, 0);
      v293[13] = v256;
      v125 = [_BCUCoverEffectsBookBinding alloc];
      v254 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v125, v126, @"cover::book::binding::ltr::flowcase", v9->_renderer, qword_26AF401E8, qword_26AF40208, 0, 0);
      v293[14] = v254;
      v127 = [_BCUCoverEffectsBookBinding alloc];
      v252 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v127, v128, @"cover::book::binding::ltr::night::flowcase", v9->_renderer, qword_26AF401F0, qword_26AF40208, 0, 0);
      v293[15] = v252;
      v129 = [_BCUCoverEffectsBookBinding alloc];
      v250 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v129, v130, @"cover::book::binding::rtl::flowcase", v9->_renderer, qword_26AF401F8, qword_26AF40208, 0, 0);
      v293[16] = v250;
      v131 = [_BCUCoverEffectsBookBinding alloc];
      v249 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v131, v132, @"cover::book::binding::rtl::night::flowcase", v9->_renderer, qword_26AF40200, qword_26AF40208, 0, 0);
      v293[17] = v249;
      v133 = [_BCUCoverEffectsAudiobook alloc];
      v248 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v133, v134, @"cover::audiobook", v9->_renderer, qword_26AF401E8, qword_26AF40228, 0, 0);
      v293[18] = v248;
      v135 = [_BCUCoverEffectsAudiobook alloc];
      v247 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v135, v136, @"cover::audiobook::darkShadow", v9->_renderer, qword_26AF401E8, qword_26AF40230, 0, 0);
      v293[19] = v247;
      v137 = [_BCUCoverEffectsAudiobook alloc];
      v246 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v137, v138, @"cover::audiobook::night", v9->_renderer, qword_26AF401F0, qword_26AF40230, 0, 0);
      v293[20] = v246;
      v139 = [_BCUCoverEffectsAudiobook alloc];
      v245 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v139, v140, @"cover::audiobook::flowcase", v9->_renderer, qword_26AF401E8, qword_26AF40208, 0, 0);
      v293[21] = v245;
      v141 = [_BCUCoverEffectsAudiobook alloc];
      v244 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v141, v142, @"cover::audiobook::night::flowcase", v9->_renderer, qword_26AF401F0, qword_26AF40208, 0, 0);
      v293[22] = v244;
      v143 = [_BCUCoverEffectsPDF alloc];
      v243 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v143, v144, @"cover::pdf", v9->_renderer, 1, 1, 0);
      v293[23] = v243;
      v145 = [_BCUCoverEffectsPDF alloc];
      v242 = objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v145, v146, @"cover::pdf::night", v9->_renderer, 1, 1, 1);
      v293[24] = v242;
      v147 = [_BCUCoverEffectsBookBinding alloc];
      v241 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v147, v148, @"cover::book::binding::ltr::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40228, qword_26AF40248, 0, 1);
      v293[25] = v241;
      v149 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v203) = 1;
      v240 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v149, v150, @"cover::book::binding::rtl::restricted", v9->_renderer, qword_26AF401F8, qword_26AF40238, qword_26AF40258, 0, v203);
      v293[26] = v240;
      v151 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v204) = 1;
      v239 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v151, v152, @"cover::book::binding::ltr::innerStack::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40228, qword_26AF40248, 1, v204);
      v293[27] = v239;
      v153 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v205) = 1;
      v238 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v153, v154, @"cover::book::binding::rtl::innerStack::restricted", v9->_renderer, qword_26AF401F8, qword_26AF40238, qword_26AF40258, 1, v205);
      v293[28] = v238;
      v155 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v206) = 1;
      v237 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v155, v156, @"cover::book::binding::ltr::topStack::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40248, qword_26AF40248, 0, v206);
      v293[29] = v237;
      v157 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v207) = 1;
      v236 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v157, v158, @"cover::book::binding::rtl::topStack::restricted", v9->_renderer, qword_26AF401F8, qword_26AF40258, qword_26AF40258, 0, v207);
      v293[30] = v236;
      v159 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v208) = 1;
      v235 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v159, v160, @"cover::book::binding::ltr::darkShadow::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40230, qword_26AF40250, 0, v208);
      v293[31] = v235;
      v161 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v209) = 1;
      v234 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v161, v162, @"cover::book::binding::rtl::darkShadow::restricted", v9->_renderer, qword_26AF401F8, qword_26AF40240, qword_26AF40260, 0, v209);
      v293[32] = v234;
      v163 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v210) = 1;
      v233 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v163, v164, @"cover::book::binding::ltr::night::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40230, qword_26AF40250, 0, v210);
      v293[33] = v233;
      v165 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v211) = 1;
      v232 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v165, v166, @"cover::book::binding::rtl::night::restricted", v9->_renderer, qword_26AF40200, qword_26AF40240, qword_26AF40260, 0, v211);
      v293[34] = v232;
      v167 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v212) = 1;
      v231 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v167, v168, @"cover::book::binding::ltr::night::innerStack::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40230, qword_26AF40250, 1, v212);
      v293[35] = v231;
      v169 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v213) = 1;
      v230 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v169, v170, @"cover::book::binding::rtl::night::innerStack::restricted", v9->_renderer, qword_26AF40200, qword_26AF40230, qword_26AF40250, 1, v213);
      v293[36] = v230;
      v171 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v214) = 1;
      v229 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v171, v172, @"cover::book::binding::ltr::night::topStack::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40250, qword_26AF40250, 0, v214);
      v293[37] = v229;
      v173 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v215) = 1;
      v228 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v173, v174, @"cover::book::binding::rtl::night::topStack::restricted", v9->_renderer, qword_26AF40200, qword_26AF40260, qword_26AF40250, 0, v215);
      v293[38] = v228;
      v175 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v216) = 1;
      v227 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v175, v176, @"cover::book::binding::ltr::flowcase::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40208, 0, 0, v216);
      v293[39] = v227;
      v177 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v217) = 1;
      v226 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v177, v178, @"cover::book::binding::ltr::night::flowcase::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40208, 0, 0, v217);
      v293[40] = v226;
      v179 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v218) = 1;
      v225 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v179, v180, @"cover::book::binding::rtl::flowcase::restricted", v9->_renderer, qword_26AF401F8, qword_26AF40208, 0, 0, v218);
      v293[41] = v225;
      v181 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v219) = 1;
      v183 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v181, v182, @"cover::book::binding::rtl::night::flowcase::restricted", v9->_renderer, qword_26AF40200, qword_26AF40208, 0, 0, v219);
      v293[42] = v183;
      v184 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v220) = 1;
      v186 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v184, v185, @"cover::audiobook::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40228, 0, 0, v220);
      v293[43] = v186;
      v187 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v221) = 1;
      v189 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v187, v188, @"cover::audiobook::darkShadow::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40230, 0, 0, v221);
      v293[44] = v189;
      v190 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v222) = 1;
      v192 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v190, v191, @"cover::audiobook::night::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40230, 0, 0, v222);
      v293[45] = v192;
      v193 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v223) = 1;
      v195 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v193, v194, @"cover::audiobook::flowcase::restricted", v9->_renderer, qword_26AF401E8, qword_26AF40208, 0, 0, v223);
      v293[46] = v195;
      v196 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v224) = 1;
      v198 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_restricted_(v196, v197, @"cover::audiobook::night::flowcase::restricted", v9->_renderer, qword_26AF401F0, qword_26AF40208, 0, 0, v224);
      v293[47] = v198;
      uint64_t v200 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v199, (uint64_t)v293, 48);
      templateImageFilters = v9->_templateImageFilters;
      v9->_templateImageFilters = (NSArray *)v200;

      id v7 = v288;
    }
  }

  return v9;
}

- (NSArray)templateImageSetFilters
{
  return (NSArray *)((uint64_t (*)(BCUCoverEffects *, char *))MEMORY[0x270F9A6D0])(self, sel_seriesCoverEffectFilters);
}

- (id)bookCoverEffectFilterForEffectIdentifier:(id)a3
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_mode == 1)
  {
    id v7 = (void *)MEMORY[0x263F086E0];
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_bundleForClass_(v7, v9, v8);
    if (objc_msgSend_isEqualToString_(v6, v11, @"BCUCoverEffectsIdentifierBookBinding"))
    {
      v13 = [_BCUCoverEffectsAssets alloc];
      uint64_t v15 = objc_msgSend_initWithBundle_rtl_night_small_(v13, v14, (uint64_t)v10, 0, 0, 1);
LABEL_17:
      v30 = (void *)v15;
      v31 = _BCUCoverEffectsBookBinding;
LABEL_18:
      id v32 = [v31 alloc];
      uint64_t v34 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v32, v33, (uint64_t)v6, self->_renderer, v30, 0, 0, 0);
LABEL_19:
      id v19 = (void *)v34;
LABEL_20:

      goto LABEL_21;
    }
    if (objc_msgSend_isEqualToString_(v6, v12, @"BCUCoverEffectsIdentifierBookBindingNight"))
    {
      v28 = [_BCUCoverEffectsAssets alloc];
      uint64_t v15 = objc_msgSend_initWithBundle_rtl_night_(v28, v29, (uint64_t)v10, 0, 1);
      goto LABEL_17;
    }
    if (objc_msgSend_isEqualToString_(v6, v27, @"BCUCoverEffectsIdentifierBookBindingWithShadow"))
    {
      v37 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_small_(v37, v38, (uint64_t)v10, 0, 0, 1);
      v39 = [_BCUCoverEffectsShadow alloc];
      objc_msgSend_URLForResource_withExtension_(v10, v40, @"iBooks_Covers_Flat-S_Shadow", @"png");
      goto LABEL_28;
    }
    if (objc_msgSend_isEqualToString_(v6, v36, @"BCUCoverEffectsIdentifierBookBindingNightWithShadow"))
    {
      v42 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_(v42, v43, (uint64_t)v10, 0, 1);
      v39 = [_BCUCoverEffectsShadow alloc];
      objc_msgSend_URLForResource_withExtension_(v10, v44, @"iBooks_Covers_Flat-L_Shadow~Night", @"png");
LABEL_28:
      CFURLRef v45 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      CFURLRef v46 = v45;
      if (v45 && (v47 = CGDataProviderCreateWithURL(v45)) != 0)
      {
        v48 = v47;
        CGImageRef v49 = CGImageCreateWithPNGDataProvider(v47, 0, 1, kCGRenderingIntentDefault);
        CFRelease(v48);
      }
      else
      {
        CGImageRef v49 = 0;
      }

      uint64_t v51 = objc_msgSend_initWithImage_insets_(v39, v50, (uint64_t)v49, 22.0, 32.0, 59.0, 32.0);
      goto LABEL_33;
    }
    if (objc_msgSend_isEqualToString_(v6, v41, @"BCUCoverEffectsIdentifierBookBindingShadowOnly"))
    {
      v57 = [_BCUCoverEffectsShadow alloc];
      v58 = @"iBooks_Covers_Flat-S_Shadow";
LABEL_39:
      CGImageRef v60 = sub_236A43048((uint64_t)v58, v10);
      v30 = objc_msgSend_initWithImage_insets_(v57, v61, (uint64_t)v60, 22.0, 32.0, 59.0, 32.0);
      v62 = _BCUCoverEffectsBookBinding;
LABEL_40:
      id v63 = [v62 alloc];
      uint64_t v34 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v63, v64, (uint64_t)v6, self->_renderer, 0, v30, 0, 1);
      goto LABEL_19;
    }
    if (objc_msgSend_isEqualToString_(v6, v56, @"BCUCoverEffectsIdentifierBookBindingNightShadowOnly"))
    {
      v57 = [_BCUCoverEffectsShadow alloc];
      v58 = @"iBooks_Covers_Flat-L_Shadow~Night";
      goto LABEL_39;
    }
    if (objc_msgSend_isEqualToString_(v6, v59, @"BCUCoverEffectsIdentifierBookBindingRTL"))
    {
      v66 = [_BCUCoverEffectsAssets alloc];
      uint64_t v15 = objc_msgSend_initWithBundle_rtl_night_small_(v66, v67, (uint64_t)v10, 1, 0, 1);
      goto LABEL_17;
    }
    if (objc_msgSend_isEqualToString_(v6, v65, @"BCUCoverEffectsIdentifierBookBindingRTLNight"))
    {
      v69 = [_BCUCoverEffectsAssets alloc];
      uint64_t v15 = objc_msgSend_initWithBundle_rtl_night_(v69, v70, (uint64_t)v10, 1, 1);
      goto LABEL_17;
    }
    if (objc_msgSend_isEqualToString_(v6, v68, @"BCUCoverEffectsIdentifierBookBindingRTLWithShadow"))
    {
      v72 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_small_(v72, v73, (uint64_t)v10, 1, 0, 1);
      v74 = [_BCUCoverEffectsShadow alloc];
      v75 = @"iBooks_Covers_RTL_Flat-S_Shadow";
LABEL_49:
      CGImageRef v79 = sub_236A43048((uint64_t)v75, v10);
      uint64_t v51 = objc_msgSend_initWithImage_insets_(v74, v80, (uint64_t)v79, 22.0, 32.0, 59.0, 32.0);
LABEL_33:
      v52 = (void *)v51;
      v53 = _BCUCoverEffectsBookBinding;
LABEL_34:
      id v54 = [v53 alloc];
      id v19 = objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v54, v55, (uint64_t)v6, self->_renderer, v30, v52, 0, 0);

      goto LABEL_20;
    }
    if (objc_msgSend_isEqualToString_(v6, v71, @"BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow"))
    {
      v77 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_(v77, v78, (uint64_t)v10, 1, 1);
      v74 = [_BCUCoverEffectsShadow alloc];
      v75 = @"iBooks_Covers_RTL_Flat-L_Shadow~Night";
      goto LABEL_49;
    }
    if (objc_msgSend_isEqualToString_(v6, v76, @"BCUCoverEffectsIdentifierBookBindingRTLShadowOnly"))
    {
      v57 = [_BCUCoverEffectsShadow alloc];
      v58 = @"iBooks_Covers_RTL_Flat-S_Shadow";
      goto LABEL_39;
    }
    if (objc_msgSend_isEqualToString_(v6, v81, @"BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly"))
    {
      v57 = [_BCUCoverEffectsShadow alloc];
      v58 = @"iBooks_Covers_RTL_Flat-L_Shadow~Night";
      goto LABEL_39;
    }
    if (objc_msgSend_isEqualToString_(v6, v82, @"BCUCoverEffectsIdentifierAudiobook"))
    {
      v84 = [_BCUCoverEffectsAssets alloc];
      uint64_t v86 = objc_msgSend_initWithBundle_rtl_night_small_(v84, v85, (uint64_t)v10, 0, 0, 1);
LABEL_58:
      v30 = (void *)v86;
      v31 = _BCUCoverEffectsAudiobook;
      goto LABEL_18;
    }
    if (objc_msgSend_isEqualToString_(v6, v83, @"BCUCoverEffectsIdentifierAudiobookNight"))
    {
      v88 = [_BCUCoverEffectsAssets alloc];
      uint64_t v86 = objc_msgSend_initWithBundle_rtl_night_(v88, v89, (uint64_t)v10, 0, 1);
      goto LABEL_58;
    }
    if (objc_msgSend_isEqualToString_(v6, v87, @"BCUCoverEffectsIdentifierAudiobookWithShadow"))
    {
      v91 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_small_(v91, v92, (uint64_t)v10, 0, 0, 1);
      v93 = [_BCUCoverEffectsShadow alloc];
      v94 = @"iBooks_Covers_Flat-S_Shadow";
LABEL_63:
      CGImageRef v98 = sub_236A43048((uint64_t)v94, v10);
      v52 = objc_msgSend_initWithImage_insets_(v93, v99, (uint64_t)v98, 22.0, 32.0, 59.0, 32.0);
      v53 = _BCUCoverEffectsAudiobook;
      goto LABEL_34;
    }
    if (objc_msgSend_isEqualToString_(v6, v90, @"BCUCoverEffectsIdentifierAudiobookNightWithShadow"))
    {
      v96 = [_BCUCoverEffectsAssets alloc];
      v30 = objc_msgSend_initWithBundle_rtl_night_(v96, v97, (uint64_t)v10, 0, 1);
      v93 = [_BCUCoverEffectsShadow alloc];
      v94 = @"iBooks_Covers_Flat-L_Shadow~Night";
      goto LABEL_63;
    }
    if (objc_msgSend_isEqualToString_(v6, v95, @"BCUCoverEffectsIdentifierAudiobookShadowOnly"))
    {
      v101 = [_BCUCoverEffectsShadow alloc];
      v102 = @"iBooks_Covers_Flat-S_Shadow";
LABEL_68:
      CGImageRef v104 = sub_236A43048((uint64_t)v102, v10);
      v30 = objc_msgSend_initWithImage_insets_(v101, v105, (uint64_t)v104, 22.0, 32.0, 59.0, 32.0);
      v62 = _BCUCoverEffectsAudiobook;
      goto LABEL_40;
    }
    if (objc_msgSend_isEqualToString_(v6, v100, @"BCUCoverEffectsIdentifierAudiobookNightShadowOnly"))
    {
      v101 = [_BCUCoverEffectsShadow alloc];
      v102 = @"iBooks_Covers_Flat-L_Shadow~Night";
      goto LABEL_68;
    }
    if (objc_msgSend_isEqualToString_(v6, v103, @"BCUCoverEffectsIdentifierPDF"))
    {
      v107 = [_BCUCoverEffectsPDF alloc];
      renderer = self->_renderer;
      uint64_t v110 = (uint64_t)v6;
      uint64_t v111 = 1;
      uint64_t v112 = 0;
LABEL_80:
      id v26 = (id)objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v107, v108, v110, renderer, v111, v112, 0);
LABEL_14:
      id v19 = v26;
      goto LABEL_21;
    }
    if (objc_msgSend_isEqualToString_(v6, v106, @"BCUCoverEffectsIdentifierPDFNight"))
    {
      v114 = [_BCUCoverEffectsPDF alloc];
      v116 = self->_renderer;
      uint64_t v117 = (uint64_t)v6;
      uint64_t v118 = 1;
      uint64_t v119 = 0;
LABEL_84:
      id v26 = (id)objc_msgSend_initWithIdentifier_renderer_image_shadow_night_(v114, v115, v117, v116, v118, v119, 1);
      goto LABEL_14;
    }
    if (objc_msgSend_isEqualToString_(v6, v113, @"BCUCoverEffectsIdentifierPDFWithShadow"))
    {
      v107 = [_BCUCoverEffectsPDF alloc];
      renderer = self->_renderer;
      uint64_t v110 = (uint64_t)v6;
      uint64_t v111 = 1;
LABEL_79:
      uint64_t v112 = 1;
      goto LABEL_80;
    }
    if (objc_msgSend_isEqualToString_(v6, v120, @"BCUCoverEffectsIdentifierPDFNightWithShadow"))
    {
      v114 = [_BCUCoverEffectsPDF alloc];
      v116 = self->_renderer;
      uint64_t v117 = (uint64_t)v6;
      uint64_t v118 = 1;
LABEL_83:
      uint64_t v119 = 1;
      goto LABEL_84;
    }
    if (objc_msgSend_isEqualToString_(v6, v121, @"BCUCoverEffectsIdentifierPDFShadowOnly"))
    {
      v107 = [_BCUCoverEffectsPDF alloc];
      renderer = self->_renderer;
      uint64_t v110 = (uint64_t)v6;
      uint64_t v111 = 0;
      goto LABEL_79;
    }
    if (objc_msgSend_isEqualToString_(v6, v122, @"BCUCoverEffectsIdentifierPDFNightShadowOnly"))
    {
      v114 = [_BCUCoverEffectsPDF alloc];
      v116 = self->_renderer;
      uint64_t v117 = (uint64_t)v6;
      uint64_t v118 = 0;
      goto LABEL_83;
    }
    if (objc_msgSend_isEqualToString_(v6, v123, @"BCUCoverEffectsIdentifierIdentity"))
    {
      v124 = [_BCUCoverEffectsIdentity alloc];
      id v26 = (id)objc_msgSend_initWithIdentifier_renderer_assets_shadow_seriesShadow_shadowOnly_(v124, v125, (uint64_t)v6, self->_renderer, 0, 0, 0, 0);
      goto LABEL_14;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_236A49250((uint64_t)v6);
    }
    id v19 = 0;
  }
  else
  {
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    uint64_t v10 = objc_msgSend_bookCoverEffectFilters(self, v4, v5, 0);
    id v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v16, (uint64_t)&v126, v130, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v127;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v127 != v20) {
            objc_enumerationMutation(v10);
          }
          id v22 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend_identifier(v22, v17, v18);
          int isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v6);

          if (isEqualToString)
          {
            id v26 = v22;
            goto LABEL_14;
          }
        }
        id v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v126, v130, 16);
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
LABEL_21:

  return v19;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)bookCoverEffectFilters
{
  return self->_bookCoverEffectFilters;
}

- (NSArray)seriesCoverEffectFilters
{
  return self->_seriesCoverEffectFilters;
}

- (NSArray)templateImageFilters
{
  return self->_templateImageFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateImageFilters, 0);
  objc_storeStrong((id *)&self->_seriesCoverEffectFilters, 0);
  objc_storeStrong((id *)&self->_bookCoverEffectFilters, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end