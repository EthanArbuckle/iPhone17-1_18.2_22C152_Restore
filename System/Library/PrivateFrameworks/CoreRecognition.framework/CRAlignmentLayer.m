@interface CRAlignmentLayer
+ (id)layer;
- (CALayer)infoLayer;
- (CAShapeLayer)maskLayer;
- (CAShapeLayer)outlineLayer;
- (CATextLayer)cardholderNameLayer;
- (CATextLayer)expirationDateLayer;
- (CATextLayer)instructionLayer;
- (CGPoint)cardNumberHorizontalDefaultPos;
- (CGPoint)pointOnInfoLayerForPointOnCard:(CGPoint)a3;
- (CGRect)alignmentRect;
- (CGRect)cardNumberHorizontalDefaultBounds;
- (CRAlignmentLayer)init;
- (NSMutableArray)cardNumberLayers;
- (void)animateFoundCardRect:(id)a3;
- (void)animateFoundCodeParts:(id)a3 codePartPositions:(id)a4 codeFrameIndex:(unint64_t)a5 cardHolder:(id)a6 cardholderPosition:(CGPoint)a7 cardholderFrameIndex:(unint64_t)a8 expDate:(id)a9 expdatePosition:(CGPoint)a10 expDateFrameIndex:(unint64_t)a11 completionBlock:(id)a12;
- (void)layoutSublayers;
- (void)makeTextLayer:(id)a3 matchWidthOfText:(id)a4;
- (void)propogateMaskColor:(id)a3 outlineColor:(id)a4 placementTextColor:(id)a5 capturedTextColor:(id)a6;
- (void)resetLayer;
- (void)setCardNumberHorizontalDefaultBounds:(CGRect)a3;
- (void)setCardNumberHorizontalDefaultPos:(CGPoint)a3;
- (void)setCardNumberLayers:(id)a3;
- (void)setCardholderNameLayer:(id)a3;
- (void)setExpirationDateLayer:(id)a3;
- (void)setInfoLayer:(id)a3;
- (void)setInstructionLayer:(id)a3;
- (void)setMaskLayer:(id)a3;
- (void)setOutlineLayer:(id)a3;
@end

@implementation CRAlignmentLayer

