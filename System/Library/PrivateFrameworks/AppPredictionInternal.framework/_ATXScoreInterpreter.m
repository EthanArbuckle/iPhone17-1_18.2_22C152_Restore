@interface _ATXScoreInterpreter
+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:;
+ (uint64_t)operatorFromFunctionName:(uint64_t)a1;
+ (void)_expectedArity:(uint64_t)a1;
- (NSSet)subscoreNames;
- (_ATXScoreInterpreter)initWithParseRoot:(id)a3;
- (double)_evalVariable:(void *)a3 withCtx:;
- (id)_compileToBytecode:(id *)a1;
- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4;
- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4;
- (id)retainBytecodeDependencyObject:(id *)a1;
- (void)_compileBytecode:(uint64_t)a1;
- (void)_runBytecode:(void *)a3 context:;
- (void)_runOperator:(unint64_t)a3 arity:(void *)a4 context:;
@end

@implementation _ATXScoreInterpreter

- (NSSet)subscoreNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(NSDictionary *)self->_bytecode allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (_ATXScoreInterpreter)initWithParseRoot:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXScoreInterpreter;
  v5 = [(_ATXScoreInterpreter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    bytecodeDependencies = v5->_bytecodeDependencies;
    v5->_bytecodeDependencies = (NSMutableArray *)v6;

    -[_ATXScoreInterpreter _compileBytecode:]((uint64_t)v5, v4);
  }

  return v5;
}

- (void)_compileBytecode:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41___ATXScoreInterpreter__compileBytecode___block_invoke;
    v9[3] = &unk_1E68AD538;
    v9[4] = a1;
    id v6 = v5;
    id v10 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];

    v7 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v6;
    id v8 = v6;
  }
}

+ (uint64_t)operatorFromFunctionName:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [&unk_1F27F3B50 objectForKeyedSubscript:v2];

  if (v3) {
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return v4;
}

+ (void)_expectedArity:(uint64_t)a1
{
  self;
  if ((unint64_t)(a2 + 1) >= 0x14)
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[_ATXScoreInterpreter _expectedArity:]();
    }

    __break(1u);
  }
}

- (void)_runOperator:(unint64_t)a3 arity:(void *)a4 context:
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  v7 = a4;
  id v8 = v7;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        shouldReturnUndefined(v7, a3);
        if (v9) {
          goto LABEL_93;
        }
        for (double i = 0.0; a3; --a3)
        {
          pop(v8);
          double i = i + v11;
        }
        goto LABEL_84;
      case 1:
        shouldReturnUndefined(v7, a3);
        if (v12) {
          goto LABEL_93;
        }
        for (double i = 1.0; a3; --a3)
        {
          pop(v8);
          double i = i * v13;
        }
        goto LABEL_84;
      case 2:
        shouldReturnUndefined(v7, 2uLL);
        if (v14) {
          goto LABEL_93;
        }
        v15 = (double *)&v8[v8[1] - a3];
        double v16 = v15[2];
        double v17 = v15[3];
        drop(v8, a3);
        double v18 = 0.0;
        if (v16 >= v17) {
          double v18 = 1.0;
        }
        goto LABEL_95;
      case 3:
        shouldReturnUndefined(v7, 2uLL);
        if (v19) {
          goto LABEL_93;
        }
        v20 = &v8[v8[1] - a3];
        long double v22 = *((double *)v20 + 2);
        long double v21 = *((double *)v20 + 3);
        drop(v8, a3);
        if (v22 <= 0.0)
        {
          v103 = [MEMORY[0x1E4F28B00] currentHandler];
          v104 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v103 handleFailureInFunction:v104, @"_ATXScoreInterpreter.m", 407, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];
        }
        if (v21 <= 0.0)
        {
          v105 = [MEMORY[0x1E4F28B00] currentHandler];
          v106 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v105 handleFailureInFunction:v106, @"_ATXScoreInterpreter.m", 408, @"Invalid parameter not satisfying: %@", @"base > 0" file lineNumber description];
        }
        if (v22 <= 0.0)
        {
          v23 = __atxlog_handle_default();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:]();
          }
        }
        else
        {
          if (v21 > 0.0) {
            goto LABEL_107;
          }
          v23 = __atxlog_handle_default();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:]();
          }
        }

