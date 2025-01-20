@interface CRNStandardScrollTestParameters
+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 canUseFlicks:(BOOL)a9 completionHandler:(id)a10;
+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8;
+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8 completionHandler:(id)a9;
+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 preventDismissalGestures:(BOOL)a6 canUseFlicks:(BOOL)a7 completionHandler:(id)a8;
- (BOOL)preventDismissalGestures;
- (BOOL)shouldFlick;
- (CGRect)scrollingBounds;
- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10;
- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10 completionHandler:(id)a11;
- (double)amplitude;
- (double)iterationDuration;
- (id)completionHandler;
- (id)composerBlock;
- (id)testName;
- (int64_t)direction;
- (unint64_t)iterations;
- (void)setAmplitude:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIterationDuration:(double)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setPreventDismissalGestures:(BOOL)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setShouldFlick:(BOOL)a3;
- (void)setTestName:(id)a3;
@end

@implementation CRNStandardScrollTestParameters

- (id)completionHandler
{
  return self->_completionHandler;
}

- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10 completionHandler:(id)a11
{
  BOOL v12 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v68[2] = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v59 = a11;
  if (CRNAxisFromScrollDirection(a7) == 1) {
    double v22 = width;
  }
  else {
    double v22 = height;
  }
  double v57 = a6;
  double v23 = floor(a6 / v22);
  unint64_t v24 = 0x264CC1000uLL;
  unint64_t v25 = 2 * a4;
  double v26 = a9 * 0.25;
  v27 = [[CRNOscillationScrollTestParameters alloc] initWithTestName:v21 iterations:2 * a4 scrollingBounds:0 useFlicks:v12 preventDismissalGestures:a7 initialAmplitude:0 amplitudeVariationPerIteration:x initialDirection:y iterationDuration:width finishWithHalfIteration:height];
  v68[0] = v27;
  unint64_t v62 = a4;
  double v61 = width;
  double v63 = a9;
  v28 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:]([CRNOscillationScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, a4, 0, v12, a7, 1, x, y, width, height, v22, 0.0, a9);
  v68[1] = v28;
  unint64_t v29 = 0x263EFF000uLL;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];

  if (v23 >= 1.0)
  {
    double v32 = 1.0;
    do
    {
      v64 = objc_msgSend(objc_alloc(*(Class *)(v24 + 248)), "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v25, 0, v12, a7, 0, x, y, width, height, v22 / 10.0, 15.0, v26);
      v67[0] = v64;
      v33 = objc_msgSend(objc_alloc(*(Class *)(v24 + 248)), "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v62, 0, v12, a7, 1, x, y, width, height, v22, 0.0, v63);
      v67[1] = v33;
      [*(id *)(v29 + 2240) arrayWithObjects:v67 count:2];
      unint64_t v34 = v29;
      id v35 = v21;
      int64_t v36 = a7;
      BOOL v37 = v12;
      unint64_t v38 = v25;
      v40 = unint64_t v39 = v24;
      v31 = [v30 arrayByAddingObjectsFromArray:v40];

      unint64_t v24 = v39;
      unint64_t v25 = v38;
      BOOL v12 = v37;
      a7 = v36;
      id v21 = v35;
      unint64_t v29 = v34;

      double v32 = v32 + 1.0;
      v30 = v31;
    }
    while (v32 <= v23);
  }
  else
  {
    v31 = v30;
  }
  if (a10)
  {
    id v41 = objc_alloc(*(Class *)(v24 + 248));
    double v42 = v63;
    unint64_t v43 = v29;
    unint64_t v44 = v62;
    double v46 = width;
    double v45 = height;
    v47 = objc_msgSend(v41, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v21, v62, 1, v12, CRNOppositeDirectionFrom(a7), 1, x, y, v61, height, v22, 0.0, v63 * 1.5);
    v66 = v47;
    v48 = [*(id *)(v43 + 2240) arrayWithObjects:&v66 count:1];
    uint64_t v49 = [v31 arrayByAddingObjectsFromArray:v48];

    v31 = (void *)v49;
    v50 = v59;
  }
  else
  {
    double v42 = v63;
    v50 = v59;
    unint64_t v44 = v62;
    double v46 = width;
    double v45 = height;
  }
  v65.receiver = self;
  v65.super_class = (Class)CRNStandardScrollTestParameters;
  v51 = [(CRNGroupScrollTestParameters *)&v65 initWithTestName:v21 withParameters:v31 completionHandler:0];
  if (v51)
  {
    uint64_t v52 = [v21 copy];
    testName = v51->_testName;
    v51->_testName = (NSString *)v52;

    v51->_scrollingBounds.origin.double x = x;
    v51->_scrollingBounds.origin.double y = y;
    v51->_scrollingBounds.size.double width = v46;
    v51->_scrollingBounds.size.double height = v45;
    v51->_iterations = v44;
    v51->_amplitude = v57;
    v51->_shouldFlick = a10;
    v51->_direction = a7;
    v51->_preventDismissalGestures = v12;
    v51->_iterationDuration = v42;
    uint64_t v54 = MEMORY[0x237E0E480](v50);
    id completionHandler = v51->_completionHandler;
    v51->_id completionHandler = (id)v54;
  }
  return v51;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)testName
{
  return self->_testName;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8
{
  return (id)[a1 parametersForTestName:a3 scrollView:a4 iterations:a5 direction:a6 preventDismissalGestures:a7 canUseFlicks:a8 completionHandler:0];
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 canUseFlicks:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = a9;
  BOOL v11 = a8;
  id v16 = a10;
  id v17 = a4;
  id v18 = a3;
  v19 = [v17 superview];
  [v17 frame];
  objc_msgSend(v19, "convertRect:toView:", 0);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [v17 adjustedContentInset];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  double v36 = v23 + v29;
  double v37 = v27 - (v29 + v33);
  unint64_t v38 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v39 = [v38 userInterfaceIdiom];

  double v40 = 25.0;
  if (v39 != 1) {
    double v40 = 5.0;
  }
  double v41 = v36 + v40;
  double v42 = -70.0;
  if (v39 != 1) {
    double v42 = -10.0;
  }
  unint64_t v43 = -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:]([CRNStandardScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", v18, a5, a7, v11, v10, v16, v21 + v31 + 5.0, v41, v25 - (v31 + v35) + -10.0, v37 + v42, a6, 1.25);

  return v43;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 direction:(int64_t)a6 preventDismissalGestures:(BOOL)a7 canUseFlicks:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a4;
  id v17 = a3;
  double v44 = CRNContentSizeInDirection(v16, a6);
  id v18 = [v16 superview];
  [v16 frame];
  objc_msgSend(v18, "convertRect:toView:", 0);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  [v16 adjustedContentInset];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = v22 + v28;
  double v36 = v26 - (v28 + v32);
  double v37 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v38 = [v37 userInterfaceIdiom];

  double v39 = 25.0;
  if (v38 != 1) {
    double v39 = 5.0;
  }
  double v40 = v35 + v39;
  double v41 = -70.0;
  if (v38 != 1) {
    double v41 = -10.0;
  }
  double v42 = -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:]([CRNStandardScrollTestParameters alloc], "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", v17, a5, a6, v10, v9, v15, v20 + v30 + 5.0, v40, v24 - (v30 + v34) + -10.0, v36 + v41, v44, 1.25);

  return v42;
}

+ (id)parametersForTestName:(id)a3 scrollView:(id)a4 iterations:(unint64_t)a5 preventDismissalGestures:(BOOL)a6 canUseFlicks:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = CRNQuadrantOfContentOffsetFor(v14);
  id v17 = +[CRNStandardScrollTestParameters parametersForTestName:v15 scrollView:v14 iterations:a5 direction:CRNOppositeDirectionFrom(v16) preventDismissalGestures:v9 canUseFlicks:v8 completionHandler:v13];

  return v17;
}

- (CRNStandardScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 preventDismissalGestures:(BOOL)a8 iterationDuration:(double)a9 canUseFlicks:(BOOL)a10
{
  return -[CRNStandardScrollTestParameters initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:amplitude:direction:preventDismissalGestures:iterationDuration:canUseFlicks:completionHandler:", a3, a4, a7, a8, a10, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a9);
}

- (id)composerBlock
{
  v100[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = CRNAxisFromScrollDirection([(CRNStandardScrollTestParameters *)self direction]);
  [(CRNStandardScrollTestParameters *)self scrollingBounds];
  if (v3 == 1) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  unint64_t v7 = 0x264CC1000uLL;
  BOOL v8 = [CRNOscillationScrollTestParameters alloc];
  BOOL v9 = [(CRNStandardScrollTestParameters *)self testName];
  unint64_t v10 = 2 * [(CRNStandardScrollTestParameters *)self iterations];
  [(CRNStandardScrollTestParameters *)self scrollingBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  BOOL v19 = [(CRNStandardScrollTestParameters *)self preventDismissalGestures];
  int64_t v20 = [(CRNStandardScrollTestParameters *)self direction];
  [(CRNStandardScrollTestParameters *)self iterationDuration];
  double v22 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v8, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v9, v10, 0, v19, v20, 0, v12, v14, v16, v18, v6 / 10.0, 15.0, v21 * 0.25);
  v100[0] = v22;
  double v23 = [CRNOscillationScrollTestParameters alloc];
  double v24 = [(CRNStandardScrollTestParameters *)self testName];
  unint64_t v25 = [(CRNStandardScrollTestParameters *)self iterations];
  [(CRNStandardScrollTestParameters *)self scrollingBounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  BOOL v34 = [(CRNStandardScrollTestParameters *)self preventDismissalGestures];
  int64_t v35 = [(CRNStandardScrollTestParameters *)self direction];
  [(CRNStandardScrollTestParameters *)self iterationDuration];
  double v37 = -[CRNOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v23, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v24, v25, 0, v34, v35, 1, v27, v29, v31, v33, v6, 0.0, v36);
  v100[1] = v37;
  unint64_t v38 = 0x263EFF000uLL;
  double v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:2];

  [(CRNStandardScrollTestParameters *)self amplitude];
  double v41 = floor(v40 / v6);
  if (v41 <= 1.0)
  {
    v76 = v39;
  }
  else
  {
    double v42 = 1.0;
    do
    {
      id v43 = objc_alloc(*(Class *)(v7 + 248));
      v96 = [(CRNStandardScrollTestParameters *)self testName];
      unint64_t v44 = 2 * [(CRNStandardScrollTestParameters *)self iterations];
      [(CRNStandardScrollTestParameters *)self scrollingBounds];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      BOOL v53 = [(CRNStandardScrollTestParameters *)self preventDismissalGestures];
      int64_t v54 = [(CRNStandardScrollTestParameters *)self direction];
      [(CRNStandardScrollTestParameters *)self iterationDuration];
      v56 = objc_msgSend(v43, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v96, v44, 0, v53, v54, 0, v46, v48, v50, v52, v6 / 10.0, 15.0, v55 * 0.25);
      v99[0] = v56;
      id v57 = objc_alloc(*(Class *)(v7 + 248));
      v58 = [(CRNStandardScrollTestParameters *)self testName];
      unint64_t v59 = [(CRNStandardScrollTestParameters *)self iterations];
      [(CRNStandardScrollTestParameters *)self scrollingBounds];
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      BOOL v68 = [(CRNStandardScrollTestParameters *)self preventDismissalGestures];
      unint64_t v69 = v7;
      unint64_t v70 = v38;
      int64_t v71 = [(CRNStandardScrollTestParameters *)self direction];
      [(CRNStandardScrollTestParameters *)self iterationDuration];
      int64_t v72 = v71;
      unint64_t v38 = v70;
      unint64_t v7 = v69;
      v74 = objc_msgSend(v57, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v58, v59, 0, v68, v72, 1, v61, v63, v65, v67, v6, 0.0, v73);
      v99[1] = v74;
      v75 = [*(id *)(v38 + 2240) arrayWithObjects:v99 count:2];
      v76 = [v39 arrayByAddingObjectsFromArray:v75];

      double v42 = v42 + 1.0;
      double v39 = v76;
    }
    while (v42 < v41);
  }
  if ([(CRNStandardScrollTestParameters *)self shouldFlick])
  {
    id v77 = objc_alloc(*(Class *)(v7 + 248));
    v78 = [(CRNStandardScrollTestParameters *)self testName];
    unint64_t v79 = [(CRNStandardScrollTestParameters *)self iterations];
    [(CRNStandardScrollTestParameters *)self scrollingBounds];
    double v81 = v80;
    double v83 = v82;
    double v85 = v84;
    double v87 = v86;
    BOOL v88 = [(CRNStandardScrollTestParameters *)self preventDismissalGestures];
    uint64_t v89 = CRNOppositeDirectionFrom([(CRNStandardScrollTestParameters *)self direction]);
    [(CRNStandardScrollTestParameters *)self iterationDuration];
    v91 = objc_msgSend(v77, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v78, v79, 1, v88, v89, 1, v81, v83, v85, v87, v6, 0.0, v90 * 1.5);
    v98 = v91;
    v92 = [*(id *)(v38 + 2240) arrayWithObjects:&v98 count:1];
    uint64_t v93 = [v76 arrayByAddingObjectsFromArray:v92];

    v76 = (void *)v93;
  }
  [(CRNGroupScrollTestParameters *)self setParameters:v76];
  v97.receiver = self;
  v97.super_class = (Class)CRNStandardScrollTestParameters;
  v94 = [(CRNGroupScrollTestParameters *)&v97 composerBlock];

  return v94;
}

- (void)setTestName:(id)a3
{
}

- (CGRect)scrollingBounds
{
  double x = self->_scrollingBounds.origin.x;
  double y = self->_scrollingBounds.origin.y;
  double width = self->_scrollingBounds.size.width;
  double height = self->_scrollingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end