+ (id)layer
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (CRAlignmentLayer)init
{
  v94[2] = *MEMORY[0x263EF8340];
  v92.receiver = self;
  v92.super_class = (Class)CRAlignmentLayer;
  id v2 = [(CRAlignmentLayer *)&v92 init];
  v3 = v2;
  if (v2)
  {
    -[CRAlignmentLayer setBounds:](v2, "setBounds:", 0.0, 0.0, 85.6, 54.0);
    -[CRAlignmentLayer setFrame:](v3, "setFrame:", 0.0, 0.0, 85.6, 54.0);
    [(CRAlignmentLayer *)v3 setHidden:0];
    v4 = [MEMORY[0x263F15880] layer];
    [(CRAlignmentLayer *)v3 setMaskLayer:v4];

    v5 = [(CRAlignmentLayer *)v3 maskLayer];
    LODWORD(v6) = 1050253722;
    [v5 setOpacity:v6];

    id v7 = +[CRColor blackColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [(CRAlignmentLayer *)v3 maskLayer];
    [v9 setFillColor:v8];

    v10 = [(CRAlignmentLayer *)v3 maskLayer];
    [v10 setFillRule:@"even-odd"];

    v11 = [(CRAlignmentLayer *)v3 maskLayer];
    [(CRAlignmentLayer *)v3 addSublayer:v11];

    v12 = [MEMORY[0x263F15880] layer];
    [(CRAlignmentLayer *)v3 setOutlineLayer:v12];

    id v13 = +[CRColor clearColor];
    uint64_t v14 = [v13 CGColor];
    v15 = [(CRAlignmentLayer *)v3 outlineLayer];
    [v15 setFillColor:v14];

    id v16 = +[CRColor whiteColor];
    uint64_t v17 = [v16 CGColor];
    v18 = [(CRAlignmentLayer *)v3 outlineLayer];
    [v18 setStrokeColor:v17];

    v19 = [(CRAlignmentLayer *)v3 outlineLayer];
    [v19 setLineWidth:1.0];

    v20 = [(CRAlignmentLayer *)v3 outlineLayer];
    [(CRAlignmentLayer *)v3 addSublayer:v20];

    v21 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C658] labelFontSize];
    v22 = objc_msgSend(v21, "systemFontOfSize:");
    v23 = [MEMORY[0x263F1C920] mainScreen];
    [v23 scale];
    double v25 = v24;

    uint64_t v26 = *MEMORY[0x263F1C238];
    v94[0] = v22;
    uint64_t v27 = *MEMORY[0x263F1C240];
    v93[0] = v26;
    v93[1] = v27;
    v28 = +[CRColor whiteColor];
    v94[1] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];

    id v30 = objc_alloc(MEMORY[0x263F089B8]);
    v31 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
    v32 = [v31 localizedStringForKey:@"Position Card in this Frame" value:&stru_26C7BF850 table:0];
    v33 = (void *)[v30 initWithString:v32 attributes:v29];

    v34 = [MEMORY[0x263F158E8] layer];
    [(CRAlignmentLayer *)v3 setInstructionLayer:v34];

    v35 = [(CRAlignmentLayer *)v3 instructionLayer];
    [v35 setWrapped:1];

    v36 = [(CRAlignmentLayer *)v3 instructionLayer];
    [v36 setAlignmentMode:@"center"];

    v37 = [(CRAlignmentLayer *)v3 instructionLayer];
    [v37 setString:v33];

    v38 = [(CRAlignmentLayer *)v3 instructionLayer];
    [v38 setContentsScale:v25];

    v39 = [(CRAlignmentLayer *)v3 instructionLayer];
    [(CRAlignmentLayer *)v3 addSublayer:v39];

    v40 = [MEMORY[0x263F157E8] layer];
    [(CRAlignmentLayer *)v3 setInfoLayer:v40];

    v41 = [(CRAlignmentLayer *)v3 infoLayer];
    objc_msgSend(v41, "setBounds:", 0.0, 0.0, 85.6, 54.0);

    v42 = [(CRAlignmentLayer *)v3 infoLayer];
    [v42 setOpacity:0.0];

    v43 = [(CRAlignmentLayer *)v3 infoLayer];
    [(CRAlignmentLayer *)v3 addSublayer:v43];

    v44 = [(CRAlignmentLayer *)v3 infoLayer];
    [v44 bounds];
    double MidX = CGRectGetMidX(v95);
    v46 = [(CRAlignmentLayer *)v3 infoLayer];
    [v46 bounds];
    -[CRAlignmentLayer setCardNumberHorizontalDefaultPos:](v3, "setCardNumberHorizontalDefaultPos:", MidX, CGRectGetMidY(v96) + 6.0);

    double v47 = v25 * 4.0;
    double v48 = v25 * 4.0 * 85.6;
    -[CRAlignmentLayer setCardNumberHorizontalDefaultBounds:](v3, "setCardNumberHorizontalDefaultBounds:", 0.0, 0.0, v48, ceil(v47 * 6.0));
    v49 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    [(CRAlignmentLayer *)v3 setCardNumberLayers:v49];

    int v50 = 4;
    double v51 = 1.0 / v47;
    do
    {
      v52 = [MEMORY[0x263F158E8] layer];
      [(CRAlignmentLayer *)v3 cardNumberHorizontalDefaultBounds];
      objc_msgSend(v52, "setBounds:");
      [(CRAlignmentLayer *)v3 cardNumberHorizontalDefaultPos];
      objc_msgSend(v52, "setPosition:");
      CATransform3DMakeScale(&v91, 1.0 / v47, 1.0 / v47, 1.0);
      CATransform3D v90 = v91;
      [v52 setTransform:&v90];
      [v52 setFont:@"Spendcardium-Regular"];
      [v52 setFontSize:v47 * 6.0];
      v53 = [(CRAlignmentLayer *)v3 infoLayer];
      [v53 addSublayer:v52];

      v54 = [(CRAlignmentLayer *)v3 cardNumberLayers];
      [v54 addObject:v52];

      --v50;
    }
    while (v50);
    v55 = [MEMORY[0x263F158E8] layer];
    [(CRAlignmentLayer *)v3 setCardholderNameLayer:v55];

    v56 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    double v57 = v47 * 4.25;
    double v58 = ceil(v47 * 4.25);
    objc_msgSend(v56, "setBounds:", 0.0, 0.0, v48, v58);

    CATransform3DMakeScale(&v89, v51, v51, 1.0);
    v59 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    CATransform3D v88 = v89;
    [v59 setTransform:&v88];

    v60 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    [v60 setFont:@"Menlo-Bold"];

    v61 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    [v61 setFontSize:v57];

    v62 = [(CRAlignmentLayer *)v3 infoLayer];
    [v62 bounds];
    double MinX = CGRectGetMinX(v97);
    v64 = [(CRAlignmentLayer *)v3 infoLayer];
    [v64 bounds];
    double MaxY = CGRectGetMaxY(v98);
    v66 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    objc_msgSend(v66, "setPosition:", MinX + 8.56, MaxY + -2.7);

    v67 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    [v67 setAlignmentMode:@"left"];

    v68 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    objc_msgSend(v68, "setAnchorPoint:", 0.0, 1.0);

    v69 = [(CRAlignmentLayer *)v3 infoLayer];
    v70 = [(CRAlignmentLayer *)v3 cardholderNameLayer];
    [v69 addSublayer:v70];

    v71 = [MEMORY[0x263F158E8] layer];
    [(CRAlignmentLayer *)v3 setExpirationDateLayer:v71];

    v72 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    objc_msgSend(v72, "setBounds:", 0.0, 0.0, v48, v58);

    v73 = [(CRAlignmentLayer *)v3 infoLayer];
    [v73 bounds];
    double v74 = CGRectGetMidX(v99);
    v75 = [(CRAlignmentLayer *)v3 infoLayer];
    [v75 bounds];
    double v76 = CGRectGetMaxY(v100);
    v77 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    objc_msgSend(v77, "setPosition:", v74 + 8.56, v76 + -10.8);

    CATransform3DMakeScale(&v87, v51, v51, 1.0);
    v78 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    CATransform3D v86 = v87;
    [v78 setTransform:&v86];

    v79 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    [v79 setFont:@"Menlo-Bold"];

    v80 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    [v80 setFontSize:v57];

    v81 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    [v81 setAlignmentMode:@"left"];

    v82 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    objc_msgSend(v82, "setAnchorPoint:", 0.0, 1.0);

    v83 = [(CRAlignmentLayer *)v3 infoLayer];
    v84 = [(CRAlignmentLayer *)v3 expirationDateLayer];
    [v83 addSublayer:v84];
  }
  return v3;
}