LABEL_107:
        double v49 = log10(v22);
        double v51 = log10(v21);
LABEL_108:
        double v18 = v49 / v51;
        goto LABEL_95;
      case 4:
        shouldReturnUndefined(v7, 2uLL);
        if (v24) {
          goto LABEL_93;
        }
        v25 = (double *)&v8[v8[1] - a3];
        double v26 = v25[2];
        double v27 = v25[3];
        drop(v8, a3);
        if (v27 != 0.0)
        {
          double v18 = v26 / v27;
          goto LABEL_95;
        }
        v107 = [MEMORY[0x1E4F28B00] currentHandler];
        v108 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
        [v107 handleFailureInFunction:v108, @"_ATXScoreInterpreter.m", 427, @"Invalid parameter not satisfying: %@", @"denominator != 0" file lineNumber description];

        v45 = __atxlog_handle_default();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[_ATXScoreInterpreter _runOperator:arity:context:].cold.4();
        }
        goto LABEL_133;
      case 5:
        shouldReturnUndefined(v7, 1uLL);
        if (v28) {
          goto LABEL_93;
        }
        long double v29 = *(double *)&v8[v8[1] - a3 + 2];
        drop(v8, a3);
        if (v29 <= 0.0)
        {
          v109 = [MEMORY[0x1E4F28B00] currentHandler];
          v110 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v109 handleFailureInFunction:v110, @"_ATXScoreInterpreter.m", 438, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];

          v30 = __atxlog_handle_default();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.5();
          }
        }
        double v18 = log(v29);
        goto LABEL_95;
      case 6:
        shouldReturnUndefined(v7, 2uLL);
        if (v31) {
          goto LABEL_93;
        }
        v32 = &v8[v8[1] - a3];
        long double v33 = *((double *)v32 + 2);
        long double v34 = *((double *)v32 + 3);
        drop(v8, a3);
        if (v33 <= 0.0 && (v33 != 0.0 || v34 <= 0.0) && v34 != (double)(int)v34)
        {
          v125 = [MEMORY[0x1E4F28B00] currentHandler];
          v126 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v125 handleFailureInFunction:v126, @"_ATXScoreInterpreter.m", 450, @"Attempted to compute pow(%f, %f)", *(void *)&v33, *(void *)&v34 file lineNumber description];

          v127 = __atxlog_handle_default();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.6();
          }
        }
        double v18 = pow(v33, v34);
        goto LABEL_95;
      case 8:
        shouldReturnUndefined(v7, 3uLL);
        if (v35) {
          goto LABEL_93;
        }
        v36 = (double *)&v8[v8[1] - a3];
        double v38 = v36[2];
        double v37 = v36[3];
        double v39 = v36[4];
        drop(v8, a3);
        if (v38 < 0.0)
        {
          v111 = [MEMORY[0x1E4F28B00] currentHandler];
          v112 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v111 handleFailureInFunction:v112, @"_ATXScoreInterpreter.m", 465, @"Invalid parameter not satisfying: %@", @"age >= 0" file lineNumber description];
        }
        if (v37 <= 0.0)
        {
          v113 = [MEMORY[0x1E4F28B00] currentHandler];
          v114 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v113 handleFailureInFunction:v114, @"_ATXScoreInterpreter.m", 466, @"Invalid parameter not satisfying: %@", @"halflife > 0" file lineNumber description];
        }
        if (v38 < 0.0)
        {
          v40 = __atxlog_handle_default();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.7();
          }

          goto LABEL_110;
        }
        if (v37 > 0.0)
        {
LABEL_110:
          double v84 = exp(v38 * (-0.693147181 / v37));
          goto LABEL_130;
        }
        v45 = __atxlog_handle_default();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[_ATXScoreInterpreter _runOperator:arity:context:].cold.8();
        }
LABEL_133:

LABEL_94:
        double v18 = -31337.0;
LABEL_95:
        v68 = v8;
