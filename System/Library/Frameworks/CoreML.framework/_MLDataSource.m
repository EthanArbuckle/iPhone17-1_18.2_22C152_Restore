@interface _MLDataSource
- (NSDictionary)dataTensorDictionary;
- (_MLDataSource)initWithMLFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6;
- (unint64_t)numberOfDataPoints;
- (void)setDataTensorDictionary:(id)a3;
@end

@implementation _MLDataSource

- (void).cxx_destruct
{
}

- (void)setDataTensorDictionary:(id)a3
{
}

- (NSDictionary)dataTensorDictionary
{
  return self->_dataTensorDictionary;
}

- (unint64_t)numberOfDataPoints
{
  return 1;
}

- (_MLDataSource)initWithMLFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v151 = a3;
  id v156 = a5;
  v168.receiver = self;
  v168.super_class = (Class)_MLDataSource;
  v141 = [(_MLDataSource *)&v168 init];
  if (!v141) {
    goto LABEL_99;
  }
  [v156 modelDescription];
  if (v7) {
    v9 = {;
  }
    [v9 inputDescriptionsByName];
  }
  else {
    v9 = {;
  }
    [v9 trainingInputDescriptionsByName];
  v153 = };

  v144 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = (void *)MEMORY[0x1E4F1CA60];
  v11 = [v156 espressoInputShapes];
  v139 = [v10 dictionaryWithDictionary:v11];

  v12 = (void *)MEMORY[0x1E4F1CA60];
  v13 = [v156 espressoInputStrides];
  v140 = [v12 dictionaryWithDictionary:v13];

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id obj = [v153 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v164 objects:v174 count:16];
  if (!v14)
  {
    int v137 = 0;
    v148 = 0;
    id v145 = 0;
    goto LABEL_93;
  }
  int v137 = 0;
  v148 = 0;
  id v145 = 0;
  uint64_t v146 = *(void *)v165;
  do
  {
    uint64_t v143 = v14;
    for (uint64_t i = 0; i != v143; ++i)
    {
      if (*(void *)v165 != v146) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v164 + 1) + 8 * i);
      v17 = [v151 featureValueForName:v16];
      v18 = [v153 objectForKeyedSubscript:v16];
      int v19 = [v18 isOptional];
      if (v17) {
        int v20 = 0;
      }
      else {
        int v20 = v19;
      }

      if (v20)
      {
        if ([0 type])
        {
          v21 = [v153 objectForKeyedSubscript:v16];
          if ([v21 type] != 5)
          {

LABEL_101:
            if (a6)
            {
              *a6 = +[MLModelErrorUtils errorWithCode:6, v145, @"Data provided in input: %@ is missing feature value for training input: %@", v151, v16 underlyingError format];
            }
            goto LABEL_154;
          }
          v22 = [0 multiArrayValue];
          v23 = [v22 shape];
          BOOL v24 = [v23 count] == 0;

          if (!v24) {
            goto LABEL_101;
          }
        }
        if ([v156 sequenceConcatConsumesOptionalInputNamed:v16])
        {
          v25 = [v153 objectForKeyedSubscript:v16];
          v26 = [v25 multiArrayConstraint];
          v27 = [v26 shape];

          if ([(MLMultiArray *)v27 count] != 1)
          {
            if ([(MLMultiArray *)v27 count] == 2)
            {
              v35 = (void *)MEMORY[0x1E4F1CA48];
              v171[0] = &unk_1EF119EF0;
              v171[1] = &unk_1EF119F08;
              v171[2] = &unk_1EF119F08;
              v30 = [(MLMultiArray *)v27 objectAtIndexedSubscript:0];
              v171[3] = v30;
              v36 = [(MLMultiArray *)v27 objectAtIndexedSubscript:1];
              v171[4] = v36;
              v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:5];
              v38 = [v35 arrayWithArray:v37];
            }
            else
            {
              if ([(MLMultiArray *)v27 count] == 3)
              {
                v39 = (void *)MEMORY[0x1E4F1CA48];
                v170[0] = &unk_1EF119EF0;
                v170[1] = &unk_1EF119F08;
                v30 = [(MLMultiArray *)v27 objectAtIndexedSubscript:0];
                v170[2] = v30;
                v36 = [(MLMultiArray *)v27 objectAtIndexedSubscript:1];
                v170[3] = v36;
                v37 = [(MLMultiArray *)v27 objectAtIndexedSubscript:2];
                v170[4] = v37;
                v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:5];
                v38 = [v39 arrayWithArray:v40];
              }
              else
              {
                uint64_t v41 = [(MLMultiArray *)v27 count];
                v42 = (void *)MEMORY[0x1E4F1CA48];
                if (v41 != 4)
                {
                  v38 = [MEMORY[0x1E4F1CA48] arrayWithArray:v27];
                  [v38 setObject:&unk_1EF119EF0 atIndexedSubscript:0];
                  goto LABEL_33;
                }
                v169[0] = &unk_1EF119EF0;
                v30 = [(MLMultiArray *)v27 objectAtIndexedSubscript:0];
                v169[1] = v30;
                v36 = [(MLMultiArray *)v27 objectAtIndexedSubscript:1];
                v169[2] = v36;
                v37 = [(MLMultiArray *)v27 objectAtIndexedSubscript:2];
                v169[3] = v37;
                v40 = [(MLMultiArray *)v27 objectAtIndexedSubscript:3];
                v169[4] = v40;
                v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:5];
                v38 = [v42 arrayWithArray:v43];
              }
            }

            goto LABEL_32;
          }
          int v28 = [v156 ndArrayInterpretation];
          v29 = (void *)MEMORY[0x1E4F1CA48];
          if (v28)
          {
            v173[0] = &unk_1EF119EF0;
            v173[1] = &unk_1EF119F08;
            v173[2] = &unk_1EF119F08;
            v173[3] = &unk_1EF119F08;
            v30 = [(MLMultiArray *)v27 objectAtIndexedSubscript:0];
            v173[4] = v30;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:5];
          }
          else
          {
            v172[0] = &unk_1EF119EF0;
            v172[1] = &unk_1EF119F08;
            v30 = [(MLMultiArray *)v27 objectAtIndexedSubscript:0];
            v172[2] = v30;
            v172[3] = &unk_1EF119F08;
            v172[4] = &unk_1EF119F08;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:5];
          v36 = };
          v38 = [v29 arrayWithArray:v36];
