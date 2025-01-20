@interface AVTAvatarAttributeEditorSectionCoordinator
- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate;
- (AVTAvatarAttributeEditorSectionCoordinator)init;
- (BOOL)isCoordinatingForSectionController:(id)a3;
- (NSMutableDictionary)sectionControllers;
- (void)addSectionController:(id)a3;
- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4;
- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3;
- (void)removeSectionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSectionControllers:(id)a3;
@end

@implementation AVTAvatarAttributeEditorSectionCoordinator

- (AVTAvatarAttributeEditorSectionCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarAttributeEditorSectionCoordinator;
  v2 = [(AVTAvatarAttributeEditorSectionCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    sectionControllers = v2->_sectionControllers;
    v2->_sectionControllers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)isCoordinatingForSectionController:(id)a3
{
  id v4 = a3;
  v5 = [(AVTAvatarAttributeEditorSectionCoordinator *)self sectionControllers];
  objc_super v6 = [v4 section];

  v7 = [v6 identifier];
  v8 = [v5 objectForKeyedSubscript:v7];
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)addSectionController:(id)a3
{
  id v7 = a3;
  if (!-[AVTAvatarAttributeEditorSectionCoordinator isCoordinatingForSectionController:](self, "isCoordinatingForSectionController:"))
  {
    [v7 setDelegate:self];
    id v4 = [(AVTAvatarAttributeEditorSectionCoordinator *)self sectionControllers];
    v5 = [v7 section];
    objc_super v6 = [v5 identifier];
    [v4 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)removeSectionController:(id)a3
{
  id v7 = a3;
  if (-[AVTAvatarAttributeEditorSectionCoordinator isCoordinatingForSectionController:](self, "isCoordinatingForSectionController:"))
  {
    id v4 = [(AVTAvatarAttributeEditorSectionCoordinator *)self sectionControllers];
    v5 = [v7 section];
    objc_super v6 = [v5 identifier];
    [v4 setObject:0 forKeyedSubscript:v6];
  }
}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTAvatarAttributeEditorSectionCoordinator *)self delegate];
  [v8 attributeEditorSectionController:v7 didDeleteSectionItems:v6];
}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTAvatarAttributeEditorSectionCoordinator *)self delegate];
  [v8 attributeEditorSectionController:v7 didSelectSectionItem:v6];
}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(AVTAvatarAttributeEditorSectionCoordinator *)self sectionControllers];
  BOOL v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v17 + 1) + 8 * v13);
        if (v14 != v6)
        {
          v15 = [v6 section];
          [v14 attributeSection:v15 didChangeValueForSectionItem:v7];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v16 = [(AVTAvatarAttributeEditorSectionCoordinator *)self delegate];
  [v16 attributeEditorSectionController:v6 didUpdateSectionItem:v7];
}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorSectionCoordinator *)self delegate];
  [v5 attributeEditorSectionControllerNeedsLayoutUpdate:v4];
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end