@interface NTKRenegadeBackgroundConfiguration
+ (id)_snapshotBezierPathWithDataAssetName:(id)a3 quiltFrame:(CGRect)a4;
+ (id)interpolatedConfigurationWithFraction:(double)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5;
+ (id)snapshotConfigurationWithBoundingFrame:(CGRect)a3 complicationEdgeInsets:(UIEdgeInsets)a4;
- (BOOL)isSnapshotConfiguration;
- (BOOL)topQuiltPieceOverlapsBottom;
- (CGRect)bottomQuiltMaxBoundingRect;
- (CGRect)bottomQuiltMinBoundingRect;
- (CGRect)topQuiltMaxBoundingRect;
- (CGRect)topQuiltMinBoundingRect;
- (UIBezierPath)bottomQuiltPath;
- (UIBezierPath)topQuiltPath;
- (_BYTE)initWithTopQuiltPieceOverlapsBottom:(double)a3 randomizationSeedValue:(double)a4 topQuiltMinBoundingRect:(double)a5 topQuiltMaxBoundingRect:(double)a6 bottomQuiltMinBoundingRect:(double)a7 bottomQuiltMaxBoundingRect:(double)a8 lineVariance:(double)a9 quiltOverlap:(uint64_t)a10;
- (double)lineVariance;
- (double)quiltOverlap;
- (id)_generateVariationValuesForQuiltPieceWithTopLeftPoint:(CGPoint)a3 topRightPoint:(CGPoint)a4 bottomLeftPoint:(CGPoint)a5 bottomRightPoint:(CGPoint)a6 variance:(double)a7;
- (id)_quiltVariationValuesForSideLength:(double)a3 variance:(double)a4 fromKeyFraction:(double)a5 toKeyFraction:(double)a6;
- (id)description;
- (unint64_t)randomizationSeedValue;
- (void)_generateQuiltPaths;
@end

@implementation NTKRenegadeBackgroundConfiguration

- (_BYTE)initWithTopQuiltPieceOverlapsBottom:(double)a3 randomizationSeedValue:(double)a4 topQuiltMinBoundingRect:(double)a5 topQuiltMaxBoundingRect:(double)a6 bottomQuiltMinBoundingRect:(double)a7 bottomQuiltMaxBoundingRect:(double)a8 lineVariance:(double)a9 quiltOverlap:(uint64_t)a10
{
  v39.receiver = a1;
  v39.super_class = (Class)NTKRenegadeBackgroundConfiguration;
  v36 = objc_msgSendSuper2(&v39, "init");
  v37 = v36;
  if (v36)
  {
    v36[48] = a11;
    *((void *)v36 + 7) = a12;
    *((double *)v36 + 10) = a2;
    *((double *)v36 + 11) = a3;
    *((double *)v36 + 12) = a4;
    *((double *)v36 + 13) = a5;
    *((double *)v36 + 14) = a6;
    *((double *)v36 + 15) = a7;
    *((double *)v36 + 16) = a8;
    *((double *)v36 + 17) = a9;
    *((void *)v36 + 18) = a17;
    *((void *)v36 + 19) = a18;
    *((void *)v36 + 20) = a19;
    *((void *)v36 + 21) = a20;
    *((void *)v36 + 22) = a21;
    *((void *)v36 + 23) = a22;
    *((void *)v36 + 24) = a23;
    *((void *)v36 + 25) = a24;
    *((void *)v36 + 8) = a25;
    *((void *)v36 + 9) = a26;
    [v36 _generateQuiltPaths];
  }
  return v37;
}

