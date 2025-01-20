@interface CompassRichBezelDialView
- (id)_gossamer_newNeedleAODView;
- (id)_gossamer_newNeedleView;
- (id)_gossamer_newTicksView;
- (id)_newNeedleAODView;
- (id)_newNeedleView;
- (id)_newTicksView;
- (id)_pregossamer_newNeedleAODView;
- (id)_pregossamer_newNeedleView;
- (id)_pregossamer_newTicksView;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
@end

@implementation CompassRichBezelDialView

- (id)_newTicksView
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend__gossamer_newTicksView(self, v5, v6, v7);
  }
  else {
    objc_msgSend__pregossamer_newTicksView(self, v5, v6, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_gossamer_newTicksView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Bezel/North Tick");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  northTick = self->_northTick;
  self->_northTick = v7;

  v9 = NanoCompassComplicationImageNamed(@"Compass/Bezel/Ticks");
  id v10 = objc_alloc(MEMORY[0x263F1C6D0]);
  v13 = (UIImageView *)objc_msgSend_initWithImage_(v10, v11, (uint64_t)v9, v12);
  ticks = self->_ticks;
  self->_ticks = v13;

  objc_msgSend_bounds(self->_ticks, v15, v16, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = objc_alloc(MEMORY[0x263F1CB60]);
  v30 = objc_msgSend_initWithFrame_(v26, v27, v28, v29, v19, v21, v23, v25);
  objc_msgSend_addSubview_(v30, v31, (uint64_t)self->_ticks, v32);
  objc_msgSend_addSubview_(v30, v33, (uint64_t)self->_northTick, v34);

  return v30;
}

- (id)_pregossamer_newTicksView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Bezel/Ticks");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  ticks = self->_ticks;
  self->_ticks = v7;

  v9 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Bezel/Dot");
  id v10 = objc_alloc(MEMORY[0x263F1C6D0]);
  v13 = (UIImageView *)objc_msgSend_initWithImage_(v10, v11, (uint64_t)v9, v12);
  dot = self->_dot;
  self->_dot = v13;

  objc_msgSend_bounds(self->_ticks, v15, v16, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = objc_alloc(MEMORY[0x263F1CB60]);
  v30 = objc_msgSend_initWithFrame_(v26, v27, v28, v29, v19, v21, v23, v25);
  objc_msgSend_addSubview_(v30, v31, (uint64_t)self->_ticks, v32);
  objc_msgSend_addSubview_(v30, v33, (uint64_t)self->_dot, v34);

  return v30;
}

- (id)_newNeedleView
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend__gossamer_newNeedleView(self, v5, v6, v7);
  }
  else {
    objc_msgSend__pregossamer_newNeedleView(self, v5, v6, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newNeedleAODView
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend__gossamer_newNeedleAODView(self, v5, v6, v7);
  }
  else {
    objc_msgSend__pregossamer_newNeedleAODView(self, v5, v6, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_gossamer_newNeedleView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Bezel/Arrow");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  arrow = self->_arrow;
  self->_arrow = v7;

  v9 = self->_arrow;
  return v9;
}

- (id)_gossamer_newNeedleAODView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Bezel/ArrowAOD");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  arrowAOD = self->_arrowAOD;
  self->_arrowAOD = v7;

  v9 = self->_arrowAOD;
  return v9;
}

- (id)_pregossamer_newNeedleView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Bezel/Needle North");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  north = self->_north;
  self->_north = v7;

  v9 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Bezel/Needle South");
  id v10 = objc_alloc(MEMORY[0x263F1C6D0]);
  v13 = (UIImageView *)objc_msgSend_initWithImage_(v10, v11, (uint64_t)v9, v12);
  south = self->_south;
  self->_south = v13;

  v15 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Bezel/Needle Shadow");
  id v16 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v19 = objc_msgSend_initWithImage_(v16, v17, (uint64_t)v15, v18);
  objc_msgSend_bounds(v19, v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  id v31 = objc_alloc(MEMORY[0x263F1CB60]);
  v35 = objc_msgSend_initWithFrame_(v31, v32, v33, v34, v24, v26, v28, v30);
  objc_msgSend_addSubview_(v35, v36, (uint64_t)v19, v37);
  objc_msgSend_addSubview_(v35, v38, (uint64_t)self->_south, v39);
  objc_msgSend_addSubview_(v35, v40, (uint64_t)self->_north, v41);

  return v35;
}

- (id)_pregossamer_newNeedleAODView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend_bounds(self, v4, v5, v6);
  id v10 = (UIView *)objc_msgSend_initWithFrame_(v3, v7, v8, v9);
  arrowAOD = self->_arrowAOD;
  self->_arrowAOD = v10;

  uint64_t v12 = self->_arrowAOD;

  return v12;
}

- (id)monochromeAccentViews
{
  v9[3] = *MEMORY[0x263EF8340];
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v9, 3, v8[0], v8[1], self->_northTick, self->_arrow, self->_arrowAOD);
  }
  else {
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v8, 2, self->_north, self->_ticks, v9[0], v9[1], v9[2]);
  }

  return v6;
}

- (id)monochromeOtherViews
{
  v9[2] = *MEMORY[0x263EF8340];
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3))
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    dot = self->_dot;
    v9[0] = self->_south;
    v9[1] = dot;
    uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v9, 2);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_south, 0);
  objc_storeStrong((id *)&self->_north, 0);
  objc_storeStrong((id *)&self->_dot, 0);
  objc_storeStrong((id *)&self->_arrowAOD, 0);
  objc_storeStrong((id *)&self->_arrow, 0);
  objc_storeStrong((id *)&self->_northTick, 0);

  objc_storeStrong((id *)&self->_ticks, 0);
}

@end