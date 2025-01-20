@interface UIView(QLPUDisplayVelocity)
+ (void)_qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:;
+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:;
+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:;
+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:;
@end

@implementation UIView(QLPUDisplayVelocity)

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  id v29 = a11;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __151__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  v36[3] = &unk_2642F6970;
  id v37 = v29;
  double v38 = a8;
  double v39 = a9;
  uint64_t v40 = a17;
  uint64_t v41 = a13;
  long long v30 = a12[1];
  v35[0] = *a12;
  v35[1] = v30;
  v35[2] = a12[2];
  id v31 = v29;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v31, v35, v36, a14, a2, a3, a4, a5, a6, a7, a18, a19, a20);
}

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  id v28 = a10;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __143__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v33[3] = &unk_2642F6998;
  id v34 = v28;
  double v35 = a8;
  uint64_t v36 = a12;
  long long v29 = a11[1];
  v32[0] = *a11;
  v32[1] = v29;
  v32[2] = a11[2];
  id v30 = v28;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v30, v32, v33, a13, a2, a3, a4, a5, a6, a7, a16, a17, a18);
}

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:
{
  id v30 = a11;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __162__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke;
  v37[3] = &unk_2642F69C0;
  id v38 = v30;
  double v39 = a8;
  double v40 = a9;
  uint64_t v41 = a13;
  long long v42 = a17;
  uint64_t v43 = a18;
  long long v31 = a12[1];
  v36[0] = *a12;
  v36[1] = v31;
  v36[2] = a12[2];
  id v32 = v30;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v32, v36, v37, a14, a2, a3, a4, a5, a6, a7, a19, a20, a21);
}

