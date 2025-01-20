@interface AVMobileChromelessControlsView
- (AVMobileAuxiliaryControlsView)auxiliaryControlsView;
- (AVMobileChromelessBackgroundGradientView)backgroundView;
- (AVMobileChromelessContentTabsView)contentTabsView;
- (AVMobileChromelessControlsLayoutConfiguration)layoutConfiguration;
- (AVMobileChromelessControlsView)init;
- (AVMobileChromelessControlsViewDelegate)delegate;
- (AVMobileChromelessDisplayModeControlsView)displayModeControlsView;
- (AVMobileChromelessPlaybackControlsView)playbackControlsView;
- (AVMobileChromelessTimelineView)timelineView;
- (AVMobileChromelessVolumeControlsView)volumeControlsView;
- (AVMobileContentTagView)liveEdgeContentTagView;
- (AVMobileTitlebarView)titlebarView;
- (BOOL)layoutAllowed;
- (CGRect)contentIntersection;
- (double)_controlsExpansionYOffset;
- (double)_layoutContentTabsInFrame:(uint64_t)a3 withConfiguration:(double)a4 canFitState:(double)a5;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3;
- (void)layoutSubviews;
- (void)setAuxiliaryControlsView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentIntersection:(CGRect)a3;
- (void)setContentTabsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayModeControlsView:(id)a3;
- (void)setLayoutAllowed:(BOOL)a3;
- (void)setLayoutConfiguration:(AVMobileChromelessControlsLayoutConfiguration *)a3;
- (void)setLiveEdgeContentTagView:(id)a3;
- (void)setPlaybackControlsView:(id)a3;
- (void)setTimelineView:(id)a3;
- (void)setTitlebarView:(id)a3;
- (void)setVolumeControlsView:(id)a3;
@end

@implementation AVMobileChromelessControlsView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_titlebarView, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_storeStrong((id *)&self->_liveEdgeContentTagView, 0);
  objc_storeStrong((id *)&self->_displayModeControlsView, 0);
  objc_storeStrong((id *)&self->_contentTabsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_auxiliaryControlsView, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessControlsViewDelegate *)WeakRetained;
}

- (AVMobileChromelessControlsLayoutConfiguration)layoutConfiguration
{
  p_layoutConfiguration = &self->_layoutConfiguration;
  long long v5 = *(_OWORD *)&self->_layoutConfiguration.controlsPadding;
  *(_OWORD *)&retstr->includedControls = *(_OWORD *)&self->_layoutConfiguration.includedControls;
  *(_OWORD *)&retstr->controlsPadding = v5;
  result = self->_layoutConfiguration.pinnedAuxiliaryControls;
  retstr->pinnedAuxiliaryControls = (NSArray *)result;
  *(_OWORD *)&retstr->contentTabPresented = *(_OWORD *)&p_layoutConfiguration->contentTabPresented;
  retstr->contentTabPresentationHeight = p_layoutConfiguration->contentTabPresentationHeight;
  return result;
}