- (void)_generateQuiltPaths
{
  randomizer = self->_randomizer;
  if (randomizer)
  {
    [(NTKRenegadeSeededRandomizer *)randomizer reset];
  }
  else
  {
    v4 = +[NTKRenegadeSeededRandomizer randomizerWithSeedValue:self->_randomizationSeedValue];
    v5 = self->_randomizer;
    self->_randomizer = v4;
  }
  CGFloat x = self->_topQuiltMaxBoundingRect.origin.x;
  CGFloat y = self->_topQuiltMaxBoundingRect.origin.y;
  CGFloat width = self->_topQuiltMaxBoundingRect.size.width;
  CGFloat height = self->_topQuiltMaxBoundingRect.size.height;
  CGFloat v11 = self->_topQuiltMinBoundingRect.origin.x;
  CGFloat v10 = self->_topQuiltMinBoundingRect.origin.y;
  CGFloat v12 = self->_topQuiltMinBoundingRect.size.height;
  CGFloat v95 = self->_topQuiltMinBoundingRect.size.width;
  v113.origin.CGFloat x = x;
  v113.origin.CGFloat y = y;
  v113.size.CGFloat width = width;
  v113.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v113);
  v114.origin.CGFloat x = x;
  v114.origin.CGFloat y = y;
  v114.size.CGFloat width = width;
  v114.size.CGFloat height = height;
  double v109 = fmax(CGRectGetMinY(v114), 0.0);
  v115.origin.CGFloat x = v11;
  v115.origin.CGFloat y = v10;
  v115.size.CGFloat width = v95;
  v115.size.CGFloat height = v12;
  double v89 = CGRectGetMinX(v115);
  v116.origin.CGFloat x = v11;
  v116.origin.CGFloat y = v10;
  v116.size.CGFloat width = v95;
  v116.size.CGFloat height = v12;
  double v106 = fmax(CGRectGetMinY(v116), 0.0);
  -[NTKRenegadeSeededRandomizer pointBetweenFirstPoint:secondPoint:](self->_randomizer, "pointBetweenFirstPoint:secondPoint:", MinX, v109, v89);
  double v98 = v14;
  double v99 = v13;
  v117.origin.CGFloat x = x;
  v117.origin.CGFloat y = y;
  v117.size.CGFloat width = width;
  v117.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v117);
  v118.origin.CGFloat x = x;
  v118.origin.CGFloat y = y;
  v118.size.CGFloat width = width;
  v118.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v118);
  v119.origin.CGFloat x = v11;
  v119.origin.CGFloat y = v10;
  v119.size.CGFloat width = v95;
  v119.size.CGFloat height = v12;
  double v83 = CGRectGetMaxX(v119);
  v120.origin.CGFloat x = v11;
  v120.origin.CGFloat y = v10;
  v120.size.CGFloat width = v95;
  v120.size.CGFloat height = v12;
  CGRectGetMaxY(v120);
  -[NTKRenegadeSeededRandomizer pointBetweenFirstPoint:secondPoint:](self->_randomizer, "pointBetweenFirstPoint:secondPoint:", MaxX, v109, v83, v106);
  double v96 = v16;
  double v97 = v15;
  CGFloat v17 = self->_bottomQuiltMaxBoundingRect.origin.x;
  CGFloat v18 = self->_bottomQuiltMaxBoundingRect.origin.y;
  CGFloat v19 = self->_bottomQuiltMaxBoundingRect.size.width;
  CGFloat v20 = self->_bottomQuiltMaxBoundingRect.size.height;
  CGFloat v21 = self->_bottomQuiltMinBoundingRect.origin.x;
  CGFloat v22 = self->_bottomQuiltMinBoundingRect.origin.y;
  CGFloat v24 = self->_bottomQuiltMinBoundingRect.size.width;
  CGFloat v23 = self->_bottomQuiltMinBoundingRect.size.height;
  v121.origin.CGFloat x = v17;
  v121.origin.CGFloat y = v18;
  v121.size.CGFloat width = v19;
  v121.size.CGFloat height = v20;
  double v110 = CGRectGetMinX(v121);
  v122.origin.CGFloat x = v17;
  v122.origin.CGFloat y = v18;
  v122.size.CGFloat width = v19;
  v122.size.CGFloat height = v20;
  double MinY = CGRectGetMinY(v122);
  v123.origin.CGFloat x = v17;
  v123.origin.CGFloat y = v18;
  v123.size.CGFloat width = v19;
  v123.size.CGFloat height = v20;
  double v88 = CGRectGetMaxX(v123);
  v124.origin.CGFloat x = v17;
  v124.origin.CGFloat y = v18;
  v124.size.CGFloat width = v19;
  v124.size.CGFloat height = v20;
  double v93 = CGRectGetMaxY(v124);
  v125.origin.CGFloat x = v21;
  v125.origin.CGFloat y = v22;
  v125.size.CGFloat width = v24;
  v125.size.CGFloat height = v23;
  double v107 = CGRectGetMinX(v125);
  v126.origin.CGFloat x = v21;
  v126.origin.CGFloat y = v22;
  v126.size.CGFloat width = v24;
  v126.size.CGFloat height = v23;
  CGRectGetMinY(v126);
  v127.origin.CGFloat x = v21;
  v127.origin.CGFloat y = v22;
  v127.size.CGFloat width = v24;
  v127.size.CGFloat height = v23;
  double v104 = CGRectGetMaxX(v127);
  v128.origin.CGFloat x = v21;
  v128.origin.CGFloat y = v22;
  v128.size.CGFloat width = v24;
  v128.size.CGFloat height = v23;
  double v92 = CGRectGetMaxY(v128);
  double lineVariance = self->_lineVariance;
  double v81 = lineVariance + self->_quiltOverlap;
  double v25 = MaxY - v81 - (MinY + v81);
  double v26 = MinY + v81 + v25 * 0.3;
  double v27 = MaxY - v81 + v25 * -0.3;
  v28 = +[CLKDevice currentDevice];
  [v28 screenBounds];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;

  v129.origin.CGFloat x = v30;
  v129.origin.CGFloat y = v32;
  v129.size.CGFloat width = v34;
  v129.size.CGFloat height = v36;
  double v37 = CGRectGetMinX(v129);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v26 secondValue:v27];
  double v39 = v38;
  v130.origin.CGFloat x = v30;
  v130.origin.CGFloat y = v32;
  v130.size.CGFloat width = v34;
  v130.size.CGFloat height = v36;
  double v40 = CGRectGetMaxX(v130);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v26 secondValue:v27];
  double v42 = v41;
  double v43 = NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v41, MinX);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v43 secondValue:NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v89)];
  double v101 = v44;
  double v45 = NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v83);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v45 secondValue:NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, MaxX)];
  double v90 = v46;
  double v47 = NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v110);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v47 secondValue:NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v107)];
  double v86 = v48;
  double v49 = NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v104);
  [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v49 secondValue:NTKRenegadeHorizontalFractionOnLine(v37, v39, v40, v42, v88)];
  double v51 = v50;
  double v52 = NTKRenegadeTangentialPointFromLine(v37, v39, v40, v42, v101, v81 * 0.0);
  double v78 = v53;
  double v80 = v52;
  double v54 = NTKRenegadeTangentialPointFromLine(v37, v39, v40, v42, v90, v81 * 0.0);
  double v76 = v55;
  double v102 = NTKRenegadeTangentialPointFromLine(v37, v39, v40, v42, v86, v81 * 0.5);
  double v91 = v56;
  double v57 = NTKRenegadeTangentialPointFromLine(v37, v39, v40, v42, v51, v81 * 0.5);
  double v84 = v58;
  double v87 = v57;
  -[NTKRenegadeSeededRandomizer pointBetweenFirstPoint:secondPoint:](self->_randomizer, "pointBetweenFirstPoint:secondPoint:", v110, v93, v107, v92);
  double v108 = v59;
  double v82 = v60;
  -[NTKRenegadeSeededRandomizer pointBetweenFirstPoint:secondPoint:](self->_randomizer, "pointBetweenFirstPoint:secondPoint:", v104, v92, v88, v93);
  double v105 = v61;
  double v94 = v62;
  v63 = -[NTKRenegadeBackgroundConfiguration _generateVariationValuesForQuiltPieceWithTopLeftPoint:topRightPoint:bottomLeftPoint:bottomRightPoint:variance:](self, "_generateVariationValuesForQuiltPieceWithTopLeftPoint:topRightPoint:bottomLeftPoint:bottomRightPoint:variance:", v99, v98, v97, v96, v80, v78, v54, v76, *(void *)&lineVariance);
  v64 = [v63 objectForKey:&off_10AB0];
  v65 = [v63 objectForKey:&off_10AC8];
  v66 = [v63 objectForKey:&off_10AE0];
  v67 = [v63 objectForKey:&off_10AF8];
  NTKRenegadeQuiltPieceBezierPath(v64, v65, v66, v67, v99, v98, v97, v96, v80, v78, v54, v76);
  v68 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  topQuiltPath = self->_topQuiltPath;
  self->_topQuiltPath = v68;

  v70 = -[NTKRenegadeBackgroundConfiguration _generateVariationValuesForQuiltPieceWithTopLeftPoint:topRightPoint:bottomLeftPoint:bottomRightPoint:variance:](self, "_generateVariationValuesForQuiltPieceWithTopLeftPoint:topRightPoint:bottomLeftPoint:bottomRightPoint:variance:", v99, v98, v97, v96, v80, v78, v54, v76, *(void *)&lineVariance);
  id v111 = [v70 objectForKey:&off_10AB0];

  v71 = [v70 objectForKey:&off_10AC8];

  v72 = [v70 objectForKey:&off_10AE0];

  v73 = [v70 objectForKey:&off_10AF8];

  NTKRenegadeQuiltPieceBezierPath(v111, v71, v72, v73, v102, v91, v87, v84, v108, v82, v105, v94);
  v74 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  bottomQuiltPath = self->_bottomQuiltPath;
  self->_bottomQuiltPath = v74;
}

