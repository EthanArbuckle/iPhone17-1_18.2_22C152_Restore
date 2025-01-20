@interface AXElementActionManager
- (AXDragManager)dragManager;
- (AXElementActionManager)initWithDragManager:(id)a3;
- (AXElementActionManager)initWithDragServiceName:(id)a3;
- (BOOL)canShowActionsForElement:(id)a3;
- (BOOL)isDragActive;
- (BOOL)performAction:(id)a3;
- (BOOL)shouldIncludeMedusaActions;
- (id)actionsForElement:(id)a3;
- (void)setShouldIncludeMedusaActions:(BOOL)a3;
@end

@implementation AXElementActionManager

- (AXElementActionManager)initWithDragServiceName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementActionManager;
  v5 = [(AXElementActionManager *)&v9 init];
  if (v5)
  {
    v6 = [[AXDragManager alloc] initWithMachServiceName:v4];
    dragManager = v5->_dragManager;
    v5->_dragManager = v6;
  }
  return v5;
}

- (AXElementActionManager)initWithDragManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementActionManager;
  v6 = [(AXElementActionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dragManager, a3);
  }

  return v7;
}

- (BOOL)isDragActive
{
  v2 = [(AXElementActionManager *)self dragManager];
  char v3 = [v2 isDragActive];

  return v3;
}

- (BOOL)canShowActionsForElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXElementActionManager *)self isDragActive];
  v6 = [v4 customActions];
  BOOL v7 = 1;
  if (![v6 count] && !v5)
  {
    v8 = [v4 drags];
    BOOL v7 = [v8 count] != 0;
  }
  if ([(AXElementActionManager *)self shouldIncludeMedusaActions])
  {
    objc_super v9 = [MEMORY[0x1E4F49468] server];
    v10 = [v9 allowedMedusaGestures];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11 || v7;
}

- (id)actionsForElement:(id)a3
{
  v35 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v36 = v3;
  BOOL v5 = [v3 customActions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        BOOL v11 = objc_alloc_init(AXElementAction);
        [(AXElementAction *)v11 setType:0];
        [(AXElementAction *)v11 setElement:v36];
        v12 = [v10 objectForKeyedSubscript:@"CustomActionName"];
        [(AXElementAction *)v11 setName:v12];

        v13 = [v10 objectForKeyedSubscript:@"CustomActionIdentifier"];
        [(AXElementAction *)v11 setCustomActionIdentifier:v13];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v7);
  }

  if ([(AXElementActionManager *)v35 isDragActive])
  {
    v14 = [v36 drops];
    v15 = AXNamesForDrops(v14);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __44__AXElementActionManager_actionsForElement___block_invoke;
    v45[3] = &unk_1E649C2E8;
    v16 = &v46;
    v17 = &v47;
    id v46 = v36;
    v47 = v15;
    v18 = &v48;
    id v19 = v4;
    id v48 = v19;
    id v20 = v15;
    [v14 enumerateObjectsUsingBlock:v45];
    v21 = objc_alloc_init(AXElementAction);
    [(AXElementAction *)v21 setType:3];
    v22 = AXUILocalizedStringForKey(@"CANCEL_DRAG");
    [(AXElementAction *)v21 setName:v22];

    [v19 addObject:v21];
  }
  else
  {
    v14 = [v36 drags];
    v23 = AXNamesForDrags(v14);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44__AXElementActionManager_actionsForElement___block_invoke_2;
    v41[3] = &unk_1E649C2E8;
    v16 = &v42;
    v17 = &v43;
    id v42 = v36;
    v43 = v23;
    v18 = &v44;
    id v44 = v4;
    id v20 = v23;
    [v14 enumerateObjectsUsingBlock:v41];
  }

  if ([(AXElementActionManager *)v35 shouldIncludeMedusaActions])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v24 = [MEMORY[0x1E4F49468] server];
    v25 = [v24 allowedMedusaGestures];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * j), "unsignedIntegerValue", v35);
          v31 = objc_opt_new();
          [v31 setType:4];
          v32 = [MEMORY[0x1E4FB1438] sharedApplication];
          [v32 userInterfaceLayoutDirection];
          v33 = AXSBTitleForMedusaGesture();
          [v31 setName:v33];

          [v31 setMedusaGesture:v30];
          [v4 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v27);
    }
  }
  return v4;
}

void __44__AXElementActionManager_actionsForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_new();
  [v6 setType:2];
  [v6 setElement:*(void *)(a1 + 32)];
  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v6 setName:v7];

  double valuePtr = 0.0;
  double v16 = 0.0;
  uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F48868]];

  AXValueGetValue((AXValueRef)v8, kAXValueTypeCGPoint, &valuePtr);
  double v13 = 0.0;
  double v14 = 0.0;
  objc_super v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F48858]];

  AXValueGetValue((AXValueRef)v9, kAXValueTypeCGPoint, &v13);
  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F48850]];

  uint64_t v11 = [v10 unsignedIntValue];
  v12 = objc_alloc_init(AXElementActionDropDescriptor);
  -[AXElementActionDropDescriptor setFixedScreenSpacePoint:](v12, "setFixedScreenSpacePoint:", valuePtr, v16);
  -[AXElementActionDropDescriptor setContextSpacePoint:](v12, "setContextSpacePoint:", v13, v14);
  [(AXElementActionDropDescriptor *)v12 setContextID:v11];
  [v6 setDropDescriptor:v12];
  [*(id *)(a1 + 48) addObject:v6];
}

void __44__AXElementActionManager_actionsForElement___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setType:1];
  [v7 setElement:*(void *)(a1 + 32)];
  uint64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v7 setName:v6];

  [v7 setDragActivationToken:v5];
  [*(id *)(a1 + 48) addObject:v7];
}

- (BOOL)performAction:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 type])
  {
    case 0:
      id v5 = [v4 element];
      uint64_t v6 = [v4 customActionIdentifier];
      char v7 = [v5 performAction:2021 withValue:v6];
      goto LABEL_4;
    case 1:
      uint64_t v8 = [(AXElementActionManager *)self dragManager];
      objc_super v9 = [v4 element];
      objc_msgSend(v8, "waitForDragStartFromPid:completionHandler:", objc_msgSend(v9, "pid"), 0);

      id v5 = [v4 element];
      uint64_t v6 = [(AXElementActionManager *)self dragManager];
      v10 = [v6 machServiceName];
      v16[0] = v10;
      uint64_t v11 = [v4 dragActivationToken];
      v16[1] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      char v7 = [v5 performAction:2050 withValue:v12];

LABEL_4:
      goto LABEL_10;
    case 2:
      double v13 = [(AXElementActionManager *)self dragManager];
      double v14 = [v4 dropDescriptor];
      [v14 fixedScreenSpacePoint];
      objc_msgSend(v13, "moveToAndDropAtPoint:");

      goto LABEL_8;
    case 3:
      double v13 = [(AXElementActionManager *)self dragManager];
      [v13 cancelDrag];
      goto LABEL_8;
    case 4:
      double v13 = [MEMORY[0x1E4F49468] server];
      objc_msgSend(v13, "performMedusaGesture:", objc_msgSend(v4, "medusaGesture"));
LABEL_8:

      break;
    default:
      break;
  }
  char v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)shouldIncludeMedusaActions
{
  return self->_shouldIncludeMedusaActions;
}

- (void)setShouldIncludeMedusaActions:(BOOL)a3
{
  self->_shouldIncludeMedusaActions = a3;
}

- (AXDragManager)dragManager
{
  return self->_dragManager;
}

- (void).cxx_destruct
{
}

@end