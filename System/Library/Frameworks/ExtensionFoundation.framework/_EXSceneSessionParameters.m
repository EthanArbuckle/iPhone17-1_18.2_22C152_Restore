@interface _EXSceneSessionParameters
+ (BOOL)supportsSecureCoding;
- (NSString)sceneIdentifier;
- (_EXPromise)initializationParametersPromise;
- (_EXSceneSessionParameters)initWithCoder:(id)a3;
- (int64_t)sizeBridgingOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setInitializationParametersPromise:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSizeBridgingOptions:(int64_t)a3;
@end

@implementation _EXSceneSessionParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_sceneIdentifier forKey:@"sceneIdentifier"];
  initializationParametersPromise = self->_initializationParametersPromise;
  if (initializationParametersPromise) {
    [v5 encodeObject:initializationParametersPromise forKey:@"initializationPromise"];
  }
  [v5 encodeInteger:self->_sizeBridgingOptions forKey:@"sizeBridgingOptions"];
}

- (_EXSceneSessionParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXSceneSessionParameters;
  id v5 = [(_EXSceneSessionParameters *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initializationPromise"];
    initializationParametersPromise = v5->_initializationParametersPromise;
    v5->_initializationParametersPromise = (_EXPromise *)v8;

    v5->_sizeBridgingOptions = [v4 decodeIntegerForKey:@"sizeBridgingOptions"];
  }

  return v5;
}

- (NSString)sceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSceneIdentifier:(id)a3
{
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (_EXPromise)initializationParametersPromise
{
  return (_EXPromise *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitializationParametersPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationParametersPromise, 0);

  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end