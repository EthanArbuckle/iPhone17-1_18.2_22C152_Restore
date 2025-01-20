@interface IKSplitTemplate
+ (id)supportedFeatures;
- (IKDOMFeatureNavigationDocument)leftNavigationDocument;
- (IKDOMFeatureNavigationDocument)rightNavigationDocument;
- (IKSplitTemplate)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (NSString)displayMode;
- (id)_featureWithName:(id)a3;
- (void)setDisplayMode:(id)a3;
@end

@implementation IKSplitTemplate

+ (id)supportedFeatures
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"leftNavigationDocument";
  v4[1] = @"rightNavigationDocument";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (IKSplitTemplate)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IKSplitTemplate;
  v9 = [(IKViewElement *)&v18 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"mode"];
    uint64_t v11 = [v10 copy];
    displayMode = v9->_displayMode;
    v9->_displayMode = (NSString *)v11;

    uint64_t v13 = [(IKSplitTemplate *)v9 _featureWithName:@"leftNavigationDocument"];
    leftNavigationDocument = v9->_leftNavigationDocument;
    v9->_leftNavigationDocument = (IKDOMFeatureNavigationDocument *)v13;

    uint64_t v15 = [(IKSplitTemplate *)v9 _featureWithName:@"rightNavigationDocument"];
    rightNavigationDocument = v9->_rightNavigationDocument;
    v9->_rightNavigationDocument = (IKDOMFeatureNavigationDocument *)v15;
  }
  return v9;
}

- (id)_featureWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IKViewElement *)self features];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "featureName", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
}

- (IKDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (IKDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocument, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocument, 0);
  objc_storeStrong((id *)&self->_displayMode, 0);
}

@end