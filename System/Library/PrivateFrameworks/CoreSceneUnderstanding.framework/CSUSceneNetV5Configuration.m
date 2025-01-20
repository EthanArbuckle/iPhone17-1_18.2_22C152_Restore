@interface CSUSceneNetV5Configuration
+ (id)availableRevisions;
+ (id)sceneNetV5ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)detectionHeadIsSoftmax;
- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor;
- (CSUPixelBufferDescriptor)saliencyAttentionMapBufferDescriptor;
- (CSUPixelBufferDescriptor)saliencyObjectnessMapBufferDescriptor;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)aestheticsAttributeVocabularyName;
- (NSString)aestheticsAttributesTensorName;
- (NSString)aestheticsGlobalScoreVocabularyName;
- (NSString)aestheticsGlobalScoresTensorName;
- (NSString)aestheticsTaxonomyPath;
- (NSString)detectionCoordinateOffsetMapName;
- (NSString)detectionScoreHeatMapName;
- (NSString)detectionTaxonomyPath;
- (NSString)detectionVocabularyName;
- (NSString)entityNetClassificationTensorName;
- (NSString)entityNetVocabularyName;
- (NSString)espressoNetworkPath;
- (NSString)fingerprintEmbeddingTensorName;
- (NSString)fingerprintModelPath;
- (NSString)hierarchicalSceneClassificationVocabularyName;
- (NSString)inputImageTensorName;
- (NSString)leafSceneClassificationVocabularyName;
- (NSString)saliencyAttentionTensorName;
- (NSString)saliencyObjectnessTensorName;
- (NSString)sceneClassificationTensorName;
- (NSString)scenePrintTensorName;
- (NSString)sceneTaxonomyPath;
- (float)detectionNMSThreshold;
- (id)aestheticsTaxonomyWithError:(id *)a3;
- (id)detectionTaxonomyWithError:(id *)a3;
- (id)initSceneNetV5ConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 scenePrintTensorName:(id)a8 sceneClassificationTensorName:(id)a9 sceneTaxonomyPath:(id)a10 aestheticsAttributesTensorName:(id)a11 aestheticsGlobalScoresTensorName:(id)a12 aestheticsTaxonomyPath:(id)a13 detectionScoreHeatMapName:(id)a14 detectionCoordinateOffsetMapName:(id)a15 detectionTaxonomyPath:(id)a16 detectionHeadIsSoftmax:(BOOL)a17 detectionNMSThreshold:(float)a18 saliencyAttentionTensorName:(id)a19 saliencyAMapDimension:(unint64_t)a20 saliencyObjectnessTensorName:(id)a21 saliencyOMapDimension:(unint64_t)a22 fingerprintEmbeddingTensorName:(id)a23 fingerprintModelPath:(id)a24 entityNetClassificationTensorName:(id)a25 leafSceneClassificationVocabularyName:(id)a26 hierarchicalSceneClassificationVocabularyName:(id)a27 entityNetVocabularyName:(id)a28 aestheticsAttributeVocabularyName:(id)a29 aestheticsGlobalScoreVocabularyName:(id)a30 detectionVocabularyName:(id)a31;
- (id)newCityNatureConfigurationAndReturnError:(id *)a3;
- (id)newClassifierAlphaConfigurationAndReturnError:(id *)a3;
- (id)newClassifierBetaConfigurationAndReturnError:(id *)a3;
- (id)newJunkHierarchicalConfigurationAndReturnError:(id *)a3;
- (id)newJunkLeafConfigurationAndReturnError:(id *)a3;
- (id)sceneTaxonomyWithError:(id *)a3;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (void)setComputeDevice:(id)a3;
@end

