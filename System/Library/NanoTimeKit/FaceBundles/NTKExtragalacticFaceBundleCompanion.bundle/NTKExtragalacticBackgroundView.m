@interface NTKExtragalacticBackgroundView
- (NTKExtragalacticBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation NTKExtragalacticBackgroundView

- (NTKExtragalacticBackgroundView)initWithFrame:(CGRect)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)NTKExtragalacticBackgroundView;
  v3 = -[NTKExtragalacticBackgroundView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] blackColor];
    [(NTKExtragalacticBackgroundView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    backgroundColors = v3->_backgroundColors;
    v3->_backgroundColors = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
    backgroundLayers = v3->_backgroundLayers;
    v3->_backgroundLayers = (NSMutableDictionary *)v7;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = +[NTKExtragalacticLayoutHelper allCorners];
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
          uint64_t v14 = [v13 unsignedIntegerValue];
          v15 = +[NTKExtragalacticColors identityColorForCorner:v14];
          [(NSMutableArray *)v3->_backgroundColors setObject:v15 atIndexedSubscript:v14];
          [(NTKExtragalacticBackgroundView *)v3 bounds];
          +[NTKExtragalacticLayoutHelper frameForCorner:screenBounds:](NTKExtragalacticLayoutHelper, "frameForCorner:screenBounds:", v14);
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          v24 = [MEMORY[0x263F157E8] layer];
          objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
          id v25 = v15;
          objc_msgSend(v24, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
          if (qword_2691D4488 != -1) {
            dispatch_once(&qword_2691D4488, &unk_26FB09218);
          }
          [v24 setActions:qword_2691D4480];
          v26 = [(NTKExtragalacticBackgroundView *)v3 layer];
          [v26 addSublayer:v24];

          [(NSMutableDictionary *)v3->_backgroundLayers setObject:v24 forKeyedSubscript:v13];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLayers, 0);

  objc_storeStrong((id *)&self->_backgroundColors, 0);
}

@end