- (CGRect)contentIntersection
{
  double x = self->_contentIntersection.origin.x;
  double y = self->_contentIntersection.origin.y;
  double width = self->_contentIntersection.size.width;
  double height = self->_contentIntersection.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AVMobileChromelessVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (AVMobileTitlebarView)titlebarView
{
  return self->_titlebarView;
}

- (AVMobileChromelessTimelineView)timelineView
{
  return self->_timelineView;
}

- (AVMobileChromelessPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (AVMobileContentTagView)liveEdgeContentTagView
{
  return self->_liveEdgeContentTagView;
}

- (AVMobileChromelessDisplayModeControlsView)displayModeControlsView
{
  return self->_displayModeControlsView;
}

- (AVMobileChromelessContentTabsView)contentTabsView
{
  return self->_contentTabsView;
}

- (AVMobileChromelessBackgroundGradientView)backgroundView
{
  return self->_backgroundView;
}

- (AVMobileAuxiliaryControlsView)auxiliaryControlsView
{
  return self->_auxiliaryControlsView;
}

- (BOOL)layoutAllowed
{
  return self->_layoutAllowed;
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.CGFloat x = x;
    p_contentIntersection->origin.CGFloat y = y;
    p_contentIntersection->size.CGFloat width = width;
    p_contentIntersection->size.CGFloat height = height;
    v9 = [(AVMobileChromelessControlsView *)self traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    if (v10 == 1)
    {
      [(AVMobileChromelessControlsView *)self setNeedsLayout];
    }
  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  if (self->_displayModeControlsView == a3 || self->_volumeControlsView == a3) {
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  if (![(AVMobileChromelessControlsView *)self layoutAllowed]) {
    goto LABEL_152;
  }
  v3 = [(AVMobileChromelessControlsView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 1 && !CGRectIsNull(self->_contentIntersection))
  {
    double y = self->_contentIntersection.origin.y;
    double x = self->_contentIntersection.origin.x;
    double height = self->_contentIntersection.size.height;
    double width = self->_contentIntersection.size.width;
  }
  else
  {
    [(AVMobileChromelessControlsView *)self bounds];
    double y = v5;
    double x = v4;
    double height = v7;
    double width = v6;
  }

  v8 = [(AVMobileChromelessControlsView *)self layoutMarginsGuide];
  [v8 layoutFrame];
  double v185 = v9;
  double v186 = v10;
  double v12 = v11;
  double v14 = v13;

  unint64_t includedControls = self->_layoutConfiguration.includedControls;
  uint64_t v16 = *(void *)&self->_layoutConfiguration.expanded;
  double controlsPadding = self->_layoutConfiguration.controlsPadding;
  unint64_t auxiliaryControlsPlacement = self->_layoutConfiguration.auxiliaryControlsPlacement;
  v18 = self->_layoutConfiguration.pinnedAuxiliaryControls;
  BOOL contentTabPresented = self->_layoutConfiguration.contentTabPresented;
  BOOL contentTabTransitioning = self->_layoutConfiguration.contentTabTransitioning;
  int v189 = *(_DWORD *)(&self->_layoutConfiguration.contentTabTransitioning + 1);
  __int16 v190 = *(_WORD *)(&self->_layoutConfiguration.contentTabTransitioning + 5);
  unint64_t contentTabsLayout = self->_layoutConfiguration.contentTabsLayout;
  double contentTabPresentationHeight = self->_layoutConfiguration.contentTabPresentationHeight;
  v22 = v18;
  unint64_t v202 = 0;
  BOOL v23 = contentTabPresented && contentTabsLayout == 1;
  double v24 = v14;
  if (v23)
  {
    v216.origin.double x = v185;
    v216.size.double width = v186;
    v216.origin.double y = v12;
    v216.size.double height = v14;
    double v24 = v14 - (contentTabPresentationHeight - CGRectGetMinY(v216));
  }
  v187 = v22;
  v25 = self->_playbackControlsView;
  uint64_t v26 = [(AVMobileChromelessControlsView *)self effectiveUserInterfaceLayoutDirection];
  [(AVMobileChromelessPlaybackControlsView *)v25 intrinsicContentSize];
  if ((includedControls & 8) != 0)
  {
    double v28 = v27;
    float v29 = v27;
    float v30 = v24;
    float v31 = vabds_f32(v29, v30);
    if (v29 < v30 || v31 < 0.00000011921)
    {
      CGFloat v33 = v12 + (v24 - v28) * 0.5;
      -[UIView avkit_setFrame:inLayoutDirection:](v25, "avkit_setFrame:inLayoutDirection:", v26, v185, v33, v186, v28);
      BYTE4(v202) = 1;

      v217.origin.double x = v185;
      v217.origin.double y = v12;
      v217.size.double width = v186;
      v217.size.double height = v14;
      double MinY = CGRectGetMinY(v217);
      v218.origin.double x = v185;
      v218.origin.double y = v12;
      v218.size.double width = v186;
      v218.size.double height = v14;
      double MaxY = CGRectGetMaxY(v218);
      v219.origin.double x = v185;
      v219.origin.double y = v33;
      v219.size.double width = v186;
      v219.size.double height = v28;
      double v35 = CGRectGetMinY(v219);
      v220.origin.double x = v185;
      v220.origin.double y = v33;
      v220.size.double width = v186;
      v220.size.double height = v28;
      CGFloat v36 = CGRectGetMaxY(v220);
      uint64_t v165 = v16;
      BOOL v169 = contentTabTransitioning;
      v221.origin.double y = controlsPadding + v36;
      v221.size.double height = MaxY - v36 - controlsPadding;
      v221.origin.double x = v185;
      double v171 = v221.origin.y;
      v221.size.double width = v186;
      double v176 = v221.size.height;
      double v164 = CGRectGetMinY(v221);
      v168 = v187;
      v37 = self->_displayModeControlsView;
      v38 = self->_volumeControlsView;
      uint64_t v39 = [(AVMobileChromelessControlsView *)self effectiveUserInterfaceLayoutDirection];
      [(AVMobileChromelessDisplayModeControlsView *)v37 intrinsicContentSize];
      double v41 = v40;
      [(AVMobileChromelessVolumeControlsView *)v38 intrinsicContentSize];
      if (v41 >= v42) {
        double v43 = v41;
      }
      else {
        double v43 = v42;
      }
      -[AVMobileChromelessDisplayModeControlsView sizeThatFits:](v37, "sizeThatFits:", v186 * 0.5, v43);
      double v45 = v44;
      unint64_t v167 = auxiliaryControlsPlacement;
      double v166 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](self);
      CGFloat v46 = *MEMORY[0x1E4F1DB28];
      CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v48 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      BOOL v49 = v43 <= v35 - MinY - controlsPadding;
      unsigned int v50 = v49 & (includedControls >> 1);
      if (v50 == 1)
      {
        CGFloat r1 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        -[UIView avkit_setFrame:inLayoutDirection:](v37, "avkit_setFrame:inLayoutDirection:", v39, v185, MinY - v166, v45, v43);
        v222.origin.double x = v46;
        v222.origin.double y = rect;
        v222.size.double width = v48;
        v222.size.double height = r1;
        v234.origin.double x = v185;
        v234.origin.double y = MinY - v166;
        v234.size.double width = v45;
        v234.size.double height = v43;
        CGRect v223 = CGRectUnion(v222, v234);
        CGFloat rect = v223.origin.y;
        CGFloat v46 = v223.origin.x;
        CGFloat v48 = v223.size.width;
        double v47 = v223.size.height;
      }
      unsigned int v51 = v49 & (includedControls >> 2);
      if (v51)
      {
        [(AVMobileChromelessVolumeControlsView *)v38 intrinsicContentSize];
        if (v52 >= v186 - v45) {
          double v53 = v186 - v45;
        }
        else {
          double v53 = v52;
        }
        -[UIView avkit_setFrame:inLayoutDirection:](v38, "avkit_setFrame:inLayoutDirection:", v39, v185 + v186 - v53, MinY - v166, v53, v43);
        v224.origin.double x = v46;
        v224.origin.double y = rect;
        v224.size.double width = v48;
        v224.size.double height = v47;
        v235.origin.double x = v185 + v186 - v53;
        v235.origin.double y = MinY - v166;
        v235.size.double width = v53;
        v235.size.double height = v43;
        CGRect v225 = CGRectUnion(v224, v235);
        CGFloat rect = v225.origin.y;
        CGFloat v46 = v225.origin.x;
        CGFloat v48 = v225.size.width;
        double v47 = v225.size.height;
      }
      BYTE2(v202) = v50;
      HIBYTE(v202) = v51;

      v54 = v168;
      if ((contentTabPresented || v169) && self->_contentTabsView && (includedControls & 0x40) != 0)
      {
        CGFloat v177 = v46;
        v228.origin.double x = v46;
        v228.origin.double y = rect;
        v228.size.double width = v48;
        v228.size.double height = v47;
        double v81 = controlsPadding + CGRectGetMaxY(v228);
        unint64_t v191 = includedControls;
        uint64_t v192 = v165;
        double v193 = controlsPadding;
        unint64_t v194 = v167;
        v195 = v168;
        BOOL v196 = contentTabPresented;
        BOOL v197 = v169;
        int v198 = v189;
        __int16 v199 = v190;
        unint64_t v200 = contentTabsLayout;
        double v201 = contentTabPresentationHeight;
        double v82 = -[AVMobileChromelessControlsView _layoutContentTabsInFrame:withConfiguration:canFitState:]((id *)&self->super.super.super.super.isa, (double *)&v191, (uint64_t)&v202, v185, v81, v186, v14 - v47);
        CGFloat v84 = v83;
        CGFloat v86 = v85;
        CGFloat v88 = v87;
        v229.origin.double y = rect;
        v229.origin.double x = v177;
        v229.size.double width = v48;
        v229.size.double height = v47;
        double v89 = CGRectGetMaxY(v229);
        v230.origin.double x = v82;
        v230.origin.double y = v84;
        v230.size.double width = v86;
        v230.size.double height = v88;
        double v90 = CGRectGetMinY(v230);
        v231.origin.double y = rect;
        v231.origin.double x = v177;
        v231.size.double width = v48;
        v231.size.double height = v47;
        double v171 = controlsPadding + v89;
        double v176 = v90 - controlsPadding - CGRectGetMaxY(v231) - controlsPadding;
      }
      else if ((includedControls & 0x40) != 0)
      {
        v55 = self->_auxiliaryControlsView;
        v56 = self->_timelineView;
        v57 = self->_titlebarView;
        unint64_t v58 = self->_layoutConfiguration.includedControls;
        double v59 = self->_layoutConfiguration.controlsPadding;
        unint64_t recta = self->_layoutConfiguration.auxiliaryControlsPlacement;
        v60 = self->_layoutConfiguration.pinnedAuxiliaryControls;
        [(AVMobileChromelessTimelineView *)v56 intrinsicContentSize];
        double v62 = v61;
        [(AVMobileTitlebarView *)v57 intrinsicContentSize];
        double v64 = v63;
        [(AVMobileAuxiliaryControlsView *)v55 sizeFittingControls:v60];
        double v66 = v65;

        BOOL v67 = (v58 & 0x10) == 0;
        if (v58) {
          double v68 = v62;
        }
        else {
          double v68 = 0.0;
        }
        if (v68 >= v66) {
          double v69 = v68;
        }
        else {
          double v69 = v66;
        }
        BOOL v70 = recta != 1 || (v58 & 0x10) == 0;
        if (recta == 1) {
          BOOL v67 = 1;
        }
        if (!v70) {
          double v68 = v69;
        }
        if ((v58 & 0x20) != 0) {
          double v71 = v64;
        }
        else {
          double v71 = 0.0;
        }
        if (v71 >= v66) {
          double v72 = v71;
        }
        else {
          double v72 = v66;
        }
        if (!v67) {
          double v71 = v72;
        }
        BOOL v73 = v71 == 0.0 || v68 == 0.0;
        double v74 = -0.0;
        if (!v73) {
          double v74 = v59;
        }
        if (v68 + v71 + 0.0 + v74 >= v176)
        {
          v54 = v168;
        }
        else
        {
          unint64_t v191 = includedControls;
          uint64_t v192 = v165;
          double v193 = controlsPadding;
          v54 = v168;
          unint64_t v194 = v167;
          v195 = v168;
          BOOL v196 = contentTabPresented;
          BOOL v197 = v169;
          int v198 = v189;
          __int16 v199 = v190;
          unint64_t v200 = contentTabsLayout;
          double v201 = contentTabPresentationHeight;
          v226.origin.double x = -[AVMobileChromelessControlsView _layoutContentTabsInFrame:withConfiguration:canFitState:]((id *)&self->super.super.super.super.isa, (double *)&v191, (uint64_t)&v202, v185, v171, v186, v176);
          CGFloat v75 = v226.origin.x;
          CGFloat v76 = v226.origin.y;
          CGFloat v77 = v226.size.width;
          CGFloat v78 = v226.size.height;
          int v79 = BYTE1(v202);
          if ((((v79 != 0) ^ CGRectEqualToRect(v226, *MEMORY[0x1E4F1DB20])) & 1) == 0)
          {
            v80 = _AVLog();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              int v161 = BYTE1(v202);
              v233.origin.double x = v75;
              v233.origin.double y = v76;
              v233.size.double width = v77;
              v233.size.double height = v78;
              v162 = NSStringFromCGRect(v233);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v161;
              LOWORD(v209) = 2112;
              *(void *)((char *)&v209 + 2) = v162;
              _os_log_error_impl(&dword_1B05B7000, v80, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Fitting state and layout rect for content tabs UI does not match. canFitContentTabs: %d  contentTabsLayoutFrame: %@", buf, 0x12u);
            }
          }
          if (BYTE1(v202))
          {
            v227.origin.double x = v75;
            v227.origin.double y = v76;
            v227.size.double width = v77;
            v227.size.double height = v78;
            double v176 = CGRectGetMinY(v227) - v164 - controlsPadding;
            double v171 = v164;
          }
        }
      }
      v91 = v54;
      v92 = self->_auxiliaryControlsView;
      v93 = self->_liveEdgeContentTagView;
      v94 = self->_timelineView;
      v95 = self->_titlebarView;
      uint64_t v96 = [(AVMobileChromelessControlsView *)self effectiveUserInterfaceLayoutDirection];
      v97 = v91;
      [(AVMobileChromelessTimelineView *)v94 intrinsicContentSize];
      if (v176 >= v98) {
        double v99 = v98;
      }
      else {
        double v99 = v176;
      }
      [(AVMobileTitlebarView *)v95 intrinsicContentSize];
      double v101 = v100;
      [(AVMobileContentTagView *)v93 intrinsicContentSize];
      double v103 = v102;
      double v179 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](self);
      [(AVMobileAuxiliaryControlsView *)v92 sizeFittingControls:v97];
      double v106 = v105;
      double v107 = v104;
      unint64_t v108 = includedControls & 1;
      double v109 = v171 + v176;
      double v110 = v99 - controlsPadding;
      double v111 = 0.0;
      if ((includedControls & 1) == 0) {
        double v110 = 0.0;
      }
      double v112 = v176 - v110;
      if (includedControls) {
        double v113 = v99;
      }
      else {
        double v113 = 0.0;
      }
      double rectb = v109 - v113;
      if ((includedControls & 0x10) == 0) {
        goto LABEL_77;
      }
      if (v167 != 1 && v112 >= v104 && v186 >= v106)
      {
        v118 = [(AVMobileTitlebarView *)v95 title];

        if (v118)
        {
          [(AVMobileTitlebarView *)v95 intrinsicContentSize];
          double v120 = v119;
          [(AVMobileTitlebarView *)v95 titleLabelCenterYOffset];
          double v122 = v121;
          v232.origin.double x = 0.0;
          v232.origin.double y = 0.0;
          v232.size.double width = v106;
          v232.size.double height = v107;
          CGFloat MidY = CGRectGetMidY(v232);
          double v124 = controlsPadding;
          double v111 = rectb - controlsPadding - (v120 - v122) - MidY;
        }
        else
        {
          double v124 = controlsPadding;
          double v111 = rectb - v107 - controlsPadding;
        }
        char v115 = 0;
        double v116 = v186 - (v106 + v124 * 1.5);
        int v114 = 1;
        goto LABEL_111;
      }
      if (v167 != 1)
      {
        int v114 = 0;
        char v115 = 1;
        goto LABEL_78;
      }
      double v172 = v103;
      float v125 = v186 + -150.0;
      float v126 = v106;
      if ((v125 > v126 || vabds_f32(v125, v126) < 0.00000011921)
        && ((float v127 = v176, v128 = v104, v127 > v128) || vabds_f32(v127, v128) < 0.00000011921))
      {
        double v129 = v106;
        double v130 = v107;
      }
      else
      {
        [(AVMobileAuxiliaryControlsView *)v92 sizeFittingControls:MEMORY[0x1E4F1CBF0]];
        float v131 = v129;
        if (v125 <= v131 && vabds_f32(v125, v131) >= 0.00000011921
          || ((float v132 = v112, v133 = v130, v134 = vabds_f32(v132, v133), v132 <= v133)
            ? (BOOL v135 = v134 < 0.00000011921)
            : (BOOL v135 = 1),
              !v135))
        {
          int v114 = 0;
          char v115 = 0;
          double v116 = v186;
          double v103 = v172;
          goto LABEL_111;
        }
        if (v129 == *MEMORY[0x1E4F1DB30])
        {
          double v103 = v172;
          if (v130 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
          {
LABEL_77:
            int v114 = 0;
            char v115 = 0;
LABEL_78:
            double v116 = v186;
LABEL_111:
            if ((includedControls & 0x20) == 0) {
              char v115 = 1;
            }
            if (v112 < v101) {
              char v137 = 1;
            }
            else {
              char v137 = v115;
            }
            if (v108) {
              -[UIView avkit_setFrame:inLayoutDirection:](v94, "avkit_setFrame:inLayoutDirection:", v96, v185, v179 + rectb);
            }
            if (v114) {
              -[UIView avkit_setFrame:inLayoutDirection:](v92, "avkit_setFrame:inLayoutDirection:", v96, v185 + v186 - v106, v179 + v111, v106, v107);
            }
            if ((v137 & 1) == 0) {
              -[UIView avkit_setFrame:inLayoutDirection:](v95, "avkit_setFrame:inLayoutDirection:", v96, v185, v179 + rectb - controlsPadding - v101, v116, v101);
            }
            BOOL v139 = v112 >= v103 && v108 != 0;
            LOBYTE(v202) = v114;
            BYTE3(v202) = v139;
            BYTE5(v202) = v108;
            BYTE6(v202) = v137 ^ 1;

            goto LABEL_129;
          }
LABEL_107:
          char v115 = 0;
          if (v130 >= v99) {
            double v136 = v130;
          }
          else {
            double v136 = v99;
          }
          double v112 = v176 - v136 - controlsPadding;
          double v111 = v109 - v136 + (v136 - v130) * 0.5;
          double rectb = v109 - v136 + (v136 - v99) * 0.5;
          int v114 = 1;
          double v116 = v186;
          double v107 = v130;
          double v106 = v129;
          goto LABEL_111;
        }
      }
      double v103 = v172;
      goto LABEL_107;
    }
  }
  BYTE4(v202) = 0;

LABEL_129:
  unint64_t v140 = v202;
  *(void *)buf = self->_auxiliaryControlsView;
  *(void *)&long long v209 = self->_contentTabsView;
  *((void *)&v209 + 1) = self->_displayModeControlsView;
  v210 = self->_liveEdgeContentTagView;
  v211 = self->_playbackControlsView;
  v212 = self->_timelineView;
  v213 = self->_titlebarView;
  v214 = self->_volumeControlsView;
  char v203 = v140 & 1;
  uint64x2_t v141 = (uint64x2_t)vdupq_n_s64(v140);
  int16x8_t v142 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v141, (uint64x2_t)xmmword_1B0721230), (int32x4_t)vshlq_u64(v141, (uint64x2_t)xmmword_1B0721220));
  *(int8x8_t *)v142.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v142), (int8x8_t)0x1000100010001);
  unsigned __int32 v204 = vmovn_s16(v142).u32[0];
  char v205 = BYTE5(v140) & 1;
  char v206 = BYTE6(v140) & 1;
  char v207 = HIBYTE(v140) & 1;
  v143 = [MEMORY[0x1E4F1CA48] array];
  v144 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 8; ++i)
  {
    id v146 = *(id *)&buf[8 * i];
    v147 = v146;
    if (v146)
    {
      int v148 = *(&v203 + i);
      if ((v148 == 0) != [v146 isHidden])
      {
        [v147 setHidden:v148 == 0];
        if (v148) {
          v149 = v144;
        }
        else {
          v149 = v143;
        }
        [v149 addObject:v147];
      }
    }
  }
  if ([v143 count])
  {
    id v150 = v143;
    v151 = v150;
    if (v150)
    {
      if ([v150 count])
      {
        v152 = [(AVMobileChromelessControlsView *)self delegate];
        char v153 = objc_opt_respondsToSelector();

        if (v153)
        {
          v154 = [(AVMobileChromelessControlsView *)self delegate];
          [v154 chromelessControlsView:self didDetachControlsViews:v151];
        }
      }
    }
  }
  if ([v144 count])
  {
    id v155 = v144;
    v156 = v155;
    if (v155)
    {
      if ([v155 count])
      {
        v157 = [(AVMobileChromelessControlsView *)self delegate];
        char v158 = objc_opt_respondsToSelector();

        if (v158)
        {
          v159 = [(AVMobileChromelessControlsView *)self delegate];
          [v159 chromelessControlsView:self didAttachControlsViews:v156];
        }
      }
    }
  }
  for (uint64_t j = 56; j != -8; j -= 8)

  -[AVMobileChromelessBackgroundGradientView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
LABEL_152:
  v188.receiver = self;
  v188.super_class = (Class)AVMobileChromelessControlsView;
  [(AVView *)&v188 layoutSubviews];
}

