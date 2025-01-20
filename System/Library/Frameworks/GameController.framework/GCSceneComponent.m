@interface GCSceneComponent
- (GCSceneComponent)init;
- (GCSceneComponent)initWithScene:(id)a3;
- (UIScene)_scene;
- (void)_setScene:(id)a3;
- (void)prepareSystemUIWithView:(id)a3;
@end

@implementation GCSceneComponent

- (GCSceneComponent)initWithScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v8 handleFailureInMethod:a2 object:self file:@"GCSceneComponent.m" lineNumber:23 description:@"Only UIWindowScene is supported for game controller scene components."];
  }
  v9.receiver = self;
  v9.super_class = (Class)GCSceneComponent;
  v6 = [(GCSceneComponent *)&v9 init];
  objc_storeWeak((id *)&v6->_scene, v5);

  return v6;
}

- (GCSceneComponent)init
{
  return 0;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)prepareSystemUIWithView:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(v3, "interactions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5)
  {

LABEL_13:
    v12 = objc_alloc_init(GCEventInteraction);
    [(GCEventInteraction *)v12 setHandledEventTypes:0];
    [v3 addInteraction:v12];

    v7 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;

        v7 = v11;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);

  if (!v7) {
    goto LABEL_13;
  }
LABEL_14:
}

@end