@implementation CSUSceneNetV5Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (id)sceneNetV5ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v44 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  uint64_t v42 = objc_msgSend__resolvedRevision_(a1, v12, a3, v13, v14);
  if ((unint64_t)(v42 - 1) >= 3)
  {
    if (a4)
    {
      v32 = NSString;
      v33 = objc_msgSend_numberWithInteger_(NSNumber, v15, a3, v16, v17);
      v37 = objc_msgSend_stringWithFormat_(v32, v34, @"Unsupported SceneNetV5 revision %@", v35, v36, v33);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v38, (uint64_t)v37, v39, v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v31 = 0;
      v19 = 0;
      v21 = 0;
      a4 = 0;
    }
    else
    {
      v31 = 0;
      v19 = 0;
      v21 = 0;
    }
    v24 = 0;
    IsSoftmax_detectionNMSThreshold_saliencyAttentionTensorName_saliencyAMapDimension_saliencyObjectnessTensorName_saliencyOMapDimension_fingerprintEmbeddingTensorName_fingerprintModelPath_entityNetClassificationTensorName_leafSceneClassificationVocabularyName_hierarchicalSceneClassificationVocabularyName_entityNetVocabularyName_aestheticsAttributeVocabularyName_aestheticsGlobalScoreVocabularyName_detectionVocabularyName = 0;
  }
  else
  {
    uint64_t v43 = objc_msgSend_pathForResource_ofType_inDirectory_(v44, v15, (uint64_t)off_2652E7C90[v42 - 1], @"espresso.net", (uint64_t)off_2652E7CA8[v42 - 1]);
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v44, v18, @"ENv0b_manifest", @"bplist", @"taxonomies/EntityNet/v0b/");
    v21 = objc_msgSend_pathForResource_ofType_inDirectory_(v44, v20, @"AEv8e_manifest", @"bplist", @"taxonomies/Aesthetics/v8e/");
    objc_msgSend_pathForResource_ofType_inDirectory_(v44, v22, @"ODv1b_manifest", @"bplist", @"taxonomies/ObjectDetection/v1b/");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_pathForResource_ofType_inDirectory_(v44, v23, @"fingerprint_lsh_144x2x192_seed1", @"bson", @"scenenet_v5_fingerprint/");
    id v25 = objc_alloc((Class)a1);
    v28 = @"entitynet";
    if (v42 == 1) {
      v28 = 0;
    }
    v29 = @"entitynet/labels";
    if (v42 == 1) {
      v29 = 0;
    }
    LODWORD(v27) = 1055286886;
    IsSoftmax_detectionNMSThreshold_saliencyAttentionTensorName_saliencyAMapDimension_saliencyObjectnessTensorName_saliencyOMapDimension_fingerprintEmbeddingTensorName_fingerprintModelPath_entityNetClassificationTensorName_leafSceneClassificationVocabularyName_hierarchicalSceneClassificationVocabularyName_entityNetVocabularyName_aestheticsAttributeVocabularyName_aestheticsGlobalScoreVocabularyName_detectionVocabularyName = objc_msgSend_initSceneNetV5ConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_scenePrintTensorName_sceneClassificationTensorName_sceneTaxonomyPath_aestheticsAttributesTensorName_aestheticsGlobalScoresTensorName_aestheticsTaxonomyPath_detectionScoreHeatMapName_detectionCoordinateOffsetMapName_detectionTaxonomyPath_detectionHeadIsSoftmax_detectionNMSThreshold_saliencyAttentionTensorName_saliencyAMapDimension_saliencyObjectnessTensorName_saliencyOMapDimension_fingerprintEmbeddingTensorName_fingerprintModelPath_entityNetClassificationTensorName_leafSceneClassificationVocabularyName_hierarchicalSceneClassificationVocabularyName_entityNetVocabularyName_aestheticsAttributeVocabularyName_aestheticsGlobalScoreVocabularyName_detectionVocabularyName_(v25, v26, v42, v43, @"image", 360, 4096, @"inner/sceneprint", v27, @"classification/labels", v19, @"aesthetics/attributes", @"aesthetics/scores", v21, @"detection/scores", @"detection/coordinates", a4, 0, @"saliency/map", 68, @"objectness/map", 68, @"fingerprint/embedding", v24, v29, @"scenenet_leaf", @"scenenet_hierarchical", v28, @"basic", @"global", @"main");
    v31 = (void *)v43;
  }

  return IsSoftmax_detectionNMSThreshold_saliencyAttentionTensorName_saliencyAMapDimension_saliencyObjectnessTensorName_saliencyOMapDimension_fingerprintEmbeddingTensorName_fingerprintModelPath_entityNetClassificationTensorName_leafSceneClassificationVocabularyName_hierarchicalSceneClassificationVocabularyName_entityNetVocabularyName_aestheticsAttributeVocabularyName_aestheticsGlobalScoreVocabularyName_detectionVocabularyName;
}