- (double)_layoutContentTabsInFrame:(uint64_t)a3 withConfiguration:(double)a4 canFitState:(double)a5
{
  id v14 = a1[60];
  double v15 = a2[2];
  [a1 layoutMargins];
  double v43 = v17;
  double v44 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [a1 effectiveUserInterfaceLayoutDirection];
  double v40 = -[AVMobileChromelessControlsView _controlsExpansionYOffset](a1);
  double v41 = a6;
  double v42 = a4;
  v46.origin.double y = a7;
  [v14 intrinsicContentSize];
  double v24 = v23;
  CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v45 = v15 + v23 + 50.0;
  v46.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB20];
  CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v27 = *a2;
  if (v46.origin.y < v45) {
    goto LABEL_15;
  }
  CGFloat r1 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v28 = 0.0;
  if ((LOBYTE(v27) & 0x40) != 0) {
    double v28 = v24;
  }
  double v29 = a5 + v46.origin.y - v28;
  if ((LOBYTE(v27) & 0x40) != 0 && v14)
  {
    double v30 = a2[7] - v24 - v15 - v21;
    if (v30 >= v46.origin.y - v24 - v15) {
      double v30 = v46.origin.y - v24 - v15;
    }
    if (v30 >= 50.0) {
      double v31 = v30;
    }
    else {
      double v31 = 50.0;
    }
    [a1 layoutMargins];
    if (*((unsigned char *)a2 + 41))
    {
      if (!*((unsigned char *)a2 + 40))
      {
        double v29 = v29 - (v15 - v44);
        double v31 = v31 - (v21 - v15);
LABEL_26:
        [v14 setFadeDistance:v32];
        goto LABEL_27;
      }
    }
    else if (!*((unsigned char *)a2 + 40))
    {
      goto LABEL_26;
    }
    double v29 = v29 - (v15 + v31 - v44);
    double v31 = v15 + v21 + v24 + v31;
    double v32 = 0.0;
    goto LABEL_26;
  }
  double v31 = v24;
  if ((LOBYTE(v27) & 0x40) == 0)
  {
LABEL_15:
    double v33 = *MEMORY[0x1E4F1DB20];
    goto LABEL_16;
  }
