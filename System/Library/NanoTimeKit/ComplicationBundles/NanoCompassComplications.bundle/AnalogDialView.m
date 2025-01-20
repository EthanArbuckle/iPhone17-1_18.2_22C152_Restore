@interface AnalogDialView
+ (id)richCircularLevelSubdialForDevice:(id)a3 andComplicationFamily:(int64_t)a4;
- (AnalogDialView)initWithDialDiameter:(double)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)tickGroups;
- (double)dialDiameter;
- (void)addTicksWithCount:(unint64_t)a3 moduloGroups:(id)a4 sizes:(id)a5 roundedCorners:(id)a6;
- (void)applyTickColor:(id)a3 toGroupIndex:(unint64_t)a4;
- (void)applyTickColor:(id)a3 toModulo:(unint64_t)a4;
- (void)layoutSubviews;
@end

@implementation AnalogDialView

+ (id)richCircularLevelSubdialForDevice:(id)a3 andComplicationFamily:(int64_t)a4
{
  v62[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268920D48);
  id WeakRetained = objc_loadWeakRetained(&qword_268920D50);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&qword_268920D50);
    if (v8 == v5)
    {
      uint64_t v12 = objc_msgSend_version(v5, v9, v10, v11);
      uint64_t v13 = qword_268920D58;

      if (v12 == v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v14 = objc_storeWeak(&qword_268920D50, v5);
  qword_268920D58 = objc_msgSend_version(v5, v15, v16, v17);

  sub_2375A90C4(v18, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268920D48);
  if (a4 == 12)
  {
    v20 = &xmmword_268920D20;
  }
  else
  {
    if (a4 != 10)
    {
      v19 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_2375D7FFC(a4, v19);
      }
    }
    v20 = &xmmword_268920CF0;
  }
  double v21 = *(double *)v20;
  long long v22 = *(long long *)((char *)v20 + 8);
  long long v60 = *(long long *)((char *)v20 + 24);
  long long v61 = v22;

  v23 = [AnalogDialView alloc];
  v27 = objc_msgSend_initWithDialDiameter_(v23, v24, v25, v26, v21);
  long long v59 = v61;
  v29 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v28, (uint64_t)&v59, (uint64_t)"{CGSize=dd}");
  v62[0] = v29;
  long long v58 = v60;
  v31 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v30, (uint64_t)&v58, (uint64_t)"{CGSize=dd}");
  v62[1] = v31;
  v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v62, 2);
  objc_msgSend_addTicksWithCount_moduloGroups_sizes_roundedCorners_(v27, v34, 40, (uint64_t)&unk_26EA53A40, v33, &unk_26EA53A58);

  v38 = objc_msgSend_tickGroups(v27, v35, v36, v37);
  unint64_t v42 = objc_msgSend_count(v38, v39, v40, v41);

  if (v42 >= 2)
  {
    unint64_t v46 = 1;
    do
    {
      v47 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v43, v44, v45, 1.0, 0.600000024);
      objc_msgSend_applyTickColor_toGroupIndex_(v27, v48, (uint64_t)v47, v46);

      ++v46;
      v52 = objc_msgSend_tickGroups(v27, v49, v50, v51);
      unint64_t v56 = objc_msgSend_count(v52, v53, v54, v55);
    }
    while (v46 < v56);
  }

  return v27;
}

- (AnalogDialView)initWithDialDiameter:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AnalogDialView;
  result = -[AnalogDialView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  if (result) {
    result->_dialDiameter = a3;
  }
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AnalogDialView;
  [(AnalogDialView *)&v4 layoutSubviews];
  objc_msgSend_insertSubview_atIndex_(self, v3, (uint64_t)self->_tickContainer, 0);
}

- (CGSize)intrinsicContentSize
{
  double dialDiameter = self->_dialDiameter;
  double v3 = dialDiameter;
  result.height = v3;
  result.width = dialDiameter;
  return result;
}

