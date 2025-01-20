@interface ASTUIDualMatrixCalibrationStrategy
- (ASTUIDualMatrixCalibrationStrategy)init;
- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3;
- (NSArray)bottomCalibrationMatrix;
- (NSArray)topCalibrationMatrix;
- (NSMutableDictionary)storedEnrollments;
- (double)uncalibratedMiddleLineOfTheScreen;
- (id)calibratedArrayForGazePoint:(CGPoint)a3;
- (id)learnCalibrationForPoints:(id)a3;
- (void)captureGazeEnrollmentPoint:(id)a3;
- (void)learnCalibration;
- (void)reset;
- (void)setBottomCalibrationMatrix:(id)a3;
- (void)setStoredEnrollments:(id)a3;
- (void)setTopCalibrationMatrix:(id)a3;
- (void)setUncalibratedMiddleLineOfTheScreen:(double)a3;
@end

@implementation ASTUIDualMatrixCalibrationStrategy

- (ASTUIDualMatrixCalibrationStrategy)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  v2 = [(ASTUIDualMatrixCalibrationStrategy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    storedEnrollments = v2->_storedEnrollments;
    v2->_storedEnrollments = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  double y = a3.y;
  [(ASTUIDualMatrixCalibrationStrategy *)self uncalibratedMiddleLineOfTheScreen];
  if (y > v5) {
    [(ASTUIDualMatrixCalibrationStrategy *)self bottomCalibrationMatrix];
  }
  else {
  objc_super v6 = [(ASTUIDualMatrixCalibrationStrategy *)self topCalibrationMatrix];
  }
  return v6;
}

- (void)captureGazeEnrollmentPoint:(id)a3
{
  id v4 = a3;
  id v6 = [(ASTUIDualMatrixCalibrationStrategy *)self storedEnrollments];
  double v5 = [v4 positionName];
  [v6 setObject:v4 forKey:v5];
}

- (void)learnCalibration
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  double v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26FC83D50];
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_26FC83D68];
  v7 = [(ASTUIDualMatrixCalibrationStrategy *)self storedEnrollments];
  v8 = [v7 allKeys];
  unint64_t v9 = [v8 count];

  if (v9 < 5)
  {
    v19 = objc_opt_new();
    v20 = [v7 allValues];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_4;
    v22[3] = &unk_26523EEC0;
    id v23 = v19;
    id v18 = v19;
    [v20 enumerateObjectsUsingBlock:v22];

    [(ASTUIDualMatrixCalibrationStrategy *)self setUncalibratedMiddleLineOfTheScreen:-1.0];
    v21 = [(ASTUIDualMatrixCalibrationStrategy *)self learnCalibrationForPoints:v18];
    [(ASTUIDualMatrixCalibrationStrategy *)self setBottomCalibrationMatrix:v21];
  }
  else
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke;
    v33[3] = &unk_26523EE70;
    id v34 = v5;
    id v10 = v3;
    id v35 = v10;
    id v36 = v6;
    id v11 = v4;
    id v37 = v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v33];
    v12 = objc_opt_new();
    v13 = objc_opt_new();
    uint64_t v29 = 0;
    v30 = (double *)&v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_2;
    v26[3] = &unk_26523EE98;
    id v14 = v12;
    id v27 = v14;
    v28 = &v29;
    [v10 enumerateObjectsUsingBlock:v26];
    [(ASTUIDualMatrixCalibrationStrategy *)self setUncalibratedMiddleLineOfTheScreen:v30[3]];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_3;
    v24[3] = &unk_26523EEC0;
    id v15 = v13;
    id v25 = v15;
    [v11 enumerateObjectsUsingBlock:v24];
    v16 = [(ASTUIDualMatrixCalibrationStrategy *)self learnCalibrationForPoints:v14];
    [(ASTUIDualMatrixCalibrationStrategy *)self setTopCalibrationMatrix:v16];

    v17 = [(ASTUIDualMatrixCalibrationStrategy *)self learnCalibrationForPoints:v15];
    [(ASTUIDualMatrixCalibrationStrategy *)self setBottomCalibrationMatrix:v17];

    _Block_object_dispose(&v29, 8);
    id v18 = v34;
  }
}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([a1[4] containsObject:v6]) {
    [a1[5] addObject:v5];
  }
  if ([a1[6] containsObject:v6]) {
    [a1[7] addObject:v5];
  }
}

