@interface ATXPBExecutableReferenceKey
+ (uint64_t)referencesType;
- (BOOL)hasExecutableAction;
- (BOOL)hasExecutableHeroApp;
- (BOOL)hasExecutableInfoSuggestion;
- (BOOL)hasExecutableLinkAction;
- (BOOL)hasExecutableString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)executableTypeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)referencesAtIndex:(id *)a1;
- (uint64_t)addReferences:(uint64_t)a1;
- (uint64_t)clearReferences;
- (uint64_t)executableAction;
- (uint64_t)executableHeroApp;
- (uint64_t)executableInfoSuggestion;
- (uint64_t)executableLinkAction;
- (uint64_t)executableString;
- (uint64_t)executableType;
- (uint64_t)references;
- (uint64_t)referencesCount;
- (uint64_t)setExecutableType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setExecutableAction:(uint64_t)a1;
- (void)setExecutableHeroApp:(uint64_t)a1;
- (void)setExecutableInfoSuggestion:(uint64_t)a1;
- (void)setExecutableLinkAction:(uint64_t)a1;
- (void)setExecutableString:(uint64_t)a1;
- (void)setReferences:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBExecutableReferenceKey

- (__CFString)executableTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D08EA0[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasExecutableString
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (BOOL)hasExecutableAction
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (BOOL)hasExecutableHeroApp
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)clearReferences
{
  if (result) {
    return [*(id *)(result + 56) removeAllObjects];
  }
  return result;
}

- (uint64_t)addReferences:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 56);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      v5 = *(void **)(a1 + 56);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)referencesCount
{
  if (result) {
    return [*(id *)(result + 56) count];
  }
  return result;
}

- (id)referencesAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)referencesType
{
  self;

  return objc_opt_class();
}

- (BOOL)hasExecutableInfoSuggestion
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasExecutableLinkAction
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBExecutableReferenceKey;
  id v4 = [(ATXPBExecutableReferenceKey *)&v8 description];
  v5 = [(ATXPBExecutableReferenceKey *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t executableType = self->_executableType;
  if (executableType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5D08EA0[executableType];
  }
  [v3 setObject:v5 forKey:@"executableType"];

  executableString = self->_executableString;
  if (executableString) {
    [v3 setObject:executableString forKey:@"executableString"];
  }
  executableAction = self->_executableAction;
  if (executableAction)
  {
    objc_super v8 = [(ATXPBAction *)executableAction dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"executableAction"];
  }
  executableHeroApp = self->_executableHeroApp;
  if (executableHeroApp)
  {
    v10 = [(ATXPBHeroAppPrediction *)executableHeroApp dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"executableHeroApp"];
  }
  if ([(NSMutableArray *)self->_references count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_references, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = self->_references;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"references"];
  }
  executableInfoSuggestion = self->_executableInfoSuggestion;
  if (executableInfoSuggestion)
  {
    v19 = [(ATXPBInfoSuggestion *)executableInfoSuggestion dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"executableInfoSuggestion"];
  }
  executableLinkAction = self->_executableLinkAction;
  if (executableLinkAction)
  {
    v21 = [(ATXPBLinkAction *)executableLinkAction dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"executableLinkAction"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBExecutableReferenceKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_executableString) {
    PBDataWriterWriteStringField();
  }
  if (self->_executableAction) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_executableHeroApp) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_references;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_executableInfoSuggestion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_executableLinkAction) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
    id v4 = *(void **)(a1 + 40);
    long long v13 = v3;
    if (v4) {
      -[ATXPBExecutableReferenceKey setExecutableString:]((uint64_t)v3, v4);
    }
    v5 = *(void **)(a1 + 8);
    if (v5) {
      -[ATXPBExecutableReferenceKey setExecutableAction:]((uint64_t)v13, v5);
    }
    uint64_t v6 = *(void **)(a1 + 16);
    if (v6) {
      -[ATXPBExecutableReferenceKey setExecutableHeroApp:]((uint64_t)v13, v6);
    }
    if ([*(id *)(a1 + 56) count])
    {
      [v13[7] removeAllObjects];
      uint64_t v7 = [*(id *)(a1 + 56) count];
      if (v7)
      {
        uint64_t v8 = v7;
        for (uint64_t i = 0; i != v8; ++i)
        {
          long long v10 = [*(id *)(a1 + 56) objectAtIndex:i];
          -[ATXPBExecutableReferenceKey addReferences:]((uint64_t)v13, v10);
        }
      }
    }
    long long v11 = *(void **)(a1 + 24);
    if (v11) {
      -[ATXPBExecutableReferenceKey setExecutableInfoSuggestion:]((uint64_t)v13, v11);
    }
    long long v12 = *(void **)(a1 + 32);
    id v3 = v13;
    if (v12)
    {
      -[ATXPBExecutableReferenceKey setExecutableLinkAction:]((uint64_t)v13, v12);
      id v3 = v13;
    }
  }
}