- (void)layoutSublayers
{
  [(CRAlignmentLayer *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  double v8 = v7;
  double height = v9;
  v11 = [(CRAlignmentLayer *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = [(CRAlignmentLayer *)self delegate];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      double v15 = 0.0;
      double v16 = 0.0;
      do
      {
        uint64_t v17 = [v14 topLayoutGuide];
        [v17 length];
        double v19 = v18;

        v20 = [v14 bottomLayoutGuide];
        [v20 length];
        double v22 = v21;

        uint64_t v23 = [v14 parentViewController];
        double v15 = fmax(v15, v19);
        double v16 = fmax(v16, v22);

        uint64_t v14 = (void *)v23;
      }
      while (v23);
    }
    else
    {
      double v16 = 0.0;
      double v15 = 0.0;
    }
    [(CRAlignmentLayer *)self bounds];
    CGFloat MinX = CGRectGetMinX(v132);
    [(CRAlignmentLayer *)self bounds];
    CGFloat v25 = v15 + CGRectGetMinY(v133);
    [(CRAlignmentLayer *)self bounds];
    CGFloat Width = CGRectGetWidth(v134);
    [(CRAlignmentLayer *)self bounds];
    v136.size.double height = CGRectGetHeight(v135) - v15 - v16;
    v136.origin.CGFloat x = MinX;
    v136.origin.CGFloat y = v25;
    v136.size.width = Width;
    CGRect v137 = CGRectInset(v136, 16.0, 16.0);
    CGFloat x = v137.origin.x;
    CGFloat y = v137.origin.y;
    double v8 = v137.size.width;
    double height = v137.size.height;
  }
  uint64_t v27 = [(CRAlignmentLayer *)self instructionLayer];
  uint64_t v28 = [v27 string];
  objc_msgSend((id)v28, "boundingRectWithSize:options:context:", 3, 0, v8, height);
  CGFloat rect = v29;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  v36 = [(CRAlignmentLayer *)self instructionLayer];
  LOBYTE(v28) = [v36 isHidden];

  if ((v28 & 1) == 0)
  {
    v138.origin.CGFloat x = v31;
    v138.origin.CGFloat y = v33;
    v138.size.width = v35;
    v138.size.double height = rect;
    double height = height - (CGRectGetHeight(v138) + 8.0);
  }
  v37 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v38 = [v37 userInterfaceIdiom];

  CGFloat v125 = v33;
  CGFloat v126 = v31;
  CGFloat v124 = v35;
  if (!v38)
  {
    v59 = deviceModel();
    int v60 = [v59 isEqualToString:@"iPhone13,4"];

    if (v60) {
      double v39 = 0.800000012;
    }
    else {
      double v39 = 1.0;
    }
    goto LABEL_18;
  }
  double v39 = 1.0;
  if (v38 != 1)
  {
LABEL_18:
    v144.origin.CGFloat x = x;
    v144.origin.CGFloat y = y;
    v144.size.width = v8;
    v144.size.double height = height;
    double v55 = v39 * CGRectGetWidth(v144);
    v145.origin.CGFloat x = x;
    v145.origin.CGFloat y = y;
    v145.size.width = v8;
    v145.size.double height = height;
    double v58 = v39 * CGRectGetHeight(v145);
    v146.origin.CGFloat x = x;
    v146.origin.CGFloat y = y;
    v146.size.width = v8;
    v146.size.double height = height;
    double v56 = CGRectGetMidX(v146) - v55 * 0.5;
    v147.origin.CGFloat x = x;
    v147.origin.CGFloat y = y;
    v147.size.width = v8;
    v147.size.double height = height;
    double v57 = CGRectGetMidY(v147) - v58 * 0.5;
    goto LABEL_19;
  }
  v40 = [MEMORY[0x263F1C920] mainScreen];
  [v40 bounds];
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  [(CRAlignmentLayer *)self bounds];
  v165.origin.CGFloat x = v49;
  v165.origin.CGFloat y = v50;
  v165.size.width = v51;
  v165.size.double height = v52;
  v139.origin.CGFloat x = v42;
  v139.origin.CGFloat y = v44;
  v139.size.width = v46;
  v139.size.double height = v48;
  BOOL v53 = CGRectEqualToRect(v139, v165);

  if (!v53)
  {
    double v39 = 0.800000012;
    goto LABEL_18;
  }
  v140.origin.CGFloat x = x;
  v140.origin.CGFloat y = y;
  v140.size.width = v8;
  v140.size.double height = height;
  double v54 = CGRectGetWidth(v140) * 0.600000024;
  v141.origin.CGFloat x = x;
  v141.origin.CGFloat y = y;
  v141.size.width = v8;
  v141.size.double height = height;
  double v55 = fmax(v54, CGRectGetHeight(v141) * 0.600000024);
  v142.origin.CGFloat x = x;
  v142.origin.CGFloat y = y;
  v142.size.width = v8;
  v142.size.double height = height;
  double v56 = CGRectGetMidX(v142) - v55 * 0.5;
  v143.origin.CGFloat x = x;
  v143.origin.CGFloat y = y;
  v143.size.width = v8;
  v143.size.double height = height;
  double v57 = CGRectGetMidY(v143) - v55 * 0.5;
  double v58 = v55;
LABEL_19:
  v148.origin.CGFloat x = v56;
  v148.origin.CGFloat y = v57;
  v148.size.width = v55;
  v148.size.double height = v58;
  double v61 = CGRectGetWidth(v148) / 85.6;
  CGFloat v127 = v57;
  CGFloat v128 = v56;
  v149.origin.CGFloat x = v56;
  v149.origin.CGFloat y = v57;
  v149.size.width = v55;
  v149.size.double height = v58;
  double v62 = fmin(v61, CGRectGetHeight(v149) / 54.0);
  CGFloat v63 = v62 * 85.6;
  CGFloat v64 = v62 * 54.0;
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v62 * 85.6, v62 * 54.0, v62 * 4.0);
  id v65 = objc_claimAutoreleasedReturnValue();
  v66 = CGPathRetain((CGPathRef)[v65 CGPath]);

  v150.origin.CGFloat x = 0.0;
  v150.origin.CGFloat y = 0.0;
  v150.size.width = v63;
  v150.size.double height = v64;
  double MidX = CGRectGetMidX(v150);
  [(CRAlignmentLayer *)self bounds];
  CGFloat v68 = MidX - CGRectGetWidth(v151);
  v152.origin.CGFloat x = 0.0;
  v152.origin.CGFloat y = 0.0;
  v152.size.width = v63;
  v152.size.double height = v64;
  double MidY = CGRectGetMidY(v152);
  [(CRAlignmentLayer *)self bounds];
  CGFloat v70 = MidY - CGRectGetHeight(v153);
  [(CRAlignmentLayer *)self bounds];
  CGFloat v71 = CGRectGetWidth(v154);
  CGFloat v72 = v71 + v71;
  [(CRAlignmentLayer *)self bounds];
  CGFloat v73 = CGRectGetHeight(v155);
  CGFloat v74 = v73 + v73;
  Mutable = CGPathCreateMutable();
  v156.origin.CGFloat x = v68;
  v156.origin.CGFloat y = v70;
  v156.size.width = v72;
  v156.size.double height = v74;
  double v76 = CGPathCreateWithRect(v156, 0);
  CGPathAddPath(Mutable, 0, v76);
  CGPathAddPath(Mutable, 0, v66);
  v77 = [(CRAlignmentLayer *)self outlineLayer];
  objc_msgSend(v77, "setBounds:", 0.0, 0.0, v63, v64);

  v157.origin.CGFloat x = v128;
  v157.origin.CGFloat y = v127;
  v157.size.width = v55;
  v157.size.double height = v58;
  double v78 = CGRectGetMidX(v157);
  v158.origin.CGFloat x = v128;
  v158.origin.CGFloat y = v127;
  v158.size.width = v55;
  v158.size.double height = v58;
  double v79 = CGRectGetMidY(v158);
  v80 = [(CRAlignmentLayer *)self outlineLayer];
  objc_msgSend(v80, "setPosition:", v78, v79);

  v81 = [(CRAlignmentLayer *)self outlineLayer];
  [v81 setPath:v66];

  CGPathRelease(v66);
  v82 = [(CRAlignmentLayer *)self outlineLayer];
  [v82 bounds];
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;
  double v90 = v89;
  CATransform3D v91 = [(CRAlignmentLayer *)self maskLayer];
  objc_msgSend(v91, "setBounds:", v84, v86, v88, v90);

  objc_super v92 = [(CRAlignmentLayer *)self outlineLayer];
  [v92 position];
  double v94 = v93;
  double v96 = v95;
  CGRect v97 = [(CRAlignmentLayer *)self maskLayer];
  objc_msgSend(v97, "setPosition:", v94, v96);

  CGRect v98 = [(CRAlignmentLayer *)self maskLayer];
  [v98 setPath:Mutable];

  CGPathRelease(Mutable);
  CGPathRelease(v76);
  v159.origin.CGFloat x = v128;
  v159.origin.CGFloat y = v127;
  v159.size.width = v55;
  v159.size.double height = v58;
  double v99 = CGRectGetWidth(v159);
  v160.origin.CGFloat y = v125;
  v160.origin.CGFloat x = v126;
  v160.size.width = v124;
  v160.size.double height = rect;
  double v100 = ceil(CGRectGetHeight(v160));
  v101 = [(CRAlignmentLayer *)self instructionLayer];
  objc_msgSend(v101, "setBounds:", 0.0, 0.0, v99, v100);

  v102 = [(CRAlignmentLayer *)self outlineLayer];
  [v102 position];
  double v104 = v103;
  v105 = [(CRAlignmentLayer *)self outlineLayer];
  [v105 position];
  double v107 = v106;
  v108 = [(CRAlignmentLayer *)self outlineLayer];
  [v108 bounds];
  double v109 = CGRectGetHeight(v161);
  v110 = [(CRAlignmentLayer *)self instructionLayer];
  [v110 bounds];
  double v111 = CGRectGetHeight(v162);
  v112 = [(CRAlignmentLayer *)self instructionLayer];
  objc_msgSend(v112, "setPosition:", v104, v107 + v109 * 0.5 + 8.0 + v111 * 0.5);

  v113 = [(CRAlignmentLayer *)self outlineLayer];
  [v113 bounds];
  double v114 = CGRectGetWidth(v163);
  v115 = [(CRAlignmentLayer *)self infoLayer];
  [v115 bounds];
  double v116 = CGRectGetWidth(v164);

  v117 = [(CRAlignmentLayer *)self outlineLayer];
  [v117 position];
  double v119 = v118;
  double v121 = v120;
  v122 = [(CRAlignmentLayer *)self infoLayer];
  objc_msgSend(v122, "setPosition:", v119, v121);

  CATransform3DMakeScale(&v131, v114 / v116, v114 / v116, 1.0);
  v123 = [(CRAlignmentLayer *)self infoLayer];
  CATransform3D v130 = v131;
  [v123 setTransform:&v130];
}

- (void)resetLayer
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = [(CRAlignmentLayer *)self cardNumberLayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v6++) setString:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  double v7 = [(CRAlignmentLayer *)self cardholderNameLayer];
  [v7 setString:0];

  double v8 = [(CRAlignmentLayer *)self expirationDateLayer];
  [v8 setString:0];

  double v9 = [(CRAlignmentLayer *)self instructionLayer];
  LODWORD(v10) = 1.0;
  [v9 setOpacity:v10];

  v11 = [(CRAlignmentLayer *)self infoLayer];
  [v11 setOpacity:0.0];
}

