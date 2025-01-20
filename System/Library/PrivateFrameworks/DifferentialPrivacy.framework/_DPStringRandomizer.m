@interface _DPStringRandomizer
+ (id)numbersRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6;
+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6;
+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7;
- (_DPStringRandomizer)init;
- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7;
- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6;
- (_DPStringRandomizer)randomizer;
- (id)description;
- (unint64_t)algorithm;
@end

@implementation _DPStringRandomizer

- (_DPStringRandomizer)init
{
  return 0;
}

- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7
{
  id v11 = a6;
  v69.receiver = self;
  v69.super_class = (Class)_DPStringRandomizer;
  v12 = [(_DPStringRandomizer *)&v69 init];
  p_isa = (id *)&v12->super.isa;
  if (!v12)
  {
LABEL_82:
    v14 = p_isa;
    goto LABEL_92;
  }
  v14 = 0;
  v12->_algorithm = a4;
  switch(a4)
  {
    case 1uLL:
      v14 = [v11 objectForKeyedSubscript:@"p"];
      if (v14
        || ([v11 objectForKeyedSubscript:@"sequenceP"],
            (v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v16 = +[_DPOBHRandomizer obhRandomizerWithDimensionality:[(_DPStringRandomizer *)v14 unsignedIntegerValue] epsilon:a3];
        if (v16) {
          goto LABEL_45;
        }
        goto LABEL_90;
      }
      goto LABEL_92;
    case 2uLL:
      v14 = [v11 objectForKeyedSubscript:@"m"];
      if (v14
        || ([v11 objectForKeyedSubscript:@"sequenceM"],
            (v14 = (_DPStringRandomizer *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = [v11 objectForKeyedSubscript:@"k"];
        if (!v19)
        {
          v19 = [v11 objectForKeyedSubscript:@"sequenceK"];
          if (!v19) {
            goto LABEL_90;
          }
        }
        if (a5 != 3)
        {
          v66 = _DPCMSRandomizer;
          goto LABEL_78;
        }
        v20 = [v11 objectForKeyedSubscript:@"sequenceFragmentBias"];
        if (!v20) {
          goto LABEL_89;
        }
        v21 = v20;
        [v20 doubleValue];
        double v23 = v22;
        [v21 doubleValue];
        double v25 = v24;
        uint64_t v26 = [v11 objectForKeyedSubscript:@"fragmentM"];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v11 objectForKeyedSubscript:@"fragmentK"];
          if (!v28) {
            goto LABEL_87;
          }
          double v29 = (1.0 - v23) * a3;
          double v30 = v25 * a3;
          v31 = _DPCMSRandomizer;
          goto LABEL_31;
        }
        goto LABEL_88;
      }
      goto LABEL_92;
    case 4uLL:
      v14 = [v11 objectForKeyedSubscript:@"m"];
      if (!v14)
      {
        v14 = [v11 objectForKeyedSubscript:@"sequenceM"];
        if (!v14) {
          goto LABEL_92;
        }
      }
      v19 = [v11 objectForKeyedSubscript:@"k"];
      if (!v19)
      {
        v19 = [v11 objectForKeyedSubscript:@"sequenceK"];
        if (!v19) {
          goto LABEL_90;
        }
      }
      if (a5 != 3)
      {
        v66 = _DPHCMSRandomizer;
LABEL_78:
        uint64_t v38 = -[__objc2_class randomizerWithEpsilon:bitCount:hashFunctionCount:](v66, "randomizerWithEpsilon:bitCount:hashFunctionCount:", -[_DPStringRandomizer unsignedIntegerValue](v14, "unsignedIntegerValue"), [v19 unsignedIntegerValue], a3);
        if (!v38) {
          goto LABEL_89;
        }
LABEL_79:
        id v48 = p_isa[1];
        p_isa[1] = (id)v38;
        goto LABEL_80;
      }
      v32 = [v11 objectForKeyedSubscript:@"sequenceFragmentBias"];
      if (!v32) {
        goto LABEL_89;
      }
      v21 = v32;
      [v32 doubleValue];
      double v34 = v33;
      [v21 doubleValue];
      double v36 = v35;
      uint64_t v37 = [v11 objectForKeyedSubscript:@"fragmentM"];
      if (!v37) {
        goto LABEL_88;
      }
      v27 = (void *)v37;
      v28 = [v11 objectForKeyedSubscript:@"fragmentK"];
      if (!v28)
      {
LABEL_87:

LABEL_88:
        goto LABEL_89;
      }
      double v29 = (1.0 - v34) * a3;
      double v30 = v36 * a3;
      v31 = _DPHCMSRandomizer;
LABEL_31:
      uint64_t v38 = -[__objc2_class randomizerWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:](v31, "randomizerWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", -[_DPStringRandomizer unsignedIntegerValue](v14, "unsignedIntegerValue"), [v19 unsignedIntegerValue], objc_msgSend(v27, "unsignedIntegerValue"), objc_msgSend(v28, "unsignedIntegerValue"), v30, v29);

      if (v38) {
        goto LABEL_79;
      }
LABEL_89:

LABEL_90:
LABEL_91:
      v14 = 0;
LABEL_92:

      return v14;
    case 5uLL:
    case 6uLL:
      v15 = [v11 objectForKeyedSubscript:@"p"];
      v14 = v15;
      if (!v15) {
        goto LABEL_92;
      }
      uint64_t v16 = +[_DPBitValueRandomizer bitValueRandomizerWithDimensionality:[(_DPStringRandomizer *)v15 unsignedIntegerValue] epsilon:a3];
      if (!v16) {
        goto LABEL_90;
      }
      goto LABEL_45;
    case 8uLL:
      v39 = [v11 objectForKeyedSubscript:@"numGroups"];
      v14 = v39;
      if (!v39) {
        goto LABEL_92;
      }
      uint64_t v16 = +[_DPPTValueRandomizer randomizerWithEpsilon:[(_DPStringRandomizer *)v39 unsignedIntValue] numberOfGroups:a3];
      if (!v16) {
        goto LABEL_90;
      }
      goto LABEL_45;
    case 9uLL:
      v17 = _DPPrioValueRandomizer;
      goto LABEL_37;
    case 0xAuLL:
      v14 = [v11 objectForKeyedSubscript:@"m"];
      if (!v14) {
        goto LABEL_92;
      }
      v40 = [v11 objectForKeyedSubscript:@"k"];
      if (!v40) {
        goto LABEL_90;
      }
      v19 = v40;
      uint64_t v41 = +[_DPPrioCountMinSketchValueRandomizer randomizerWithEpsilon:bitCount:hashFunctionCount:](_DPPrioCountMinSketchValueRandomizer, "randomizerWithEpsilon:bitCount:hashFunctionCount:", -[_DPStringRandomizer unsignedIntValue](v14, "unsignedIntValue"), [v40 unsignedIntValue], a3);
      if (!v41) {
        goto LABEL_89;
      }
      goto LABEL_56;
    case 0xBuLL:
      v42 = [v11 objectForKeyedSubscript:@"p"];
      v14 = v42;
      if (!v42) {
        goto LABEL_92;
      }
      uint64_t v16 = +[_DPOHEBitValueRandomizer oheBitValueRandomizerWithDimensionality:[(_DPStringRandomizer *)v42 unsignedIntegerValue] epsilon:a3];
      if (!v16) {
        goto LABEL_90;
      }
LABEL_45:
      id v43 = p_isa[1];
      p_isa[1] = (id)v16;

      goto LABEL_81;
    case 0xCuLL:
      v14 = [v11 objectForKeyedSubscript:@"n"];
      if (!v14) {
        goto LABEL_92;
      }
      uint64_t v44 = [v11 objectForKeyedSubscript:@"delta"];
      if (!v44) {
        goto LABEL_90;
      }
      v19 = (void *)v44;
      v45 = _DPPrioPlusPlusValueRandomizer;
      goto LABEL_52;
    case 0xDuLL:
      v14 = [v11 objectForKeyedSubscript:@"n"];
      if (!v14) {
        goto LABEL_92;
      }
      uint64_t v46 = [v11 objectForKeyedSubscript:@"delta"];
      if (!v46) {
        goto LABEL_90;
      }
      v19 = (void *)v46;
      v45 = _DPPrioPlusPlusMetricsValueRandomizer;
LABEL_52:
      [v19 doubleValue];
      uint64_t v41 = [(__objc2_class *)v45 randomizerWithEpsilon:[(_DPStringRandomizer *)v14 unsignedIntValue] delta:a3 maxLength:v47];
      if (!v41) {
        goto LABEL_89;
      }
LABEL_56:
      id v48 = p_isa[1];
      p_isa[1] = (id)v41;
LABEL_80:

LABEL_81:
      goto LABEL_82;
    case 0xEuLL:
      v14 = [v11 objectForKeyedSubscript:@"p"];
      if (!v14) {
        goto LABEL_92;
      }
      v19 = [v11 objectForKeyedSubscript:@"dynamicVectorSize"];
      uint64_t v41 = +[_DPPrioPlusPlusMetadataValueRandomizer randomizerWithEpsilon:dimensionality:dynamicVectorSize:](_DPPrioPlusPlusMetadataValueRandomizer, "randomizerWithEpsilon:dimensionality:dynamicVectorSize:", -[_DPStringRandomizer unsignedIntValue](v14, "unsignedIntValue"), [v19 BOOLValue], a3);
      if (v41) {
        goto LABEL_56;
      }
      goto LABEL_89;
    case 0xFuLL:
      v49 = [v11 objectForKeyedSubscript:@"p"];
      v50 = [v11 objectForKeyedSubscript:@"prime"];
      v51 = [v11 objectForKeyedSubscript:@"alpha0"];
      uint64_t v52 = [v11 objectForKeyedSubscript:@"alpha1"];
      v53 = (void *)v52;
      if (v49
        && (v50 ? (BOOL v54 = v51 == 0) : (BOOL v54 = 1),
            !v54 ? (BOOL v55 = v52 == 0) : (BOOL v55 = 1),
            !v55 || (!v50 ? (BOOL v56 = v51 == 0) : (BOOL v56 = 0), v56 ? (v57 = v52 == 0) : (v57 = 0), v57)))
      {
        v68 = [v11 objectForKeyedSubscript:@"dynamicVectorSize"];
        uint64_t v59 = [v68 BOOLValue];
        uint64_t v60 = [v49 unsignedIntegerValue];
        uint64_t v61 = [v50 unsignedIntValue];
        [v51 doubleValue];
        double v63 = v62;
        [v53 doubleValue];
        v65 = +[_DPPrioPiRapporValueRandomizer randomizerWithEpsilon:v60 dimensionality:v59 dynamicVectorSize:v61 piRapporPrime:a3 piRapporAlpha0:v63 piRapporAlpha1:v64];
        if (v65)
        {
          objc_storeStrong(p_isa + 1, v65);
          int v58 = 2;
        }
        else
        {
          int v58 = 1;
        }
      }
      else
      {
        int v58 = 1;
      }

      if (v58 == 2) {
        goto LABEL_82;
      }
      goto LABEL_91;
    case 0x10uLL:
    case 0x13uLL:
      v17 = _DPPrio3SumVectorRandomizer;
LABEL_37:
      uint64_t v18 = [(__objc2_class *)v17 randomizerWithEpsilon:v11 parameters:a3];
      if (v18) {
        goto LABEL_38;
      }
      goto LABEL_91;
    case 0x11uLL:
    case 0x12uLL:
      uint64_t v18 = +[_DPPINERandomizer randomizerWithMaxCentralEpsilon:v11 parameters:a3];
      if (!v18) {
        goto LABEL_91;
      }
LABEL_38:
      v14 = (_DPStringRandomizer *)p_isa[1];
      p_isa[1] = (id)v18;
      goto LABEL_81;
    default:
      goto LABEL_92;
  }
}

- (_DPStringRandomizer)initWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6
{
  v16.receiver = self;
  v16.super_class = (Class)_DPStringRandomizer;
  v10 = [(_DPStringRandomizer *)&v16 init];
  id v11 = v10;
  if (v10)
  {
    if (a5 != 1
      || (v10->_algorithm = a4, a4 != 3)
      || (+[_DPNumberRandomizer numberRandomizerWithRange:a6 epsilon:a3], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v14 = 0;
      goto LABEL_8;
    }
    randomizer = v11->_randomizer;
    v11->_randomizer = (_DPStringRandomizer *)v12;
  }
  v14 = v11;
LABEL_8:

  return v14;
}

+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6
{
  return (id)[a1 stringRandomizerWithEpsilon:a4 privatizationAlgorithm:a5 dataAlgorithm:a6 algorithmParameters:0 huffmanTableClass:a3];
}

+ (id)stringRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 algorithmParameters:(id)a6 huffmanTableClass:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  v14 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 privatizationAlgorithm:a5 dataAlgorithm:v13 algorithmParameters:v12 huffmanTableClass:a3];

  return v14;
}

+ (id)numbersRandomizerWithEpsilon:(double)a3 privatizationAlgorithm:(unint64_t)a4 dataAlgorithm:(unint64_t)a5 range:(unint64_t)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 privatizationAlgorithm:a5 dataAlgorithm:a6 range:a3];
  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: { randomizer=%@ }", v5, self->_randomizer];

  return v6;
}

- (_DPStringRandomizer)randomizer
{
  return self->_randomizer;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
}

@end