@interface CompassRichCornerDialView
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

@implementation CompassRichCornerDialView

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
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Corner/North Tick");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  northTick = self->_northTick;
  self->_northTick = v7;

  v9 = NanoCompassComplicationImageNamed(@"Compass/Corner/Ticks");
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
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Corner/Ticks");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  ticks = self->_ticks;
  self->_ticks = v7;

  v9 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Corner/Dot");
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
  id v4 = (void *)MEMORY[0x263F1C6B0];
  id v5 = v3;
  uint64_t v9 = objc_msgSend_CGImage(v5, v6, v7, v8);
  objc_msgSend_scale(v5, v10, v11, v12);
  double v14 = v13 + v13;
  uint64_t v18 = objc_msgSend_imageOrientation(v5, v15, v16, v17);
  double v20 = objc_msgSend_imageWithCGImage_scale_orientation_(v4, v19, v9, v18, v14);

  id v21 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v24 = (UIImageView *)objc_msgSend_initWithImage_(v21, v22, (uint64_t)v20, v23);
  arrow = self->_arrow;
  self->_arrow = v24;

  id v26 = self->_arrow;
  return v26;
}

- (id)_gossamer_newNeedleAODView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Corner/ArrowAOD");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  arrowAOD = self->_arrowAOD;
  self->_arrowAOD = v7;

  uint64_t v9 = self->_arrowAOD;
  return v9;
}

- (id)_pregossamer_newNeedleView
{
  uint64_t v3 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Corner/Needle North");
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v7 = (UIImageView *)objc_msgSend_initWithImage_(v4, v5, (uint64_t)v3, v6);
  north = self->_north;
  self->_north = v7;

  uint64_t v9 = NanoCompassComplicationImageNamed(@"Compass/Legacy/Corner/Needle South");
  id v10 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v13 = (UIImageView *)objc_msgSend_initWithImage_(v10, v11, (uint64_t)v9, v12);
  south = self->_south;
  self->_south = v13;

  objc_msgSend_bounds(self->_north, v15, v16, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = objc_alloc(MEMORY[0x263F1CB60]);
  v30 = objc_msgSend_initWithFrame_(v26, v27, v28, v29, v19, v21, v23, v25);
  objc_msgSend_addSubview_(v30, v31, (uint64_t)self->_south, v32);
  objc_msgSend_addSubview_(v30, v33, (uint64_t)self->_north, v34);

  return v30;
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
  v9[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v9, 1, v8[0], v8[1], self->_ticks);
  }
  else {
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v8, 2, self->_south, self->_dot, v9[0]);
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