- (CGRect)alignmentRect
{
  double v3 = [(CRAlignmentLayer *)self outlineLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [(CRAlignmentLayer *)self outlineLayer];
  -[CRAlignmentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGPoint)pointOnInfoLayerForPointOnCard:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    double v7 = [(CRAlignmentLayer *)self infoLayer];
    [v7 bounds];
    double v9 = v8;

    double v10 = [(CRAlignmentLayer *)self infoLayer];
    [v10 bounds];
    double MinX = CGRectGetMinX(v19);
    long long v12 = [(CRAlignmentLayer *)self infoLayer];
    [v12 bounds];
    CGFloat MaxY = CGRectGetMaxY(v20);
    float v14 = v9 / 85.6;
    double v15 = v14;
    double x = MinX + x * v15;
    double y = MaxY - y * v15;
  }
  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)makeTextLayer:(id)a3 matchWidthOfText:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  double v6 = (void *)MEMORY[0x263F1C658];
  uint64_t v7 = [v16 font];
  [v16 fontSize];
  double v8 = objc_msgSend(v6, "fontWithName:size:", v7);
  double v9 = [NSDictionary dictionaryWithObject:v8 forKey:*MEMORY[0x263F1C238]];
  [v5 sizeWithAttributes:v9];
  double v11 = v10;

  [v16 bounds];
  double v13 = v12;
  [v16 bounds];
  double v15 = v14;
  [v16 bounds];
  objc_msgSend(v16, "setBounds:", v13, v15, v11);
}