LABEL_96:
        push(v68, v18);
        break;
      case 9:
        shouldReturnUndefined(v7, 3uLL);
        if (v41) {
          goto LABEL_93;
        }
        v42 = (double *)&v8[v8[1] - a3];
        long double v43 = v42[2];
        double v39 = v42[3];
        long double v44 = v42[4];
        drop(v8, a3);
        if (v44 == 1.0)
        {
          v115 = [MEMORY[0x1E4F28B00] currentHandler];
          v116 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v115 handleFailureInFunction:v116, @"_ATXScoreInterpreter.m", 481, @"Invalid parameter not satisfying: %@", @"ratio != 1" file lineNumber description];
        }
        if (v44 < 0.0)
        {
          v117 = [MEMORY[0x1E4F28B00] currentHandler];
          v118 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          [v117 handleFailureInFunction:v118, @"_ATXScoreInterpreter.m", 482, @"Invalid parameter not satisfying: %@", @"ratio >= 0" file lineNumber description];
        }
        if (v44 == 1.0)
        {
          v45 = __atxlog_handle_default();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.9();
          }
          goto LABEL_133;
        }
        if (v44 < 0.0 && v43 != (double)(int)v43)
        {
          v100 = __atxlog_handle_default();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
            -[_ATXScoreInterpreter _runOperator:arity:context:]0();
          }
        }
        double v84 = (1.0 - pow(v44, v43)) / (1.0 - v44);
LABEL_130:
        double v18 = v39 * v84;
        goto LABEL_95;
      case 10:
        shouldReturnUndefined(v7, 3uLL);
        if (v46) {
          goto LABEL_93;
        }
        v47 = (double *)&v8[v8[1] - a3];
        double v48 = v47[2];
        double v49 = v47[3];
        double v50 = v47[4];
        drop(v8, a3);
        double v51 = exp(-(v50 * v48)) + 1.0;
        goto LABEL_108;
      case 12:
        shouldReturnUndefined(v7, 4uLL);
        if (v52) {
          goto LABEL_93;
        }
        v53 = (double *)&v8[v8[1] - a3];
        double v55 = v53[2];
        double v54 = v53[3];
        double v57 = v53[4];
        double v56 = v53[5];
        drop(v8, a3);
        if (v54 > v56)
        {
          v119 = [MEMORY[0x1E4F28B00] currentHandler];
          v120 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v119, "handleFailureInFunction:file:lineNumber:description:", v120, @"_ATXScoreInterpreter.m", 515, @"ClampToRange: minVal (%f) must be <= defaultVal (%f) ", *(void *)&v54, *(void *)&v56);
        }
        if (v56 > v57)
        {
          v121 = [MEMORY[0x1E4F28B00] currentHandler];
          v122 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v121, "handleFailureInFunction:file:lineNumber:description:", v122, @"_ATXScoreInterpreter.m", 516, @"ClampToRange: defaultVal (%f) must be <= maxVal (%f) ", *(void *)&v56, *(void *)&v57);
        }
        double v58 = v55;
        if (v55 < v54) {
          double v58 = v54;
        }
        if (v58 >= v57) {
          double i = v57;
        }
        else {
          double i = v58;
        }
        if (i != v55)
        {
          v59 = __atxlog_handle_default();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134219008;
            double v136 = v55;
            __int16 v137 = 2048;
            double v138 = v54;
            __int16 v139 = 2048;
            double v140 = v57;
            __int16 v141 = 2048;
            double v142 = v56;
            __int16 v143 = 2048;
            double v144 = i;
            _os_log_debug_impl(&dword_1D0FA3000, v59, OS_LOG_TYPE_DEBUG, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
          }
        }
        goto LABEL_84;
      case 13:
        pop(v7);
        double v61 = v60;
        pop(v8);
        double v63 = fabs(v61);
        BOOL v65 = v61 == -31337.0 || v63 == INFINITY;
        double v66 = 1.0;
        if (!v65) {
          double v66 = v61;
        }
        if (v62 >= 0.0) {
          double v18 = v62 * v66;
        }
        else {
          double v18 = v62 / fmax(v66, 0.0000001);
        }
        goto LABEL_95;
      case 14:
        shouldReturnUndefined(v7, a3);
        if (v67) {
          goto LABEL_93;
        }
        double i = *(double *)&v8[v8[1] - a3 + 3 + (unint64_t)*(double *)&v8[v8[1] - a3 + 2]];
        drop(v8, a3);
