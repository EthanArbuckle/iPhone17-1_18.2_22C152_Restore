@interface _LTDisambiguationUserSelection
- (BOOL)isEqual:(id)a3;
- (NSString)sourceSnippet;
- (_LTDirectedEdge)edge;
- (_LTDisambiguationUserSelection)initWithEdge:(id)a3 sourceSnippet:(id)a4 linkIndex:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)linkIndex;
@end

@implementation _LTDisambiguationUserSelection

- (_LTDisambiguationUserSelection)initWithEdge:(id)a3 sourceSnippet:(id)a4 linkIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_LTDisambiguationUserSelection;
  v10 = [(_LTDisambiguationUserSelection *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    edge = v10->_edge;
    v10->_edge = (_LTDirectedEdge *)v11;

    uint64_t v13 = [v9 copy];
    sourceSnippet = v10->_sourceSnippet;
    v10->_sourceSnippet = (NSString *)v13;

    v10->_linkIndex = a5;
    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(_LTDisambiguationUserSelection *)self edge];
    v6 = [v4 edge];
    if ([v5 isEqual:v6])
    {
      v7 = [(_LTDisambiguationUserSelection *)self sourceSnippet];
      id v8 = [v4 sourceSnippet];
      if ([v7 isEqualToString:v8])
      {
        unint64_t v9 = [(_LTDisambiguationUserSelection *)self linkIndex];
        BOOL v10 = v9 == [v4 linkIndex];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(_LTDisambiguationUserSelection *)self edge];
  uint64_t v4 = [v3 hash];
  v5 = [(_LTDisambiguationUserSelection *)self sourceSnippet];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_LTDisambiguationUserSelection linkIndex](self, "linkIndex"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  uint64_t v4 = (void *)[(_LTDirectedEdge *)v3->_edge copy];
  v5 = (void *)[(NSString *)v3->_sourceSnippet copy];
  uint64_t v6 = [(_LTDisambiguationUserSelection *)v3 initWithEdge:v4 sourceSnippet:v5 linkIndex:v3->_linkIndex];

  return v6;
}

- (_LTDirectedEdge)edge
{
  return self->_edge;
}

- (NSString)sourceSnippet
{
  return self->_sourceSnippet;
}

- (unint64_t)linkIndex
{
  return self->_linkIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSnippet, 0);

  objc_storeStrong((id *)&self->_edge, 0);
}

@end