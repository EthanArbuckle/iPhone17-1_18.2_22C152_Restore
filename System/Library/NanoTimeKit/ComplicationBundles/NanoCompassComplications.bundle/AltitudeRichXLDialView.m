@interface AltitudeRichXLDialView
- (CircularLayoutConstants)_layoutConstantsForDevice:(id)a3;
- (id)unitFont;
- (id)valueFont;
@end

@implementation AltitudeRichXLDialView

- (CircularLayoutConstants)_layoutConstantsForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268920CB8);
  id WeakRetained = objc_loadWeakRetained(&qword_268920CC0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_268920CC0);
  if (v7 != v4)
  {

LABEL_5:
    id v13 = objc_storeWeak(&qword_268920CC0, v4);
    qword_268920CC8 = objc_msgSend_version(v4, v14, v15, v16);

    sub_2375A5968(v17, v4);
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_version(v4, v8, v9, v10);
  uint64_t v12 = qword_268920CC8;

  if (v11 != v12) {
    goto LABEL_5;
  }
LABEL_6:
  p_layoutConstants = &self->_layoutConstants;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268920CB8);
  uint64_t v19 = qword_268920C98;
  uint64_t v20 = qword_268920CA0;
  uint64_t v21 = qword_268920CA8;
  uint64_t v22 = qword_268920CB0;

  *(void *)&p_layoutConstants->lineSpacing = v19;
  *(void *)&p_layoutConstants->symbolSize = v20;
  *(void *)&p_layoutConstants->unitFontSize = v21;
  *(void *)&p_layoutConstants->valueFontSize = v22;

  double v23 = *(double *)&v19;
  double v24 = *(double *)&v20;
  double v25 = *(double *)&v21;
  double v26 = *(double *)&v22;
  result.valueFontSize = v26;
  result.unitFontSize = v25;
  result.symbolSize = v24;
  result.lineSpacing = v23;
  return result;
}

- (id)unitFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A57D0;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_268920C80 != -1) {
    dispatch_once(&qword_268920C80, block);
  }
  return (id)qword_268920C70;
}

- (id)valueFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A58F8;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_268920C90 != -1) {
    dispatch_once(&qword_268920C90, block);
  }
  return (id)qword_268920C88;
}

@end