LABEL_27:
  objc_msgSend(a1[60], "setLayoutMargins:", v44, v19, v21, v43);
  objc_msgSend(a1[60], "avkit_setFrame:inLayoutDirection:", v22, v42 - v19, v40 + v29, v43 + v41 + v19, v31);
  v48.origin.double x = v46.origin.x;
  v48.origin.double y = v25;
  v48.size.double width = v26;
  v48.size.double height = r1;
  v50.origin.double x = v42 - v19;
  v50.origin.double y = v40 + v29;
  v50.size.double width = v43 + v41 + v19;
  v50.size.double height = v31;
  *(void *)&double v33 = (unint64_t)CGRectUnion(v48, v50);
  if (*((unsigned char *)a2 + 40))
  {
    [a1 bounds];
    double MaxY = CGRectGetMaxY(v49);
    if (*((unsigned char *)a2 + 40))
    {
      if (MaxY - (v40 + v29) != a2[7])
      {
        v38 = _AVLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v38, OS_LOG_TYPE_ERROR, "The content tabs layout frame height does not match the given contentTabsPresentationHeight.", buf, 2u);
        }
      }
    }
  }
LABEL_16:
  if (a3)
  {
    unsigned int v34 = (LODWORD(v27) >> 6) & 1;
    if (v46.origin.y < v45) {
      LOBYTE(v34) = 0;
    }
    *(unsigned char *)(a3 + 1) = v34;
  }
  else
  {
    double v35 = _AVLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v46.size.width) = 0;
      _os_log_error_impl(&dword_1B05B7000, v35, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. AVMobileChromelessControlsViewCanFitState cannot be nil.", (uint8_t *)&v46.size, 2u);
    }
  }
  return v33;
}

