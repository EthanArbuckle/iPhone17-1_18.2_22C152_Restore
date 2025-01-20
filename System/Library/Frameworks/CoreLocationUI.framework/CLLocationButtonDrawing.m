@interface CLLocationButtonDrawing
+ (id)_drawingWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5;
- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (CGSize)drawingSize;
- (CGSize)engravedSize;
- (CGSize)neededSize;
- (CLLocationButtonDrawing)initWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5;
- (NSString)localizedTitle;
- (UISTextLineDrawing)textDrawing;
- (UISVectorGlyphDrawing)glyphDrawing;
- (unsigned)secureName;
- (void)_computeImageMetrics;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)setEngravedSize:(CGSize)a3;
- (void)setGlyphDrawing:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setNeededSize:(CGSize)a3;
- (void)setTextDrawing:(id)a3;
@end

@implementation CLLocationButtonDrawing

- (CLLocationButtonDrawing)initWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLLocationButtonDrawing;
  v11 = [(CLLocationButtonDrawing *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a3);
    objc_storeStrong((id *)&v12->_currentTag, a4);
    v12->_remote = a5;
    objc_msgSend__computeImageMetrics(v12, v13, v14, v15);
  }

  return v12;
}

+ (id)_drawingWithStyle:(id)a3 tag:(id)a4 remote:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  __n128 v14 = objc_msgSend_initWithStyle_tag_remote_(v10, v11, v12, v13, v9, v8, v5);

  return v14;
}

- (CGSize)drawingSize
{
  objc_msgSend_buttonWidth(self->_currentTag, a2, v2, v3);
  double v6 = v5.n128_f64[0];
  objc_msgSend_neededSize(self, v7, v5, v8);
  if (v6 < v10.n128_f64[0]) {
    double v6 = v10.n128_f64[0];
  }
  objc_msgSend_buttonHeight(self->_currentTag, v9, v10, v11);
  double v13 = v12.n128_f64[0];
  objc_msgSend_neededSize(self, v14, v12, v15);
  if (v13 >= v16) {
    double v16 = v13;
  }
  double v17 = v6;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  CGContextSaveGState(a3);
  objc_msgSend_drawingSize(self, v6, v7, v8);
  double v10 = v9.n128_f64[0];
  double v12 = v11.n128_f64[0];
  objc_msgSend_backgroundColor(self->_currentTag, v13, v9, v11);
  id v14 = objc_claimAutoreleasedReturnValue();
  v18 = (CGColor *)objc_msgSend_CGColor(v14, v15, v16, v17);
  CGContextSetFillColorWithColor(a3, v18);

  objc_msgSend_cornerRadius(self->_currentTag, v19, v20, v21);
  CGFloat v23 = v22.n128_f64[0];
  objc_msgSend_cornerRadius(self->_currentTag, v24, v22, v25);
  CGFloat v27 = v26;
  v107.origin.x = 0.0;
  v107.origin.y = 0.0;
  v107.size.width = v10;
  v107.size.height = v12;
  v28 = CGPathCreateWithRoundedRect(v107, v23, v27, 0);
  CGContextAddPath(a3, v28);
  CGPathRelease(v28);
  CGContextFillPath(a3);
  double v29 = v10 * 0.5;
  objc_msgSend_engravedSize(self, v30, v31, v32);
  double v34 = v33.n128_f64[0];
  objc_msgSend_engravedSize(self, v35, v33, v36);
  double v38 = v37.n128_f64[0];
  v41 = objc_msgSend_textDrawing(self, v39, v37, v40);
  objc_msgSend_drawingSize(v41, v42, v43, v44);
  double v46 = v45;

  v50 = objc_msgSend_glyphDrawing(self, v47, v48, v49);
  objc_msgSend_drawingSize(v50, v51, v52, v53);
  double v55 = v54;

  v59 = objc_msgSend_textDrawing(self, v56, v57, v58);
  objc_msgSend_drawingSize(v59, v60, v61, v62);
  id v104 = v63;

  if (objc_msgSend_layoutDirection(self->_style, v64, v65, v66) == 1)
  {
    objc_msgSend_engravedSize(self, v67, v68, v69);
    v71.n128_f64[0] = v70 * 0.5;
    double v72 = v29 - v71.n128_f64[0];
    objc_msgSend_engravedSize(self, v73, v71, v74);
    v76.n128_f64[0] = v75 * 0.5;
    double v77 = v29 + v76.n128_f64[0];
    v80 = objc_msgSend_glyphDrawing(self, v78, v76, v79);
    objc_msgSend_drawingSize(v80, v81, v82, v83);
    double v85 = v77 - v84;
  }
  else
  {
    double v85 = v29 - v34 * 0.5;
    v68.n128_f64[0] = v29 + v38 * 0.5;
    double v72 = v68.n128_f64[0] - v46;
  }
  if (!self->_remote) {
    CGContextSetAlpha(a3, 0.5);
  }
  double v86 = v12 * 0.5;
  if (objc_msgSend_icon(self->_currentTag, v67, v68, v69))
  {
    v88.n128_f64[0] = v55 * 0.5;
    v90 = objc_msgSend_glyphDrawing(self, v87, v88, v89);
    v91.n128_f64[0] = v85;
    v92.n128_f64[0] = v86 - v55 * 0.5;
    objc_msgSend_drawInContext_atPoint_(v90, v93, v91, v92, a3);
  }
  CGContextRestoreGState(a3);
  if (!self->_remote) {
    CGContextSetAlpha(a3, 0.5);
  }
  if (objc_msgSend_label(self->_currentTag, v94, v95, v96) || !objc_msgSend_icon(self->_currentTag, v97, v98, v99))
  {
    v98.n128_f64[0] = *(double *)&v104 * 0.5;
    double v100 = v86 - *(double *)&v104 * 0.5;
    objc_msgSend_textDrawing(self, v97, v98, v99);
    id v105 = (id)objc_claimAutoreleasedReturnValue();
    v101.n128_f64[0] = v72;
    v102.n128_f64[0] = v100;
    objc_msgSend_drawInContext_atPoint_(v105, v103, v101, v102, a3);
  }
}

