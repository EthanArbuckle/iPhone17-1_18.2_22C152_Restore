@interface JETreatment
+ (id)treatmentWithConfiguration:(id)a3 topic:(id)a4;
- (JETreatment)initWithConfigDictionary:(id)a3 topic:(id)a4;
- (id)performTreatment:(id)a3;
@end

@implementation JETreatment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldActions, 0);
  objc_storeStrong((id *)&self->_eventAction, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)treatmentWithConfiguration:(id)a3 topic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    v9 = [[JETreatment alloc] initWithConfigDictionary:v8 topic:v6];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (id)performTreatment:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[JETreatmentContext alloc] initWithTreatment:self metrics:v4];
  if (self)
  {
    id v6 = self->_predicate;
    if (v6)
    {
      id v7 = v6;
      BOOL v8 = [(JEMetricsDataPredicate *)self->_predicate evaluateWithMetricsData:v4];

      if (!v8) {
        goto LABEL_29;
      }
    }
    if (self->_eventAction) {
      [(JETreatmentAction *)self->_eventAction performActionWithContext:v5];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  if (self) {
    fieldActions = self->_fieldActions;
  }
  else {
    fieldActions = 0;
  }
  v10 = [(NSDictionary *)fieldActions objectEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = -[JETreatmentAction sourceField]((uint64_t)v15);

        if (v16) {
          [v15 performActionWithContext:v5];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  if (self) {
    v17 = self->_fieldActions;
  }
  else {
    v17 = 0;
  }
  v18 = [(NSDictionary *)v17 objectEnumerator];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        v24 = -[JETreatmentAction sourceField]((uint64_t)v23);

        if (!v24) {
          [v23 performActionWithContext:v5];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

LABEL_29:
  v25 = -[JETreatmentContext metrics]((uint64_t)v5);

  return v25;
}

void __46__JETreatment_initWithConfigDictionary_topic___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = +[JETreatmentAction treatmentActionWithField:configuration:topic:](JETreatmentAction, "treatmentActionWithField:configuration:topic:");
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v4];
  }
}

- (JETreatment)initWithConfigDictionary:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)JETreatment;
  BOOL v8 = [(JETreatment *)&v28 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"filters"];
    uint64_t v10 = +[JEMetricsDataPredicate predicateWithConfiguration:v9];
    predicate = v8->_predicate;
    v8->_predicate = (JEMetricsDataPredicate *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"eventActions"];
    uint64_t v13 = +[JETreatmentAction treatmentActionWithField:0 configuration:v12 topic:v7];
    eventAction = v8->_eventAction;
    v8->_eventAction = (JETreatmentAction *)v13;

    v15 = [v6 objectForKeyedSubscript:@"fieldActions"];
    objc_opt_class();
    id v16 = 0;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }

    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __46__JETreatment_initWithConfigDictionary_topic___block_invoke;
      v25 = &unk_1E59B50E8;
      id v26 = v7;
      id v27 = v17;
      id v18 = v17;
      [v16 enumerateKeysAndObjectsUsingBlock:&v22];
      uint64_t v19 = objc_msgSend(v18, "copy", v22, v23, v24, v25);
      fieldActions = v8->_fieldActions;
      v8->_fieldActions = (NSDictionary *)v19;
    }
  }

  return v8;
}

@end