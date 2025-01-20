@interface VCPVideoCNNActionClassifier
+ (id)sharedModel:(id)a3 inputNames:(id)a4 properties:(id)a5;
+ (id)sharedModelStage1:(id)a3 inputNames:(id)a4 properties:(id)a5;
- (VCPVideoCNNActionClassifier)initWithPHFaces:(id)a3;
- (id).cxx_construct;
- (id)results;
- (int)finishAnalysisPass:(id *)a3;
- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7;
@end

@implementation VCPVideoCNNActionClassifier

+ (id)sharedModel:(id)a3 inputNames:(id)a4 properties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VCPSharedInstanceManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__VCPVideoCNNActionClassifier_sharedModel_inputNames_properties___block_invoke;
  v16[3] = &unk_1E62990C0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v14 = [v10 sharedInstanceWithIdentifier:@"VCPVideoCNNActionClassifierEspresso" andCreationBlock:v16];

  return v14;
}

VCPCNNModelEspresso *__65__VCPVideoCNNActionClassifier_sharedModel_inputNames_properties___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:a1[4] inputNames:a1[5] outputNames:0 properties:a1[6]];
  return v1;
}

+ (id)sharedModelStage1:(id)a3 inputNames:(id)a4 properties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VCPSharedInstanceManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__VCPVideoCNNActionClassifier_sharedModelStage1_inputNames_properties___block_invoke;
  v16[3] = &unk_1E62990C0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v14 = [v10 sharedInstanceWithIdentifier:@"VCPVideoCNNActionClassifierEspressoStage1" andCreationBlock:v16];

  return v14;
}

VCPCNNModelEspresso *__71__VCPVideoCNNActionClassifier_sharedModelStage1_inputNames_properties___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:a1[4] inputNames:a1[5] outputNames:0 properties:a1[6]];
  return v1;
}

- (VCPVideoCNNActionClassifier)initWithPHFaces:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)VCPVideoCNNActionClassifier;
  v5 = [(VCPVideoCNNActionClassifier *)&v40 init];
  v6 = v5;
  if (v5)
  {
    BOOL v7 = DeviceGeqD5x();
    v42[0] = @"forceNNGraph";
    id v8 = [NSNumber numberWithBool:v7 ^ 1];
    v43[0] = v8;
    v42[1] = @"sharedContext";
    id v9 = [NSNumber numberWithBool:v7];
    v43[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    phFaces = v5->_phFaces;
    v5->_phFaces = (NSMutableArray *)v11;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v13);
          }
          -[NSMutableArray addObject:](v5->_phFaces, "addObject:", *(void *)(*((void *)&v36 + 1) + 8 * i), (void)v36);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v14);
    }

    id v17 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    id v18 = [v17 resourceURL];

    id v19 = [MEMORY[0x1E4F1CB10] URLWithString:@"action_recognition_head.espresso.net" relativeToURL:v18];
    v20 = [MEMORY[0x1E4F1CB10] URLWithString:@"action_taxonomy.plist" relativeToURL:v18];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfURL:v20];
    taxonomy = v5->_taxonomy;
    v5->_taxonomy = (NSArray *)v21;

    if ([(NSArray *)v5->_taxonomy count] == 35)
    {
      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      results = v5->_results;
      v5->_results = (NSMutableArray *)v23;

      inputNames = v5->_inputNames;
      v5->_inputNames = (NSArray *)&unk_1F15EE718;

      std::vector<void *>::resize((uint64_t)&v5->_inputsData, [(NSArray *)v5->_inputNames count]);
      if (DeviceHasANE())
      {
        v26 = [(id)objc_opt_class() sharedModel:v19 inputNames:v5->_inputNames properties:0];
      }
      else
      {
        v26 = [[VCPCNNModelEspresso alloc] initWithParameters:v19 inputNames:v5->_inputNames outputNames:0 properties:0];
      }
      modelEspresso = v5->_modelEspresso;
      v5->_modelEspresso = v26;

      v28 = v5->_modelEspresso;
      if (v28)
      {
        if (![(VCPCNNModelEspresso *)v28 prepareModelWithConfig:&stru_1F15A0D70])
        {
          v29 = [MEMORY[0x1E4F1CB10] URLWithString:@"action_recognition_head_stage1.espresso.net" relativeToURL:v18];

          if (DeviceHasANE())
          {
            v30 = [(id)objc_opt_class() sharedModelStage1:v29 inputNames:0 properties:v10];
          }
          else
          {
            v30 = [[VCPCNNModelEspresso alloc] initWithParameters:v29 inputNames:0 outputNames:0 properties:v10];
          }
          modelEspressoStage1 = v5->_modelEspressoStage1;
          v5->_modelEspressoStage1 = v30;

          v32 = v5->_modelEspressoStage1;
          if (v32)
          {
            BOOL v33 = [(VCPCNNModelEspresso *)v32 prepareModelWithConfig:&stru_1F15A0D70] == 0;

            if (v33)
            {
              v6 = v5;
              goto LABEL_24;
            }
LABEL_23:
            v6 = 0;
            goto LABEL_24;
          }
          id v19 = v29;
        }
      }
    }

    goto LABEL_23;
  }
