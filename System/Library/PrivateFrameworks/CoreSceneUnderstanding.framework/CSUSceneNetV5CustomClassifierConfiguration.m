@interface CSUSceneNetV5CustomClassifierConfiguration
+ (id)availableCityNatureRevisions;
+ (id)availableClassifierAlphaRevisions;
+ (id)availableClassifierBetaRevisions;
+ (id)availableJunkHierarchicalRevisions;
+ (id)availableJunkLeafRevisions;
+ (id)cityNatureConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)classifierAlphaConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)classifierBetaConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)junkHierarchicalConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)junkLeafConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)validateAndInitCustomClassifierForRevision:(int64_t)a3 forNetworkPath:(id)a4 forTaxonomyPath:(id)a5 withInputImageTensorName:(id)a6 withVocabularyName:(id)a7 withClassificationTensorName:(id)a8 withIdentifier:(int64_t)a9 error:(id *)a10;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)classificationTensorName;
- (NSString)espressoNetworkPath;
- (NSString)inputImageTensorName;
- (NSString)taxonomyPath;
- (NSString)vocabularyName;
- (id)initConfigurationForRevision:(int64_t)a3 espressoNetworkPath:(id)a4 inputImageTensorName:(id)a5 vocabularyName:(id)a6 taxonomyPath:(id)a7 identifier:(int64_t)a8 classificationTensorName:(id)a9;
- (id)taxonomyWithError:(id *)a3;
- (int)espressoExecutionEngine;
- (int64_t)customClassifierIdentifier;
- (int64_t)revision;
- (void)setComputeDevice:(id)a3;
@end

@implementation CSUSceneNetV5CustomClassifierConfiguration

+ (id)classifierAlphaConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, @"EventsLeaf_v0.5.0_89sf2c9ryr-157700", @"espresso.net", @"scenenet_v5_custom_classifiers/EventsLeaf/EventsLeaf_v0.5.0");
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, @"Events-v1c_manifest", @"bplist", @"taxonomies/events/");
    v21 = objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, @"2590", @"basic", @"events_fc_post_act_1", 1, a4);
  }
  else
  {
    v22 = NSString;
    v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v22, v23, @"Unsupported Classifier Alpha revision %@", v24, v25, v17);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)junkLeafConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, @"JunkLeaf_v0.11.0_y8pf7cunms-10000", @"espresso.net", @"scenenet_v5_custom_classifiers/JunkLeaf/JunkLeaf_v0.11.0/");
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, @"Junk-v3b_manifest", @"bplist", @"taxonomies/junk/");
    v21 = objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, @"2593", @"leaf", @"fc_leaf_post_act_1", 2, a4);
  }
  else
  {
    v22 = NSString;
    v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v22, v23, @"Unsupported Junk Leaf revision %@", v24, v25, v17);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)junkHierarchicalConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, @"JunkHierarchical_v0.11.0_y8pf7cunms-10000", @"espresso.net", @"scenenet_v5_custom_classifiers/JunkHierarchical/JunkHierarchical_v0.11.0/");
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, @"Junk-v3b_manifest", @"bplist", @"taxonomies/junk/");
    v21 = objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, @"2593", @"hierarchical", @"fc_hier_post_act_1", 3, a4);
  }
  else
  {
    v22 = NSString;
    v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v22, v23, @"Unsupported Junk Hierarchical revision %@", v24, v25, v17);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)cityNatureConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, @"UrbanNatureLeaf_v0.1.0_ccinynq7s3-5000", @"espresso.net", @"scenenet_v5_custom_classifiers/CityNature/CityNature_v0.1.0");
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, @"CityNature-v1a_manifest", @"bplist", @"taxonomies/citynature/");
    v21 = objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, @"2590", @"basic", @"fc_leaf_post_act_1", 4, a4);
  }
  else
  {
    v22 = NSString;
    v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v22, v23, @"Unsupported CityNature revision %@", v24, v25, v17);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)classifierBetaConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v16 = v12;
  if (a3 == 1 || a3 == -1)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v13, @"semdev_23y8pwvx7w_18000", @"espresso.net", @"scenenet_v5_custom_classifiers/SemanticDevelopment/SemanticDevelopment_v1.0.0");
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v16, v18, @"SemDev-v1a_manifest", @"bplist", @"taxonomies/semanticdeveloping/");
    v21 = objc_msgSend_validateAndInitCustomClassifierForRevision_forNetworkPath_forTaxonomyPath_withInputImageTensorName_withVocabularyName_withClassificationTensorName_withIdentifier_error_(a1, v20, 1, (uint64_t)v17, (uint64_t)v19, @"2590", @"basic", @"fc_leaf_post_act_1", 5, a4);