LABEL_84:
        v68 = v8;
        double v18 = i;
        goto LABEL_96;
      case 15:
        shouldReturnUndefined(v7, a3);
        if (v69) {
          goto LABEL_93;
        }
        v70 = [*(id *)(a1 + 16) objectAtIndexedSubscript:(unint64_t)*(double *)&v8[v8[1] - a3 + 2]];
        unint64_t v71 = (unint64_t)((double)(unint64_t)v8[1] - (double)(a3 - 1));
        drop(v8, a3);
        [v70 predict:&v8[v71 + 2]];
        push(v8, v72);
        goto LABEL_142;
      case 16:
        shouldReturnUndefined(v7, a3);
        if (v73) {
          goto LABEL_93;
        }
        v70 = [*(id *)(a1 + 16) objectAtIndexedSubscript:(unint64_t)*(double *)&v8[v8[1] - a3 + 2]];
        if ([v70 hasOutputIndexedSubscript])
        {
          pop(v8);
          uint64_t v75 = (uint64_t)v74;
        }
        else
        {
          uint64_t v75 = -1;
        }
        uint64_t v129 = v75;
        v85 = objc_opt_new();
        uint64_t v86 = [v70 numberOfFeatures];
        if (!v86) {
          goto LABEL_123;
        }
        uint64_t v87 = v86;
        uint64_t v88 = 0;
        v130 = v70;
        v131 = v85;
        while (2)
        {
          v89 = [v70 featureAtIndex:v87 + ~v88];
          v90 = [v89 featureName];
          if ([v89 featureType] == 2)
          {
            pop(v8);
            v91 = objc_msgSend(NSNumber, "numberWithDouble:");
            goto LABEL_122;
          }
          if ([v89 featureType] == 5)
          {
            v132 = v90;
            uint64_t v92 = [v89 multiArraySize];
            id v93 = objc_alloc(MEMORY[0x1E4F1E9A8]);
            v94 = [NSNumber numberWithUnsignedInteger:v92];
            v134 = v94;
            v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
            id v133 = 0;
            v91 = (void *)[v93 initWithShape:v95 dataType:65600 error:&v133];
            id v96 = v133;

            if (!v96)
            {
              if (v92)
              {
                uint64_t v97 = v92 - 1;
                do
                {
                  pop(v8);
                  v98 = objc_msgSend(NSNumber, "numberWithDouble:");
                  [v91 setObject:v98 atIndexedSubscript:v97];

                  --v97;
                }
                while (v97 != -1);
              }
              v70 = v130;
              v85 = v131;
              v90 = v132;
LABEL_122:
              [v85 setObject:v91 forKeyedSubscript:v90];

              if (++v88 == v87)
              {
LABEL_123:
                drop(v8, 1uLL);
                [v70 predictionForEvaluatedFeatures:v85 withOutputIndexedSubscript:v129];
                push(v8, v99);
                goto LABEL_141;
              }
              continue;
            }
            v102 = __atxlog_handle_default();
            v90 = v132;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
              -[_ATXScoreInterpreter _runOperator:arity:context:]1();
            }

            push(v8, -31337.0);
            v70 = v130;
            v85 = v131;
          }
          else
          {
            v101 = __atxlog_handle_default();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
              -[_ATXScoreInterpreter _runOperator:arity:context:]2();
            }

            push(v8, -31337.0);
          }
          break;
        }

LABEL_141:
LABEL_142:

        break;
      case 17:
        pop(v7);
        v77 = [*(id *)(a1 + 16) objectAtIndexedSubscript:(unint64_t)v76];
        v78 = v77;
        if (v8[504]) {
          double v79 = (double)objc_msgSend(v77, "containsObject:");
        }
        else {
          double v79 = 0.0;
        }
        push(v8, v79);

        break;
      case 18:
        shouldReturnUndefined(v7, 2uLL);
        if (v80)
        {
LABEL_93:
          drop(v8, a3);
          goto LABEL_94;
        }
        v81 = (double *)&v8[v8[1] - a3];
        double v82 = v81[2];
        double v83 = v81[3];
        drop(v8, a3);
        if (v82 > v83)
        {
          v123 = [MEMORY[0x1E4F28B00] currentHandler];
          v124 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v123, "handleFailureInFunction:file:lineNumber:description:", v124, @"_ATXScoreInterpreter.m", 631, @"RandomUniform: start (%f) must be <= end (%f) ", *(void *)&v82, *(void *)&v83);
        }
        double v18 = v82 + (v83 - v82) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
        goto LABEL_95;
      default:
        v128 = __atxlog_handle_default();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
          -[_ATXScoreInterpreter _runOperator:arity:context:]();
        }

        __break(1u);
        JUMPOUT(0x1D1035EACLL);
    }
  }
}

