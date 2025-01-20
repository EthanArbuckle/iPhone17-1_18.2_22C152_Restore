@interface SCNTechnique(SCNTechniqueCompositorAdditions)
- (id)passForName:()SCNTechniqueCompositorAdditions;
@end

@implementation SCNTechnique(SCNTechniqueCompositorAdditions)

- (id)passForName:()SCNTechniqueCompositorAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 dictionaryRepresentation];
  v6 = [v5 mutableArrayValueForKey:@"sequence"];

  uint64_t v7 = [v6 indexOfObject:v4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = _ARLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v13 = 138543874;
      v14 = v10;
      __int16 v15 = 2048;
      v16 = a1;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to find index for pass: %{public}@!", (uint8_t *)&v13, 0x20u);
    }
    __assert_rtn("-[SCNTechnique(SCNTechniqueCompositorAdditions) passForName:]", "ARSCNCompositor.mm", 77, "index != NSNotFound");
  }
  v11 = [a1 passAtIndex:v7];

  return v11;
}

@end