LABEL_6:

    goto LABEL_7;
  }
  if (a4)
  {
    v22 = NSString;
    v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v22, v23, @"Unsupported Classifier Beta revision %@", v24, v25, v17);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v26, (uint64_t)v19, v27, v28);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v21 = 0;
LABEL_7:

  return v21;
}

+ (id)validateAndInitCustomClassifierForRevision:(int64_t)a3 forNetworkPath:(id)a4 forTaxonomyPath:(id)a5 withInputImageTensorName:(id)a6 withVocabularyName:(id)a7 withClassificationTensorName:(id)a8 withIdentifier:(int64_t)a9 error:(id *)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v23 = a8;
  if (v16)
  {
    if (v17)
    {
      id v24 = objc_alloc((Class)a1);
      inited = objc_msgSend_initConfigurationForRevision_espressoNetworkPath_inputImageTensorName_vocabularyName_taxonomyPath_identifier_classificationTensorName_(v24, v25, a3, (uint64_t)v16, (uint64_t)v18, v19, v17, a9, v23);
      goto LABEL_7;
    }
    objc_msgSend_errorForDataUnavailableWithLocalizedDescription_(CSUError, v20, @"Missing custom classifier taxonomy files", v21, v22);
  }
  else
  {
    objc_msgSend_errorForDataUnavailableWithLocalizedDescription_(CSUError, v20, @"Missing custom classifier network files", v21, v22);
  }
  inited = 0;
  *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return inited;
}

+ (id)availableClassifierAlphaRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableJunkLeafRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableJunkHierarchicalRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableCityNatureRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

+ (id)availableClassifierBetaRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (id)taxonomyWithError:(id *)a3
{
  taxonomy = self->_taxonomy;
  if (taxonomy)
  {
  }
  else
  {
    v7 = [CSUSceneNetV5CustomClassifierTaxonomy alloc];
    v12 = objc_msgSend_taxonomyPath(self, v8, v9, v10, v11);
    uint64_t v15 = (CSUSceneNetV5CustomClassifierTaxonomy *)objc_msgSend_initWithManifestPath_error_(v7, v13, (uint64_t)v12, (uint64_t)a3, v14);
    id v16 = self->_taxonomy;
    self->_taxonomy = v15;

    taxonomy = self->_taxonomy;
  }
  return taxonomy;
}

- (id)initConfigurationForRevision:(int64_t)a3 espressoNetworkPath:(id)a4 inputImageTensorName:(id)a5 vocabularyName:(id)a6 taxonomyPath:(id)a7 identifier:(int64_t)a8 classificationTensorName:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v53.receiver = self;
  v53.super_class = (Class)CSUSceneNetV5CustomClassifierConfiguration;
  v20 = [(CSUSceneNetV5CustomClassifierConfiguration *)&v53 init];
  uint64_t v25 = v20;
  if (v20)
  {
    v20->_revision = a3;
    uint64_t v26 = objc_msgSend_copy(v15, v21, v22, v23, v24);
    espressoNetworkPath = v25->_espressoNetworkPath;
    v25->_espressoNetworkPath = (NSString *)v26;

    uint64_t v32 = objc_msgSend_copy(v16, v28, v29, v30, v31);
    inputImageTensorName = v25->_inputImageTensorName;
    v25->_inputImageTensorName = (NSString *)v32;

    uint64_t v38 = objc_msgSend_copy(v17, v34, v35, v36, v37);
    vocabularyName = v25->_vocabularyName;
    v25->_vocabularyName = (NSString *)v38;

    uint64_t v44 = objc_msgSend_copy(v18, v40, v41, v42, v43);
    taxonomyPath = v25->_taxonomyPath;
    v25->_taxonomyPath = (NSString *)v44;

    uint64_t v50 = objc_msgSend_copy(v19, v46, v47, v48, v49);
    classificationTensorName = v25->_classificationTensorName;
    v25->_classificationTensorName = (NSString *)v50;

    v25->_customClassifierIdentifier = a8;
  }

  return v25;
}

- (int)espressoExecutionEngine
{
  uint64_t v5 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  int v6 = sub_24C689C00(v5);

  return v6;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (NSString)vocabularyName
{
  return self->_vocabularyName;
}

- (int64_t)customClassifierIdentifier
{
  return self->_customClassifierIdentifier;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)espressoNetworkPath
{
  return self->_espressoNetworkPath;
}

- (NSString)inputImageTensorName
{
  return self->_inputImageTensorName;
}

- (NSString)taxonomyPath
{
  return self->_taxonomyPath;
}

- (NSString)classificationTensorName
{
  return self->_classificationTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationTensorName, 0);
  objc_storeStrong((id *)&self->_taxonomyPath, 0);
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyName, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
}

@end