- (void)_runBytecode:(void *)a3 context:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = v5;
    id v8 = (double *)[v7 bytes];
    uint64_t v9 = [v7 length];
    if (v9 >= 1)
    {
      id v10 = (double *)((char *)v8 + v9);
      double v11 = (double *)((char *)v8 + 1);
      uint64_t v12 = 2;
      while (1)
      {
        uint64_t v13 = *(unsigned __int8 *)v8;
        switch(*(unsigned char *)v8)
        {
          case 0xFC:
            if (v12 != 2) {
              -[_ATXScoreInterpreter _runBytecode:context:]();
            }
            uint64_t v12 = 4;
            goto LABEL_41;
          case 0xFD:
            pop(v6);
            if (v15 != -31337.0)
            {
              BOOL v16 = (*(void *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
              BOOL v17 = ((*(void *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
              if (v15 >= 0.0)
              {
                BOOL v17 = 0;
                BOOL v16 = 0;
              }
              if ((*(void *)&v15 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
                BOOL v16 = 1;
              }
              int v18 = (*(void *)&v15 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v16;
              if ((*(void *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000) {
                int v18 = 1;
              }
              if (((v18 | v17) & 1) == 0) {
                goto LABEL_37;
              }
            }
            goto LABEL_26;
          case 0xFE:
            pop(v6);
            if (v19 == -31337.0 || fabs(v19) == INFINITY)
            {
LABEL_37:
              int v14 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10) {
                goto LABEL_48;
              }
              __memcpy_chk();
LABEL_39:
              uint64_t v12 = 2;
LABEL_40:
              double v11 = v14;
            }
            else
            {
              push(v6, v19);
LABEL_26:
              if ((double *)((char *)v11 + v12) > v10) {
                goto LABEL_48;
              }
              __memcpy_chk();
              double v11 = (double *)((char *)v11 + v12);
              if (v11 >= v10) {
                goto LABEL_48;
              }
              uint64_t v12 = 2;
            }
LABEL_41:
            id v8 = v11;
            double v11 = (double *)((char *)v11 + 1);
            if (v11 > v10) {
              goto LABEL_48;
            }
            break;
          case 0xFF:
            goto LABEL_26;
          default:
            if (v13 == 201)
            {
              int v14 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10) {
                goto LABEL_48;
              }
              __memcpy_chk();
              v20 = [*(id *)(a1 + 16) objectAtIndexedSubscript:0];
              buf[0] = 0;
              [v6[502] scoreForKey:v20 found:buf];
              if (!buf[0])
              {
                [v6[503] scoreForKey:v20 found:buf];
                if (!buf[0]) {
                  double v21 = -[_ATXScoreInterpreter _evalVariable:withCtx:](a1, v20, v6);
                }
              }
              push(v6, v21);

              goto LABEL_39;
            }
            if (v13 == 202)
            {
              int v14 = (double *)((char *)v8 + 9);
              if (v14 > v10) {
                goto LABEL_48;
              }
              push(v6, *v11);
              goto LABEL_40;
            }
            +[_ATXScoreInterpreter _expectedArity:]((uint64_t)_ATXScoreInterpreter, *(unsigned __int8 *)v8);
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v23 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10) {
                goto LABEL_48;
              }
              __memcpy_chk();
              unint64_t v24 = 0;
              uint64_t v12 = 2;
              double v11 = v23;
            }
            else
            {
              unint64_t v24 = v22;
            }
            double v25 = (double)(unint64_t)v6[1];
            -[_ATXScoreInterpreter _runOperator:arity:context:](a1, v13, v24, v6);
            if ((double)(unint64_t)v6[1] > v25)
            {
              double v26 = __atxlog_handle_default();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                unint64_t v27 = (unint64_t)((double)(unint64_t)v6[1] - v25);
                *(_DWORD *)buf = 134217984;
                unint64_t v29 = v27;
                _os_log_fault_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_FAULT, "Stack size after op > old stack size! This is an issue. Diff = %lu", buf, 0xCu);
              }
            }
            goto LABEL_41;
        }
      }
    }
  }
LABEL_48:
}

- (double)_evalVariable:(void *)a3 withCtx:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _evalVariable:withCtx:]"];
      [v19 handleFailureInFunction:v20, @"_ATXScoreInterpreter.m", 1040, @"Invalid parameter not satisfying: %@", @"varName" file lineNumber description];
    }
    id v7 = [*(id *)(a1 + 8) objectForKeyedSubscript:v5];
    -[_ATXScoreInterpreter _runBytecode:context:](a1, v7, v6);

    pop(v6);
    double v9 = v8;
    double v10 = fabs(v8);
    if (v10 >= INFINITY && v10 <= INFINITY)
    {
      double v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    [v6[503] setScore:v5 forKey:v9];
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)_compileToBytecode:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x1D25F6CC0]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 202, 0, v3);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v3);
        id v6 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 201, v7, 0);

        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v3 count] != 1)
        {
          int v46 = [MEMORY[0x1E4F28B00] currentHandler];
          v47 = [NSString stringWithUTF8String:"-[_ATXScoreInterpreter _compileToBytecode:]"];
          [v46 handleFailureInFunction:v47, @"_ATXScoreInterpreter.m", 810, @"Dictionary must be of size 1, not %lu", objc_msgSend(v3, "count") file lineNumber description];
        }
        uint64_t v66 = 0;
        int v67 = &v66;
        uint64_t v68 = 0x3032000000;
        int v69 = __Block_byref_object_copy__14;
        v70 = __Block_byref_object_dispose__14;
        id v71 = 0;
        uint64_t v60 = 0;
        double v61 = &v60;
        uint64_t v62 = 0x3032000000;
        double v63 = __Block_byref_object_copy__14;
        v64 = __Block_byref_object_dispose__14;
        id v65 = 0;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __43___ATXScoreInterpreter__compileToBytecode___block_invoke;
        v59[3] = &unk_1E68AD4E8;
        v59[4] = &v66;
        v59[5] = &v60;
        [v3 enumerateKeysAndObjectsUsingBlock:v59];
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x3032000000;
        v57[3] = __Block_byref_object_copy__14;
        v57[4] = __Block_byref_object_dispose__14;
        id v58 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __43___ATXScoreInterpreter__compileToBytecode___block_invoke_2;
        aBlock[3] = &unk_1E68AD510;
        aBlock[4] = v57;
        aBlock[5] = &v60;
        double v8 = (void (**)(void))_Block_copy(aBlock);
        uint64_t v9 = +[_ATXScoreInterpreter operatorFromFunctionName:]((uint64_t)_ATXScoreInterpreter, (void *)v67[5]);
        switch(v9)
        {
          case 7:
            if ([(id)v61[5] count] != 3)
            {
              double v49 = [MEMORY[0x1E4F28B00] currentHandler];
              [v49 handleFailureInMethod:sel__compileToBytecode_, a1, @"_ATXScoreInterpreter.m", 834, @"Invalid parameter not satisfying: %@", @"argArray.count == 3" object file lineNumber description];
            }
            double v10 = [(id)v61[5] objectAtIndexedSubscript:1];
            double v11 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v10);

            uint64_t v12 = [(id)v61[5] objectAtIndexedSubscript:2];
            uint64_t v13 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v12);

            uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
            uint64_t v15 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 255, v14, 0);
            v53 = v8;

            uint64_t v16 = [(id)v61[5] objectAtIndexedSubscript:0];
            uint64_t v17 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v16);

            int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length") + objc_msgSend(v11, "length"));
            double v19 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 253, v18, 0);

            id v6 = (void *)[v17 mutableCopy];
            [v6 appendData:v19];
            [v6 appendData:v11];
            [v6 appendData:v15];
            [v6 appendData:v13];

            double v8 = v53;
            goto LABEL_18;
          case 11:
            if ([(id)v61[5] count] != 2)
            {
              double v50 = [MEMORY[0x1E4F28B00] currentHandler];
              [v50 handleFailureInMethod:sel__compileToBytecode_, a1, @"_ATXScoreInterpreter.m", 862, @"Invalid parameter not satisfying: %@", @"argArray.count == 2" object file lineNumber description];
            }
            v20 = [(id)v61[5] objectAtIndexedSubscript:1];
            double v11 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v20);

            double v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
            uint64_t v13 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 254, v21, 0);

            unint64_t v22 = [(id)v61[5] objectAtIndexedSubscript:0];
            uint64_t v15 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v22);

            id v6 = (void *)[v15 mutableCopy];
            [v6 appendData:v13];
            [v6 appendData:v11];
