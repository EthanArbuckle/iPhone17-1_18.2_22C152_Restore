@interface BWInferenceSimpleTextureStorage
- ($6B1C8249A366D7A998236AE6139054A2)entryForRequirement:(id)a3;
- (BWInferenceSimpleTextureStorage)init;
- (void)clear;
- (void)dealloc;
- (void)setEntry:(id *)a3 forRequirement:(id)a4;
- (void)setTexture:(id)a3 forRequirement:(id)a4;
@end

@implementation BWInferenceSimpleTextureStorage

- (BWInferenceSimpleTextureStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSimpleTextureStorage;
  v2 = [(BWInferenceSimpleTextureStorage *)&v7 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:1027];
    [v3 setSizeFunction:BWInferenceTextureStorageEntrySize];
    [v3 setRelinquishFunction:BWInferenceTextureStorageEntryRelinquish];
    v4 = (NSMapTable *)objc_msgSend(MEMORY[0x1E4F28E10], "bw_strongVideoRequirementToMapTableWithValueFunctions:", v3);
    v2->_entriesByRequirement = v4;
    v5 = v4;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSimpleTextureStorage;
  [(BWInferenceSimpleTextureStorage *)&v3 dealloc];
}

- ($6B1C8249A366D7A998236AE6139054A2)entryForRequirement:(id)a3
{
  return ($6B1C8249A366D7A998236AE6139054A2 *)[(NSMapTable *)self->_entriesByRequirement objectForKey:a3];
}

- (void)setEntry:(id *)a3 forRequirement:(id)a4
{
  id v7 = a3->var0.var0;
  id v8 = a3->var1;
  entriesByRequirement = self->_entriesByRequirement;
  [(NSMapTable *)entriesByRequirement setObject:a3 forKey:a4];
}

- (void)setTexture:(id)a3 forRequirement:(id)a4
{
  v6[0] = a3;
  v6[1] = 0;
  [(NSMapTable *)self->_entriesByRequirement setObject:v6 forKey:a4];
}

- (void)clear
{
}

@end