- (id)initSceneNetV5ConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 scenePrintTensorName:(id)a8 sceneClassificationTensorName:(id)a9 sceneTaxonomyPath:(id)a10 aestheticsAttributesTensorName:(id)a11 aestheticsGlobalScoresTensorName:(id)a12 aestheticsTaxonomyPath:(id)a13 detectionScoreHeatMapName:(id)a14 detectionCoordinateOffsetMapName:(id)a15 detectionTaxonomyPath:(id)a16 detectionHeadIsSoftmax:(BOOL)a17 detectionNMSThreshold:(float)a18 saliencyAttentionTensorName:(id)a19 saliencyAMapDimension:(unint64_t)a20 saliencyObjectnessTensorName:(id)a21 saliencyOMapDimension:(unint64_t)a22 fingerprintEmbeddingTensorName:(id)a23 fingerprintModelPath:(id)a24 entityNetClassificationTensorName:(id)a25 leafSceneClassificationVocabularyName:(id)a26 hierarchicalSceneClassificationVocabularyName:(id)a27 entityNetVocabularyName:(id)a28 aestheticsAttributeVocabularyName:(id)a29 aestheticsGlobalScoreVocabularyName:(id)a30 detectionVocabularyName:(id)a31
{
  id v220 = a4;
  id v34 = a5;
  id v35 = a8;
  id v36 = a9;
  id v37 = a10;
  v38 = v35;
  id v219 = a11;
  uint64_t v39 = v34;
  id v218 = a12;
  id v217 = a13;
  id v216 = a14;
  id v215 = a15;
  id v214 = a16;
  id v213 = a19;
  id v212 = a21;
  id v211 = a23;
  id v40 = a24;
  id v41 = a25;
  id v209 = a26;
  id v208 = a27;
  id v207 = a28;
  id v206 = a29;
  id v205 = a30;
  id v204 = a31;
  v221.receiver = self;
  v221.super_class = (Class)CSUSceneNetV5Configuration;
  uint64_t v42 = [(CSUSceneNetV5Configuration *)&v221 init];
  v47 = v42;
  if (v42)
  {
    v42->_revision = a3;
    uint64_t v48 = objc_msgSend_copy(v220, v43, v44, v45, v46);
    espressoNetworkPath = v47->_espressoNetworkPath;
    v47->_espressoNetworkPath = (NSString *)v48;

    uint64_t v54 = objc_msgSend_copy(v39, v50, v51, v52, v53);
    inputImageTensorName = v47->_inputImageTensorName;
    v47->_inputImageTensorName = (NSString *)v54;

    uint64_t v60 = objc_msgSend_copy(v38, v56, v57, v58, v59);
    scenePrintTensorName = v47->_scenePrintTensorName;
    v47->_scenePrintTensorName = (NSString *)v60;

    uint64_t v66 = objc_msgSend_copy(v36, v62, v63, v64, v65);
    sceneClassificationTensorName = v47->_sceneClassificationTensorName;
    v47->_sceneClassificationTensorName = (NSString *)v66;

    uint64_t v72 = objc_msgSend_copy(v37, v68, v69, v70, v71);
    sceneTaxonomyPath = v47->_sceneTaxonomyPath;
    v47->_sceneTaxonomyPath = (NSString *)v72;

    uint64_t v78 = objc_msgSend_copy(v219, v74, v75, v76, v77);
    aestheticsAttributesTensorName = v47->_aestheticsAttributesTensorName;
    v47->_aestheticsAttributesTensorName = (NSString *)v78;

    uint64_t v84 = objc_msgSend_copy(v218, v80, v81, v82, v83);
    aestheticsGlobalScoresTensorName = v47->_aestheticsGlobalScoresTensorName;
    v47->_aestheticsGlobalScoresTensorName = (NSString *)v84;

    uint64_t v90 = objc_msgSend_copy(v217, v86, v87, v88, v89);
    aestheticsTaxonomyPath = v47->_aestheticsTaxonomyPath;
    v47->_aestheticsTaxonomyPath = (NSString *)v90;

    uint64_t v96 = objc_msgSend_copy(v216, v92, v93, v94, v95);
    detectionScoreHeatMapName = v47->_detectionScoreHeatMapName;
    v47->_detectionScoreHeatMapName = (NSString *)v96;

    uint64_t v102 = objc_msgSend_copy(v215, v98, v99, v100, v101);
    detectionCoordinateOffsetMapName = v47->_detectionCoordinateOffsetMapName;
    v47->_detectionCoordinateOffsetMapName = (NSString *)v102;

    uint64_t v108 = objc_msgSend_copy(v214, v104, v105, v106, v107);
    detectionTaxonomyPath = v47->_detectionTaxonomyPath;
    v47->_detectionTaxonomyPath = (NSString *)v108;

    v47->_detectionHeadIsSoftmax = a17;
    v47->_detectionNMSThreshold = a18;
    uint64_t v114 = objc_msgSend_copy(v213, v110, v111, v112, v113);
    saliencyAttentionTensorName = v47->_saliencyAttentionTensorName;
    v47->_saliencyAttentionTensorName = (NSString *)v114;

    uint64_t v120 = objc_msgSend_copy(v212, v116, v117, v118, v119);
    saliencyObjectnessTensorName = v47->_saliencyObjectnessTensorName;
    v47->_saliencyObjectnessTensorName = (NSString *)v120;

    uint64_t v126 = objc_msgSend_copy(v211, v122, v123, v124, v125);
    fingerprintEmbeddingTensorName = v47->_fingerprintEmbeddingTensorName;
    v47->_fingerprintEmbeddingTensorName = (NSString *)v126;

    uint64_t v132 = objc_msgSend_copy(v40, v128, v129, v130, v131);
    fingerprintModelPath = v47->_fingerprintModelPath;
    v47->_fingerprintModelPath = (NSString *)v132;

    uint64_t v138 = objc_msgSend_copy(v41, v134, v135, v136, v137);
    entityNetClassificationTensorName = v47->_entityNetClassificationTensorName;
    v47->_entityNetClassificationTensorName = (NSString *)v138;

    v140 = objc_alloc_init(CSUPixelBufferDescriptor);
    inputPixelBufferDescriptor = v47->_inputPixelBufferDescriptor;
    v47->_inputPixelBufferDescriptor = v140;

    objc_msgSend_setWidth_(v47->_inputPixelBufferDescriptor, v142, a6, v143, v144);
    objc_msgSend_setHeight_(v47->_inputPixelBufferDescriptor, v145, a6, v146, v147);
    objc_msgSend_setPixelFormat_(v47->_inputPixelBufferDescriptor, v148, 1111970369, v149, v150);
    objc_msgSend_setBytesPerRowAlignment_(v47->_inputPixelBufferDescriptor, v151, a7, v152, v153);
    objc_msgSend_setIsIOSurfaceBacked_(v47->_inputPixelBufferDescriptor, v154, 1, v155, v156);
    v157 = objc_alloc_init(CSUPixelBufferDescriptor);
    saliencyAttentionMapBufferDescriptor = v47->_saliencyAttentionMapBufferDescriptor;
    v47->_saliencyAttentionMapBufferDescriptor = v157;

    objc_msgSend_setWidth_(v47->_saliencyAttentionMapBufferDescriptor, v159, a20, v160, v161);
    objc_msgSend_setHeight_(v47->_saliencyAttentionMapBufferDescriptor, v162, a20, v163, v164);
    objc_msgSend_setPixelFormat_(v47->_saliencyAttentionMapBufferDescriptor, v165, 1278226534, v166, v167);
    v168 = v47->_saliencyAttentionMapBufferDescriptor;
    uint64_t v173 = objc_msgSend_width(v168, v169, v170, v171, v172);
    objc_msgSend_setBytesPerRowAlignment_(v168, v174, 4 * v173, v175, v176);
    v177 = objc_alloc_init(CSUPixelBufferDescriptor);
    saliencyObjectnessMapBufferDescriptor = v47->_saliencyObjectnessMapBufferDescriptor;
    v47->_saliencyObjectnessMapBufferDescriptor = v177;

    objc_msgSend_setWidth_(v47->_saliencyObjectnessMapBufferDescriptor, v179, a22, v180, v181);
    objc_msgSend_setHeight_(v47->_saliencyObjectnessMapBufferDescriptor, v182, a22, v183, v184);
    objc_msgSend_setPixelFormat_(v47->_saliencyObjectnessMapBufferDescriptor, v185, 1278226534, v186, v187);
    v188 = v47->_saliencyAttentionMapBufferDescriptor;
    uint64_t v193 = objc_msgSend_width(v47->_saliencyObjectnessMapBufferDescriptor, v189, v190, v191, v192);
    objc_msgSend_setBytesPerRowAlignment_(v188, v194, 4 * v193, v195, v196);
    objc_storeStrong((id *)&v47->_leafSceneClassificationVocabularyName, a26);
    objc_storeStrong((id *)&v47->_hierarchicalSceneClassificationVocabularyName, a27);
    objc_storeStrong((id *)&v47->_entityNetVocabularyName, a28);
    objc_storeStrong((id *)&v47->_aestheticsAttributeVocabularyName, a29);
    objc_storeStrong((id *)&v47->_aestheticsGlobalScoreVocabularyName, a30);
    objc_storeStrong((id *)&v47->_detectionVocabularyName, a31);
    sceneTaxonomy = v47->_sceneTaxonomy;
    v47->_sceneTaxonomy = 0;

    detectionTaxonomy = v47->_detectionTaxonomy;
    v47->_detectionTaxonomy = 0;

    aestheticsTaxonomy = v47->_aestheticsTaxonomy;
    v47->_aestheticsTaxonomy = 0;
  }
  return v47;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 3, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 1, v7, v8);
  return v2;
}