LABEL_18:

            goto LABEL_37;
          case 15:
            if ((unint64_t)[(id)v61[5] count] <= 1)
            {
              double v51 = [MEMORY[0x1E4F28B00] currentHandler];
              [v51 handleFailureInMethod:sel__compileToBytecode_, a1, @"_ATXScoreInterpreter.m", 890, @"Invalid parameter not satisfying: %@", @"argArray.count >= 2" object file lineNumber description];
            }
            v23 = [_ATXNeuralNetwork alloc];
            unint64_t v24 = [(id)v61[5] objectAtIndexedSubscript:0];
            double v25 = [(_ATXNeuralNetwork *)v23 initWithData:v24];

            double v26 = -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v25);
            unint64_t v27 = v8[2](v8);
            [v27 setObject:v26 atIndexedSubscript:0];
            goto LABEL_26;
          case 16:
            double v25 = [(id)v61[5] objectAtIndexedSubscript:0];
            uint64_t v54 = v9;
            double v26 = [(id)v61[5] objectAtIndexedSubscript:1];
            int v28 = v8;
            unint64_t v27 = [(id)v61[5] objectAtIndexedSubscript:2];
            unint64_t v29 = [[_ATXScoreInterpreterCoreMLModel alloc] initWithModelName:v25 features:v26 outputSpecification:v27];
            uint64_t v30 = [(_ATXScoreInterpreterCoreMLModel *)v29 getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:v26 outputSpecification:v27];
            int v31 = (void *)v61[5];
            v61[5] = v30;

            v32 = v28[2](v28);
            long double v33 = -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v29);
            [v32 insertObject:v33 atIndex:0];

            double v8 = v28;
            uint64_t v9 = v54;
            goto LABEL_26;
          case 17:
            if ((unint64_t)[(id)v61[5] count] <= 1)
            {
              int v52 = [MEMORY[0x1E4F28B00] currentHandler];
              [v52 handleFailureInMethod:sel__compileToBytecode_, a1, @"_ATXScoreInterpreter.m", 880, @"Invalid parameter not satisfying: %@", @"argArray.count >= 2" object file lineNumber description];
            }
            id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            double v25 = (_ATXNeuralNetwork *)[v34 initWithArray:v61[5]];
            int v35 = (void *)MEMORY[0x1E4F1C978];
            double v26 = -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v25);
            uint64_t v36 = [v35 arrayWithObject:v26];
            unint64_t v27 = (void *)v61[5];
            v61[5] = v36;