+ (void)_qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v27 = a9;
  id v28 = a11;
  id v29 = a12;
  [v27 center];
  double v31 = v30;
  double v33 = v32;
  [v27 bounds];
  CGFloat v78 = v35;
  CGFloat v80 = v34;
  CGFloat v74 = v37;
  CGFloat v76 = v36;
  memset(&v141, 0, sizeof(v141));
  if (v27) {
    [v27 transform];
  }
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x2020000000;
  char v140 = 1;
  id v38 = dispatch_group_create();
  dispatch_group_enter(v38);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_2642F69E8;
  id v39 = v29;
  id v137 = v39;
  v138 = v139;
  dispatch_group_notify(v38, MEMORY[0x263EF83A0], block);
  if (a1 == v31)
  {
    a1 = v31;
  }
  else
  {
    dispatch_group_enter(v38);
    v132[0] = MEMORY[0x263EF8330];
    v132[1] = 3221225472;
    v132[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v132[3] = &unk_2642F5858;
    id v133 = v27;
    double v134 = a1;
    double v135 = v33;
    v129[0] = MEMORY[0x263EF8330];
    v129[1] = 3221225472;
    v129[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v129[3] = &unk_2642F6A10;
    v131 = v139;
    v130 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v132, v129, a15 / (a1 - v31));
  }
  if (a2 != v33)
  {
    dispatch_group_enter(v38);
    v125[0] = MEMORY[0x263EF8330];
    v125[1] = 3221225472;
    v125[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v125[3] = &unk_2642F5858;
    id v126 = v27;
    double v127 = a1;
    double v128 = a2;
    v122[0] = MEMORY[0x263EF8330];
    v122[1] = 3221225472;
    v122[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v122[3] = &unk_2642F6A10;
    v124 = v139;
    v123 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v125, v122, a16 / (a2 - v33));
  }
  v144.origin.x = a3;
  v144.origin.y = a4;
  v144.size.width = a5;
  v144.size.height = a6;
  v149.origin.y = v78;
  v149.origin.x = v80;
  v149.size.height = v74;
  v149.size.width = v76;
  if (!CGRectEqualToRect(v144, v149))
  {
    v145.origin.x = a3;
    v145.origin.y = a4;
    v145.size.width = a5;
    v145.size.height = a6;
    double Width = CGRectGetWidth(v145);
    v146.origin.y = v78;
    v146.origin.x = v80;
    v146.size.height = v74;
    v146.size.width = v76;
    double v41 = CGRectGetWidth(v146);
    v147.origin.x = a3;
    v147.origin.y = a4;
    v147.size.width = a5;
    v147.size.height = a6;
    double Height = CGRectGetHeight(v147);
    v148.origin.y = v78;
    v148.origin.x = v80;
    v148.size.height = v74;
    v148.size.width = v76;
    double v43 = Height / CGRectGetHeight(v148);
    double v44 = 0.0;
    double v45 = 0.0;
    if (Width / v41 != 1.0) {
      double v45 = a17 / (Width / v41 + -1.0);
    }
    if (v43 != 1.0) {
      double v44 = a17 / (v43 + -1.0);
    }
    double v46 = (v45 + v44) * 0.5;
    dispatch_group_enter(v38);
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v116[3] = &unk_2642F5880;
    id v117 = v27;
    CGFloat v118 = a3;
    CGFloat v119 = a4;
    CGFloat v120 = a5;
    CGFloat v121 = a6;
    v113[0] = MEMORY[0x263EF8330];
    v113[1] = 3221225472;
    v113[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v113[3] = &unk_2642F6A10;
    v115 = v139;
    v114 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v116, v113, v46);
  }
  long long v47 = *(_OWORD *)(a10 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a10;
  *(_OWORD *)&t1.c = v47;
  *(_OWORD *)&t1.double tx = *(_OWORD *)(a10 + 32);
  CGAffineTransform t2 = v141;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v48 = *(_OWORD *)&v141.a;
    double ty = v141.ty;
    double tx = v141.tx;
    double v49 = atan2(v141.b, v141.a);
    __double2 v50 = __sincos_stret(v49);
    if (fabs(v50.__cosval) <= fabs(v50.__sinval))
    {
      double v51 = *((double *)&v48 + 1) / v50.__sinval;
      double v52 = -v141.c / v50.__sinval;
    }
    else
    {
      double v51 = *(double *)&v48 / v50.__cosval;
      double v52 = v141.d / v50.__cosval;
    }
    double v53 = *(double *)a10;
    long double v54 = *(double *)(a10 + 8);
    double v56 = *(double *)(a10 + 32);
    double v55 = *(double *)(a10 + 40);
    double v77 = atan2(v54, *(long double *)a10);
    __double2 v57 = __sincos_stret(v77);
    if (fabs(v57.__cosval) <= fabs(v57.__sinval))
    {
      double v58 = v54 / v57.__sinval;
      double v59 = -*(double *)(a10 + 16) / v57.__sinval;
    }
    else
    {
      double v58 = v53 / v57.__cosval;
      double v59 = *(double *)(a10 + 24) / v57.__cosval;
    }
    double v60 = v77;
    if (vabdd_f64(tx, v56) > 0.00000999999975 || vabdd_f64(ty, v55) > 0.00000999999975)
    {
      v61 = (void **)MEMORY[0x263F62940];
      v62 = (void *)*MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v62 = *v61;
      }
      v63 = v62;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        CGAffineTransform t1 = v141;
        NSStringFromCGAffineTransform(&t1);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        long long v65 = *(_OWORD *)(a10 + 16);
        *(_OWORD *)&t1.a = *(_OWORD *)a10;
        *(_OWORD *)&t1.c = v65;
        *(_OWORD *)&t1.double tx = *(_OWORD *)(a10 + 32);
        v66 = NSStringFromCGAffineTransform(&t1);
        LODWORD(t2.a) = 138412546;
        *(void *)((char *)&t2.a + 4) = v64;
        WORD2(t2.b) = 2112;
        *(void *)((char *)&t2.b + 6) = v66;
        _os_log_impl(&dword_217F61000, v63, OS_LOG_TYPE_INFO, "animation of translational transforms is not supported (%@ => %@) #Generic", (uint8_t *)&t2, 0x16u);
      }
    }
    if (v58 == v51 && v59 == v52)
    {
      double v59 = v52;
      double v58 = v51;
    }
    else
    {
      double v67 = v59 / v52;
      double v68 = 0.0;
      double v69 = 0.0;
      if (v58 / v51 != 1.0) {
        double v69 = a17 / (v58 / v51 + -1.0);
      }
      if (v67 != 1.0) {
        double v68 = a17 / (v67 + -1.0);
      }
      double v75 = v68;
      double v70 = vabdd_f64(v69, v68);
      if (v70 > 0.00000999999975) {
        double v71 = v52;
      }
      else {
        double v71 = v59;
      }
      dispatch_group_enter(v38);
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
      v105[3] = &unk_2642F6A38;
      id v72 = v27;
      id v106 = v72;
      double v107 = tx;
      double v108 = ty;
      double v109 = v58;
      double v110 = v71;
      double v111 = v49;
      v102[0] = MEMORY[0x263EF8330];
      v102[1] = 3221225472;
      v102[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_5;
      v102[3] = &unk_2642F6A10;
      v104 = v139;
      v73 = v38;
      v103 = v73;
      (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v105, v102, v69);
      double v60 = v77;
      if (v70 > 0.00000999999975)
      {
        dispatch_group_enter(v73);
        v95[0] = MEMORY[0x263EF8330];
        v95[1] = 3221225472;
        v95[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_6;
        v95[3] = &unk_2642F6A38;
        id v96 = v72;
        double v97 = tx;
        double v98 = ty;
        double v99 = v58;
        double v100 = v59;
        double v101 = v49;
        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_7;
        v92[3] = &unk_2642F6A10;
        v94 = v139;
        v93 = v73;
        (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v95, v92, v75);
      }
    }
    if (v60 != v49)
    {
      dispatch_group_enter(v38);
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_8;
      v85[3] = &unk_2642F6A38;
      id v86 = v27;
      double v87 = tx;
      double v88 = ty;
      double v89 = v58;
      double v90 = v59;
      double v91 = v60;
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_9;
      v82[3] = &unk_2642F6A10;
      v84 = v139;
      v83 = v38;
      (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v85, v82, a18 / (v60 - v49));
    }
  }
  dispatch_group_leave(v38);

  _Block_object_dispose(v139, 8);
}

@end