double __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  id v4 = a2;
  [v4 predictedPoint];
  v18[0] = v5;
  v18[1] = v6;
  v7 = [v3 valueWithBytes:v18 objCType:"{CGPoint=dd}"];
  v8 = *(void **)(a1 + 32);
  unint64_t v9 = (void *)MEMORY[0x263F08D40];
  [v4 groundTruthPoint];
  v17[0] = v10;
  v17[1] = v11;
  v12 = [v9 valueWithBytes:v17 objCType:"{CGPoint=dd}"];
  [v8 setObject:v7 forKeyedSubscript:v12];

  [v4 predictedPoint];
  double v14 = v13;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = fmax(v14, *(double *)(v15 + 24));
  *(double *)(v15 + 24) = result;
  return result;
}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  id v4 = a2;
  [v4 predictedPoint];
  v16[0] = v5;
  v16[1] = v6;
  v7 = [v3 valueWithBytes:v16 objCType:"{CGPoint=dd}"];
  v8 = *(void **)(a1 + 32);
  unint64_t v9 = (void *)MEMORY[0x263F08D40];
  [v4 groundTruthPoint];
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v15[0] = v11;
  v15[1] = v13;
  double v14 = [v9 valueWithBytes:v15 objCType:"{CGPoint=dd}"];
  [v8 setObject:v7 forKeyedSubscript:v14];
}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  id v4 = a2;
  [v4 predictedPoint];
  v16[0] = v5;
  v16[1] = v6;
  v7 = [v3 valueWithBytes:v16 objCType:"{CGPoint=dd}"];
  v8 = *(void **)(a1 + 32);
  unint64_t v9 = (void *)MEMORY[0x263F08D40];
  [v4 groundTruthPoint];
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v15[0] = v11;
  v15[1] = v13;
  double v14 = [v9 valueWithBytes:v15 objCType:"{CGPoint=dd}"];
  [v8 setObject:v7 forKeyedSubscript:v14];
}

- (void)reset
{
  id v3 = (id)objc_opt_new();
  [(ASTUIDualMatrixCalibrationStrategy *)self setStoredEnrollments:v3];
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy calibratedGazePointForGazePoint:](&v5, sel_calibratedGazePointForGazePoint_, a3.x, a3.y);
  result.double y = v4;
  result.x = v3;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  double v3 = [(ASTUILinearMatrixCalibrationStrategy *)&v5 learnCalibrationForPoints:a3];
  return v3;
}

- (NSMutableDictionary)storedEnrollments
{
  return self->_storedEnrollments;
}

- (void)setStoredEnrollments:(id)a3
{
}

- (NSArray)topCalibrationMatrix
{
  return self->_topCalibrationMatrix;
}

- (void)setTopCalibrationMatrix:(id)a3
{
}

- (NSArray)bottomCalibrationMatrix
{
  return self->_bottomCalibrationMatrix;
}

- (void)setBottomCalibrationMatrix:(id)a3
{
}

- (double)uncalibratedMiddleLineOfTheScreen
{
  return self->_uncalibratedMiddleLineOfTheScreen;
}

- (void)setUncalibratedMiddleLineOfTheScreen:(double)a3
{
  self->_uncalibratedMiddleLineOfTheScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomCalibrationMatrix, 0);
  objc_storeStrong((id *)&self->_topCalibrationMatrix, 0);
  objc_storeStrong((id *)&self->_storedEnrollments, 0);
}

@end