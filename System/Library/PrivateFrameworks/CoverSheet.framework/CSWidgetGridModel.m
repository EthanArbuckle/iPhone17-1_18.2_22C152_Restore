@interface CSWidgetGridModel
- (CSApplicationInforming)applicationInformer;
- (CSWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5;
- (void)setApplicationInformer:(id)a3;
- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4;
- (void)validateIconsForAvailableWidgets;
@end

@implementation CSWidgetGridModel

- (CSWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSWidgetGridModel;
  v5 = [(PRWidgetGridModel *)&v9 initWithComplicationDescriptors:a3 iconLayout:a4 type:a5];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    removedDescriptorToIndex = v5->_removedDescriptorToIndex;
    v5->_removedDescriptorToIndex = v6;
  }
  return v5;
}

- (void)validateIconsForAvailableWidgets
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v22 = [(PRWidgetGridModel *)self complicationDescriptors];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_posterComplicationDescriptors;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
        v8 = [v7 widgetDescriptor];
        objc_super v9 = [v8 effectiveContainerBundleIdentifier];
        if (([v7 hasMatchingDescriptor] & 1) == 0)
        {
          char v11 = [(CSApplicationInforming *)self->_applicationInformer applicationExistsForBundleIdentifier:v9];
          int v12 = [(CSApplicationInforming *)self->_applicationInformer isInstallingApplicationWithBundleIdentifier:v9];
          if ((v11 & 1) == 0 && !v12) {
            goto LABEL_14;
          }
        }
        v10 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v9];
        if ([v10 isLocked])
        {

LABEL_14:
          v17 = [(PRWidgetGridModel *)self removeComplicationDescriptor:v7];
          [(NSMutableDictionary *)self->_removedDescriptorToIndex setObject:v17 forKeyedSubscript:v7];
          v18 = SBLogDashBoard();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v7;
            __int16 v30 = 2114;
            v31 = self;
            v19 = v18;
            v20 = "Removed %{public}@ from widget grid %{public}@";
            goto LABEL_16;
          }
          goto LABEL_17;
        }
        char v13 = [v10 isHidden];

        if (v13) {
          goto LABEL_14;
        }
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
        v15 = [v14 applicationState];
        int v16 = [v15 isRestricted];

        if (v16) {
          goto LABEL_14;
        }
        if (([v22 containsObject:v7] & 1) == 0)
        {
          v17 = [(NSMutableDictionary *)self->_removedDescriptorToIndex objectForKeyedSubscript:v7];
          [(PRWidgetGridModel *)self addComplicationDescriptor:v7 withGridIndex:v17];
          v18 = SBLogDashBoard();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v7;
            __int16 v30 = 2114;
            v31 = self;
            v19 = v18;
            v20 = "Adding %{public}@ back to widget grid %{public}@";
LABEL_16:
            _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
          }
LABEL_17:
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      uint64_t v4 = v21;
    }
    while (v21);
  }
}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = (NSArray *)[[v6 alloc] initWithArray:v8 copyItems:1];
  posterComplicationDescriptors = self->_posterComplicationDescriptors;
  self->_posterComplicationDescriptors = v9;

  v11.receiver = self;
  v11.super_class = (Class)CSWidgetGridModel;
  [(PRWidgetGridModel *)&v11 setComplicationDescriptors:v8 iconLayout:v7];
}

- (CSApplicationInforming)applicationInformer
{
  return self->_applicationInformer;
}

- (void)setApplicationInformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_removedDescriptorToIndex, 0);

  objc_storeStrong((id *)&self->_posterComplicationDescriptors, 0);
}

@end