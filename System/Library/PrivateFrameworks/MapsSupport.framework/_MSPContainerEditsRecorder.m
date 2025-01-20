@interface _MSPContainerEditsRecorder
- (NSArray)orderedEdits;
- (NSMutableArray)recordableMutableArray;
- (_MSPContainerEditsRecorder)initWithMutableArray:(id)a3;
- (id)editableObjectsAtIndexes:(id)a3;
- (id)objectInEditableObjectsAtIndex:(unint64_t)a3;
- (unint64_t)countOfEditableObjects;
- (void)_editDetectorDidDetectUpdateForObject:(id)a3;
- (void)_mutableObjectContentDidUpdate:(id)a3;
- (void)getEditableObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertEditableObjects:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inEditableObjectsAtIndex:(unint64_t)a4;
- (void)removeEditableObjectsAtIndexes:(id)a3;
- (void)removeObjectFromEditableObjectsAtIndex:(unint64_t)a3;
- (void)replaceEditableObjectsAtIndexes:(id)a3 withEditableObjects:(id)a4;
- (void)replaceObjectInEditableObjectsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)useImmutableObjectsForEditsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4;
@end

@implementation _MSPContainerEditsRecorder

- (_MSPContainerEditsRecorder)initWithMutableArray:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MSPContainerEditsRecorder;
  v6 = [(_MSPContainerEditsRecorder *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalMutableArray, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedEdits = v7->_orderedEdits;
    v7->_orderedEdits = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__mutableObjectContentDidUpdate_ name:@"MSPMutableObjectContentDidUpdateNotification" object:0];
  }
  return v7;
}

- (NSMutableArray)recordableMutableArray
{
  return (NSMutableArray *)[(_MSPContainerEditsRecorder *)self mutableArrayValueForKey:@"editableObjects"];
}

- (NSArray)orderedEdits
{
  return (NSArray *)self->_orderedEdits;
}

- (unint64_t)countOfEditableObjects
{
  return [(NSMutableArray *)self->_originalMutableArray count];
}

- (id)objectInEditableObjectsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_originalMutableArray objectAtIndexedSubscript:a3];
}

- (id)editableObjectsAtIndexes:(id)a3
{
  return (id)[(NSMutableArray *)self->_originalMutableArray objectsAtIndexes:a3];
}

- (void)getEditableObjects:(id *)a3 range:(_NSRange)a4
{
}

- (void)insertObject:(id)a3 inEditableObjectsAtIndex:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSMutableArray *)self->_originalMutableArray insertObject:v6 atIndex:a4];
  if (a4)
  {
    v7 = [(NSMutableArray *)self->_originalMutableArray objectAtIndexedSubscript:a4 - 1];
    v8 = [v7 storageIdentifier];
  }
  else
  {
    v8 = 0;
  }
  orderedEdits = self->_orderedEdits;
  v10 = [_MSPContainerEditAddition alloc];
  v17[0] = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  objc_super v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v15 = [(_MSPContainerEditAddition *)v10 initWithObjects:v11 indexes:v12 identifiersAtop:v14];
  [(NSMutableArray *)orderedEdits addObject:v15];

  if (!v8) {
}
  }

- (void)removeObjectFromEditableObjectsAtIndex:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:");
  [(NSMutableArray *)self->_originalMutableArray removeObjectAtIndex:a3];
  orderedEdits = self->_orderedEdits;
  v7 = [_MSPContainerEditRemoval alloc];
  v11[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  v10 = [(_MSPContainerEditRemoval *)v7 initWithRemovedObjects:v8 indexes:v9];
  [(NSMutableArray *)orderedEdits addObject:v10];
}

- (void)replaceObjectInEditableObjectsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(NSMutableArray *)self->_originalMutableArray objectAtIndexedSubscript:a3];
  if (([v7 isEqual:v6] & 1) == 0)
  {
    [(NSMutableArray *)self->_originalMutableArray replaceObjectAtIndex:a3 withObject:v6];
    orderedEdits = self->_orderedEdits;
    v9 = [_MSPContainerEditReplacement alloc];
    v15[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v14 = v6;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    objc_super v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    v13 = [(_MSPContainerEditReplacement *)v9 initWithOriginalObjects:v10 replacementObjects:v11 indexes:v12];
    [(NSMutableArray *)orderedEdits addObject:v13];
  }
}

- (void)insertEditableObjects:(id)a3 atIndexes:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [(NSMutableArray *)self->_originalMutableArray insertObjects:v15 atIndexes:v6];
  v7 = objc_opt_new();
  uint64_t v8 = [v6 firstIndex];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v8 - 1;
    if (v8) {
      goto LABEL_7;
    }
    while (1)
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v7 addObject:v11];
      while (1)
      {

        if (!v9) {
          break;
        }
LABEL_7:
        v11 = [(NSMutableArray *)self->_originalMutableArray objectAtIndexedSubscript:v10];
        id v14 = [v11 storageIdentifier];
        [v7 addObject:v14];
      }
    }
  }
  orderedEdits = self->_orderedEdits;
  v13 = [[_MSPContainerEditAddition alloc] initWithObjects:v15 indexes:v6 identifiersAtop:v7];
  [(NSMutableArray *)orderedEdits addObject:v13];
}

- (void)removeEditableObjectsAtIndexes:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    v4 = [(NSMutableArray *)self->_originalMutableArray objectsAtIndexes:v7];
    [(NSMutableArray *)self->_originalMutableArray removeObjectsAtIndexes:v7];
    orderedEdits = self->_orderedEdits;
    id v6 = [[_MSPContainerEditRemoval alloc] initWithRemovedObjects:v4 indexes:v7];
    [(NSMutableArray *)orderedEdits addObject:v6];
  }
}

- (void)replaceEditableObjectsAtIndexes:(id)a3 withEditableObjects:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMutableArray *)self->_originalMutableArray objectsAtIndexes:v10];
  if (([v7 isEqual:v6] & 1) == 0)
  {
    [(NSMutableArray *)self->_originalMutableArray replaceObjectsAtIndexes:v10 withObjects:v6];
    orderedEdits = self->_orderedEdits;
    uint64_t v9 = [[_MSPContainerEditReplacement alloc] initWithOriginalObjects:v7 replacementObjects:v6 indexes:v10];
    [(NSMutableArray *)orderedEdits addObject:v9];
  }
}

- (void)_mutableObjectContentDidUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    originalMutableArray = self->_originalMutableArray;
    id v8 = v4;
    id v6 = [v4 object];
    LODWORD(originalMutableArray) = [(NSMutableArray *)originalMutableArray containsObject:v6];

    id v4 = v8;
    if (originalMutableArray)
    {
      id v7 = [v8 object];
      [(_MSPContainerEditsRecorder *)self _editDetectorDidDetectUpdateForObject:v7];

      id v4 = v8;
    }
  }
}

- (void)_editDetectorDidDetectUpdateForObject:(id)a3
{
  id v4 = a3;
  updatedObjects = self->_updatedObjects;
  id v10 = v4;
  if (!updatedObjects)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_updatedObjects;
    self->_updatedObjects = v6;

    id v4 = v10;
    updatedObjects = self->_updatedObjects;
  }
  if (([(NSMutableSet *)updatedObjects containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_updatedObjects addObject:v10];
    orderedEdits = self->_orderedEdits;
    uint64_t v9 = [[_MSPContainerEditContentUpdate alloc] initWithUpdatedObject:v10];
    [(NSMutableArray *)orderedEdits addObject:v9];
  }
}

- (void)useImmutableObjectsForEditsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(_MSPContainerEditsRecorder *)self orderedEdits];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) useImmutableObjectsFromMap:v6 intermediateMutableObjectTransferBlock:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_orderedEdits, 0);

  objc_storeStrong((id *)&self->_originalMutableArray, 0);
}

@end