LABEL_32:

LABEL_33:
          v44 = [[MLMultiArray alloc] initWithShape:v38 dataType:65600 error:a6];
          [(MLMultiArray *)v44 fillWithNumber:&unk_1EF119E60];
          v17 = +[MLFeatureValue featureValueWithMultiArray:v44];
        }
        else
        {
          v31 = [MLMultiArray alloc];
          v32 = [v153 objectForKeyedSubscript:v16];
          v33 = [v32 multiArrayConstraint];
          v34 = [v33 shape];
          v27 = [(MLMultiArray *)v31 initWithShape:v34 dataType:65600 error:a6];

          [(MLMultiArray *)v27 fillWithNumber:&unk_1EF119E60];
          v17 = +[MLFeatureValue featureValueWithMultiArray:v27];
        }
      }
      if (!v17) {
        goto LABEL_101;
      }
      v152 = [v153 objectForKeyedSubscript:v16];
      v45 = [v156 modelDescription];
      v46 = [v45 predictedFeatureName];
      int v47 = [v46 isEqualToString:v16];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v48 = [v156 lossTargetName];
        int v49 = [v48 isEqualToString:v16];
      }
      else
      {
        int v49 = 0;
      }
      if (((v47 | v49) & 1) != 0 || v152)
      {
        id v154 = v16;
        uint64_t v50 = [v17 type];
        if (v50 == 4)
        {
          v61 = [v152 imageConstraint];
          char v62 = [v61 isAllowedValue:v17 error:a6];

          if (v62)
          {
            uint64_t v63 = [v17 imageBufferValue];
            id v64 = objc_alloc(MEMORY[0x1E4F611A0]);
            v65 = [v156 imagePreprocessingParameters];
            v66 = [v65 objectForKeyedSubscript:v154];
            id v159 = v145;
            uint64_t v67 = [v64 initWithCVPixelBuffer:v63 imageParameters:v66 error:&v159];
            id v68 = v159;

            if (!v67)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:6 format:@"Failed to copy over image input"];
                v148 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v148 = 0;
              }
              id v145 = v68;
              goto LABEL_153;
            }
            v69 = (void *)v67;
            id v145 = v68;
            id v70 = v154;
            goto LABEL_86;
          }
          if (a6)
          {
            v129 = [v152 imageConstraint];
            *a6 = +[MLModelErrorUtils errorWithCode:6, @"Image value for %@ does not comply with constraint: %@", v154, v129 format];
          }
        }
        else
        {
          if (v50 == 5)
          {
            v147 = [v17 multiArrayValue];
            v51 = [v147 shape];
            if (!v51
              || ([v147 shape],
                  v52 = objc_claimAutoreleasedReturnValue(),
                  BOOL v53 = [v52 count] == 0,
                  v52,
                  v51,
                  v53))
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6, v145, @"Data provided for %@ has insufficient shape", v154 underlyingError format];
              }
              goto LABEL_119;
            }
            v54 = [v152 multiArrayConstraint];
            char v55 = objc_msgSend(v54, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v17, 1, objc_msgSend(v156, "ndArrayInterpretation") ^ 1, v154, a6);

            if ((v55 & 1) == 0)
            {
              if (a6)
              {
                v131 = [v152 multiArrayConstraint];
                *a6 = +[MLModelErrorUtils errorWithCode:6, @"MLMultiArray value for %@ does not comply with constraint: %@", v154, v131 format];
              }
LABEL_119:

              goto LABEL_153;
            }
            v56 = [MLMultiArray alloc];
            v57 = [v147 shape];
            id v163 = v145;
            v149 = [(MLMultiArray *)v56 initWithShape:v57 dataType:65568 error:&v163];
            id v58 = v163;

            if (!v149)
            {
              if (a6)
              {
                v132 = [v147 shape];
                *a6 = +[MLModelErrorUtils errorWithCode:6, v58, @"Failed to create multi array of shape %@", v132 underlyingError format];
              }
              v133 = 0;
              goto LABEL_142;
            }
            id v162 = v58;
            char v59 = [v147 copyIntoMultiArray:v149 error:&v162];
            id v145 = v162;

            if ((v59 & 1) == 0)
            {
              v133 = v149;
              if (a6)
              {
                id v134 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v145 format:@"Failed to copy over input multi array"];
                goto LABEL_130;
              }