- (void)setExecutableString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setExecutableAction:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setExecutableHeroApp:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setExecutableInfoSuggestion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setExecutableLinkAction:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_executableType;
  uint64_t v6 = [(NSString *)self->_executableString copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(ATXPBAction *)self->_executableAction copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(ATXPBHeroAppPrediction *)self->_executableHeroApp copyWithZone:a3];
  long long v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v12 = self->_references;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (void)v23);
        -[ATXPBExecutableReferenceKey addReferences:](v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(ATXPBInfoSuggestion *)self->_executableInfoSuggestion copyWithZone:a3];
  v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  id v20 = [(ATXPBLinkAction *)self->_executableLinkAction copyWithZone:a3];
  v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_executableType == *((_DWORD *)v4 + 12)
    && ((executableString = self->_executableString, !((unint64_t)executableString | v4[5]))
     || -[NSString isEqual:](executableString, "isEqual:"))
    && ((executableAction = self->_executableAction, !((unint64_t)executableAction | v4[1]))
     || -[ATXPBAction isEqual:](executableAction, "isEqual:"))
    && ((executableHeroApp = self->_executableHeroApp, !((unint64_t)executableHeroApp | v4[2]))
     || -[ATXPBHeroAppPrediction isEqual:](executableHeroApp, "isEqual:"))
    && ((references = self->_references, !((unint64_t)references | v4[7]))
     || -[NSMutableArray isEqual:](references, "isEqual:"))
    && ((executableInfoSuggestion = self->_executableInfoSuggestion,
         !((unint64_t)executableInfoSuggestion | v4[3]))
     || -[ATXPBInfoSuggestion isEqual:](executableInfoSuggestion, "isEqual:")))
  {
    executableLinkAction = self->_executableLinkAction;
    if ((unint64_t)executableLinkAction | v4[4]) {
      char v11 = -[ATXPBLinkAction isEqual:](executableLinkAction, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_executableType;
  NSUInteger v4 = [(NSString *)self->_executableString hash];
  unint64_t v5 = v4 ^ [(ATXPBAction *)self->_executableAction hash];
  uint64_t v6 = v5 ^ [(ATXPBHeroAppPrediction *)self->_executableHeroApp hash];
  uint64_t v7 = v6 ^ [(NSMutableArray *)self->_references hash];
  uint64_t v8 = v7 ^ [(ATXPBInfoSuggestion *)self->_executableInfoSuggestion hash] ^ v3;
  return v8 ^ [(ATXPBLinkAction *)self->_executableLinkAction hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  NSUInteger v4 = v3;
  if (a1)
  {
    *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
    id v5 = v3[5];
    if (v5) {
      objc_storeStrong((id *)(a1 + 40), v5);
    }
    id v6 = v4[1];
    if (*(void *)(a1 + 8))
    {
      if (v6) {
        objc_msgSend(*(id *)(a1 + 8), "mergeFrom:");
      }
    }
    else if (v6)
    {
      objc_storeStrong((id *)(a1 + 8), v4[1]);
    }
    id v7 = v4[2];
    if (*(void *)(a1 + 16))
    {
      if (v7) {
        objc_msgSend(*(id *)(a1 + 16), "mergeFrom:");
      }
    }
    else if (v7)
    {
      objc_storeStrong((id *)(a1 + 16), v4[2]);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v4[7];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[ATXPBExecutableReferenceKey addReferences:](a1, *(void **)(*((void *)&v15 + 1) + 8 * i));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    id v13 = v4[3];
    if (*(void *)(a1 + 24))
    {
      if (v13) {
        [*(id *)(a1 + 24) mergeFrom:(void)v15];
      }
    }
    else if (v13)
    {
      objc_storeStrong((id *)(a1 + 24), v4[3]);
    }
    id v14 = v4[4];
    if (*(void *)(a1 + 32))
    {
      if (v14) {
        objc_msgSend(*(id *)(a1 + 32), "mergeFrom:");
      }
    }
    else if (v14)
    {
      objc_storeStrong((id *)(a1 + 32), v4[4]);
    }
  }
}

- (uint64_t)executableType
{
  if (result) {
    return *(unsigned int *)(result + 48);
  }
  return result;
}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)executableString
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)executableAction
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)executableHeroApp
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)references
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)setReferences:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)executableInfoSuggestion
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)executableLinkAction
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_executableString, 0);
  objc_storeStrong((id *)&self->_executableLinkAction, 0);
  objc_storeStrong((id *)&self->_executableInfoSuggestion, 0);
  objc_storeStrong((id *)&self->_executableHeroApp, 0);

  objc_storeStrong((id *)&self->_executableAction, 0);
}

@end