- (void)_computeImageMetrics
{
  uint64_t v248 = *MEMORY[0x263EF8340];
  objc_msgSend_setRenderedSuccessfully_(self->_currentTag, a2, v2, v3, 0);
  __n128 v8 = objc_msgSend_bundleWithPath_(MEMORY[0x263F086E0], v5, v6, v7, @"/System/Library/CoreServices/CoreGlyphs.bundle");
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F38378]);
    id v241 = 0;
    double v13 = objc_msgSend_initWithName_fromBundle_error_(v9, v10, v11, v12, @"Assets", v8, &v241);
    id v14 = v241;
    v18 = v14;
    if (v13) {
      BOOL v19 = v14 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (!v19) {
      goto LABEL_43;
    }
    objc_msgSend_fontContentSizeCategory(self->_style, v15, v16, v17);
    __n128 v20 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
    objc_msgSend_fontSize(self->_currentTag, v21, v22, v23);
    CTFontRef v25 = CTFontCreateWithFontDescriptor(v20, v24, 0);
    CFRelease(v20);
    CFAutorelease(v25);
    uint64_t v29 = objc_msgSend_label(self->_currentTag, v26, v27, v28);
    __n128 v33 = objc_msgSend_objectAtIndexedSubscript_(&unk_26F0BC1A8, v30, v31, v32, v29);
    objc_msgSend_secureNameForStyle_(self->_currentTag, v34, v35, v36, self->_style);
    __n128 v40 = objc_msgSend_localization(self->_style, v37, v38, v39);
    v41 = UISLocalizedStringForSecureName();

    if (objc_msgSend_isEqualToString_(v33, v42, v43, v44, v41))
    {
      if (!CFBundleGetBundleWithIdentifier(@"com.apple.locationd.CoreLocationUI"))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton could not find CoreLocationUI bundle for localization", buf, 2u);
        }
        v59 = v41;
        goto LABEL_42;
      }
      v239 = v18;
      __n128 v48 = (void *)MEMORY[0x263EFF960];
      objc_msgSend_localization(self->_style, v45, v46, v47);
      v50 = __n128 v49 = v33;
      double v54 = objc_msgSend_localeWithLocaleIdentifier_(v48, v51, v52, v53, v50);
      __n128 v58 = objc_msgSend_languageCode(v54, v55, v56, v57);

      __n128 v33 = v49;
      v59 = (void *)CFBundleCopyLocalizedStringForLocalization();

      if (objc_msgSend_isEqualToString_(v49, v60, v61, v62, v59))
      {
        v18 = v239;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          __n128 v66 = objc_msgSend_localization(self->_style, v63, v64, v65);
          *(_DWORD *)buf = 138412290;
          v245 = v66;
        }
        goto LABEL_42;
      }

      v18 = v239;
    }
    else
    {
      v59 = v41;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      double v70 = objc_msgSend_localization(self->_style, v67, v68, v69);
      *(_DWORD *)buf = 138412546;
      v245 = v59;
      __int16 v246 = 2112;
      v247 = v70;
    }
    if (v59) {
      objc_msgSend_setLocalizedTitle_(self, v67, v68, v69, v59);
    }
    uint64_t v71 = *MEMORY[0x263F039A0];
    v243[0] = v25;
    uint64_t v72 = *MEMORY[0x263F03C60];
    v242[0] = v71;
    v242[1] = v72;
    objc_msgSend_tintColor(self->_currentTag, v67, v68, v69);
    id v73 = objc_claimAutoreleasedReturnValue();
    v243[1] = objc_msgSend_CGColor(v73, v74, v75, v76);
    v80 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, v78, v79, v243, v242, 2);

    id v81 = objc_alloc(MEMORY[0x263F83E88]);
    v85.n128_f64[0] = (double)objc_msgSend_displayScale(self->_style, v82, v83, v84);
    v86.n128_u64[0] = 0x7FF8000000000000;
    __n128 v88 = objc_msgSend_initWithString_attributes_lineBreakMode_textAlignment_width_scale_(v81, v87, v86, v85, v59, v80, 0, 0);
    objc_msgSend_setTextDrawing_(self, v89, v90, v91, v88);

    __n128 v95 = objc_msgSend_textDrawing(self, v92, v93, v94);

    if (!v95)
    {
LABEL_41:

LABEL_42:
LABEL_43:

      goto LABEL_44;
    }
    v237 = v59;
    v238 = v80;
    v240 = v33;
    uint64_t v99 = objc_msgSend_icon(self->_currentTag, v96, v97, v98);
    v103 = objc_msgSend_objectAtIndexedSubscript_(&unk_26F0BC1C0, v100, v101, v102, v99);
    objc_msgSend_assetScaleFactor(self->_style, v104, v105, v106);
    unint64_t v108 = v107.n128_u64[0];
    uint64_t v111 = objc_msgSend_assetDeviceIdiom(self->_style, v109, v107, v110);
    uint64_t v115 = objc_msgSend_layoutDirection(self->_style, v112, v113, v114);
    v116.n128_f64[0] = CTFontGetSize(v25);
    unint64_t v117 = v116.n128_u64[0];
    v120 = objc_msgSend_assetAppearanceNames(self->_style, v118, v116, v119);
    v124 = objc_msgSend_lastObject(v120, v121, v122, v123);
    v125.n128_u64[0] = v108;
    v126.n128_u64[0] = v117;
    v128 = objc_msgSend_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphSize_glyphWeight_glyphPointSize_appearanceName_(v13, v127, v125, v126, v103, v111, v115, 2, 6, v124);

    if (!v128) {
      goto LABEL_40;
    }
    id v129 = objc_alloc(MEMORY[0x263F83E98]);
    objc_msgSend_tintColor(self->_currentTag, v130, v131, v132);
    id v133 = objc_claimAutoreleasedReturnValue();
    uint64_t v137 = objc_msgSend_CGColor(v133, v134, v135, v136);
    v141 = objc_msgSend_initWithVectorGlyph_tintColor_(v129, v138, v139, v140, v128, v137);
    objc_msgSend_setGlyphDrawing_(self, v142, v143, v144, v141);

    v148 = objc_msgSend_glyphDrawing(self, v145, v146, v147);

    if (!v148)
    {
LABEL_40:

      v80 = v238;
      __n128 v33 = v240;
      v59 = v237;
      goto LABEL_41;
    }
    if (objc_msgSend_icon(self->_currentTag, v149, v150, v151))
    {
      if (objc_msgSend_label(self->_currentTag, v152, v153, v154))
      {
        objc_msgSend_fontSize(self->_currentTag, v155, v156, v157);
        v158.n128_u64[0] = 0.5;
        double v160 = v159.n128_f64[0] * 0.5;
        v162 = objc_msgSend_textDrawing(self, v161, v159, v158);
        objc_msgSend_drawingSize(v162, v163, v164, v165);
        double v167 = v166.n128_f64[0];
        v170 = objc_msgSend_glyphDrawing(self, v168, v166, v169);
        objc_msgSend_drawingSize(v170, v171, v172, v173);
        double v175 = v160 + v167 + v174;

        v179 = objc_msgSend_glyphDrawing(self, v176, v177, v178);
        objc_msgSend_drawingSize(v179, v180, v181, v182);
        double v184 = v183;

        v188 = objc_msgSend_textDrawing(self, v185, v186, v187);
        objc_msgSend_drawingSize(v188, v189, v190, v191);
        double v193 = v192;

        if (v184 >= v193) {
          v196.n128_f64[0] = v184;
        }
        else {
          v196.n128_f64[0] = v193;
        }
        v195.n128_f64[0] = v175;
        objc_msgSend_setEngravedSize_(self, v194, v195, v196);
LABEL_34:
        objc_msgSend_fontSize(self->_currentTag, v197, v198, v199);
        double v209 = v208.n128_f64[0];
        objc_msgSend_engravedSize(self, v210, v208, v211);
        double v213 = v209 + v212.n128_f64[0];
        objc_msgSend_engravedSize(self, v214, v212, v215);
        v217.n128_f64[0] = v209 + v216;
        v218.n128_f64[0] = v213;
        objc_msgSend_setNeededSize_(self, v219, v218, v217);
        objc_msgSend_frame(self->_currentTag, v220, v221, v222);
        if (CGRectIsEmpty(v249)
          || (objc_msgSend_neededSize(self, v223, v224, v225),
              double v227 = v226.n128_f64[0],
              objc_msgSend_buttonWidth(self->_currentTag, v228, v226, v229),
              v227 <= v231.n128_f64[0])
          && (objc_msgSend_neededSize(self, v230, v231, v232),
              double v234 = v233.n128_f64[0],
              objc_msgSend_buttonHeight(self->_currentTag, v235, v236, v233),
              v234 <= v224.n128_f64[0]))
        {
          objc_msgSend_setRenderedSuccessfully_(self->_currentTag, v223, v224, v225, 1);
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to inappropriate sizes", buf, 2u);
        }
        goto LABEL_40;
      }
      v200 = objc_msgSend_glyphDrawing(self, v155, v156, v157);
    }
    else
    {
      v200 = objc_msgSend_textDrawing(self, v152, v153, v154);
    }
    v204 = v200;
    objc_msgSend_drawingSize(v200, v201, v202, v203);
    objc_msgSend_setEngravedSize_(self, v205, v206, v207);

    goto LABEL_34;
  }
LABEL_44:
}

- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  return 0;
}

- (CGSize)neededSize
{
  double width = self->_neededSize.width;
  double height = self->_neededSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNeededSize:(CGSize)a3
{
  self->_neededSize = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (CGSize)engravedSize
{
  double width = self->_engravedSize.width;
  double height = self->_engravedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEngravedSize:(CGSize)a3
{
  self->_engravedSize = a3;
}

- (UISTextLineDrawing)textDrawing
{
  return self->_textDrawing;
}

- (void)setTextDrawing:(id)a3
{
}

- (UISVectorGlyphDrawing)glyphDrawing
{
  return self->_glyphDrawing;
}

- (void)setGlyphDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphDrawing, 0);
  objc_storeStrong((id *)&self->_textDrawing, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_currentTag, 0);
}

@end