LABEL_26:

            break;
          default:
            break;
        }
        +[_ATXScoreInterpreter _expectedArity:]((uint64_t)_ATXScoreInterpreter, v9);
        uint64_t v38 = v37;
        if (v37 != 0x7FFFFFFFFFFFFFFFLL && [(id)v61[5] count] != v37)
        {
          double v48 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, @"_ATXScoreInterpreter.m", 922, @"expected argArray.count (%tu) == expected count (%tu) for operator %hu", objc_msgSend((id)v61[5], "count"), v38, v9);
        }
        char v55 = v9;
        double v39 = v8;
        id v6 = objc_opt_new();
        for (unint64_t i = 0; i < [(id)v61[5] count]; ++i)
        {
          int v41 = (void *)MEMORY[0x1D25F6CC0]();
          v42 = [(id)v61[5] objectAtIndexedSubscript:i];
          long double v43 = -[_ATXScoreInterpreter _compileToBytecode:](a1, v42);
          [v6 appendData:v43];
        }
        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v8 = v39;
          long double v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v61[5], "count"));
          double v11 = +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, v55, v44, 0);
        }
        else
        {
          +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, v55, 0, 0);
          v11 = double v8 = v39;
        }
        [v6 appendData:v11];
LABEL_37:

        _Block_object_dispose(v57, 8);
        _Block_object_dispose(&v60, 8);

        _Block_object_dispose(&v66, 8);
        goto LABEL_38;
      }
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] data];
    }
    id v6 = (void *)v5;
