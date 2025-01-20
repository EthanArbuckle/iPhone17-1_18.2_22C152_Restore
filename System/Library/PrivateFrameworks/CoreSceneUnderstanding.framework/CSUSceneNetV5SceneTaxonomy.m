@interface CSUSceneNetV5SceneTaxonomy
- (CSUSceneNetV5SceneTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4;
- (id)attributesForLabel:(id)a3 error:(id *)a4;
@end

@implementation CSUSceneNetV5SceneTaxonomy

- (CSUSceneNetV5SceneTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSUSceneNetV5SceneTaxonomy;
  v7 = [(CSUTaxonomy *)&v21 initWithManifestPath:v6 error:a4];
  v11 = (uint64_t *)v7;
  if (!v7) {
    goto LABEL_7;
  }
  if (!v7->super._labelAttributes)
  {
    if (!a4) {
      goto LABEL_8;
    }
    v17 = objc_msgSend_stringWithFormat_(NSString, v8, @"No label attributes found in SceneNet taxonomy %@", v9, v10, v6);
    objc_msgSend_errorWithCode_message_(CSUError, v18, 6, (uint64_t)v17, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a4 = 0;
    goto LABEL_8;
  }
  v12 = [CSUSceneNetV5SceneTaxonomyAttributes alloc];
  uint64_t v15 = objc_msgSend_initWithAttributePaths_error_(v12, v13, v11[2], (uint64_t)a4, v14);
  v16 = (void *)v11[11];
  v11[11] = v15;

  if (!v11[11]) {
    goto LABEL_7;
  }
  a4 = v11;
LABEL_8:

  return (CSUSceneNetV5SceneTaxonomy *)a4;
}

- (id)attributesForLabel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [CSUSceneNetV5SceneLabelAttributes alloc];
  uint64_t v9 = objc_msgSend_initWithTaxonomyAttributes_forLabel_(v6, v7, (uint64_t)self->_attributeManager, (uint64_t)v5, v8);

  return v9;
}

- (void).cxx_destruct
{
}

@end