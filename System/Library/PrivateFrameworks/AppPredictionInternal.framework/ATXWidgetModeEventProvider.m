@interface ATXWidgetModeEventProvider
- (ATXWidgetModeEventProvider)initWithInformationStore:(id)a3;
- (id)widgetEngagementCountSinceStartDate:(id)a3;
- (id)widgetModeEventsBetweenStartDate:(id)a3 endDate:(id)a4;
@end

@implementation ATXWidgetModeEventProvider

- (ATXWidgetModeEventProvider)initWithInformationStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetModeEventProvider;
  v6 = [(ATXWidgetModeEventProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_informationStore, a3);
  }

  return v7;
}

- (id)widgetModeEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  v4 = [(ATXInformationStore *)self->_informationStore fetchWidgetTapEngagementsBetweenStartDate:a3 endDate:a4];
  id v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXWidgetModeEventProvider_widgetModeEventsBetweenStartDate_endDate___block_invoke;
  v9[3] = &unk_1E68B38E8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];
  v7 = (void *)[v6 copy];

  return v7;
}

void __71__ATXWidgetModeEventProvider_widgetModeEventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [v19 containerBundleIdentifier];
  if (!v3)
  {
    v4 = [v19 widgetBundleId];
    v3 = [v4 componentsSeparatedByString:@"."];

    if ((unint64_t)[v3 count] < 2) {
      goto LABEL_5;
    }
    id v5 = objc_msgSend(v3, "subarrayWithRange:", 0, objc_msgSend(v3, "count") - 1);
    uint64_t v6 = [v5 componentsJoinedByString:@"."];

    v3 = (void *)v6;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v8 = objc_alloc(MEMORY[0x1E4F58CC0]);
  objc_super v9 = [v19 widgetBundleId];
  id v10 = (void *)[v8 initWithExtensionBundleIdentifier:v9 containerBundleIdentifier:v3 deviceIdentifier:0];
  v11 = [v19 widgetKind];
  v12 = objc_msgSend(v7, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v10, v11, objc_msgSend(v19, "widgetFamily"), 0, 0);

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4B438]) initWithWidget:v12];
  v14 = *(void **)(a1 + 32);
  v15 = [ATXModeEvent alloc];
  v16 = [v19 date];
  v17 = [v19 date];
  v18 = [(ATXModeEvent *)v15 initWithStartDate:v16 endDate:v17 entity:v13];
  [v14 addObject:v18];

LABEL_5:
}

- (id)widgetEngagementCountSinceStartDate:(id)a3
{
  return (id)[(ATXInformationStore *)self->_informationStore fetchWidgetTapEngagementCountSinceStartDate:a3];
}

- (void).cxx_destruct
{
}

@end