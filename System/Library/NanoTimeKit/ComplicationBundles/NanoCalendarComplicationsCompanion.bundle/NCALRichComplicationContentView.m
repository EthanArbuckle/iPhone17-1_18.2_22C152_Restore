@interface NCALRichComplicationContentView
- (BOOL)hasConflicts;
- (CLKUIColoringLabel)body2Label;
- (CLKUIColoringLabel)bodyLabel;
- (CLKUIColoringLabel)headerLabel;
- (NCALRichComplicationPillView)verticalPill;
- (NCALRichComplicationPillView)verticalPill2;
- (NSArray)otherEventColors;
- (UIColor)firstEventColor;
- (id)initForDevice:(id)a3;
- (unint64_t)eventCount;
- (void)setBody2Label:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setEventCount:(unint64_t)a3;
- (void)setFirstEventColor:(id)a3;
- (void)setHasConflicts:(BOOL)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setOtherEventColors:(id)a3;
- (void)setVerticalPill2:(id)a3;
- (void)setVerticalPill:(id)a3;
- (void)updateLayout;
@end

@implementation NCALRichComplicationContentView

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v178.receiver = self;
  v178.super_class = (Class)NCALRichComplicationContentView;
  v5 = [(NCALRichComplicationContentView *)&v178 init];
  if (v5)
  {
    id v167 = v4;
    id v6 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_284E8);
    id WeakRetained = objc_loadWeakRetained(&qword_284F0);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      id v9 = objc_loadWeakRetained(&qword_284F0);
      if (v9 == v6)
      {
        id v10 = [v6 version];
        uint64_t v11 = qword_284F8;

        if (v10 == (id)v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_284E8);
          double v14 = *(double *)&qword_284A0;
          double v15 = *(double *)&qword_284A8;
          double v16 = *(double *)&qword_284B0;
          double v166 = *(double *)&qword_284B8;
          double v163 = *(double *)&qword_284C0;
          double v17 = *(double *)&qword_284C8;
          double v18 = *(double *)&qword_284D0;
          double v19 = *(double *)&qword_284D8;
          double v168 = *(double *)&qword_284E0;

          v20 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v14 design:UIFontWeightBold];
          v171 = [v20 CLKFontWithAlternativePunctuation];

          v21 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v14 design:UIFontWeightMedium];
          uint64_t v22 = [v21 CLKFontWithAlternativePunctuation];

          id v23 = objc_alloc_init((Class)UILayoutGuide);
          v24 = objc_alloc_init(NCALRichComplicationPillView);
          verticalPill = v5->_verticalPill;
          v5->_verticalPill = v24;

          [(NCALRichComplicationPillView *)v5->_verticalPill setTranslatesAutoresizingMaskIntoConstraints:0];
          v26 = +[UIColor whiteColor];
          [(NCALRichComplicationPillView *)v5->_verticalPill setBackgroundColor:v26];

          v27 = [(NCALRichComplicationPillView *)v5->_verticalPill layer];
          [v27 setCornerRadius:v17];

          v28 = objc_alloc_init(NCALRichComplicationPillView);
          verticalPill2 = v5->_verticalPill2;
          v5->_verticalPill2 = v28;

          [(NCALRichComplicationPillView *)v5->_verticalPill2 setTranslatesAutoresizingMaskIntoConstraints:0];
          v30 = +[UIColor whiteColor];
          [(NCALRichComplicationPillView *)v5->_verticalPill2 setBackgroundColor:v30];

          v31 = [(NCALRichComplicationPillView *)v5->_verticalPill2 layer];
          [v31 setCornerRadius:v17];

          [(NCALRichComplicationPillView *)v5->_verticalPill2 setHidden:1];
          id v32 = objc_alloc((Class)CLKUIColoringLabel);
          double y = CGRectZero.origin.y;
          double width = CGRectZero.size.width;
          double height = CGRectZero.size.height;
          v36 = (CLKUIColoringLabel *)objc_msgSend(v32, "initWithFrame:options:", 4, CGRectZero.origin.x, y, width, height);
          headerLabel = v5->_headerLabel;
          v5->_headerLabel = v36;

          [(CLKUIColoringLabel *)v5->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v5->_headerLabel setLineBreakMode:4];
          v38 = +[UIColor whiteColor];
          [(CLKUIColoringLabel *)v5->_headerLabel setTextColor:v38];

          [(CLKUIColoringLabel *)v5->_headerLabel setFont:v171];
          v39 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 4, CGRectZero.origin.x, y, width, height);
          bodyLabel = v5->_bodyLabel;
          v5->_bodyLabel = v39;

          [(CLKUIColoringLabel *)v5->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v5->_bodyLabel setLineBreakMode:4];
          v41 = +[UIColor whiteColor];
          [(CLKUIColoringLabel *)v5->_bodyLabel setTextColor:v41];

          v175 = (void *)v22;
          [(CLKUIColoringLabel *)v5->_bodyLabel setFont:v22];
          v42 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 4, CGRectZero.origin.x, y, width, height);
          body2Label = v5->_body2Label;
          v5->_body2Label = v42;

          [(CLKUIColoringLabel *)v5->_body2Label setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v5->_body2Label setLineBreakMode:4];
          v44 = +[UIColor grayColor];
          [(CLKUIColoringLabel *)v5->_body2Label setTextColor:v44];

          [(CLKUIColoringLabel *)v5->_body2Label setFont:v22];
          [(NCALRichComplicationContentView *)v5 addLayoutGuide:v23];
          [(NCALRichComplicationContentView *)v5 addSubview:v5->_verticalPill];
          [(NCALRichComplicationContentView *)v5 addSubview:v5->_verticalPill2];
          [(NCALRichComplicationContentView *)v5 addSubview:v5->_headerLabel];
          [(NCALRichComplicationContentView *)v5 addSubview:v5->_bodyLabel];
          [(NCALRichComplicationContentView *)v5 addSubview:v5->_body2Label];
          v160 = [v23 bottomAnchor];
          v154 = [(NCALRichComplicationContentView *)v5 bottomAnchor];
          v150 = [v160 constraintEqualToAnchor:v154 constant:-0.0];
          v185[0] = v150;
          v146 = [v23 leadingAnchor];
          v142 = [(NCALRichComplicationContentView *)v5 leadingAnchor];
          v139 = [v146 constraintEqualToAnchor:v142 constant:v19];
          v185[1] = v139;
          v136 = [v23 trailingAnchor];
          v133 = [(NCALRichComplicationContentView *)v5 trailingAnchor];
          v169 = [v136 constraintEqualToAnchor:v133 constant:-v168];
          v185[2] = v169;
          v131 = [v23 topAnchor];
          v129 = [(NCALRichComplicationContentView *)v5 topAnchor];
          v127 = [v131 constraintEqualToAnchor:v129 constant:0.0];
          v185[3] = v127;
          v125 = [(CLKUIColoringLabel *)v5->_headerLabel topAnchor];
          v124 = [v23 topAnchor];
          v123 = [v125 constraintEqualToAnchor:v124];
          v185[4] = v123;
          v122 = [(CLKUIColoringLabel *)v5->_bodyLabel firstBaselineAnchor];
          v121 = [(CLKUIColoringLabel *)v5->_headerLabel firstBaselineAnchor];
          v120 = [v122 constraintEqualToAnchor:v121 constant:v15];
          v185[5] = v120;
          v119 = [(CLKUIColoringLabel *)v5->_body2Label firstBaselineAnchor];
          v118 = [(CLKUIColoringLabel *)v5->_bodyLabel firstBaselineAnchor];
          v117 = [v119 constraintEqualToAnchor:v118 constant:v15];
          v185[6] = v117;
          v45 = [(CLKUIColoringLabel *)v5->_headerLabel trailingAnchor];
          v46 = [v23 trailingAnchor];
          v47 = [v45 constraintEqualToAnchor:v46];
          v185[7] = v47;
          v48 = [(CLKUIColoringLabel *)v5->_bodyLabel trailingAnchor];
          v49 = v23;
          v177 = v23;
          v50 = [v23 trailingAnchor];
          v51 = [v48 constraintEqualToAnchor:v50];
          v185[8] = v51;
          v52 = [(CLKUIColoringLabel *)v5->_body2Label trailingAnchor];
          v53 = [v49 trailingAnchor];
          v54 = [v52 constraintEqualToAnchor:v53];
          v185[9] = v54;
          v165 = +[NSArray arrayWithObjects:v185 count:10];

          v161 = [(NCALRichComplicationPillView *)v5->_verticalPill topAnchor];
          v155 = [(CLKUIColoringLabel *)v5->_headerLabel firstBaselineAnchor];
          [v171 capHeight];
          v151 = [v161 constraintEqualToAnchor:v155 constant:-v55 - v18];
          v184[0] = v151;
          v147 = [(NCALRichComplicationPillView *)v5->_verticalPill leadingAnchor];
          v143 = [v177 leadingAnchor];
          v140 = [v147 constraintEqualToAnchor:v143];
          v184[1] = v140;
          v137 = [(NCALRichComplicationPillView *)v5->_verticalPill widthAnchor];
          v134 = [v137 constraintEqualToConstant:v163];
          v184[2] = v134;
          v56 = [(CLKUIColoringLabel *)v5->_headerLabel leadingAnchor];
          v57 = [(NCALRichComplicationPillView *)v5->_verticalPill trailingAnchor];
          v58 = [v56 constraintEqualToAnchor:v57 constant:v16];
          v184[3] = v58;
          v59 = [(CLKUIColoringLabel *)v5->_bodyLabel leadingAnchor];
          v60 = [(NCALRichComplicationPillView *)v5->_verticalPill trailingAnchor];
          v61 = [v59 constraintEqualToAnchor:v60 constant:v16];
          v184[4] = v61;
          v62 = [(CLKUIColoringLabel *)v5->_body2Label leadingAnchor];
          v63 = [(NCALRichComplicationPillView *)v5->_verticalPill trailingAnchor];
          v64 = [v62 constraintEqualToAnchor:v63 constant:v16];
          v184[5] = v64;
          v170 = +[NSArray arrayWithObjects:v184 count:6];

          v162 = [(NCALRichComplicationPillView *)v5->_verticalPill bottomAnchor];
          v156 = [(CLKUIColoringLabel *)v5->_bodyLabel lastBaselineAnchor];
          v65 = [v162 constraintEqualToAnchor:v156 constant:v18];
          v183[0] = v65;
          v66 = [(CLKUIColoringLabel *)v5->_bodyLabel bottomAnchor];
          v67 = [v177 bottomAnchor];
          v68 = [v66 constraintEqualToAnchor:v67];
          v183[1] = v68;
          v69 = +[NSArray arrayWithObjects:v183 count:2];
          id v70 = [v170 copy];
          uint64_t v71 = [v69 arrayByAddingObjectsFromArray:v70];
          pillAlignedToBody1BottomConstraints = v5->_pillAlignedToBody1BottomConstraints;
          v5->_pillAlignedToBody1BottomConstraints = (NSArray *)v71;

          v157 = [(NCALRichComplicationPillView *)v5->_verticalPill bottomAnchor];
          v73 = [(CLKUIColoringLabel *)v5->_body2Label lastBaselineAnchor];
          v74 = [v157 constraintEqualToAnchor:v73 constant:v18];
          v182[0] = v74;
          v75 = [(CLKUIColoringLabel *)v5->_body2Label bottomAnchor];
          v76 = [v177 bottomAnchor];
          v77 = [v75 constraintEqualToAnchor:v76];
          v182[1] = v77;
          v78 = +[NSArray arrayWithObjects:v182 count:2];
          id v79 = [v170 copy];
          uint64_t v80 = [v78 arrayByAddingObjectsFromArray:v79];
          pillAlignedToBody2BottomConstraints = v5->_pillAlignedToBody2BottomConstraints;
          v5->_pillAlignedToBody2BottomConstraints = (NSArray *)v80;

          v158 = [(NCALRichComplicationPillView *)v5->_verticalPill topAnchor];
          v152 = [(CLKUIColoringLabel *)v5->_bodyLabel firstBaselineAnchor];
          [v175 capHeight];
          v148 = [v158 constraintEqualToAnchor:v152 constant:-v82 - v18];
          v181[0] = v148;
          v144 = [(NCALRichComplicationPillView *)v5->_verticalPill leadingAnchor];
          v141 = [v177 leadingAnchor];
          v138 = [v144 constraintEqualToAnchor:v141];
          v181[1] = v138;
          v135 = [(NCALRichComplicationPillView *)v5->_verticalPill widthAnchor];
          v132 = [v135 constraintEqualToConstant:v163];
          v181[2] = v132;
          v130 = [(NCALRichComplicationPillView *)v5->_verticalPill bottomAnchor];
          v128 = [(CLKUIColoringLabel *)v5->_bodyLabel lastBaselineAnchor];
          v126 = [v130 constraintEqualToAnchor:v128 constant:v18];
          v181[3] = v126;
          v83 = [(CLKUIColoringLabel *)v5->_headerLabel leadingAnchor];
          v84 = [v177 leadingAnchor];
          v85 = [v83 constraintEqualToAnchor:v84 constant:v166];
          v181[4] = v85;
          v86 = [(CLKUIColoringLabel *)v5->_bodyLabel leadingAnchor];
          v87 = [(NCALRichComplicationPillView *)v5->_verticalPill trailingAnchor];
          v88 = [v86 constraintEqualToAnchor:v87 constant:v16];
          v181[5] = v88;
          v89 = [(CLKUIColoringLabel *)v5->_body2Label leadingAnchor];
          v90 = [(NCALRichComplicationPillView *)v5->_verticalPill trailingAnchor];
          v91 = [v89 constraintEqualToAnchor:v90 constant:v16];
          v181[6] = v91;
          uint64_t v92 = +[NSArray arrayWithObjects:v181 count:7];
          conflictEventsPillAlignmentConstraints = v5->_conflictEventsPillAlignmentConstraints;
          v5->_conflictEventsPillAlignmentConstraints = (NSArray *)v92;

          v172 = [(NCALRichComplicationPillView *)v5->_verticalPill2 topAnchor];
          v159 = [(CLKUIColoringLabel *)v5->_body2Label firstBaselineAnchor];
          [v175 capHeight];
          v153 = [v172 constraintEqualToAnchor:v159 constant:-v94 - v18];
          v180[0] = v153;
          v149 = [(NCALRichComplicationPillView *)v5->_verticalPill2 leadingAnchor];
          v145 = [v177 leadingAnchor];
          v95 = [v149 constraintEqualToAnchor:v145];
          v180[1] = v95;
          v96 = [(NCALRichComplicationPillView *)v5->_verticalPill2 widthAnchor];
          v97 = [v96 constraintEqualToConstant:v163];
          v180[2] = v97;
          v98 = [(NCALRichComplicationPillView *)v5->_verticalPill2 bottomAnchor];
          v99 = [(CLKUIColoringLabel *)v5->_body2Label lastBaselineAnchor];
          v100 = [v98 constraintEqualToAnchor:v99 constant:v18];
          v180[3] = v100;
          v101 = [(CLKUIColoringLabel *)v5->_body2Label bottomAnchor];
          v102 = [v177 bottomAnchor];
          v103 = [v101 constraintEqualToAnchor:v102];
          v180[4] = v103;
          uint64_t v104 = +[NSArray arrayWithObjects:v180 count:5];
          conflictEventsPill2AlignmentConstraints = v5->_conflictEventsPill2AlignmentConstraints;
          v5->_conflictEventsPill2AlignmentConstraints = (NSArray *)v104;

          v174 = [(CLKUIColoringLabel *)v5->_headerLabel leadingAnchor];
          v173 = [v177 leadingAnchor];
          v164 = [v174 constraintEqualToAnchor:v173 constant:v166];
          v179[0] = v164;
          v176 = [(CLKUIColoringLabel *)v5->_bodyLabel leadingAnchor];
          v106 = [v177 leadingAnchor];
          v107 = [v176 constraintEqualToAnchor:v106 constant:v166];
          v179[1] = v107;
          v108 = [(CLKUIColoringLabel *)v5->_body2Label leadingAnchor];
          v109 = [v177 leadingAnchor];
          v110 = [v108 constraintEqualToAnchor:v109 constant:v166];
          v179[2] = v110;
          v111 = [(CLKUIColoringLabel *)v5->_body2Label bottomAnchor];
          v112 = [v177 bottomAnchor];
          v113 = [v111 constraintEqualToAnchor:v112];
          v179[3] = v113;
          uint64_t v114 = +[NSArray arrayWithObjects:v179 count:4];
          noPillConstraints = v5->_noPillConstraints;
          v5->_noPillConstraints = (NSArray *)v114;

          +[NSLayoutConstraint activateConstraints:v165];
          +[NSLayoutConstraint activateConstraints:v5->_pillAlignedToBody2BottomConstraints];

          id v4 = v167;
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v12 = objc_storeWeak(&qword_284F0, v6);
    qword_284F8 = (uint64_t)[v6 version];

    sub_114AC(v13, v6);
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)updateLayout
{
  unsigned int v4 = [(NCALRichComplicationContentView *)self hasConflicts];
  v5 = [(NCALRichComplicationContentView *)self body2Label];
  id v6 = [v5 textProvider];

  +[NSLayoutConstraint deactivateConstraints:self->_pillAlignedToBody1BottomConstraints];
  +[NSLayoutConstraint deactivateConstraints:self->_pillAlignedToBody2BottomConstraints];
  +[NSLayoutConstraint deactivateConstraints:self->_conflictEventsPillAlignmentConstraints];
  +[NSLayoutConstraint deactivateConstraints:self->_conflictEventsPill2AlignmentConstraints];
  p_noPillConstraints = &self->_noPillConstraints;
  +[NSLayoutConstraint deactivateConstraints:self->_noPillConstraints];
  v8 = [(NCALRichComplicationContentView *)self firstEventColor];
  if (v8)
  {
    v2 = [(NCALRichComplicationContentView *)self firstEventColor];
    double v19 = v2;
    id v9 = +[NSArray arrayWithObjects:&v19 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [(NCALRichComplicationContentView *)self verticalPill];
  [v10 setPillColors:v9];

  if (v8)
  {
  }
  uint64_t v11 = [(NCALRichComplicationContentView *)self otherEventColors];
  id v12 = [(NCALRichComplicationContentView *)self verticalPill2];
  [v12 setPillColors:v11];

  uint64_t v13 = [(NCALRichComplicationContentView *)self verticalPill2];
  [v13 setHidden:v4 ^ 1];

  if (v6) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  double v15 = [(NCALRichComplicationContentView *)self bodyLabel];
  [v15 setNumberOfLines:v14];

  if ((v4 ^ 1)) {
    +[UIColor grayColor];
  }
  else {
  double v16 = +[UIColor whiteColor];
  }
  double v17 = [(NCALRichComplicationContentView *)self body2Label];
  [v17 setTextColor:v16];

  double v18 = [(NCALRichComplicationContentView *)self body2Label];
  [v18 setHidden:v6 == 0];

  if ([(NCALRichComplicationContentView *)self eventCount])
  {
    if (v4)
    {
      +[NSLayoutConstraint activateConstraints:self->_conflictEventsPillAlignmentConstraints];
      p_noPillConstraints = &self->_conflictEventsPill2AlignmentConstraints;
    }
    else if (v6)
    {
      p_noPillConstraints = &self->_pillAlignedToBody2BottomConstraints;
    }
    else
    {
      p_noPillConstraints = &self->_pillAlignedToBody1BottomConstraints;
    }
  }
  +[NSLayoutConstraint activateConstraints:*p_noPillConstraints];
}

- (NCALRichComplicationPillView)verticalPill
{
  return self->_verticalPill;
}

- (void)setVerticalPill:(id)a3
{
}

- (NCALRichComplicationPillView)verticalPill2
{
  return self->_verticalPill2;
}

- (void)setVerticalPill2:(id)a3
{
}

- (CLKUIColoringLabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (CLKUIColoringLabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (CLKUIColoringLabel)body2Label
{
  return self->_body2Label;
}

- (void)setBody2Label:(id)a3
{
}

- (UIColor)firstEventColor
{
  return self->_firstEventColor;
}

- (void)setFirstEventColor:(id)a3
{
}

- (NSArray)otherEventColors
{
  return self->_otherEventColors;
}

- (void)setOtherEventColors:(id)a3
{
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (BOOL)hasConflicts
{
  return self->_hasConflicts;
}

- (void)setHasConflicts:(BOOL)a3
{
  self->_hasConflicts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherEventColors, 0);
  objc_storeStrong((id *)&self->_firstEventColor, 0);
  objc_storeStrong((id *)&self->_body2Label, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_verticalPill2, 0);
  objc_storeStrong((id *)&self->_verticalPill, 0);
  objc_storeStrong((id *)&self->_noPillConstraints, 0);
  objc_storeStrong((id *)&self->_conflictEventsPill2AlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_conflictEventsPillAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_pillAlignedToBody2BottomConstraints, 0);

  objc_storeStrong((id *)&self->_pillAlignedToBody1BottomConstraints, 0);
}

@end