- (double)_controlsExpansionYOffset
{
  return 0.0;
}

- (void)setVolumeControlsView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: volumeControlsView is already a subview of another view.", buf, 2u);
    }
  }
  p_volumeControlsView = (id *)&self->_volumeControlsView;
  if (self->_volumeControlsView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: volumeControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_volumeControlsView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_volumeControlsView, a3);
    [*p_volumeControlsView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_volumeControlsView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setTitlebarView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: titlebarView is already a subview of another view.", buf, 2u);
    }
  }
  p_titlebarView = (id *)&self->_titlebarView;
  if (self->_titlebarView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: titlebarView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_titlebarView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_titlebarView, a3);
    [*p_titlebarView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_titlebarView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setTimelineView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: timelineView is already a subview of another view.", buf, 2u);
    }
  }
  p_timelineView = (id *)&self->_timelineView;
  if (self->_timelineView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: timelineView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_timelineView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_timelineView, a3);
    [*p_timelineView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_timelineView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setPlaybackControlsView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: playbackControlsView is already a subview of another view.", buf, 2u);
    }
  }
  p_playbackControlsView = (id *)&self->_playbackControlsView;
  if (self->_playbackControlsView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: playbackControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_playbackControlsView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_playbackControlsView, a3);
    [*p_playbackControlsView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_playbackControlsView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setLiveEdgeContentTagView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: liveEdgeContentTagView is already a subview of another view.", buf, 2u);
    }
  }
  p_liveEdgeContentTagView = (id *)&self->_liveEdgeContentTagView;
  if (self->_liveEdgeContentTagView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: liveEdgeContentTagView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_liveEdgeContentTagView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_liveEdgeContentTagView, a3);
    [*p_liveEdgeContentTagView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_liveEdgeContentTagView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setDisplayModeControlsView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: displayModeControlsView is already a subview of another view.", buf, 2u);
    }
  }
  p_displayModeControlsView = (id *)&self->_displayModeControlsView;
  if (self->_displayModeControlsView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: displayModeControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_displayModeControlsView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_displayModeControlsView, a3);
    [*p_displayModeControlsView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_displayModeControlsView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setContentTabsView:(id)a3
{
  id v5 = (AVMobileChromelessContentTabsView *)a3;
  double v6 = [(AVMobileChromelessContentTabsView *)v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v9 = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: contentTabView is already a subview of another view.", v9, 2u);
    }
  }
  contentTabsView = self->_contentTabsView;
  if (contentTabsView != v5)
  {
    [(AVMobileChromelessContentTabsView *)contentTabsView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentTabsView, a3);
    [(AVMobileChromelessControlsView *)self addSubview:self->_contentTabsView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (AVMobileChromelessBackgroundGradientView *)a3;
  double v6 = [(AVMobileChromelessBackgroundGradientView *)v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: backgroundView is already a subview of another view.", buf, 2u);
    }
  }
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: backgroundView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_backgroundView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [(AVMobileChromelessBackgroundGradientView *)v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(AVMobileChromelessControlsView *)self addSubview:*p_backgroundView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryControlsView:(id)a3
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    double v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: auxiliaryControlsView is already a subview of another view.", buf, 2u);
    }
  }
  p_auxiliaryControlsView = (id *)&self->_auxiliaryControlsView;
  if (self->_auxiliaryControlsView)
  {
    double v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: auxiliaryControlsView should only be set once on an AVMobileChromelessControlsView.", v11, 2u);
    }

    id v10 = *p_auxiliaryControlsView;
  }
  else
  {
    id v10 = 0;
  }
  if (v10 != v5)
  {
    [v10 removeFromSuperview];
    objc_storeStrong((id *)&self->_auxiliaryControlsView, a3);
    [*p_auxiliaryControlsView setHidden:1];
    [(AVMobileChromelessControlsView *)self addSubview:*p_auxiliaryControlsView];
    [(AVMobileChromelessControlsView *)self setNeedsLayout];
  }
}

