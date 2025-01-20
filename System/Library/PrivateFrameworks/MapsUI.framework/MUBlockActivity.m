@interface MUBlockActivity
+ (id)createBlockActivitiesFromPlaceActionItems:(id)a3 usingActionManager:(id)a4 presentationOptions:(id)a5 analyticsModuleMetadata:(id)a6;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (MUBlockActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6;
- (NSString)systemImageName;
- (NSString)title;
- (NSString)type;
- (id)_systemImageName;
- (id)activityType;
- (id)block;
- (int64_t)activityCategory;
- (void)performActivity;
@end

@implementation MUBlockActivity

- (MUBlockActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MUBlockActivity;
  v15 = [(UIActivity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    v17 = _Block_copy(v14);
    id block = v16->_block;
    v16->_id block = v17;

    objc_storeStrong((id *)&v16->_type, a5);
    objc_storeStrong((id *)&v16->_systemImageName, a4);
  }

  return v16;
}

- (id)_systemImageName
{
  return self->_systemImageName;
}

- (id)activityType
{
  v3 = [(MUBlockActivity *)self type];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [(MUBlockActivity *)self title];
    id v5 = [v6 stringWithFormat:@"%@.%@", v7, v8];
  }
  return v5;
}

- (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id block = (void (**)(id, SEL))self->_block;
  if (block) {
    block[2](block, a2);
  }
  [(UIActivity *)self activityDidFinish:1];
}

- (id)block
{
  return self->_block;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
}

+ (id)createBlockActivitiesFromPlaceActionItems:(id)a3 usingActionManager:(id)a4 presentationOptions:(id)a5 analyticsModuleMetadata:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v32 = a4;
  id v10 = a5;
  id v11 = a6;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v30 = *(void *)v38;
    uint64_t v29 = *MEMORY[0x1E4F30DC8];
    uint64_t v28 = *MEMORY[0x1E4F30DC0];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        v15 = [*(id *)(*((void *)&v37 + 1) + 8 * i) resolvedActionItem];
        v16 = [v15 titleForDisplayStyle:0];
        v17 = [v15 symbolForDisplayStyle:0];
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v19 = [v10 sourceView];

        if (v19)
        {
          objc_super v20 = [v10 sourceView];
          [v18 setObject:v20 forKeyedSubscript:v29];
        }
        if (v11) {
          [v18 setObject:v11 forKeyedSubscript:v28];
        }
        v21 = [MUBlockActivity alloc];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __152__MUBlockActivity_MKPlaceActionManagerExtras__createBlockActivitiesFromPlaceActionItems_usingActionManager_presentationOptions_analyticsModuleMetadata___block_invoke;
        v33[3] = &unk_1E574F600;
        id v34 = v32;
        id v35 = v15;
        id v36 = v18;
        id v22 = v18;
        id v23 = v15;
        v24 = [(MUBlockActivity *)v21 initWithTitle:v16 systemImageName:v17 activityType:0 block:v33];
        [v31 addObject:v24];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v13);
  }

  v25 = (void *)[v31 copy];
  return v25;
}

void __152__MUBlockActivity_MKPlaceActionManagerExtras__createBlockActivitiesFromPlaceActionItems_usingActionManager_presentationOptions_analyticsModuleMetadata___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v1 performAction:v2 options:v3 completion:0];
}

@end