- (int)espressoExecutionEngine
{
  uint64_t v5 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  int v6 = sub_24C689C00(v5);

  return v6;
}

- (id)newJunkLeafConfigurationAndReturnError:(id *)a3
{
  int64_t revision = self->_revision;
  if ((unint64_t)(revision - 1) > 2)
  {
    if (a3)
    {
      uint64_t v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, revision, v3, v4);
      uint64_t v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported Custom Classifer for Junk Leaf corresponding to SceneNetV5 revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_junkLeafConfigurationForRevision_error_(CSUSceneNetV5CustomClassifierConfiguration, a2, -1, (uint64_t)a3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)newClassifierAlphaConfigurationAndReturnError:(id *)a3
{
  int64_t revision = self->_revision;
  if ((unint64_t)(revision - 1) > 2)
  {
    if (a3)
    {
      uint64_t v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, revision, v3, v4);
      uint64_t v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported Custom Classifer for CSU240a5b55fd50f267 corresponding to SceneNetV5 revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_classifierAlphaConfigurationForRevision_error_(CSUSceneNetV5CustomClassifierConfiguration, a2, -1, (uint64_t)a3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)newJunkHierarchicalConfigurationAndReturnError:(id *)a3
{
  int64_t revision = self->_revision;
  if ((unint64_t)(revision - 1) > 2)
  {
    if (a3)
    {
      uint64_t v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, revision, v3, v4);
      uint64_t v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported Custom Classifer for Junk Hierarchical corresponding to SceneNetV5 revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_junkHierarchicalConfigurationForRevision_error_(CSUSceneNetV5CustomClassifierConfiguration, a2, -1, (uint64_t)a3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)newCityNatureConfigurationAndReturnError:(id *)a3
{
  int64_t revision = self->_revision;
  if ((unint64_t)(revision - 1) > 2)
  {
    if (a3)
    {
      uint64_t v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, revision, v3, v4);
      uint64_t v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported Custom Classifer for City Nature corresponding to SceneNetV5 revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_cityNatureConfigurationForRevision_error_(CSUSceneNetV5CustomClassifierConfiguration, a2, -1, (uint64_t)a3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)newClassifierBetaConfigurationAndReturnError:(id *)a3
{
  int64_t revision = self->_revision;
  if ((unint64_t)(revision - 1) > 2)
  {
    if (a3)
    {
      uint64_t v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, revision, v3, v4);
      uint64_t v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported Custom Classifer for CSU46e61bcf56c2de0a corresponding to SceneNetV5 revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_classifierBetaConfigurationForRevision_error_(CSUSceneNetV5CustomClassifierConfiguration, a2, -1, (uint64_t)a3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)sceneTaxonomyWithError:(id *)a3
{
  sceneTaxonomy = self->_sceneTaxonomy;
  if (sceneTaxonomy)
  {
  }
  else
  {
    uint64_t v7 = [CSUSceneNetV5SceneTaxonomy alloc];
    uint64_t v12 = objc_msgSend_sceneTaxonomyPath(self, v8, v9, v10, v11);
    uint64_t v15 = (CSUSceneNetV5SceneTaxonomy *)objc_msgSend_initWithManifestPath_error_(v7, v13, (uint64_t)v12, (uint64_t)a3, v14);
    uint64_t v16 = self->_sceneTaxonomy;
    self->_sceneTaxonomy = v15;

    sceneTaxonomy = self->_sceneTaxonomy;
  }
  return sceneTaxonomy;
}

- (id)aestheticsTaxonomyWithError:(id *)a3
{
  aestheticsTaxonomy = self->_aestheticsTaxonomy;
  if (aestheticsTaxonomy)
  {
  }
  else
  {
    uint64_t v7 = [CSUSceneNetV5AestheticsTaxonomy alloc];
    uint64_t v12 = objc_msgSend_aestheticsTaxonomyPath(self, v8, v9, v10, v11);
    uint64_t v15 = (CSUSceneNetV5AestheticsTaxonomy *)objc_msgSend_initWithManifestPath_error_(v7, v13, (uint64_t)v12, (uint64_t)a3, v14);
    uint64_t v16 = self->_aestheticsTaxonomy;
    self->_aestheticsTaxonomy = v15;

    aestheticsTaxonomy = self->_aestheticsTaxonomy;
  }
  return aestheticsTaxonomy;
}

- (id)detectionTaxonomyWithError:(id *)a3
{
  detectionTaxonomy = self->_detectionTaxonomy;
  if (detectionTaxonomy)
  {
  }
  else
  {
    uint64_t v7 = [CSUSceneNetV5DetectionTaxonomy alloc];
    uint64_t v12 = objc_msgSend_detectionTaxonomyPath(self, v8, v9, v10, v11);
    uint64_t v15 = (CSUSceneNetV5DetectionTaxonomy *)objc_msgSend_initWithManifestPath_error_(v7, v13, (uint64_t)v12, (uint64_t)a3, v14);
    uint64_t v16 = self->_detectionTaxonomy;
    self->_detectionTaxonomy = v15;

    detectionTaxonomy = self->_detectionTaxonomy;
  }
  return detectionTaxonomy;
}

- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor
{
  return self->_inputPixelBufferDescriptor;
}

- (CSUPixelBufferDescriptor)saliencyAttentionMapBufferDescriptor
{
  return self->_saliencyAttentionMapBufferDescriptor;
}

- (CSUPixelBufferDescriptor)saliencyObjectnessMapBufferDescriptor
{
  return self->_saliencyObjectnessMapBufferDescriptor;
}

- (int64_t)revision
{
  return self->_revision;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (NSString)leafSceneClassificationVocabularyName
{
  return self->_leafSceneClassificationVocabularyName;
}

- (NSString)hierarchicalSceneClassificationVocabularyName
{
  return self->_hierarchicalSceneClassificationVocabularyName;
}

- (NSString)entityNetVocabularyName
{
  return self->_entityNetVocabularyName;
}

- (NSString)aestheticsAttributeVocabularyName
{
  return self->_aestheticsAttributeVocabularyName;
}

- (NSString)aestheticsGlobalScoreVocabularyName
{
  return self->_aestheticsGlobalScoreVocabularyName;
}

- (NSString)detectionVocabularyName
{
  return self->_detectionVocabularyName;
}

- (NSString)espressoNetworkPath
{
  return self->_espressoNetworkPath;
}

- (NSString)inputImageTensorName
{
  return self->_inputImageTensorName;
}

- (NSString)scenePrintTensorName
{
  return self->_scenePrintTensorName;
}

- (NSString)sceneClassificationTensorName
{
  return self->_sceneClassificationTensorName;
}

- (NSString)sceneTaxonomyPath
{
  return self->_sceneTaxonomyPath;
}

- (NSString)aestheticsAttributesTensorName
{
  return self->_aestheticsAttributesTensorName;
}

- (NSString)aestheticsGlobalScoresTensorName
{
  return self->_aestheticsGlobalScoresTensorName;
}

- (NSString)aestheticsTaxonomyPath
{
  return self->_aestheticsTaxonomyPath;
}

- (NSString)detectionScoreHeatMapName
{
  return self->_detectionScoreHeatMapName;
}

- (NSString)detectionCoordinateOffsetMapName
{
  return self->_detectionCoordinateOffsetMapName;
}

- (NSString)detectionTaxonomyPath
{
  return self->_detectionTaxonomyPath;
}

- (BOOL)detectionHeadIsSoftmax
{
  return self->_detectionHeadIsSoftmax;
}

- (float)detectionNMSThreshold
{
  return self->_detectionNMSThreshold;
}

- (NSString)saliencyAttentionTensorName
{
  return self->_saliencyAttentionTensorName;
}

- (NSString)saliencyObjectnessTensorName
{
  return self->_saliencyObjectnessTensorName;
}

- (NSString)fingerprintEmbeddingTensorName
{
  return self->_fingerprintEmbeddingTensorName;
}

- (NSString)fingerprintModelPath
{
  return self->_fingerprintModelPath;
}

- (NSString)entityNetClassificationTensorName
{
  return self->_entityNetClassificationTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityNetClassificationTensorName, 0);
  objc_storeStrong((id *)&self->_fingerprintModelPath, 0);
  objc_storeStrong((id *)&self->_fingerprintEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessTensorName, 0);
  objc_storeStrong((id *)&self->_saliencyAttentionTensorName, 0);
  objc_storeStrong((id *)&self->_detectionTaxonomyPath, 0);
  objc_storeStrong((id *)&self->_detectionCoordinateOffsetMapName, 0);
  objc_storeStrong((id *)&self->_detectionScoreHeatMapName, 0);
  objc_storeStrong((id *)&self->_aestheticsTaxonomyPath, 0);
  objc_storeStrong((id *)&self->_aestheticsGlobalScoresTensorName, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributesTensorName, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyPath, 0);
  objc_storeStrong((id *)&self->_sceneClassificationTensorName, 0);
  objc_storeStrong((id *)&self->_scenePrintTensorName, 0);
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_detectionVocabularyName, 0);
  objc_storeStrong((id *)&self->_aestheticsGlobalScoreVocabularyName, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributeVocabularyName, 0);
  objc_storeStrong((id *)&self->_entityNetVocabularyName, 0);
  objc_storeStrong((id *)&self->_hierarchicalSceneClassificationVocabularyName, 0);
  objc_storeStrong((id *)&self->_leafSceneClassificationVocabularyName, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessMapBufferDescriptor, 0);
  objc_storeStrong((id *)&self->_saliencyAttentionMapBufferDescriptor, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
  objc_storeStrong((id *)&self->_detectionTaxonomy, 0);
  objc_storeStrong((id *)&self->_aestheticsTaxonomy, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

@end