- (void)setLayoutConfiguration:(AVMobileChromelessControlsLayoutConfiguration *)a3
{
  p_layoutConfiguration = &self->_layoutConfiguration;
  unint64_t includedControls = self->_layoutConfiguration.includedControls;
  int expanded = self->_layoutConfiguration.expanded;
  double controlsPadding = self->_layoutConfiguration.controlsPadding;
  unint64_t auxiliaryControlsPlacement = self->_layoutConfiguration.auxiliaryControlsPlacement;
  p_pinnedAuxiliaryControls = &self->_layoutConfiguration.pinnedAuxiliaryControls;
  pinnedAuxiliaryControls = self->_layoutConfiguration.pinnedAuxiliaryControls;
  p_BOOL contentTabPresented = &self->_layoutConfiguration.contentTabPresented;
  BOOL contentTabPresented = self->_layoutConfiguration.contentTabPresented;
  double contentTabPresentationHeight = self->_layoutConfiguration.contentTabPresentationHeight;
  unint64_t v11 = a3->includedControls;
  int v12 = a3->expanded;
  double v13 = a3->controlsPadding;
  unint64_t v14 = a3->auxiliaryControlsPlacement;
  double v15 = a3->pinnedAuxiliaryControls;
  if (expanded == v12
    && includedControls == v11
    && auxiliaryControlsPlacement == v14
    && controlsPadding == v13
    && pinnedAuxiliaryControls == v15
    && contentTabPresented == a3->contentTabPresented)
  {
    double v21 = a3->contentTabPresentationHeight;

    if (contentTabPresentationHeight == v21) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  long long v22 = *(_OWORD *)&a3->controlsPadding;
  *(_OWORD *)&p_layoutConfiguration->unint64_t includedControls = *(_OWORD *)&a3->includedControls;
  *(_OWORD *)&p_layoutConfiguration->double controlsPadding = v22;
  objc_storeStrong((id *)p_pinnedAuxiliaryControls, a3->pinnedAuxiliaryControls);
  long long v23 = *(_OWORD *)&a3->contentTabPresented;
  *((void *)p_contentTabPresented + 2) = *(void *)&a3->contentTabPresentationHeight;
  *(_OWORD *)p_BOOL contentTabPresented = v23;
  [(AVMobileChromelessControlsView *)self setNeedsLayout];
LABEL_20:
  double v24 = a3->pinnedAuxiliaryControls;
}

- (void)setLayoutAllowed:(BOOL)a3
{
  if (self->_layoutAllowed != a3)
  {
    self->_layoutAllowed = a3;
    if (a3) {
      [(AVMobileChromelessControlsView *)self setNeedsLayout];
    }
  }
}

- (AVMobileChromelessControlsView)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsView;
  v2 = [(AVView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_layoutConfiguration.unint64_t includedControls = 0u;
    *(_OWORD *)&v2->_layoutConfiguration.double controlsPadding = 0u;
    pinnedAuxiliaryControls = v2->_layoutConfiguration.pinnedAuxiliaryControls;
    v2->_layoutConfiguration.pinnedAuxiliaryControls = 0;

    *(void *)&v3->_layoutConfiguration.BOOL contentTabPresented = 0;
    v3->_layoutConfiguration.unint64_t contentTabsLayout = 0;
    v3->_layoutConfiguration.double contentTabPresentationHeight = 0.0;
    v3->_layoutAllowed = 1;
  }
  return v3;
}

@end