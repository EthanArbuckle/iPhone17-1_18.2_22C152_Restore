@interface NTKExtragalacticDigitsView
- (NTKExtragalacticDigitsView)initWithFrame:(CGRect)a3 device:(id)a4 digitNumbers:(id)a5;
- (void)_setupShapeLayers;
- (void)setDigitNumbers:(id)a3;
@end

@implementation NTKExtragalacticDigitsView

- (NTKExtragalacticDigitsView)initWithFrame:(CGRect)a3 device:(id)a4 digitNumbers:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NTKExtragalacticDigitsView;
  v14 = -[NTKExtragalacticDigitsView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_device, a4);
    id v16 = v12;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D4438);
    id WeakRetained = objc_loadWeakRetained(&qword_2691D4440);
    if (WeakRetained)
    {
      v18 = WeakRetained;
      id v19 = objc_loadWeakRetained(&qword_2691D4440);
      if (v19 == v16)
      {
        uint64_t v20 = [v16 version];
        uint64_t v21 = qword_2691D4448;

        if (v20 == v21)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D4438);
          uint64_t v24 = qword_2691D4430;

          *(void *)&v15->_lineWidth = v24;
          v25 = [[NTKExtragalacticDigitLoader alloc] initWithDevice:v16];
          digitLoader = v15->_digitLoader;
          v15->_digitLoader = v25;

          [(NTKExtragalacticDigitsView *)v15 _setupShapeLayers];
          [(NTKExtragalacticDigitsView *)v15 setDigitNumbers:v13];
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v22 = objc_storeWeak(&qword_2691D4440, v16);
    qword_2691D4448 = [v16 version];

    sub_246AF7A50(v23, (uint64_t)v16);
    goto LABEL_7;
  }
LABEL_8:

  return v15;
}

- (void)_setupShapeLayers
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (qword_2691D4458 != -1) {
    dispatch_once(&qword_2691D4458, &unk_26FB091B8);
  }
  id v2 = (id)qword_2691D4450;
  v3 = [MEMORY[0x263F157E8] layer];
  fillContainerLayer = self->_fillContainerLayer;
  self->_fillContainerLayer = v3;

  [(NTKExtragalacticDigitsView *)self bounds];
  -[CALayer setFrame:](self->_fillContainerLayer, "setFrame:");
  [(CALayer *)self->_fillContainerLayer setActions:v2];
  v5 = [(NTKExtragalacticDigitsView *)self layer];
  [v5 addSublayer:self->_fillContainerLayer];

  v6 = [MEMORY[0x263F157E8] layer];
  strokeContainerLayer = self->_strokeContainerLayer;
  self->_strokeContainerLayer = v6;

  [(NTKExtragalacticDigitsView *)self bounds];
  -[CALayer setFrame:](self->_strokeContainerLayer, "setFrame:");
  [(CALayer *)self->_strokeContainerLayer setOpacity:0.0];
  [(CALayer *)self->_strokeContainerLayer setActions:v2];
  v8 = [(NTKExtragalacticDigitsView *)self layer];
  [v8 addSublayer:self->_strokeContainerLayer];

  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = sub_246AF7108;
  v57[3] = &unk_2651F5958;
  id v36 = v2;
  id v58 = v36;
  v9 = (void *)MEMORY[0x24C5415B0](v57);
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_246AF7190;
  v55[3] = &unk_2651F5980;
  id v10 = v9;
  id v56 = v10;
  v43 = (void (**)(void, void, double, double, double, double))MEMORY[0x24C5415B0](v55);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = sub_246AF7270;
  v53[3] = &unk_2651F59A8;
  id v35 = v10;
  v53[4] = self;
  id v54 = v35;
  v42 = (void (**)(void, void, double, double, double, double))MEMORY[0x24C5415B0](v53);
  v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  glyphFillLayers = self->_glyphFillLayers;
  self->_glyphFillLayers = v11;

  id v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  glyphStrokeLayers = self->_glyphStrokeLayers;
  self->_glyphStrokeLayers = v13;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = +[NTKExtragalacticLayoutHelper allCorners];
  uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
        uint64_t v41 = v15;
        uint64_t v16 = [v40 unsignedIntegerValue];
        [(NTKExtragalacticDigitsView *)self bounds];
        +[NTKExtragalacticLayoutHelper frameForCorner:screenBounds:](NTKExtragalacticLayoutHelper, "frameForCorner:screenBounds:", v16);
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        v25 = objc_opt_new();
        v26 = objc_opt_new();
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v27 = [&unk_26FB0C278 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v46 != v29) {
                objc_enumerationMutation(&unk_26FB0C278);
              }
              uint64_t v31 = [*(id *)(*((void *)&v45 + 1) + 8 * i) unsignedIntegerValue];
              v32 = +[NTKExtragalacticColors identityColorForGlyphColor:v31];
              v33 = ((void (**)(void, void *, double, double, double, double))v43)[2](v43, v32, v18, v20, v22, v24);
              [(CALayer *)self->_fillContainerLayer addSublayer:v33];
              [v25 setShapeLayer:v33 atGlyphColor:v31];
              v34 = ((void (**)(void, void *, double, double, double, double))v42)[2](v42, v32, v18, v20, v22, v24);
              [(CALayer *)self->_strokeContainerLayer addSublayer:v34];
              [v26 setShapeLayer:v34 atGlyphColor:v31];
            }
            uint64_t v28 = [&unk_26FB0C278 countByEnumeratingWithState:&v45 objects:v59 count:16];
          }
          while (v28);
        }
        [(NSMutableDictionary *)self->_glyphFillLayers setObject:v25 forKeyedSubscript:v40];
        [(NSMutableDictionary *)self->_glyphStrokeLayers setObject:v26 forKeyedSubscript:v40];

        uint64_t v15 = v41 + 1;
      }
      while (v41 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v39);
  }
}