LABEL_24:
  v34 = v6;

  return v34;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v103 = a3;
  id v100 = a4;
  if (!v100 && ![(NSMutableArray *)self->_phFaces count])
  {
    int v59 = 0;
    goto LABEL_84;
  }
  v110 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v111 = [MEMORY[0x1E4F1CA60] dictionary];
  v108 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_phFaces count])
  {
    if ((unint64_t)[(NSMutableArray *)self->_phFaces count] >= 4)
    {
      [(NSMutableArray *)self->_phFaces sortUsingComparator:&__block_literal_global_80];
      id v9 = -[NSMutableArray subarrayWithRange:](self->_phFaces, "subarrayWithRange:", 0, 3);
      v10 = (NSMutableArray *)[v9 mutableCopy];
      phFaces = self->_phFaces;
      self->_phFaces = v10;
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v12 = self->_phFaces;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v124 objects:v136 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v125 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          [v16 bodyWidth];
          double v18 = v17;
          [v16 bodyHeight];
          if (v18 * v19 == 0.0)
          {
            if ((int)MediaAnalysisLogLevel() < 7) {
              continue;
            }
            v20 = VCPLogInstance();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = [v16 localIdentifier];
              LODWORD(buf[0].value) = 138412290;
              *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v21;
              _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "Action classifier - empty torso bound in PHFace %@", (uint8_t *)buf, 0xCu);
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v23 = [v16 localIdentifier];
                LODWORD(buf[0].value) = 138412290;
                *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v23;
                _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "Action classifier - found torso bound in PHFace %@", (uint8_t *)buf, 0xCu);
              }
            }
            [v16 bodyCenterX];
            double v25 = v24;
            [v16 bodyWidth];
            double v27 = v26;
            [v16 bodyCenterY];
            double v29 = v28;
            [v16 bodyHeight];
            double v31 = v30;
            [v16 bodyWidth];
            double v33 = v32;
            [v16 bodyHeight];
            double v35 = v34;
            long long v36 = [v16 localIdentifier];
            BOOL v37 = v36 == 0;

            double v38 = v25 + v27 * -0.5;
            double v39 = v29 + v31 * -0.5;
            if (!v37)
            {
              v138.origin.double x = v38;
              v138.origin.double y = v29 + v31 * -0.5;
              v138.size.double width = v33;
              v138.size.double height = v35;
              objc_super v40 = NSStringFromRect(v138);
              v41 = [v16 localIdentifier];
              [v108 setObject:v40 forKeyedSubscript:v41];
            }
            if (!CGRectIsEmpty(a5))
            {
              double v38 = fmax(v38 - a5.origin.x, 0.0) / a5.size.width;
              double v39 = fmax(v39 - a5.origin.y, 0.0) / a5.size.height;
              double v33 = fmin(v33 / a5.size.width, 0.99000001 - v38);
              double v35 = fmin(v35 / a5.size.height, 0.99000001 - v39);
            }
            v139.origin.double x = v38;
            v139.origin.double y = v39;
            v139.size.double width = v33;
            v139.size.double height = v35;
            v20 = NSStringFromRect(v139);
            [v8 addObject:v20];
            v42 = [v16 localIdentifier];
            BOOL v43 = v42 == 0;

            if (!v43)
            {
              v44 = [v16 localIdentifier];
              [v110 setObject:v44 forKeyedSubscript:v20];
            }
          }
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v124 objects:v136 count:16];
      }
      while (v13);
    }
  }
  else
  {
    long long v123 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v120 = 0u;
    id v12 = (NSMutableArray *)v100;
    uint64_t v45 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v120 objects:v135 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v121;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v121 != v46) {
            objc_enumerationMutation(v12);
          }
          v48 = *(void **)(*((void *)&v120 + 1) + 8 * j);
          [v48 bounds];
          v49 = NSStringFromRect(v140);
          [v8 addObject:v49];
          v50 = [v48 torsoprint];
          BOOL v51 = v50 == 0;

          if (!v51)
          {
            v52 = [v48 torsoprint];
            [v111 setObject:v52 forKeyedSubscript:v49];
          }
        }
        uint64_t v45 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v120 objects:v135 count:16];
      }
      while (v45);
    }
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = v8;
  uint64_t v53 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
  if (!v53)
  {
    int v59 = 0;
    goto LABEL_83;
  }
  int v109 = 0;
  char v54 = 0;
  uint64_t v106 = *(void *)v117;
  v99 = @"torsoPrint";
  while (2)
  {
    uint64_t v105 = v53;
    for (uint64_t k = 0; k != v105; ++k)
    {
      if (*(void *)v117 != v106) {
        objc_enumerationMutation(obj);
      }
      v56 = *(NSString **)(*((void *)&v116 + 1) + 8 * k);
      v57 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v99);
      NSRect v141 = NSRectFromString(v56);
      if (v141.size.height * v141.size.width >= 0.00499999989)
      {
        if (v109 > 2)
        {
          int v59 = 0;
        }
        else
        {
          CGRect v142 = CGRectInset(v141, v141.size.width * -0.25, v141.size.height * -0.25);
          v133[0] = 0;
          float v58 = fmax(v142.origin.x, 0.0);
          v142.origin.double y = 1.0 - v142.origin.y;
          *(float *)&v142.size.double height = fmax(v142.origin.y - v142.size.height, 0.0);
          *(float *)&v133[1] = v58;
          v133[2] = LODWORD(v142.size.height);
          *(float *)&v142.origin.double x = fmin(v142.origin.x + v142.size.width, 1.0);
          *(float *)&v142.origin.double y = fmin(v142.origin.y, 1.0);
          v133[3] = LODWORD(v142.origin.x);
          v133[4] = LODWORD(v142.origin.y);
          if ((v54 & 1) == 0)
          {
            int v59 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspressoStage1, "espressoForward:", [v103 outputRes4]);
            if (v59) {
              goto LABEL_82;
            }
          }
          modelEspressoStage1 = self->_modelEspressoStage1;
          if (modelEspressoStage1)
          {
            [(VCPCNNModelEspresso *)modelEspressoStage1 outputBlob];
            value = (float *)buf[0].value;
          }
          else
          {
            value = 0;
          }
          *self->_inputsData.__begin_ = value;
          *((void *)self->_inputsData.__begin_ + 1) = v133;
          modelEspresso = self->_modelEspresso;
          v114 = 0;
          uint64_t v115 = 0;
          __p = 0;
          std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
          int v59 = [(VCPCNNModelEspresso *)modelEspresso espressoForwardInputs:&__p];
          if (__p)
          {
            v114 = __p;
            operator delete(__p);
          }
          if (v59) {
            goto LABEL_82;
          }
          v63 = self->_modelEspresso;
          if (!v63) {
            goto LABEL_81;
          }
          [(VCPCNNModelEspresso *)v63 outputBlob];
          CMTimeValue v64 = buf[0].value;
          if (!buf[0].value) {
            goto LABEL_81;
          }
          uint64_t v65 = 0;
          ++v109;
          float v66 = 0.0;
          do
          {
            float v66 = v66 + expf(*(float *)(v64 + v65));
            v65 += 4;
          }
          while (v65 != 140);
          for (uint64_t m = 0; m != 35; ++m)
          {
            if ((float)(expf(*(float *)(v64 + 4 * m)) / v66) > 0.1)
            {
              v68 = objc_msgSend(NSNumber, "numberWithFloat:");
              v69 = [NSNumber numberWithInt:m];
              v70 = [v69 stringValue];
              [v57 setObject:v68 forKeyedSubscript:v70];
            }
          }
          v71 = [v57 allKeys];
          BOOL v72 = [v71 count] == 0;

          if (v72) {
            goto LABEL_73;
          }
          NSRect v143 = NSRectFromString(v56);
          double x = v143.origin.x;
          double y = v143.origin.y;
          double width = v143.size.width;
          double height = v143.size.height;
          v77 = [v110 objectForKeyedSubscript:v56];
          if (!v77) {
            goto LABEL_65;
          }
          v78 = [v110 objectForKeyedSubscript:v56];
          v79 = [v108 objectForKeyedSubscript:v78];
          BOOL v80 = v79 == 0;

          if (v80)
          {
LABEL_65:
            if (!CGRectIsEmpty(a5))
            {
              double x = a5.origin.x + x * a5.size.width;
              double y = a5.origin.y + y * a5.size.height;
              double width = a5.size.width * width;
              double height = a5.size.height * height;
            }
          }
          else
          {
            v81 = [v110 objectForKeyedSubscript:v56];
            v82 = [v108 objectForKeyedSubscript:v81];
            NSRect v144 = NSRectFromString(v82);
            double x = v144.origin.x;
            double y = v144.origin.y;
            double width = v144.size.width;
            double height = v144.size.height;
          }
          v83 = (void *)MEMORY[0x1E4F1CA60];
          v130[0] = @"humanActions";
          v130[1] = @"humanBounds";
          v131[0] = v57;
          v145.origin.double x = x;
          v145.origin.double y = y;
          v145.size.double width = width;
          v145.size.double height = height;
          v84 = NSStringFromRect(v145);
          v131[1] = v84;
          v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:2];
          v86 = [v83 dictionaryWithDictionary:v85];

          v87 = [v110 objectForKeyedSubscript:v56];
          BOOL v88 = v87 == 0;

          if (!v88)
          {
            v89 = [v110 objectForKeyedSubscript:v56];
            [v86 setObject:v89 forKeyedSubscript:@"faceIdentifier"];
          }
          v90 = [v111 objectForKeyedSubscript:v56];
          BOOL v91 = v90 == 0;

          if (v91)
          {
LABEL_72:
            results = self->_results;
            v128[0] = @"start";
            buf[0] = (CMTime)*a6;
            CFDictionaryRef v95 = CMTimeCopyAsDictionary(buf, 0);
            v129[0] = v95;
            v128[1] = @"duration";
            buf[0] = (CMTime)*a7;
            CFDictionaryRef v96 = CMTimeCopyAsDictionary(buf, 0);
            v128[2] = @"attributes";
            v129[1] = v96;
            v129[2] = v86;
            v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v128 count:3];
            [(NSMutableArray *)results addObject:v97];

LABEL_73:
            char v54 = 1;
            goto LABEL_74;
          }
          v92 = [v111 objectForKeyedSubscript:v56];
          v93 = [v92 serializeStateAndReturnError:0];

          if (v93)
          {
            [v86 setObject:v93 forKeyedSubscript:v99];

            goto LABEL_72;
          }

LABEL_81:
          int v59 = -18;
        }
LABEL_82:

        goto LABEL_83;
      }
LABEL_74:
    }
    uint64_t v53 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
    int v59 = 0;
    if (v53) {
      continue;
    }
    break;
  }
LABEL_83:

LABEL_84:
  return v59;
}

uint64_t __80__VCPVideoCNNActionClassifier_run_withPersons_andRegionCrop_atTime_andDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 bodyWidth];
  double v7 = v6;
  [v4 bodyHeight];
  double v9 = v8;
  [v5 bodyWidth];
  double v11 = v10;
  [v5 bodyHeight];
  float v12 = v7 * v9;
  float v14 = v11 * v13;
  if (v12 > v14) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = v12 < v14;
  }

  return v15;
}

- (int)finishAnalysisPass:(id *)a3
{
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  id v5 = @"HumanActionClassificationResults";
  v6[0] = results;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phFaces, 0);
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    self->_inputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_modelEspressoStage1, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end