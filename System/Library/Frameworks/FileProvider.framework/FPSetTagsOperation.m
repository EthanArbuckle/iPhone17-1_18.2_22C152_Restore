@interface FPSetTagsOperation
- (FPSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation FPSetTagsOperation

- (FPSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPSetTagsOperation;
  v9 = [(FPTransformOperation *)&v14 initWithItemsOfDifferentProviders:v7 action:0];
  if (v9)
  {
    uint64_t v10 = [v7 count];
    if (v10 != [v8 count])
    {
      uint64_t v11 = [v7 count];
      if (v11 != [v8 count])
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"FPActionOperation.m", 1163, @"Number of items (%lu) doesn't match number of tag lists (%lu)", objc_msgSend(v7, "count"), objc_msgSend(v8, "count"));
      }
    }
    objc_storeStrong((id *)&v9->_tagsLists, a4);
    [(FPActionOperation *)v9 setSetupRemoteOperationService:1];
  }

  return v9;
}

- (id)replicateForItems:(id)a3
{
  id v4 = a3;
  v5 = [FPSetTagsOperation alloc];
  v6 = [(FPTransformOperation *)self items];
  id v7 = objc_msgSend(v6, "fp_pickItemsFromArray:correspondingToIndexesOfItemsInArray:", self->_tagsLists, v4);
  id v8 = [(FPSetTagsOperation *)v5 initWithItems:v4 tagsLists:v7];

  return v8;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  tagsLists = self->_tagsLists;
  id v6 = a3;
  id v7 = [(NSArray *)tagsLists objectAtIndex:a4];
  [v6 setTags:v7];

  return 16;
}

- (id)fp_prettyDescription
{
  v3 = NSString;
  id v4 = [(FPTransformOperation *)self items];
  v5 = objc_msgSend(v4, "fp_itemIdentifiers");
  id v6 = FPAbbreviatedArrayDescription(v5);
  id v7 = FPAbbreviatedArrayDescription(self->_tagsLists);
  id v8 = [v3 stringWithFormat:@"tag items %@ with tags %@", v6, v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end