LABEL_38:
    goto LABEL_39;
  }
  id v6 = 0;
LABEL_39:

  return v6;
}

+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v16 = a2;
  unint64_t v6 = a3;
  unint64_t v7 = a4;
  self;
  unsigned int v8 = v6 != 0;
  if (v7) {
    ++v8;
  }
  if (v8 >= 2) {
    +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]();
  }
  if (v6 | v7)
  {
    if (v6)
    {
      unsigned int v12 = [(id)v6 unsignedIntValue];
      if (HIWORD(v12))
      {
        char v17 = -4;
        LOBYTE(v18) = a2;
        *(_DWORD *)((char *)&v18 + 1) = v12;
        id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        double v10 = &v17;
        uint64_t v11 = 6;
      }
      else
      {
        char v17 = a2;
        LOWORD(v18) = v12;
        id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        double v10 = &v17;
        uint64_t v11 = 3;
      }
    }
    else
    {
      char v17 = a2;
      [(id)v7 doubleValue];
      uint64_t v18 = v13;
      id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      double v10 = &v17;
      uint64_t v11 = 9;
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    double v10 = &v16;
    uint64_t v11 = 1;
  }
  uint64_t v14 = (void *)[v9 initWithBytes:v10 length:v11];

  return v14;
}

- (id)retainBytecodeDependencyObject:(id *)a1
{
  if (a1)
  {
    id v3 = a1;
    [a1[2] addObject:a2];
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3[2], "count") - 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [_ATXScoreInterpreterCtx alloc];
  id v9 = +[ATXScoreDict scoreDictFromDictionary:v6];
  double v10 = [(_ATXScoreInterpreterCtx *)v8 initWithInputScores:v9 intentType:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = self->_bytecode;
  uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)self, *(void **)(*((void *)&v19 + 1) + 8 * i), v10);
      }
      uint64_t v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16, v16);
    }
    while (v13);
  }

  char v17 = objc_msgSend(v10[503], "toDictionary", (void)v19);

  return v17;
}

- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [[_ATXScoreInterpreterCtx alloc] initWithInputScores:v6 intentType:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = self->_bytecode;
  uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)self, *(void **)(*((void *)&v17 + 1) + 8 * v13++), v8);
      }
      while (v11 != v13);
      uint64_t v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v14);
    }
    while (v11);
  }

  uint64_t v15 = v8->subscores;
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytecodeDependencies, 0);
  objc_storeStrong((id *)&self->_bytecode, 0);
}

+ (void)_expectedArity:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Arity not specified for op %tu", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Undefined operator of value %tu", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.2()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Attempted to compute log10 of non-positive number %f (base arg of Logarithm operator) -- output is NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.3()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Attempted to compute log10 of non-positive number %f (value arg of Logarithm operator) --  output is NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.4()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "Divide by zero error (%f / %f) -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.5()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Attempted to compute NatLog of non-positive number %f -- output is NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.6()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "Attempted to compute pow(%f,%f) -- output is NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.7()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Attempted to compute ExpDecay with negative age: %f  -- output is NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.8()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Attempted to compute ExpDecay with non-positive half-life: %f -- forcing output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.10()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "Attempted to compute GeometricSum with ratio of %f and terms of %f -- result will be NaN", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ScoreInterpreter - CoreMLModel - Error in initializing MLMultiArray: %@", v2, v3, v4, v5, v6);
}

- (void)_runOperator:arity:context:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ScoreInterpreter - CoreMLModel - input feature with name %@ is not of type Double or MLMultiArray", v2, v3, v4, v5, v6);
}

- (void)_runBytecode:context:.cold.1()
{
  __assert_rtn("-[_ATXScoreInterpreter _runBytecode:context:]", "_ATXScoreInterpreter.m", 687, "nextUIntArgumentSize == sizeof(uint16_t)");
}

- (void)_evalVariable:(uint64_t)a3 withCtx:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, a2, a3, "Score for variable %@ returned Nan or Inf: %f", a5, a6, a7, a8, 2u);
}

+ (void)_bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:.cold.1()
{
  __assert_rtn("+[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]", "_ATXScoreInterpreter.m", 1002, "(nil != unsignedIntegerArgument ? 1 : 0) + (nil != doubleArgument ? 1 : 0) <= 1");
}

@end