- (void)animateFoundCodeParts:(id)a3 codePartPositions:(id)a4 codeFrameIndex:(unint64_t)a5 cardHolder:(id)a6 cardholderPosition:(CGPoint)a7 cardholderFrameIndex:(unint64_t)a8 expDate:(id)a9 expdatePosition:(CGPoint)a10 expDateFrameIndex:(unint64_t)a11 completionBlock:(id)a12
{
  double y = a10.y;
  double x = a10.x;
  double v16 = a7.y;
  double v17 = a7.x;
  uint64_t v192 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v184 = a4;
  id v182 = a6;
  id v178 = a9;
  id v177 = a12;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:MEMORY[0x263EFFA88] forKey:@"disableActions"];
  if ([v184 count] == 1)
  {
    double v22 = [v184 objectAtIndex:0];
    NSPointFromString(v22);

    double v23 = [(CRAlignmentLayer *)self cardNumberLayers];
    double v24 = [v23 objectAtIndexedSubscript:0];
    [v24 setAlignmentMode:@"center"];

    [(CRAlignmentLayer *)self cardNumberHorizontalDefaultBounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    CGFloat v33 = [(CRAlignmentLayer *)self cardNumberLayers];
    double v34 = [v33 objectAtIndexedSubscript:0];
    objc_msgSend(v34, "setBounds:", v26, v28, v30, v32);

    CGFloat v35 = [(CRAlignmentLayer *)self cardNumberLayers];
    v36 = [v35 objectAtIndexedSubscript:0];
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 0.5);

    [(CRAlignmentLayer *)self cardNumberHorizontalDefaultPos];
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:");
    double v38 = v37;
    double v40 = v39;
    double v41 = [(CRAlignmentLayer *)self cardNumberLayers];
    CGFloat v42 = [v41 objectAtIndexedSubscript:0];
    objc_msgSend(v42, "setPosition:", v38, v40);
  }
  else
  {
    double v43 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v184, "count"));
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v12 = v184;
    uint64_t v44 = [v12 countByEnumeratingWithState:&v187 objects:v191 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v188;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v188 != v45) {
            objc_enumerationMutation(v12);
          }
          NSPoint v48 = NSPointFromString((NSString *)*(void *)(*((void *)&v187 + 1) + 8 * i));
          HIDWORD(v47) = HIDWORD(v48.x);
          *(float *)&double v47 = v48.x;
          CGFloat v49 = objc_msgSend(NSNumber, "numberWithFloat:", v47, v48.y);
          [v43 addObject:v49];
        }
        uint64_t v44 = [v12 countByEnumeratingWithState:&v187 objects:v191 count:16];
      }
      while (v44);
    }

    [v43 sortUsingComparator:&__block_literal_global_0];
    CGFloat v50 = objc_msgSend(v43, "objectAtIndex:", (unint64_t)objc_msgSend(v43, "count") >> 1);
    [v50 floatValue];
    float v52 = v51;

    unint64_t v53 = 0;
    double v54 = v52;
    while (1)
    {
      unint64_t v55 = [v12 count];
      if (v53 > 3 || v53 >= v55) {
        break;
      }
      double v56 = [v12 objectAtIndex:v53];
      double v57 = NSPointFromString(v56).y;

      double v58 = [(CRAlignmentLayer *)self cardNumberLayers];
      v59 = [v58 objectAtIndexedSubscript:v53];
      [v59 setAlignmentMode:@"left"];

      int v60 = [(CRAlignmentLayer *)self cardNumberLayers];
      double v61 = [v60 objectAtIndexedSubscript:v53];
      objc_msgSend(v61, "setAnchorPoint:", 0.0, 1.0);

      -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", v54, v57);
      double v63 = v62;
      double v65 = v64;
      v66 = [(CRAlignmentLayer *)self cardNumberLayers];
      v67 = [v66 objectAtIndexedSubscript:v53];
      objc_msgSend(v67, "setPosition:", v63, v65);

      ++v53;
    }
  }
  CGFloat v68 = (double *)MEMORY[0x263F00148];
  double v69 = *MEMORY[0x263F00148];
  double v70 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v17 != *MEMORY[0x263F00148] || v16 != v70)
  {
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", v17, v16);
    double v73 = v72;
    double v75 = v74;
    double v76 = [(CRAlignmentLayer *)self cardholderNameLayer];
    objc_msgSend(v76, "setPosition:", v73, v75);

    double v69 = *v68;
    double v70 = v68[1];
  }
  if (x != v69 || y != v70)
  {
    -[CRAlignmentLayer pointOnInfoLayerForPointOnCard:](self, "pointOnInfoLayerForPointOnCard:", x, y);
    double v79 = v78;
    double v81 = v80;
    v82 = [(CRAlignmentLayer *)self expirationDateLayer];
    objc_msgSend(v82, "setPosition:", v79, v81);
  }
  double v83 = [(CRAlignmentLayer *)self infoLayer];
  [v83 bounds];
  double v85 = v84;
  double v86 = [(CRAlignmentLayer *)self infoLayer];
  [v86 bounds];
  double v88 = v87;

  if ((unint64_t)[v184 count] >= 2)
  {
    double v89 = [(CRAlignmentLayer *)self cardNumberLayers];
    double v90 = objc_msgSend(v89, "subarrayWithRange:", 0, objc_msgSend(v184, "count"));
    CATransform3D v91 = (void *)[v90 mutableCopy];

    [v91 sortUsingComparator:&__block_literal_global_53];
    for (unint64_t j = 1; j < [v91 count]; unint64_t j = v94 + 2)
    {
      double v93 = [v91 objectAtIndex:j];
      unint64_t v94 = j - 1;
      double v95 = [v91 objectAtIndex:j - 1];
      [v95 frame];
      double v97 = v96;
      [v95 frame];
      double v99 = v98;
      [v93 frame];
      double v101 = v97 + v99 - v100;
      if (v101 > 0.0)
      {
        [v93 frame];
        double v103 = v102;
        [v93 frame];
        double v105 = v104;
        [v93 frame];
        double v107 = v106;
        [v93 frame];
        objc_msgSend(v93, "setFrame:", v103, v101 + v105, v107);
      }
    }
  }
  id v108 = objc_alloc(MEMORY[0x263F158E8]);
  double v109 = [(CRAlignmentLayer *)self cardNumberLayers];
  v110 = [v109 objectAtIndex:0];
  v186 = (void *)[v108 initWithLayer:v110];

  double v111 = [(CRAlignmentLayer *)self infoLayer];
  [v111 addSublayer:v186];

  v112 = [(CRAlignmentLayer *)self cardNumberLayers];
  v113 = [v112 objectAtIndex:0];
  [v113 frame];
  double v115 = v114;
  double v117 = v116;
  double width = v118;
  double height = v120;

  unint64_t v122 = a11;
  double v123 = v88 + -1.0;
  for (unint64_t k = 1; k < [v21 count]; ++k)
  {
    CGFloat v125 = [(CRAlignmentLayer *)self cardNumberLayers];
    BOOL v126 = k < [v125 count];

    if (!v126) {
      break;
    }
    CGFloat v127 = [(CRAlignmentLayer *)self cardNumberLayers];
    CGFloat v128 = [v127 objectAtIndex:k];
    [v128 frame];
    v196.origin.double x = v129;
    v196.origin.double y = v130;
    v196.size.double width = v131;
    v196.size.double height = v132;
    v193.origin.double x = v115;
    v193.origin.double y = v117;
    v193.size.double width = width;
    v193.size.double height = height;
    CGRect v194 = CGRectUnion(v193, v196);
    double v115 = v194.origin.x;
    double v117 = v194.origin.y;
    double width = v194.size.width;
    double height = v194.size.height;
  }
  objc_msgSend(v186, "setFrame:", v115, v117, width, height);
  v183 = [MEMORY[0x263EFF980] arrayWithObject:v186];
  CGRect v133 = (void *)MEMORY[0x263EFF980];
  CGRect v134 = [NSNumber numberWithUnsignedInteger:a5];
  v179 = [v133 arrayWithObject:v134];

  if (a8 != -1)
  {
    CGRect v135 = [(CRAlignmentLayer *)self cardholderNameLayer];
    [v183 addObject:v135];

    CGRect v136 = [NSNumber numberWithUnsignedInteger:a8];
    [v179 addObject:v136];
  }
  if (a11 != -1)
  {
    CGRect v137 = [(CRAlignmentLayer *)self expirationDateLayer];
    [v183 addObject:v137];

    CGRect v138 = [NSNumber numberWithUnsignedInteger:a11];
    [v179 addObject:v138];
  }
  for (unint64_t m = 0; m < [v21 count]; ++m)
  {
    CGRect v140 = [(CRAlignmentLayer *)self cardNumberLayers];
    unint64_t v122 = m < [v140 count];

    if ((v122 & 1) == 0) {
      break;
    }
    CGRect v141 = [(CRAlignmentLayer *)self cardNumberLayers];
    unint64_t v122 = [v141 objectAtIndexedSubscript:m];
    CGRect v142 = [v21 objectAtIndex:m];
    [(CRAlignmentLayer *)self makeTextLayer:v122 matchWidthOfText:v142];
  }
  CGRect v143 = [(CRAlignmentLayer *)self cardholderNameLayer];
  [(CRAlignmentLayer *)self makeTextLayer:v143 matchWidthOfText:v182];

  v181 = [v178 stringByReplacingOccurrencesOfString:@"0" withString:@"O"];
  CGRect v144 = [(CRAlignmentLayer *)self expirationDateLayer];
  [(CRAlignmentLayer *)self makeTextLayer:v144 matchWidthOfText:v181];

  sortOverlappingCALayers(v183, v179, 0.0, 1.0, v85, v123);
  keepAllLayersWithinHorizontalBounds(v183, 0.0, 1.0, v85);
  [v186 frame];
  double v146 = v145;
  [v186 frame];
  unint64_t v147 = 0;
  double v148 = v146 - v115;
  double v150 = v149 - v117;
  while (v147 < [v21 count])
  {
    CGRect v151 = [(CRAlignmentLayer *)self cardNumberLayers];
    unint64_t v122 = v147 < [v151 count];

    if ((v122 & 1) == 0) {
      break;
    }
    unint64_t v122 = [(CRAlignmentLayer *)self cardNumberLayers];
    CGRect v152 = [(id)v122 objectAtIndexedSubscript:v147];

    [v152 position];
    double v154 = v153;
    [v152 position];
    objc_msgSend(v152, "setPosition:", v148 + v154, v150 + v155);

    ++v147;
  }
  [v186 removeFromSuperlayer];
  [MEMORY[0x263F158F8] setValue:MEMORY[0x263EFFA80] forKey:@"disableActions"];
  for (unint64_t n = 0; n < [v21 count]; ++n)
  {
    CGRect v157 = [(CRAlignmentLayer *)self cardNumberLayers];
    BOOL v158 = n < [v157 count];

    if (!v158) {
      break;
    }
    CGRect v159 = [v21 objectAtIndexedSubscript:n];
    if (v159)
    {
      CGRect v160 = NSString;
      unint64_t v122 = [v21 objectAtIndexedSubscript:n];
      id v12 = (id)[v160 _newZStringWithString:v122];
      id v161 = v12;
    }
    else
    {
      id v161 = 0;
    }
    CGRect v162 = [(CRAlignmentLayer *)self cardNumberLayers];
    CGRect v163 = [v162 objectAtIndexedSubscript:n];
    [v163 setString:v161];

    if (v159)
    {
    }
  }
  if (v182) {
    CGRect v164 = objc_msgSend(NSString, "_newZStringWithString:");
  }
  else {
    CGRect v164 = 0;
  }
  CGRect v165 = [(CRAlignmentLayer *)self cardholderNameLayer];
  [v165 setString:v164];

  if (v182) {
  if (v181)
  }
    v166 = objc_msgSend(NSString, "_newZStringWithString:");
  else {
    v166 = 0;
  }
  v167 = [(CRAlignmentLayer *)self expirationDateLayer];
  [v167 setString:v166];

  if (v181) {
  [MEMORY[0x263F158F8] commit];
  }
  v168 = [(CRAlignmentLayer *)self instructionLayer];
  [v168 setOpacity:0.0];

  [MEMORY[0x263F158F8] begin];
  v169 = (void *)MEMORY[0x263F158F8];
  LODWORD(v170) = 0.5;
  v171 = [NSNumber numberWithFloat:v170];
  [v169 setValue:v171 forKey:@"animationDuration"];

  v172 = [(CRAlignmentLayer *)self maskLayer];
  BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v172 path]);
  v173 = CGPathCreateWithRect(BoundingBox, 0);

  v174 = [(CRAlignmentLayer *)self maskLayer];
  [v174 setPath:v173];

  CGPathRelease(v173);
  v175 = [(CRAlignmentLayer *)self infoLayer];
  LODWORD(v176) = 1.0;
  [v175 setOpacity:v176];

  [MEMORY[0x263F158F8] setCompletionBlock:v177];
  [MEMORY[0x263F158F8] commit];
}