LABEL_141:
              id v58 = v145;
LABEL_142:

              id v145 = v58;
              goto LABEL_153;
            }
            v60 = [v156 espressoInputShapes];
            if (v60)
            {

              goto LABEL_68;
            }
            v84 = [v156 espressoInputStrides];
            BOOL v85 = v84 == 0;

            if (!v85)
            {
LABEL_68:
              v86 = [v156 espressoInputShapes];
              v87 = [v86 objectForKeyedSubscript:v154];
              if (v87)
              {

                goto LABEL_74;
              }
              v92 = [v156 espressoInputShapes];
              v93 = [v92 objectForKeyedSubscript:v154];
              BOOL v94 = v93 == 0;

              if (!v94)
              {
LABEL_74:
                id v95 = objc_alloc(MEMORY[0x1E4F611A0]);
                uint64_t v96 = [(MLMultiArray *)v149 mutableBytes];
                id v97 = [v156 espressoInputShapes];
                id v98 = [v97 objectForKeyedSubscript:v154];
                v99 = [v156 espressoInputStrides];
                v100 = [v99 objectForKeyedSubscript:v154];
                uint64_t v101 = [v95 initWithData:v96 type:2 shape:v98 strides:v100];
                goto LABEL_79;
              }
            }
            v111 = [v147 shape];
            uint64_t v112 = [v156 ndArrayInterpretation];
            id v160 = 0;
            id v161 = 0;
            BOOL v113 = +[MLDataConversionUtils populateEspressoShapeAndStridesFromInputShape:v111 ndRepresentation:v112 espressoShape:&v161 espressoStrides:&v160 error:a6];
            id v97 = v161;
            id v98 = v160;

            if (v113)
            {
              [v139 setObject:v97 forKeyedSubscript:v154];
              [v140 setObject:v98 forKeyedSubscript:v154];
              id v114 = objc_alloc(MEMORY[0x1E4F611A0]);
              uint64_t v115 = [(MLMultiArray *)v149 mutableBytes];
              v99 = [v139 objectForKeyedSubscript:v154];
              v100 = [v140 objectForKeyedSubscript:v154];
              uint64_t v101 = [v114 initWithData:v115 type:2 shape:v99 strides:v100];
              int v137 = 1;
LABEL_79:

              if (v101)
              {
                v82 = [v154 stringByAppendingString:@"_MultiArray"];
                [(NSDictionary *)v144 setObject:v149 forKeyedSubscript:v82];
                uint64_t v138 = (uint64_t)v154;
                goto LABEL_85;
              }
              v133 = v149;
              if (!a6)
              {
                v148 = 0;
                goto LABEL_141;
              }
              id v134 = +[MLModelErrorUtils errorWithCode:6 format:@"Failed to copy over input multi array"];
              v148 = 0;
LABEL_130:
              *a6 = v134;
            }
            else
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6, @"Shape for multi array value of %@ is not allowed", v154 format];
              }
            }
            id v58 = v145;
            v133 = v149;
            goto LABEL_142;
          }
          v71 = [v156 modelDescription];
          v72 = [v71 predictedFeatureName];
          int v73 = [v72 isEqualToString:v154];

          if (v73)
          {
            if ([v17 type] != 1 && objc_msgSend(v17, "type") != 3
              || ([v152 isAllowedValue:v17 error:a6] & 1) == 0)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6, @"Value for %@ does not comply with constraint in description: %@ (%@)", v154, v152, *a6 format];
              }
              goto LABEL_153;
            }
            v74 = [v156 classLabels];
            v75 = v74;
            if (!v74 || (v147 = v74, ![v74 count]))
            {
              if (a6)
              {
                v147 = v75;
                v128 = +[MLModelErrorUtils errorWithCode:6 format:@"Failed to derive valid training input from class label"];
                goto LABEL_107;
              }
LABEL_108:

              goto LABEL_153;
            }
            v76 = [v75 objectAtIndexedSubscript:0];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v75 = v147;
              if ([v17 type] != 3)
              {
                if (a6)
                {
                  v128 = +[MLModelErrorUtils errorWithCode:6 format:@"Predicted class is not in expected format"];
LABEL_107:
                  *a6 = v128;
                  v75 = v147;
                }
                goto LABEL_108;
              }
              v78 = [v156 classLabelToIndexMap];
              v79 = [v17 stringValue];
              uint64_t v80 = [v78 objectForKeyedSubscript:v79];
            }
            else
            {
              v78 = [v156 classLabelToIndexMap];
              v79 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "int64Value"));
              uint64_t v80 = [v78 objectForKeyedSubscript:v79];
            }
            v149 = (MLMultiArray *)v80;

            if (!v149)
            {
              v135 = v147;
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6, @"Invalid class label %@ provided as input", v17 format];
                v135 = v147;
              }

              goto LABEL_153;
            }
            v81 = [[MLMultiArray alloc] initWithShape:&unk_1EF11A880 dataType:65568 error:a6];
            v82 = v81;
            if (!v81)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:6 format:@"Failed to copy over input multi array"];
                v82 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v82 = 0;
              }
              goto LABEL_152;
            }
            [(MLMultiArray *)v81 setObject:v149 atIndexedSubscript:0];
            uint64_t v138 = [v156 lossTargetName];

            v83 = [v156 espressoInputShapes];
            if (v83)
            {

              goto LABEL_71;
            }
            v88 = [v156 espressoInputStrides];
            BOOL v89 = v88 == 0;

            if (!v89)
            {
LABEL_71:
              v90 = [v156 espressoInputShapes];
              v91 = [v90 objectForKeyedSubscript:v154];
              if (v91)
              {

                goto LABEL_76;
              }
              v102 = [v156 espressoInputShapes];
              v103 = [v102 objectForKeyedSubscript:v154];
              BOOL v104 = v103 == 0;

              if (!v104)
              {
LABEL_76:
                id v105 = objc_alloc(MEMORY[0x1E4F611A0]);
                uint64_t v106 = [v82 mutableBytes];
                id v107 = [v156 espressoInputShapes];
                id v108 = [v107 objectForKeyedSubscript:v154];
                v109 = [v156 espressoInputStrides];
                v110 = [v109 objectForKeyedSubscript:v154];
                uint64_t v101 = [v105 initWithData:v106 type:2 shape:v108 strides:v110];
                goto LABEL_83;
              }
            }
            v116 = [v82 shape];
            uint64_t v117 = [v156 ndArrayInterpretation];
            id v157 = 0;
            id v158 = 0;
            BOOL v118 = +[MLDataConversionUtils populateEspressoShapeAndStridesFromInputShape:v116 ndRepresentation:v117 espressoShape:&v158 espressoStrides:&v157 error:a6];
            id v107 = v158;
            id v108 = v157;

            if (v118)
            {
              [v139 setObject:v107 forKeyedSubscript:v154];
              [v140 setObject:v108 forKeyedSubscript:v154];
              id v119 = objc_alloc(MEMORY[0x1E4F611A0]);
              uint64_t v120 = [v82 mutableBytes];
              v109 = [v139 objectForKeyedSubscript:v154];
              v110 = [v140 objectForKeyedSubscript:v154];
              uint64_t v101 = [v119 initWithData:v120 type:2 shape:v109 strides:v110];
              int v137 = 1;
LABEL_83:

              if (v101)
              {
                v121 = [v154 stringByAppendingString:@"_MultiArray"];
                [(NSDictionary *)v144 setObject:v82 forKeyedSubscript:v121];

LABEL_85:
                v69 = (void *)v101;
                id v70 = (id)v138;
LABEL_86:
                v148 = v69;
                v155 = v70;
                -[NSDictionary setObject:forKeyedSubscript:](v144, "setObject:forKeyedSubscript:");

                goto LABEL_87;
              }
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:6 format:@"Failed to copy over input multi array"];
                v148 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v148 = 0;
              }
            }
            else
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6, @"Shape for multi array value of %@ is not allowed", v154 format];
              }
            }
            id v154 = (id)v138;
LABEL_152:

            goto LABEL_153;
          }
          if (a6)
          {
            v130 = [v153 objectForKeyedSubscript:v154];
            *a6 = +[MLModelErrorUtils errorWithCode:6, @"Input %@ is not in the expected format, expected: %@", v154, v130 format];
          }
        }
LABEL_153:

LABEL_154:
        v127 = 0;
        goto LABEL_155;
      }
LABEL_87:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v164 objects:v174 count:16];
  }
  while (v14);
LABEL_93:

  v122 = [v156 espressoInputShapes];
  if (!v122)
  {
    v123 = [v156 espressoInputStrides];
    BOOL v124 = v123 == 0;

    if (((v124 | v137) & 1) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }

  if (v137)
  {
LABEL_97:
    [v156 setEspressoInputShapes:v139];
    [v156 setEspressoInputStrides:v140];
  }
LABEL_98:
  dataTensorDictionary = v141->_dataTensorDictionary;
  v141->_dataTensorDictionary = v144;
  v126 = v144;

LABEL_99:
  v127 = v141;
LABEL_155:

  return v127;
}

@end