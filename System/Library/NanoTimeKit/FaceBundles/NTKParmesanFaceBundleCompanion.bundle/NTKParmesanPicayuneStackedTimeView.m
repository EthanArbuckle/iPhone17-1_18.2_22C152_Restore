@interface NTKParmesanPicayuneStackedTimeView
- (void)layoutSubviews;
@end

@implementation NTKParmesanPicayuneStackedTimeView

- (void)layoutSubviews
{
  v131.receiver = self;
  v131.super_class = (Class)NTKParmesanPicayuneStackedTimeView;
  [(NTKParmesanPicayuneStackedTimeView *)&v131 layoutSubviews];
  objc_msgSend_device(self, v3, v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8DD0);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8DD8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&qword_2691D8DD8);
  if (v9 != v6)
  {

LABEL_5:
    id v15 = objc_storeWeak(&qword_2691D8DD8, v6);
    qword_2691D8DE0 = objc_msgSend_version(v6, v16, v17, v18);

    sub_246B5F280(v19, (const char *)v6);
    goto LABEL_6;
  }
  uint64_t v13 = objc_msgSend_version(v6, v10, v11, v12);
  uint64_t v14 = qword_2691D8DE0;

  if (v13 != v14) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8DD0);
  double v20 = *(double *)&qword_2691D8DC0;
  double v21 = *(double *)&qword_2691D8DC8;

  objc_msgSend_bounds(self, v22, v23, v24);
  double Width = CGRectGetWidth(v132);
  objc_msgSend_bounds(self, v26, v27, v28);
  double Height = CGRectGetHeight(v133);
  objc_msgSend_paddingInsets(self, v30, v31, v32);
  double v34 = v21 - v33;
  v38 = objc_msgSend_minuteLabel(self, v35, v36, v37);
  objc_msgSend_frame(v38, v39, v40, v41);
  double v43 = v42;
  double v45 = v44;

  objc_msgSend_paddingInsets(self, v46, v47, v48);
  double v50 = Width - v49 - v43;
  v54 = objc_msgSend_minuteLabel(self, v51, v52, v53);
  objc_msgSend_opticalInsets(v54, v55, v56, v57);
  double v59 = v50 + v58;

  v63 = objc_msgSend_minuteLabel(self, v60, v61, v62);
  objc_msgSend__lastLineBaseline(v63, v64, v65, v66);
  double v68 = Height - v67 - v34;

  v72 = objc_msgSend_minuteLabel(self, v69, v70, v71);
  objc_msgSend_setFrame_(v72, v73, v74, v75, v59, v68, v43, v45);

  v79 = objc_msgSend_inactiveMinuteLabel(self, v76, v77, v78);
  objc_msgSend_setFrame_(v79, v80, v81, v82, v59, v68, v43, v45);

  v86 = objc_msgSend_hourLabel(self, v83, v84, v85);
  objc_msgSend_frame(v86, v87, v88, v89);
  double v91 = v90;
  double v93 = v92;

  objc_msgSend_paddingInsets(self, v94, v95, v96);
  double v98 = Width - v97 - v91;
  v102 = objc_msgSend_hourLabel(self, v99, v100, v101);
  objc_msgSend_opticalInsets(v102, v103, v104, v105);
  double v107 = v98 + v106;

  v111 = objc_msgSend_hourLabel(self, v108, v109, v110);
  objc_msgSend__lastLineBaseline(v111, v112, v113, v114);
  double v116 = Height - v115 - (v20 + v34);

  v120 = objc_msgSend_hourLabel(self, v117, v118, v119);
  objc_msgSend_setFrame_(v120, v121, v122, v123, v107, v116, v91, v93);

  v127 = objc_msgSend_inactiveHourLabel(self, v124, v125, v126);
  objc_msgSend_setFrame_(v127, v128, v129, v130, v107, v116, v91, v93);
}

@end