- (void)setDigitNumbers:(id)a3
{
  v67[3] = *MEMORY[0x263EF8340];
  v4 = (NSMutableDictionary *)a3;
  long long v51 = self;
  if (self->_digitNumbers == v4) {
    goto LABEL_37;
  }
  if (qword_2691D4468 != -1) {
    dispatch_once(&qword_2691D4468, &unk_26FB091D8);
  }
  id v45 = (id)qword_2691D4460;
  v5 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:&unk_26FB0C010];
  int v6 = [v5 isEqual:&unk_26FB0C040];

  if (v6)
  {
    if (qword_2691D4478 != -1) {
      dispatch_once(&qword_2691D4478, &unk_26FB091F8);
    }
    id v7 = (id)qword_2691D4470;

    v66[0] = &unk_26FB0BFE0;
    v66[1] = &unk_26FB0BFF8;
    v67[0] = &unk_26FB0C010;
    v67[1] = &unk_26FB0BFE0;
    v66[2] = &unk_26FB0C010;
    v67[2] = &unk_26FB0BFF8;
    long long v52 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
    id v45 = v7;
    goto LABEL_13;
  }
  v8 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:&unk_26FB0C010];
  if (([v8 isEqual:&unk_26FB0C058] & 1) == 0)
  {

    goto LABEL_12;
  }
  v9 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:&unk_26FB0C028];
  int v10 = [v9 isEqual:&unk_26FB0C070];

  if (!v10)
  {
LABEL_12:
    long long v52 = 0;
    goto LABEL_13;
  }
  v64[0] = &unk_26FB0BFE0;
  v64[1] = &unk_26FB0BFF8;
  v65[0] = &unk_26FB0C010;
  v65[1] = &unk_26FB0BFF8;
  v64[2] = &unk_26FB0C010;
  v65[2] = &unk_26FB0BFE0;
  long long v52 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
