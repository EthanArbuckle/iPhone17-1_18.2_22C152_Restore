@interface MLCompilerOptions
+ (id)defaultOptions;
- (BOOL)allowMultipleInputsWithEnumeratedShapes;
- (BOOL)allowsPixelBufferDirectBinding;
- (BOOL)containerIsCloud;
- (BOOL)dryRun;
- (BOOL)encryptModel;
- (BOOL)trainWithMLCompute;
- (BOOL)usesCodeSigningIdentityForEncryption;
- (MLCompilerOptions)init;
- (NSData)iv;
- (NSData)key;
- (NSData)mlsinf;
- (NSData)sinf;
- (NSMutableArray)warnings;
- (NSNumber)keyInfoVersion;
- (NSString)keyID;
- (NSString)platform;
- (NSString)platformVersion;
- (NSURL)specURL;
- (int)mlProgramAddDuringCompilationMode;
- (void)setAllowMultipleInputsWithEnumeratedShapes:(BOOL)a3;
- (void)setAllowsPixelBufferDirectBinding:(BOOL)a3;
- (void)setContainerIsCloud:(BOOL)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setEncryptModel:(BOOL)a3;
- (void)setIv:(id)a3;
- (void)setKey:(id)a3;
- (void)setKeyID:(id)a3;
- (void)setKeyInfoVersion:(id)a3;
- (void)setMlProgramAddDuringCompilationMode:(int)a3;
- (void)setMlsinf:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPlatformVersion:(id)a3;
- (void)setSinf:(id)a3;
- (void)setSpecURL:(id)a3;
- (void)setTrainWithMLCompute:(BOOL)a3;
- (void)setUsesCodeSigningIdentityForEncryption:(BOOL)a3;
- (void)setWarnings:(id)a3;
@end

@implementation MLCompilerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_specURL, 0);
  objc_storeStrong((id *)&self->_mlsinf, 0);
  objc_storeStrong((id *)&self->_sinf, 0);
  objc_storeStrong((id *)&self->_iv, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_keyInfoVersion, 0);
  objc_storeStrong((id *)&self->_platformVersion, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

- (void)setWarnings:(id)a3
{
}

- (NSMutableArray)warnings
{
  return self->_warnings;
}

- (void)setAllowMultipleInputsWithEnumeratedShapes:(BOOL)a3
{
  self->_allowMultipleInputsWithEnumeratedShapes = a3;
}

- (BOOL)allowMultipleInputsWithEnumeratedShapes
{
  return self->_allowMultipleInputsWithEnumeratedShapes;
}

- (void)setMlProgramAddDuringCompilationMode:(int)a3
{
  self->_mlProgramAddDuringCompilationMode = a3;
}

- (int)mlProgramAddDuringCompilationMode
{
  return self->_mlProgramAddDuringCompilationMode;
}

- (void)setSpecURL:(id)a3
{
}

- (NSURL)specURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMlsinf:(id)a3
{
}

- (NSData)mlsinf
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSinf:(id)a3
{
}

- (NSData)sinf
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIv:(id)a3
{
}

- (NSData)iv
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUsesCodeSigningIdentityForEncryption:(BOOL)a3
{
  self->_usesCodeSigningIdentityForEncryption = a3;
}

- (BOOL)usesCodeSigningIdentityForEncryption
{
  return self->_usesCodeSigningIdentityForEncryption;
}

- (void)setKey:(id)a3
{
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyID:(id)a3
{
}

- (NSString)keyID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyInfoVersion:(id)a3
{
}

- (NSNumber)keyInfoVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncryptModel:(BOOL)a3
{
  self->_encryptModel = a3;
}

- (BOOL)encryptModel
{
  return self->_encryptModel;
}

- (void)setAllowsPixelBufferDirectBinding:(BOOL)a3
{
  self->_allowsPixelBufferDirectBinding = a3;
}

- (BOOL)allowsPixelBufferDirectBinding
{
  return self->_allowsPixelBufferDirectBinding;
}

- (void)setTrainWithMLCompute:(BOOL)a3
{
  self->_trainWithMLCompute = a3;
}

- (BOOL)trainWithMLCompute
{
  return self->_trainWithMLCompute;
}

- (void)setContainerIsCloud:(BOOL)a3
{
  self->_containerIsCloud = a3;
}

- (BOOL)containerIsCloud
{
  return self->_containerIsCloud;
}

- (void)setPlatformVersion:(id)a3
{
}

- (NSString)platformVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (MLCompilerOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLCompilerOptions;
  result = [(MLCompilerOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_dryRun = 0;
    result->_allowsPixelBufferDirectBinding = 0;
  }
  return result;
}

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end