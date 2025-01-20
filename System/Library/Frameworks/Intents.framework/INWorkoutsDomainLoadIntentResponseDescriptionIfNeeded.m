@interface INWorkoutsDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INWorkoutsDomainLoadIntentResponseDescriptionIfNeeded

void ___INWorkoutsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v47[5] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  v41 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v40 = [(INIntentResponseDescription *)v0 initWithName:@"CancelWorkoutIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.fitness.CancelWorkoutIntentResponse" isPrivate:0 slotsByName:v41];
  v47[0] = v40;
  v4 = [INIntentResponseDescription alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v39 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v7 = [(INIntentResponseDescription *)v4 initWithName:@"EndWorkoutIntentResponse" facadeClass:v5 dataClass:v6 type:@"sirikit.intent.fitness.EndWorkoutIntentResponse" isPrivate:0 slotsByName:v39];
  v47[1] = v7;
  v8 = [INIntentResponseDescription alloc];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v12 = [(INIntentResponseDescription *)v8 initWithName:@"PauseWorkoutIntentResponse" facadeClass:v9 dataClass:v10 type:@"sirikit.intent.fitness.PauseWorkoutIntentResponse" isPrivate:0 slotsByName:v11];
  v47[2] = v12;
  v13 = [INIntentResponseDescription alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v17 = [(INIntentResponseDescription *)v13 initWithName:@"ResumeWorkoutIntentResponse" facadeClass:v14 dataClass:v15 type:@"sirikit.intent.fitness.ResumeWorkoutIntentResponse" isPrivate:0 slotsByName:v16];
  v47[3] = v17;
  v18 = [INIntentResponseDescription alloc];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v21 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v22 = [(INIntentResponseDescription *)v18 initWithName:@"StartWorkoutIntentResponse" facadeClass:v19 dataClass:v20 type:@"sirikit.intent.fitness.StartWorkoutIntentResponse" isPrivate:0 slotsByName:v21];
  v47[4] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:5];

  uint64_t v24 = [v23 count];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v33 = [v32 name];
        [v25 setObject:v32 forKey:v33];

        v34 = [v32 type];
        [v26 setObject:v32 forKey:v34];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v29);
  }

  uint64_t v35 = [v25 copy];
  v36 = (void *)sWorkoutsDomain_intentResponseDescsByName;
  sWorkoutsDomain_intentResponseDescsByName = v35;

  uint64_t v37 = [v26 copy];
  v38 = (void *)sWorkoutsDomain_intentResponseDescsByType;
  sWorkoutsDomain_intentResponseDescsByType = v37;
}

@end