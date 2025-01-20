@interface PHASESoundPrototype
+ (PHASESoundPrototype)new;
- (NSArray)mixerInformation;
- (NSString)assetIdentifier;
- (NSString)assetUID;
- (PHASESoundPrototype)init;
- (PHASESoundPrototype)initWithEngine:(id)a3 actionTreeRootNode:(id)a4 error:(id *)a5;
- (PHASESoundPrototype)initWithEngine:(id)a3 registeredActionTreeIdentifier:(id)a4 error:(id *)a5;
- (void)deRegister;
- (void)dealloc;
- (void)setAssetIdentifier:(id)a3;
- (void)setAssetUID:(id)a3;
@end

@implementation PHASESoundPrototype

- (NSString)assetUID
{
  return self->_assetIdentifier;
}

- (void)setAssetUID:(id)a3
{
}

- (PHASESoundPrototype)init
{
  return 0;
}

+ (PHASESoundPrototype)new
{
  return 0;
}

- (PHASESoundPrototype)initWithEngine:(id)a3 registeredActionTreeIdentifier:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)PHASESoundPrototype;
    v10 = [(PHASESoundPrototype *)&v21 init];
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_engine, v8);
      objc_storeStrong((id *)&v11->_assetIdentifier, a4);
      programmaticAPIAsset = v11->_programmaticAPIAsset;
      v11->_programmaticAPIAsset = 0;
    }
    self = v11;
    v13 = self;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v28 = *MEMORY[0x263F08320];
    v15 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v29[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v16 objectForKeyedSubscript:v14];
      *(_DWORD *)buf = 136315650;
      v23 = "PHASESoundPrototype.mm";
      __int16 v24 = 1024;
      int v25 = 65;
      __int16 v26 = 2080;
      uint64_t v27 = [v19 UTF8String];
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913633 userInfo:v16];
    }

    v13 = 0;
  }

  return v13;
}

- (PHASESoundPrototype)initWithEngine:(id)a3 actionTreeRootNode:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_5;
  }
  v21.receiver = self;
  v21.super_class = (Class)PHASESoundPrototype;
  v10 = [(PHASESoundPrototype *)&v21 init];
  self = v10;
  if (!v10) {
    goto LABEL_4;
  }
  id v11 = objc_storeWeak((id *)&v10->_engine, v8);
  v12 = [v8 assetRegistry];
  v13 = [v12 getUniqueIdentifier];
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = v13;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v16 = [WeakRetained assetRegistry];
  v17 = [v16 registerSoundEventAssetWithRootNode:v9 identifier:self->_assetIdentifier error:a5];
  programmaticAPIAsset = self->_programmaticAPIAsset;
  self->_programmaticAPIAsset = v17;

  if (self->_programmaticAPIAsset)
  {
LABEL_4:
    self = self;
    id v19 = self;
  }
  else
  {
LABEL_5:
    id v19 = 0;
  }

  return v19;
}

- (void)deRegister
{
  if (self->_programmaticAPIAsset)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    v4 = [WeakRetained assetRegistry];
    v5 = [(PHASEAsset *)self->_programmaticAPIAsset identifier];
    [v4 unregisterAssetWithIdentifier:v5 completion:0];

    programmaticAPIAsset = self->_programmaticAPIAsset;
    self->_programmaticAPIAsset = 0;
  }
}

- (void)dealloc
{
  if (self->_programmaticAPIAsset) {
    [(PHASESoundPrototype *)self deRegister];
  }
  v3.receiver = self;
  v3.super_class = (Class)PHASESoundPrototype;
  [(PHASESoundPrototype *)&v3 dealloc];
}

- (NSArray)mixerInformation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v4 = [WeakRetained assetRegistry];
  v5 = [v4 mixerInformationForActionTreeWithIdentifier:self->_assetIdentifier];

  return (NSArray *)v5;
}

- (NSString)assetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_programmaticAPIAsset, 0);

  objc_destroyWeak((id *)&self->_engine);
}

@end