uint64_t __184__CRAlignmentLayer_animateFoundCodeParts_codePartPositions_codeFrameIndex_cardHolder_cardholderPosition_cardholderFrameIndex_expDate_expdatePosition_expDateFrameIndex_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __184__CRAlignmentLayer_animateFoundCodeParts_codePartPositions_codeFrameIndex_cardHolder_cardholderPosition_cardholderFrameIndex_expDate_expdatePosition_expDateFrameIndex_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 position];
  double v7 = v6;
  [v5 position];
  if (v7 >= v8)
  {
    [v4 position];
    double v11 = v10;
    [v5 position];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)animateFoundCardRect:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v60 = a3;
  if (v60)
  {
    uint64_t v4 = 0;
    id v5 = &v62;
    do
    {
      double v6 = [v60 objectAtIndex:v4];
      [v6 CGPointValue];
      *((void *)v5 - 1) = v7;
      *(void *)id v5 = v8;

      ++v4;
      v5 += 2;
    }
    while (v4 != 4);
    double v9 = v61;
    double v10 = v62;
    double v12 = v63;
    double v11 = v64;
    double v13 = v65;
    double v14 = v66;
    double v15 = v67;
    double v16 = v68;
    if ((sqrt((v61 - v63) * (v61 - v63) + (v62 - v64) * (v62 - v64))
        + sqrt((v65 - v67) * (v65 - v67) + (v66 - v68) * (v66 - v68)))
       * 0.5 <= (sqrt((v63 - v65) * (v63 - v65) + (v64 - v66) * (v64 - v66))
               + sqrt((v67 - v61) * (v67 - v61) + (v68 - v62) * (v68 - v62)))
              * 0.5)
    {
      double v17 = v65 + v67;
      double v18 = v66 + v68;
      double v19 = v63;
      double v20 = v64;
    }
    else
    {
      double v17 = v63 + v65;
      double v18 = v64 + v66;
      double v19 = v67;
      double v20 = v68;
    }
    double v21 = (v62 + v20) * 0.5;
    double v22 = (v61 + v19) * 0.5;
    double v23 = v18 * 0.5;
    double v24 = v17 * 0.5;
    if (v24 == v22) {
      double v25 = dbl_2177A1920[v23 > v21];
    }
    else {
      double v25 = atan((v23 - v21) / (v24 - v22));
    }
    double v26 = [(CRAlignmentLayer *)self outlineLayer];
    double v52 = v13;
    double v53 = v12;
    double v54 = v11;
    double v56 = v10;
    double v58 = v9;
    [v26 bounds];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    CGFloat v35 = [(CRAlignmentLayer *)self outlineLayer];
    -[CRAlignmentLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", v35, v28, v30, v32, v34);
    CGRect v75 = CGRectInset(v74, -16.0, -16.0);
    CGFloat x = v75.origin.x;
    CGFloat y = v75.origin.y;
    double width = v75.size.width;
    double height = v75.size.height;

    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.double width = width;
    v76.size.double height = height;
    v71.CGFloat x = (v58 + v53 + v52 + v15) * 0.25;
    v71.CGFloat y = (v56 + v54 + v14 + v16) * 0.25;
    BOOL v40 = CGRectContainsPoint(v76, v71);
    v77.origin.CGFloat x = x;
    v77.origin.CGFloat y = y;
    v77.size.double width = width;
    v77.size.double height = height;
    CGRect v78 = CGRectInset(v77, width * 0.2, height * 0.2);
    CGFloat v57 = v78.origin.y;
    CGFloat v59 = v78.origin.x;
    CGFloat v41 = v78.size.width;
    CGFloat v42 = v78.size.height;
    uint64_t v43 = 0;
    double v55 = v51 * 180.0 / 3.14159265;
    do
    {
      CGFloat v44 = *(double *)((char *)&v61 + v43);
      CGFloat v45 = *(double *)((char *)&v61 + v43 + 8);
      v79.origin.CGFloat x = x;
      v79.origin.CGFloat y = y;
      v79.size.double width = width;
      v79.size.double height = height;
      v72.CGFloat x = v44;
      v72.CGFloat y = v45;
      if (!CGRectContainsPoint(v79, v72)
        || (v80.origin.CGFloat y = v57,
            v80.origin.CGFloat x = v59,
            v80.size.double width = v41,
            v80.size.double height = v42,
            v73.CGFloat x = v44,
            v73.CGFloat y = v45,
            CGRectContainsPoint(v80, v73)))
      {
        BOOL v40 = 0;
      }
      v43 += 16;
    }
    while (v43 != 64);
    if (v40 && v55 >= -15.0 && v55 <= 15.0)
    {
      double v47 = [(CRAlignmentLayer *)self instructionLayer];
      [v47 opacity];
      float v49 = v48;

      if (v49 != 0.0)
      {
        CGFloat v50 = [(CRAlignmentLayer *)self instructionLayer];
        [v50 setOpacity:0.0];
      }
    }
  }
}

