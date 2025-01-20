@interface SGMicrodataParserStackItem
- (NSArray)itemScopes;
- (NSArray)textConsumers;
- (SGMicrodataDocument)document;
- (SGMicrodataParserStackItem)initWithDocument:(id)a3;
- (SGMicrodataParserStackItem)initWithParent:(id)a3 item:(id)a4 htmlId:(id)a5 textConsumer:(id)a6;
- (SGMicrodataParserStackItem)parent;
@end

@implementation SGMicrodataParserStackItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemScopes, 0);
  objc_storeStrong((id *)&self->_textConsumers, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (NSArray)itemScopes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)textConsumers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (SGMicrodataParserStackItem)parent
{
  return (SGMicrodataParserStackItem *)objc_getProperty(self, a2, 16, 1);
}

- (SGMicrodataDocument)document
{
  return (SGMicrodataDocument *)objc_getProperty(self, a2, 8, 1);
}

- (SGMicrodataParserStackItem)initWithParent:(id)a3 item:(id)a4 htmlId:(id)a5 textConsumer:(id)a6
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)SGMicrodataParserStackItem;
  v15 = [(SGMicrodataParserStackItem *)&v36 init];
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v16 = [v11 document];
  document = v15->_document;
  v15->_document = (SGMicrodataDocument *)v16;

  objc_storeStrong((id *)&v15->_parent, a3);
  if (v13
    && ([(SGMicrodataDocument *)v15->_document htmlIds],
        v18 = objc_claimAutoreleasedReturnValue(),
        [v18 objectForKeyedSubscript:v13],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    v20 = objc_opt_new();
    [(SGMicrodataDocument *)v15->_document setHtmlIdItemScope:v20 forHtmlId:v13];
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v20 = 0;
    if (v12)
    {
LABEL_5:
      if (v20)
      {
        v38[0] = v12;
        v38[1] = v20;
        v21 = (void *)MEMORY[0x1E4F1C978];
        v22 = (id *)v38;
        uint64_t v23 = 2;
      }
      else
      {
        id v37 = v12;
        v21 = (void *)MEMORY[0x1E4F1C978];
        v22 = &v37;
        uint64_t v23 = 1;
      }
      uint64_t v28 = [v21 arrayWithObjects:v22 count:v23];
      itemScopes = v15->_itemScopes;
      v15->_itemScopes = (NSArray *)v28;
      goto LABEL_12;
    }
  }
  v24 = [v11 itemScopes];
  itemScopes = v24;
  if (v20)
  {
    uint64_t v26 = [(NSArray *)v24 arrayByAddingObject:v20];
    v27 = v15->_itemScopes;
    v15->_itemScopes = (NSArray *)v26;
  }
  else
  {
    v35 = v15->_itemScopes;
    v15->_itemScopes = v24;
    itemScopes = v35;
  }
LABEL_12:

  v29 = [v11 textConsumers];
  v30 = v29;
  if (v14)
  {
    uint64_t v31 = [(NSArray *)v29 arrayByAddingObject:v14];
    textConsumers = v15->_textConsumers;
    v15->_textConsumers = (NSArray *)v31;
  }
  else
  {
    v33 = v15->_textConsumers;
    v15->_textConsumers = v29;
    v30 = v33;
  }

LABEL_16:
  return v15;
}

- (SGMicrodataParserStackItem)initWithDocument:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGMicrodataParserStackItem;
  v6 = [(SGMicrodataParserStackItem *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    parent = v7->_parent;
    v7->_parent = 0;

    textConsumers = v7->_textConsumers;
    v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v7->_textConsumers = (NSArray *)MEMORY[0x1E4F1CBF0];

    itemScopes = v7->_itemScopes;
    v7->_itemScopes = v10;
  }
  return v7;
}

@end