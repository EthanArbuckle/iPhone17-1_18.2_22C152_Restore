@interface WFStorageServicePickerParameter
+ (id)referencedActionResourceClasses;
- (BOOL)isHidden;
- (WFiCloudDriveAccessResource)iCloudDriveAccessResource;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)defaultSupportedVariableTypes;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (void)setActionResources:(id)a3;
- (void)setICloudDriveAccessResource:(id)a3;
@end

@implementation WFStorageServicePickerParameter

+ (id)referencedActionResourceClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudDriveAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (void)setICloudDriveAccessResource:(id)a3
{
}

- (WFiCloudDriveAccessResource)iCloudDriveAccessResource
{
  return self->_iCloudDriveAccessResource;
}

- (id)defaultSerializedRepresentation
{
  uint64_t v3 = [(WFStorageServicePickerParameter *)self definition];
  v4 = [v3 objectForKey:@"AlwaysRequiresServiceResource"];
  if ([v4 BOOLValue])
  {
    v5 = [(WFStorageServicePickerParameter *)self iCloudDriveAccessResource];
    int v6 = [v5 isAvailable];

    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = (void *)MEMORY[0x263F86F00];
  v9 = +[WFDefaultFileStorageService serviceName];
  v7 = [v8 serializedRepresentationFromValue:v9];

LABEL_6:
  return v7;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = +[WFStorageServiceRegistry sharedRegistry];
    v5 = [v4 storageServices];
    objc_msgSend(v5, "if_map:", &__block_literal_global_30020);
    int v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __49__WFStorageServicePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = objc_opt_class();

  int v6 = [v5 serviceName];
  v7 = (void *)[v4 initWithValue:v6];

  return v7;
}

- (BOOL)isHidden
{
  v2 = [(WFStorageServicePickerParameter *)self possibleStates];
  BOOL v3 = (unint64_t)[v2 count] < 2;

  return v3;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F85308];
  id v4 = [a3 value];
  v5 = [v3 workflowKitImageNamed:v4];
  int v6 = [v5 imageWithRenderingMode:1];

  return v6;
}

- (void)setActionResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [a3 anyObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315906;
      v11 = "WFEnforceClass";
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      id v9 = v15;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  [(WFStorageServicePickerParameter *)self setICloudDriveAccessResource:v7];
}

@end