- (void)propogateMaskColor:(id)a3 outlineColor:(id)a4 placementTextColor:(id)a5 capturedTextColor:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v29 = a5;
  id v12 = a6;
  double v34 = 0.0;
  [v10 getWhite:0 alpha:&v34];
  double v13 = [(CRAlignmentLayer *)self maskLayer];
  HIDWORD(v14) = HIDWORD(v34);
  *(float *)&double v14 = v34;
  [v13 setOpacity:v14];

  double v15 = [(CRAlignmentLayer *)self maskLayer];
  id v16 = [v10 colorWithAlphaComponent:1.0];
  objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

  double v17 = [(CRAlignmentLayer *)self outlineLayer];
  id v18 = [v11 colorWithAlphaComponent:1.0];
  objc_msgSend(v17, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

  double v19 = [(CRAlignmentLayer *)self instructionLayer];
  id v20 = v29;
  objc_msgSend(v19, "setForegroundColor:", objc_msgSend(v20, "CGColor"));

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v21 = [(CRAlignmentLayer *)self cardNumberLayers];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v24++), "setForegroundColor:", objc_msgSend(v12, "CGColor"));
      }
      while (v22 != v24);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }

  double v25 = [(CRAlignmentLayer *)self cardholderNameLayer];
  id v26 = v12;
  objc_msgSend(v25, "setForegroundColor:", objc_msgSend(v26, "CGColor"));

  double v27 = [(CRAlignmentLayer *)self expirationDateLayer];
  id v28 = v26;
  objc_msgSend(v27, "setForegroundColor:", objc_msgSend(v28, "CGColor"));
}

