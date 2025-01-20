@interface SGMultiLabelEspressoClassifierWrapper
- (NSString)espressoModelFile;
- (_PASLazyPurgeableResult)classifier;
- (void)setClassifier:(id)a3;
- (void)setEspressoModelFile:(id)a3;
@end

@implementation SGMultiLabelEspressoClassifierWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

- (void)setClassifier:(id)a3
{
}

- (_PASLazyPurgeableResult)classifier
{
  return self->_classifier;
}

- (void)setEspressoModelFile:(id)a3
{
}

- (NSString)espressoModelFile
{
  return self->_espressoModelFile;
}

@end