- (id)_generateVariationValuesForQuiltPieceWithTopLeftPoint:(CGPoint)a3 topRightPoint:(CGPoint)a4 bottomLeftPoint:(CGPoint)a5 bottomRightPoint:(CGPoint)a6 variance:(double)a7
{
  CGFloat y = a6.y;
  double x = a6.x;
  double v32 = a5.x;
  double v8 = a5.y;
  double v9 = a3.y;
  double v10 = a3.x;
  unint64_t v12 = [(NTKRenegadeSeededRandomizer *)self->_randomizer unsignedLongValue];
  uint64_t v13 = (v12 / 0xA * (unsigned __int128)0x199999999999999AuLL) >> 64;
  double v14 = 1.0;
  double v15 = 0.0;
  uint64_t v16 = ((v12 / 0xA) + 2 * (_BYTE)v13) & 3;
  double v33 = y;
  if ((((v12 / 0xA) + 2 * (_BYTE)v13) & 3) != 0)
  {
    if (v16 == 1)
    {
      int v17 = 1;
    }
    else
    {
      if (v16 == 2)
      {
        int v17 = 0;
        double v28 = 0.95;
        double v18 = 0.0;
        goto LABEL_10;
      }
      int v17 = 0;
      double v15 = 0.05;
    }
    double v18 = 0.0;
  }
  else
  {
    int v17 = 0;
    double v14 = 0.95;
    double v18 = 0.05;
  }
  double v28 = 1.0;
LABEL_10:
  CGFloat v19 = [(NTKRenegadeBackgroundConfiguration *)self _quiltVariationValuesForSideLength:NTKRenegadeLengthBetweenPoints(v32, v8, v10, v9) variance:a7 fromKeyFraction:v15 toKeyFraction:v14];
  double v20 = NTKRenegadeLengthBetweenPoints(v10, v9, a4.x, a4.y);
  if (v17) {
    double v21 = 0.95;
  }
  else {
    double v21 = 1.0;
  }
  if (v17) {
    double v22 = 0.05;
  }
  else {
    double v22 = 0.0;
  }
  CGFloat v23 = -[NTKRenegadeBackgroundConfiguration _quiltVariationValuesForSideLength:variance:fromKeyFraction:toKeyFraction:](self, "_quiltVariationValuesForSideLength:variance:fromKeyFraction:toKeyFraction:", v20, a7, v18, v21, *(void *)&v28);
  CGFloat v24 = [(NTKRenegadeBackgroundConfiguration *)self _quiltVariationValuesForSideLength:NTKRenegadeLengthBetweenPoints(a4.x, a4.y, x, v33) variance:a7 fromKeyFraction:v22 toKeyFraction:v29];
  double v25 = [(NTKRenegadeBackgroundConfiguration *)self _quiltVariationValuesForSideLength:NTKRenegadeLengthBetweenPoints(x, v33, v32, v8) variance:a7 fromKeyFraction:v15 toKeyFraction:v14];
  v34[0] = &off_10AB0;
  v34[1] = &off_10AE0;
  v35[0] = v19;
  v35[1] = v23;
  v34[2] = &off_10AC8;
  v34[3] = &off_10AF8;
  v35[2] = v24;
  v35[3] = v25;
  double v26 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

  return v26;
}