- (CATextLayer)instructionLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstructionLayer:(id)a3
{
}

- (CAShapeLayer)maskLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMaskLayer:(id)a3
{
}

- (CAShapeLayer)outlineLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutlineLayer:(id)a3
{
}

- (CALayer)infoLayer
{
  return (CALayer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInfoLayer:(id)a3
{
}

- (NSMutableArray)cardNumberLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCardNumberLayers:(id)a3
{
}

- (CGPoint)cardNumberHorizontalDefaultPos
{
  double x = self->_cardNumberHorizontalDefaultPos.x;
  double y = self->_cardNumberHorizontalDefaultPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCardNumberHorizontalDefaultPos:(CGPoint)a3
{
  self->_cardNumberHorizontalDefaultPos = a3;
}

- (CGRect)cardNumberHorizontalDefaultBounds
{
  double x = self->_cardNumberHorizontalDefaultBounds.origin.x;
  double y = self->_cardNumberHorizontalDefaultBounds.origin.y;
  double width = self->_cardNumberHorizontalDefaultBounds.size.width;
  double height = self->_cardNumberHorizontalDefaultBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCardNumberHorizontalDefaultBounds:(CGRect)a3
{
  self->_cardNumberHorizontalDefaultBounds = a3;
}

- (CATextLayer)cardholderNameLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCardholderNameLayer:(id)a3
{
}

- (CATextLayer)expirationDateLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpirationDateLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDateLayer, 0);
  objc_storeStrong((id *)&self->_cardholderNameLayer, 0);
  objc_storeStrong((id *)&self->_cardNumberLayers, 0);
  objc_storeStrong((id *)&self->_infoLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_instructionLayer, 0);
}

@end