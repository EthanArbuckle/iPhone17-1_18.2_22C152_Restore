@interface CDMVocEntry
- (BOOL)isEqual:(id)a3;
- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5;
- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5 usoGraph:(id)a6 nodeIndex:(int)a7;
- (NSString)label;
- (NSString)semantic;
- (NSString)text;
- (SIRINLUEXTERNALUsoGraph)usoGraph;
- (id)description;
- (int)nodeIndex;
- (void)setNodeIndex:(int)a3;
- (void)setUsoGraph:(id)a3;
@end

@implementation CDMVocEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_semantic, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setNodeIndex:(int)a3
{
  self->_nodeIndex = a3;
}

- (int)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setUsoGraph:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)usoGraph
{
  return self->_usoGraph;
}

- (NSString)semantic
{
  return self->_semantic;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CDMVocEntry *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    text = self->_text;
    v8 = [(CDMVocEntry *)v6 text];
    if ([(NSString *)text isEqual:v8])
    {
      label = self->_label;
      v10 = [(CDMVocEntry *)v6 label];
      if ([(NSString *)label isEqual:v10])
      {
        semantic = self->_semantic;
        v12 = [(CDMVocEntry *)v6 semantic];
        char v13 = [(NSString *)semantic isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Voc Entry text: %@, label: %@, semantic: %@", self->_text, self->_label, self->_semantic];
}

- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5 usoGraph:(id)a6 nodeIndex:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CDMVocEntry;
  v17 = [(CDMVocEntry *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_text, a3);
    objc_storeStrong((id *)&v18->_label, a4);
    objc_storeStrong((id *)&v18->_semantic, a5);
    objc_storeStrong((id *)&v18->_usoGraph, a6);
    v18->_nodeIndex = a7;
  }

  return v18;
}

- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMVocEntry;
  v12 = [(CDMVocEntry *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_semantic, a5);
  }

  return v13;
}

@end