- (id)_quiltVariationValuesForSideLength:(double)a3 variance:(double)a4 fromKeyFraction:(double)a5 toKeyFraction:(double)a6
{
  double v10 = a4 * 0.1;
  CGFloat v11 = objc_opt_new();
  unint64_t v12 = +[NSNumber numberWithDouble:a5];
  v23[0] = v12;
  v24[0] = &off_10C60;
  uint64_t v13 = +[NSNumber numberWithDouble:a6];
  v23[1] = v13;
  v24[1] = &off_10C60;
  double v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v11 addEntriesFromDictionary:v14];

  unint64_t v15 = 1;
  double v16 = 0.0;
  char v17 = 1;
  do
  {
    if (a4 - v16 <= v10) {
      v17 ^= 1u;
    }
    if (v17) {
      double v18 = a4;
    }
    else {
      double v18 = 0.0;
    }
    [(NTKRenegadeSeededRandomizer *)self->_randomizer floatValueBetweenFirstValue:v16 secondValue:v18];
    double v16 = v19;
    double v20 = +[NSNumber numberWithDouble:v19];
    double v21 = +[NSNumber numberWithDouble:(double)v15 / 6.0];
    [v11 setObject:v20 forKeyedSubscript:v21];

    ++v15;
  }
  while (v15 != 6);

  return v11;
}

