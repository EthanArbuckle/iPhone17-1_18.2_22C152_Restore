@interface AXMVisionColorMarker
+ (NSArray)allColorMarkers;
+ (id)closestMarkerToColor:(id)a3 withMaximumThreshold:(double)a4;
+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5 localizedName:(id)a6;
- (NSString)localizedName;
- (id)description;
- (void)setLocalizedName:(id)a3;
@end

@implementation AXMVisionColorMarker

+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5 localizedName:(id)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___AXMVisionColorMarker;
  id v9 = a6;
  v10 = objc_msgSendSuper2(&v12, sel_colorWithHueDegrees_saturation_brightness_, a3, a4, a5);
  objc_msgSend(v10, "setLocalizedName:", v9, v12.receiver, v12.super_class);

  return v10;
}

+ (NSArray)allColorMarkers
{
  if (allColorMarkers_onceToken != -1) {
    dispatch_once(&allColorMarkers_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)allColorMarkers__ColorMarkers;

  return (NSArray *)v2;
}

void __39__AXMVisionColorMarker_allColorMarkers__block_invoke()
{
  v42[40] = *MEMORY[0x1E4F143B8];
  v41 = +[AXMVisionColorMarker colorWithHueDegrees:@"Black" saturation:0.0 brightness:0.0 localizedName:0.0];
  v42[0] = v41;
  v40 = +[AXMVisionColorMarker colorWithHueDegrees:@"Gray" saturation:0.0 brightness:0.0 localizedName:0.5];
  v42[1] = v40;
  v39 = +[AXMVisionColorMarker colorWithHueDegrees:@"Silver" saturation:0.0 brightness:0.0 localizedName:0.85];
  v42[2] = v39;
  v38 = +[AXMVisionColorMarker colorWithHueDegrees:@"White" saturation:0.0 brightness:0.0 localizedName:1.0];
  v42[3] = v38;
  v37 = +[AXMVisionColorMarker colorWithHueDegrees:@"Red" saturation:0.0 brightness:1.0 localizedName:1.0];
  v42[4] = v37;
  v36 = +[AXMVisionColorMarker colorWithHueDegrees:@"Salmon" saturation:5.0 brightness:0.53 localizedName:0.97];
  v42[5] = v36;
  v35 = +[AXMVisionColorMarker colorWithHueDegrees:@"Rose" saturation:18.0 brightness:0.25 localizedName:0.84];
  v42[6] = v35;
  v34 = +[AXMVisionColorMarker colorWithHueDegrees:@"Brown" saturation:18.0 brightness:0.66 localizedName:0.38];
  v42[7] = v34;
  v33 = +[AXMVisionColorMarker colorWithHueDegrees:@"Coral" saturation:24.0 brightness:0.84 localizedName:1.0];
  v42[8] = v33;
  v32 = +[AXMVisionColorMarker colorWithHueDegrees:@"Orange" saturation:30.0 brightness:1.0 localizedName:1.0];
  v42[9] = v32;
  v31 = +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", @"Chestnut", 35.0, 0.23);
  v42[10] = v31;
  v30 = +[AXMVisionColorMarker colorWithHueDegrees:@"Tan" saturation:37.0 brightness:0.22 localizedName:0.78];
  v42[11] = v30;
  v29 = +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", @"Gold", 50.0, 0.8);
  v42[12] = v29;
  v28 = +[AXMVisionColorMarker colorWithHueDegrees:saturation:brightness:localizedName:](AXMVisionColorMarker, "colorWithHueDegrees:saturation:brightness:localizedName:", @"Olive", 59.0, 0.82);
  v42[13] = v28;
  v27 = +[AXMVisionColorMarker colorWithHueDegrees:@"Ivory" saturation:60.0 brightness:0.06 localizedName:0.99];
  v42[14] = v27;
  v26 = +[AXMVisionColorMarker colorWithHueDegrees:@"Beige" saturation:60.0 brightness:0.1 localizedName:0.96];
  v42[15] = v26;
  v25 = +[AXMVisionColorMarker colorWithHueDegrees:@"Yellow" saturation:60.0 brightness:1.0 localizedName:1.0];
  v42[16] = v25;
  v24 = +[AXMVisionColorMarker colorWithHueDegrees:@"Lime Green" saturation:72.0 brightness:0.94 localizedName:0.91];
  v42[17] = v24;
  v23 = +[AXMVisionColorMarker colorWithHueDegrees:@"Light Green" saturation:94.0 brightness:0.23 localizedName:0.75];
  v42[18] = v23;
  v22 = +[AXMVisionColorMarker colorWithHueDegrees:@"Sea Foam Green" saturation:112.0 brightness:0.17 localizedName:0.97];
  v42[19] = v22;
  v21 = +[AXMVisionColorMarker colorWithHueDegrees:@"Forest Green" saturation:119.0 brightness:0.71 localizedName:0.54];
  v42[20] = v21;
  v20 = +[AXMVisionColorMarker colorWithHueDegrees:@"Light Green" saturation:120.0 brightness:0.38 localizedName:0.93];
  v42[21] = v20;
  v19 = +[AXMVisionColorMarker colorWithHueDegrees:@"Green" saturation:120.0 brightness:1.0 localizedName:1.0];
  v42[22] = v19;
  v18 = +[AXMVisionColorMarker colorWithHueDegrees:@"Turquoise" saturation:174.0 brightness:0.67 localizedName:0.87];
  v42[23] = v18;
  v17 = +[AXMVisionColorMarker colorWithHueDegrees:@"Teal" saturation:174.0 brightness:0.83 localizedName:0.93];
  v42[24] = v17;
  v16 = +[AXMVisionColorMarker colorWithHueDegrees:@"Cyan" saturation:180.0 brightness:1.0 localizedName:1.0];
  v42[25] = v16;
  v15 = +[AXMVisionColorMarker colorWithHueDegrees:@"Aqua" saturation:191.0 brightness:0.86 localizedName:0.86];
  v42[26] = v15;
  v14 = +[AXMVisionColorMarker colorWithHueDegrees:@"Sky Blue" saturation:221.0 brightness:0.15 localizedName:0.88];
  v42[27] = v14;
  v13 = +[AXMVisionColorMarker colorWithHueDegrees:@"Royal Blue" saturation:228.0 brightness:0.91 localizedName:0.93];
  v42[28] = v13;
  objc_super v12 = +[AXMVisionColorMarker colorWithHueDegrees:@"Navy Blue" saturation:228.0 brightness:0.93 localizedName:0.37];
  v42[29] = v12;
  v0 = +[AXMVisionColorMarker colorWithHueDegrees:@"Indigo" saturation:228.0 brightness:0.9 localizedName:0.5];
  v42[30] = v0;
  v1 = +[AXMVisionColorMarker colorWithHueDegrees:@"Lavender" saturation:240.0 brightness:0.08 localizedName:0.98];
  v42[31] = v1;
  v2 = +[AXMVisionColorMarker colorWithHueDegrees:@"Purple" saturation:266.0 brightness:0.15 localizedName:0.75];
  v42[32] = v2;
  v3 = +[AXMVisionColorMarker colorWithHueDegrees:@"Fuchsia" saturation:300.0 brightness:0.84 localizedName:0.99];
  v42[33] = v3;
  v4 = +[AXMVisionColorMarker colorWithHueDegrees:@"Dark Purple" saturation:301.0 brightness:0.88 localizedName:0.44];
  v42[34] = v4;
  v5 = +[AXMVisionColorMarker colorWithHueDegrees:@"Light Pink" saturation:317.0 brightness:0.08 localizedName:0.94];
  v42[35] = v5;
  v6 = +[AXMVisionColorMarker colorWithHueDegrees:@"Violet" saturation:300.0 brightness:0.43 localizedName:0.91];
  v42[36] = v6;
  v7 = +[AXMVisionColorMarker colorWithHueDegrees:@"Pink" saturation:320.0 brightness:0.28 localizedName:0.95];
  v42[37] = v7;
  v8 = +[AXMVisionColorMarker colorWithHueDegrees:@"Maroon" saturation:339.0 brightness:0.72 localizedName:0.38];
  v42[38] = v8;
  id v9 = +[AXMVisionColorMarker colorWithHueDegrees:@"Crimson" saturation:357.0 brightness:0.97 localizedName:0.59];
  v42[39] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:40];
  v11 = (void *)allColorMarkers__ColorMarkers;
  allColorMarkers__ColorMarkers = v10;
}

+ (id)closestMarkerToColor:(id)a3 withMaximumThreshold:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = fmin(fmax(a4, 0.0), 1.0);
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = [a1 allColorMarkers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v14 euclidianDistanceHS:v6];
        if (v15 < v7 + v7) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  double v16 = v7 * 2.23606798;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v30;
    double v22 = 1.79769313e308;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        objc_msgSend(v24, "euclidianDistanceHSV:", v6, (void)v29);
        if (v25 < v22)
        {
          double v26 = v25;
          id v27 = v24;

          double v22 = v26;
          v20 = v27;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }
  else
  {
    v20 = 0;
    double v22 = 1.79769313e308;
  }

  if (v22 > v16)
  {

    v20 = 0;
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXMVisionColorMarker;
  v4 = [(AXMVisionColor *)&v8 description];
  v5 = [(AXMVisionColorMarker *)self localizedName];
  id v6 = [v3 stringWithFormat:@"%@ name:%@", v4, v5];

  return v6;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end