LABEL_13:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = +[NTKExtragalacticLayoutHelper allCorners];
  uint64_t v47 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v59;
    v43 = v4;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v13 = [(NSMutableDictionary *)v51->_digitNumbers objectForKeyedSubscript:v12];
        v14 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v12];

        if (v13 != v14)
        {
          uint64_t v49 = i;
          uint64_t v15 = [v12 unsignedIntegerValue];
          [(NTKExtragalacticDigitsView *)v51 bounds];
          +[NTKExtragalacticLayoutHelper frameForCorner:screenBounds:](NTKExtragalacticLayoutHelper, "frameForCorner:screenBounds:", v15);
          uint64_t v16 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v12];
          [(NSMutableDictionary *)v51->_digitNumbers setObject:v16 forKeyedSubscript:v12];
          double v17 = [v45 objectForKeyedSubscript:v12];
          uint64_t v18 = [v17 unsignedIntegerValue];

          long long v48 = (void *)v16;
          double v19 = [(NTKExtragalacticDigitLoader *)v51->_digitLoader digitDrawInfoForNumber:v16 style:v18];
          double v20 = v19;
          if (v19)
          {
            [v19 unifiedGlyphSize];
            +[NTKExtragalacticLayoutHelper digitCenterPositionForCorner:unifiedGlyphSize:cornerFrame:](NTKExtragalacticLayoutHelper, "digitCenterPositionForCorner:unifiedGlyphSize:cornerFrame:", v15);
            double v22 = v21;
            double v24 = v23;
            v25 = [(NSMutableDictionary *)v51->_glyphFillLayers objectForKeyedSubscript:v12];
            [v25 removeAllPaths];

            v26 = [(NSMutableDictionary *)v51->_glyphStrokeLayers objectForKeyedSubscript:v12];
            [v26 removeAllPaths];

            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            uint64_t v27 = [v20 paths];
            uint64_t v28 = [v27 allKeys];

            id v50 = v28;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v53 = *(void *)v55;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v55 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  v32 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                  uint64_t v33 = [v32 unsignedIntegerValue];
                  v34 = [v20 paths];
                  id v35 = [v34 objectForKeyedSubscript:v32];

                  if ([v12 isEqual:&unk_26FB0C010] && v52)
                  {
                    id v36 = [v52 objectForKeyedSubscript:v32];
                    v37 = [v20 paths];
                    uint64_t v38 = [v37 objectForKeyedSubscript:v36];

                    id v35 = (void *)v38;
                  }
                  if (v35)
                  {
                    uint64_t v39 = [(NSMutableDictionary *)v51->_glyphFillLayers objectForKeyedSubscript:v12];
                    [v39 setPath:v35 forGlyphColor:v33];

                    v40 = [(NSMutableDictionary *)v51->_glyphFillLayers objectForKeyedSubscript:v12];
                    objc_msgSend(v40, "setPosition:", v22, v24);

                    uint64_t v41 = [(NSMutableDictionary *)v51->_glyphStrokeLayers objectForKeyedSubscript:v12];
                    [v41 setPath:v35 forGlyphColor:v33];

                    v42 = [(NSMutableDictionary *)v51->_glyphStrokeLayers objectForKeyedSubscript:v12];
                    objc_msgSend(v42, "setPosition:", v22, v24);
                  }
                }
                uint64_t v30 = [v50 countByEnumeratingWithState:&v54 objects:v62 count:16];
              }
              while (v30);
            }

            v4 = v43;
          }

          uint64_t i = v49;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v47);
  }

LABEL_37:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphStrokeLayers, 0);
  objc_storeStrong((id *)&self->_glyphFillLayers, 0);
  objc_storeStrong((id *)&self->_strokeContainerLayer, 0);
  objc_storeStrong((id *)&self->_fillContainerLayer, 0);
  objc_storeStrong((id *)&self->_digitNumbers, 0);
  objc_storeStrong((id *)&self->_digitLoader, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end