- (id)description
{
  if (self->_randomizationSeedValue || self->_isSnapshotConfiguration)
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKRenegadeBackgroundConfiguration;
    v3 = [(NTKRenegadeBackgroundConfiguration *)&v13 description];
    BOOL topQuiltPieceOverlapsBottom = self->_topQuiltPieceOverlapsBottom;
    unint64_t randomizationSeedValue = self->_randomizationSeedValue;
    v6 = NSStringFromCGRect(self->_topQuiltMinBoundingRect);
    v7 = NSStringFromCGRect(self->_topQuiltMaxBoundingRect);
    double v8 = NSStringFromCGRect(self->_bottomQuiltMinBoundingRect);
    double v9 = NSStringFromCGRect(self->_bottomQuiltMaxBoundingRect);
    double v10 = +[NSString stringWithFormat:@"%@ topQuiltPieceOverlapsBottom: %d, randomizationSeedValue: %lul, topQuiltMinBoundingRect: %@, topQuiltMaxBoundingRect: %@, bottomQuiltMinBoundingRect: %@, bottomQuiltMaxBoundingRect: %@, lineVariance: %f, quiltOverlap: %f, isSnapshotConfiguration: %d", v3, topQuiltPieceOverlapsBottom, randomizationSeedValue, v6, v7, v8, v9, *(void *)&self->_lineVariance, *(void *)&self->_quiltOverlap, self->_isSnapshotConfiguration];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKRenegadeBackgroundConfiguration;
    v3 = [(NTKRenegadeBackgroundConfiguration *)&v14 description];
    BOOL v12 = self->_topQuiltPieceOverlapsBottom;
    [(UIBezierPath *)self->_topQuiltPath bounds];
    v6 = NSStringFromCGRect(v16);
    [(UIBezierPath *)self->_bottomQuiltPath bounds];
    v7 = NSStringFromCGRect(v17);
    double v10 = +[NSString stringWithFormat:@"%@ interpolated configuration topQuiltPieceOverlapsBottom: %d, topQuiltPath.bounds: %@, bottomQuiltPath.bounds: %@", v3, v12, v6, v7];
  }

  return v10;
}