- (void)addTicksWithCount:(unint64_t)a3 moduloGroups:(id)a4 sizes:(id)a5 roundedCorners:(id)a6
{
  uint64_t v192 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v184 = a5;
  id v12 = a6;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v183 = self;
  uint64_t v13 = self->_tickGroups;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v187, (uint64_t)v191, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v188;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v188 != v20) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_removeFromSuperview(*(void **)(*((void *)&v187 + 1) + 8 * i), v16, v17, v18);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v187, (uint64_t)v191, 16);
    }
    while (v19);
  }

  long long v22 = v183;
  objc_msgSend_removeFromSuperview(v183->_tickContainer, v23, v24, v25);
  id v26 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend_bounds(v183, v27, v28, v29);
  uint64_t v33 = objc_msgSend_initWithFrame_(v26, v30, v31, v32);
  tickContainer = v183->_tickContainer;
  v183->_tickContainer = (UIView *)v33;

  objc_msgSend_addSubview_(v22, v35, (uint64_t)v22->_tickContainer, v36);
  objc_storeStrong((id *)&v183->_moduloGroups, a4);
  uint64_t v37 = objc_opt_new();
  if (objc_msgSend_count(v11, v38, v39, v40))
  {
    unint64_t v43 = 0;
    do
    {
      uint64_t v44 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v41, v43, v42);
      v47 = objc_msgSend_objectAtIndexedSubscript_(v11, v45, v43, v46);
      objc_msgSend_setObject_forKeyedSubscript_(v37, v48, (uint64_t)v44, (uint64_t)v47);

      ++v43;
    }
    while (v43 < objc_msgSend_count(v11, v49, v50, v51));
  }
  v180 = v37;
  objc_storeStrong((id *)&v183->_moduloToGroup, v37);
  double dialDiameter = v183->_dialDiameter;
  v182 = (NSArray *)objc_opt_new();
  if (objc_msgSend_count(v11, v53, v54, v55))
  {
    unint64_t v58 = 0;
    double v59 = dialDiameter * 0.5;
    double v61 = -(dialDiameter * 0.5);
    id v181 = v12;
    do
    {
      v62 = objc_msgSend_objectAtIndexedSubscript_(v11, v56, v58, v57);
      unint64_t v66 = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65);

      v69 = objc_msgSend_objectAtIndexedSubscript_(v184, v67, v58, v68);
      objc_msgSend_CGSizeValue(v69, v70, v71, v72);
      double v74 = v73;
      double v76 = v75;

      if (v12)
      {
        v80 = objc_msgSend_objectAtIndexedSubscript_(v12, v77, v58, v79);
        int v84 = objc_msgSend_BOOLValue(v80, v81, v82, v83) ^ 1;
      }
      else
      {
        int v84 = 1;
      }
      v85 = objc_msgSend_layer(MEMORY[0x263F157E8], v77, v78, v79);
      objc_msgSend_setBounds_(v85, v86, v87, v88, 0.0, 0.0, v22->_dialDiameter, v22->_dialDiameter);
      v92 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v89, v90, v91);
      objc_msgSend_screenScale(v92, v93, v94, v95);
      objc_msgSend_setContentsScale_(v85, v96, v97, v98);

      if (a3)
      {
        unint64_t v102 = 0;
        if (v74 >= v76) {
          double v103 = v76;
        }
        else {
          double v103 = v74;
        }
        double v104 = v103 * 0.5;
        if (v84) {
          double v105 = 0.0;
        }
        else {
          double v105 = v104;
        }
        do
        {
          if (!(v102 % v66))
          {
            if (v58)
            {
              uint64_t v106 = 0;
              while (1)
              {
                v107 = objc_msgSend_objectAtIndexedSubscript_(v11, v99, v106, v101);
                unint64_t v111 = v102 % objc_msgSend_unsignedIntegerValue(v107, v108, v109, v110);

                if (!v111) {
                  break;
                }
                if (v58 == ++v106) {
                  goto LABEL_28;
                }
              }
            }
            else
            {
LABEL_28:
              double v60 = 6.28318531 / (double)a3;
              v112 = objc_msgSend_layer(MEMORY[0x263F157E8], v99, v100, v101);
              objc_msgSend_setFrame_(v112, v113, v114, v115, 0.0, 0.0, v74, v76);
              objc_msgSend_setAnchorPoint_(v112, v116, v117, v118, 0.5, 0.0);
              objc_msgSend_setCornerRadius_(v112, v119, v120, v121, v105);
              __double2 v122 = __sincos_stret(v60 * (double)v102);
              objc_msgSend_setPosition_(v112, v123, v124, v125, v59 + v59 * v122.__sinval, v59 + v61 * v122.__cosval);
              objc_msgSend_whiteColor(MEMORY[0x263F1C550], v126, v127, v128);
              id v129 = objc_claimAutoreleasedReturnValue();
              uint64_t v133 = objc_msgSend_CGColor(v129, v130, v131, v132);
              objc_msgSend_setBackgroundColor_(v112, v134, v133, v135);

              CGAffineTransformMakeRotation(&v186, v60 * (double)v102);
              CGAffineTransform v185 = v186;
              objc_msgSend_setAffineTransform_(v112, v136, (uint64_t)&v185, v137);
              objc_msgSend_addSublayer_(v85, v138, (uint64_t)v112, v139);
            }
          }
          ++v102;
        }
        while (v102 != a3);
      }
      objc_msgSend_bounds(v85, v99, v100, v101);
      v193.width = v140;
      v193.height = v141;
      UIGraphicsBeginImageContextWithOptions(v193, 0, 0.0);
      CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
      objc_msgSend_renderInContext_(v85, v143, (uint64_t)CurrentContext, v144);
      v145 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      id v146 = objc_alloc(MEMORY[0x263F1C6D0]);
      v149 = objc_msgSend_imageWithRenderingMode_(v145, v147, 2, v148);
      v152 = objc_msgSend_initWithImage_(v146, v150, (uint64_t)v149, v151);

      long long v22 = v183;
      objc_msgSend_bounds(v183, v153, v154, v155);
      objc_msgSend_setFrame_(v152, v156, v157, v158);
      v162 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v159, v160, v161, 1.0, 0.333333343, 0.0313725509, 1.0);
      objc_msgSend_setTintColor_(v152, v163, (uint64_t)v162, v164);

      if (qword_268920D68 != -1) {
        dispatch_once(&qword_268920D68, &unk_26EA48900);
      }
      id v165 = (id)qword_268920D60;
      v169 = objc_msgSend_layer(v152, v166, v167, v168);
      objc_msgSend_setActions_(v169, v170, (uint64_t)v165, v171);

      objc_msgSend_addObject_(v182, v172, (uint64_t)v152, v173);
      objc_msgSend_addSubview_(v183->_tickContainer, v174, (uint64_t)v152, v175);

      ++v58;
      id v12 = v181;
    }
    while (v58 < objc_msgSend_count(v11, v176, v177, v178));
  }
  tickGroups = v22->_tickGroups;
  v22->_tickGroups = v182;
}

- (void)applyTickColor:(id)a3 toModulo:(unint64_t)a4
{
  moduloToGroup = self->_moduloToGroup;
  v7 = NSNumber;
  id v19 = a3;
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v7, v8, a4, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(moduloToGroup, v11, (uint64_t)v10, v12);
  uint64_t v17 = objc_msgSend_unsignedIntegerValue(v13, v14, v15, v16);

  objc_msgSend_applyTickColor_toGroupIndex_(self, v18, (uint64_t)v19, v17);
}

- (void)applyTickColor:(id)a3 toGroupIndex:(unint64_t)a4
{
  tickGroups = self->_tickGroups;
  id v6 = a3;
  objc_msgSend_objectAtIndexedSubscript_(tickGroups, v7, a4, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(v11, v9, (uint64_t)v6, v10);
}

- (NSArray)tickGroups
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickGroups, 0);
  objc_storeStrong((id *)&self->_tickContainer, 0);
  objc_storeStrong((id *)&self->_textLayers, 0);
  objc_storeStrong((id *)&self->_moduloToGroup, 0);

  objc_storeStrong((id *)&self->_moduloGroups, 0);
}

@end