+ (id)interpolatedConfigurationWithFraction:(double)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [a1 new];
  double v10 = [v7 topQuiltPath];
  CGFloat v11 = [v8 topQuiltPath];
  uint64_t v12 = NTKInterpolateBetweenBezierPaths();
  objc_super v13 = (void *)v9[2];
  v9[2] = v12;

  objc_super v14 = [v7 bottomQuiltPath];
  unint64_t v15 = [v8 bottomQuiltPath];
  uint64_t v16 = NTKInterpolateBetweenBezierPaths();
  CGRect v17 = (void *)v9[3];
  v9[3] = v16;

  v9[7] = 0;
  LODWORD(v14) = [v8 topQuiltPieceOverlapsBottom];

  if (v14) {
    unsigned __int8 v18 = [v7 topQuiltPieceOverlapsBottom];
  }
  else {
    unsigned __int8 v18 = 0;
  }
  *((unsigned char *)v9 + 48) = v18;

  return v9;
}

+ (id)snapshotConfigurationWithBoundingFrame:(CGRect)a3 complicationEdgeInsets:(UIEdgeInsets)a4
{
  double v5 = NTKRenegadeHorizontallyCenteredFrameWithEdgeInsets(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [a1 new];
  uint64_t v13 = objc_msgSend(a1, "_snapshotBezierPathWithDataAssetName:quiltFrame:", @"SnapshotVectorHour", v5, v7, v9, v11);
  objc_super v14 = (void *)v12[2];
  v12[2] = v13;

  uint64_t v15 = objc_msgSend(a1, "_snapshotBezierPathWithDataAssetName:quiltFrame:", @"SnapshotVectorMinute", v5, v7, v9, v11);
  uint64_t v16 = (void *)v12[3];
  v12[3] = v15;

  *((_WORD *)v12 + 24) = 256;
  v12[7] = 0;

  return v12;
}

+ (id)_snapshotBezierPathWithDataAssetName:(id)a3 quiltFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  double v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [objc_alloc((Class)NSDataAsset) initWithName:v8 bundle:v9];

  double v11 = NTKRenegadeBezierPathFromSVGDataAsset(v10, x, y, width, height);

  return v11;
}

- (BOOL)topQuiltPieceOverlapsBottom
{
  return self->_topQuiltPieceOverlapsBottom;
}

- (unint64_t)randomizationSeedValue
{
  return self->_randomizationSeedValue;
}

- (CGRect)topQuiltMinBoundingRect
{
  double x = self->_topQuiltMinBoundingRect.origin.x;
  double y = self->_topQuiltMinBoundingRect.origin.y;
  double width = self->_topQuiltMinBoundingRect.size.width;
  double height = self->_topQuiltMinBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)topQuiltMaxBoundingRect
{
  double x = self->_topQuiltMaxBoundingRect.origin.x;
  double y = self->_topQuiltMaxBoundingRect.origin.y;
  double width = self->_topQuiltMaxBoundingRect.size.width;
  double height = self->_topQuiltMaxBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bottomQuiltMinBoundingRect
{
  double x = self->_bottomQuiltMinBoundingRect.origin.x;
  double y = self->_bottomQuiltMinBoundingRect.origin.y;
  double width = self->_bottomQuiltMinBoundingRect.size.width;
  double height = self->_bottomQuiltMinBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bottomQuiltMaxBoundingRect
{
  double x = self->_bottomQuiltMaxBoundingRect.origin.x;
  double y = self->_bottomQuiltMaxBoundingRect.origin.y;
  double width = self->_bottomQuiltMaxBoundingRect.size.width;
  double height = self->_bottomQuiltMaxBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)lineVariance
{
  return self->_lineVariance;
}

- (double)quiltOverlap
{
  return self->_quiltOverlap;
}

- (UIBezierPath)topQuiltPath
{
  return self->_topQuiltPath;
}

- (UIBezierPath)bottomQuiltPath
{
  return self->_bottomQuiltPath;
}

- (BOOL)isSnapshotConfiguration
{
  return self->_isSnapshotConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toInterpolatedConfiguration, 0);
  objc_storeStrong((id *)&self->_fromInterpolatedConfiguration, 0);
  objc_storeStrong((id *)&self->_bottomQuiltPath, 0);
  objc_storeStrong((id *)&self->_topQuiltPath, 0);

  objc_storeStrong((id *)&self->_randomizer, 0);
}

@end