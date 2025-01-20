@interface _MPCQueueControllerEnumerator
+ (_MPCQueueControllerEnumerator)enumeratorWithMusicBehavior:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 startPosition:(id)a6 endPosition:(id)a7;
- (MPSectionedIdentifierListPosition)endPosition;
- (MPSectionedIdentifierListPosition)startPosition;
- (NSEnumerator)enumerator;
- (_MPCQueueControllerBehaviorMusic)musicBehavior;
- (id)_init;
- (id)nextObject;
- (id)repeatBoundaryBlock;
- (int64_t)mode;
- (unint64_t)options;
- (void)_buildEnumerator;
- (void)setRepeatBoundaryBlock:(id)a3;
@end

@implementation _MPCQueueControllerEnumerator

+ (_MPCQueueControllerEnumerator)enumeratorWithMusicBehavior:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 startPosition:(id)a6 endPosition:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = [[_MPCQueueControllerEnumerator alloc] _init];
  objc_storeWeak(v14 + 4, v11);
  v14[5] = (id)a4;
  v14[6] = (id)a5;
  objc_storeStrong(v14 + 8, a6);
  if ((a5 & 8) != 0)
  {
    v14[1] = (id)2;
    if (v12)
    {
      v22 = [v12 itemIdentifier];
      int v23 = [v22 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"];

      if (v23)
      {
        v14[1] = (id)1;
        id v24 = v14[8];
        v14[8] = 0;
      }
      v25 = [v11 identifierList];
      v26 = [v12 sectionIdentifier];
      char v27 = [v25 hasSection:v26];

      if (v27)
      {
        uint64_t v21 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v14[1] = (id)1;
    if (v12)
    {
      v15 = [v12 itemIdentifier];
      int v16 = [v15 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"];

      if (v16)
      {
        v14[1] = (id)2;
        id v17 = v14[8];
        v14[8] = 0;
      }
      v18 = [v11 autoPlayIdentifierList];
      v19 = [v12 sectionIdentifier];
      int v20 = [v18 hasSection:v19];

      if (v20)
      {
        uint64_t v21 = 2;
LABEL_12:
        v14[1] = (id)v21;
      }
    }
  }
  id v28 = v14[9];
  v14[9] = v13;

  return (_MPCQueueControllerEnumerator *)v14;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_MPCQueueControllerEnumerator;
  return [(_MPCQueueControllerEnumerator *)&v3 init];
}

- (id)nextObject
{
  enumerator = self->_enumerator;
  if (!enumerator)
  {
    [(_MPCQueueControllerEnumerator *)self _buildEnumerator];
    enumerator = self->_enumerator;
  }
  v4 = [(NSEnumerator *)enumerator nextObject];
  if (!v4)
  {
    [(_MPCQueueControllerEnumerator *)self _buildEnumerator];
    v4 = [(NSEnumerator *)self->_enumerator nextObject];
  }
  if (self->_isEnumeratingFromRepeatAllBase && [v4 entryType] == 3) {
    self->_hasEmittedItemFromRepeatAllBase = 1;
  }

  return v4;
}

- (int64_t)mode
{
  return self->_mode;
}

- (_MPCQueueControllerBehaviorMusic)musicBehavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehavior);

  return (_MPCQueueControllerBehaviorMusic *)WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setRepeatBoundaryBlock:(id)a3
{
}

- (void)_buildEnumerator
{
  v39[1] = *MEMORY[0x263EF8340];
  v4 = self->_startPosition;
  v5 = self->_endPosition;
  unint64_t options = self->_options;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehavior);
  if ([WeakRetained autoPlayEnabled] && objc_msgSend(WeakRetained, "repeatType") != 2)
  {
    id v12 = 0;
  }
  else
  {
    v7 = [WeakRetained autoPlayEndPosition];
    v8 = v7;
    if (v7)
    {
      if ([v7 entryType] != 3)
      {
        v37 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_MPCQueueControllerBehaviorMusic.m", 4216, @"Unexpected autoPlayEndPosition.entryType: %d", objc_msgSend(v8, "entryType"));
      }
      v9 = [v8 sectionIdentifier];
      v10 = [v8 itemIdentifier];
      id v11 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v9 itemID:v10];

      id v12 = [WeakRetained _upNextSectionIdentifierForItem:v11 shouldLookInBaseList:0];
    }
    else
    {
      id v12 = [WeakRetained latestUpNextSectionID];
      if (v12)
      {
        id v13 = [WeakRetained autoPlayIdentifierList];
        v14 = [WeakRetained latestUpNextSectionID];
        int v15 = [v13 hasSection:v14];

        if (v15)
        {
          id v12 = [WeakRetained latestUpNextSectionID];
        }
        else
        {
          id v12 = 0;
        }
      }
    }
  }
  switch(self->_nextEnumerator)
  {
    case 0:
      goto LABEL_63;
    case 1:
      self->_nextEnumerator = 0;
      if ((self->_options & 8) == 0)
      {
        if ((uint64_t v16 = [WeakRetained repeatType], (objc_msgSend(WeakRetained, "autoPlayEnabled"))
           || ([WeakRetained autoPlayEndPosition],
               id v17 = objc_claimAutoreleasedReturnValue(),
               v17,
               v17))
          && !v16
          || !self->_mode
          || v12)
        {
          self->_nextEnumerator = 2;
        }
      }
      if ((self->_mode & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v18 = [WeakRetained repeatType];
        if (!self->_nextEnumerator && v18 == 2)
        {
          self->_nextEnumerator = 3;
          startPosition = self->_startPosition;
          self->_startPosition = 0;

          endPosition = self->_endPosition;
          self->_endPosition = 0;
        }
      }
      self->_isEnumeratingFromRepeatAllBase = 0;
      uint64_t v22 = [WeakRetained identifierList];
      goto LABEL_47;
    case 2:
      if ((self->_options & 8) != 0)
      {
        if (!v4)
        {
          if (v12) {
            [MEMORY[0x263F12210] positionForTailOfSection:v12];
          }
          else {
          v4 = [WeakRetained autoPlayEndPosition];
          }
        }
        int64_t v23 = 1;
      }
      else
      {
        if (v5)
        {
LABEL_32:
          int64_t v23 = 0;
          goto LABEL_46;
        }
        if (v12)
        {
          v5 = [MEMORY[0x263F12210] positionForTailOfSection:v12];
          goto LABEL_32;
        }
        v5 = [WeakRetained autoPlayEndPosition];
        int64_t v23 = 0;
        options |= 0x40uLL;
      }
LABEL_46:
      self->_nextEnumerator = v23;
      self->_isEnumeratingFromRepeatAllBase = 0;
      uint64_t v22 = [WeakRetained autoPlayIdentifierList];
      if (v22)
      {
LABEL_47:
        id v24 = (void *)v22;
LABEL_48:
        if (!v4) {
          goto LABEL_56;
        }
LABEL_54:
        v31 = [(MPSectionedIdentifierListPosition *)v4 sectionIdentifier];
        char v32 = [v24 hasSection:v31];

        if ((v32 & 1) == 0)
        {

          v4 = 0;
        }
        goto LABEL_56;
      }
      if ([WeakRetained autoPlayState] == 9 && self->_mode)
      {
        v26 = [_MPCAutoPlayEnumerationResult alloc];
        id v24 = [WeakRetained sessionID];
        char v27 = [(_MPCAutoPlayEnumerationResult *)v26 initWithSectionIdentifier:v24];
        v39[0] = v27;
        id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
        v29 = [v28 objectEnumerator];
        enumerator = self->_enumerator;
        self->_enumerator = v29;

        goto LABEL_62;
      }
LABEL_53:
      id v24 = 0;
      if (v4) {
        goto LABEL_54;
      }
LABEL_56:
      if (v5)
      {
        v33 = [(MPSectionedIdentifierListPosition *)v5 sectionIdentifier];
        char v34 = [v24 hasSection:v33];

        if ((v34 & 1) == 0)
        {

          v5 = 0;
        }
      }
      if ([(MPSectionedIdentifierListPosition *)v4 isEqual:v5])
      {
        self->_nextEnumerator = 0;
      }
      else
      {
        v35 = [v24 enumeratorWithOptions:options startPosition:v4 endPosition:v5];
        v36 = self->_enumerator;
        self->_enumerator = v35;
      }
LABEL_62:

LABEL_63:
      return;
    case 3:
      if (self->_isEnumeratingFromRepeatAllBase && !self->_hasEmittedItemFromRepeatAllBase) {
        goto LABEL_63;
      }
      self->_isEnumeratingFromRepeatAllBase = 1;
      id v24 = [WeakRetained identifierList];
      repeatBoundaryBlock = (void (**)(void))self->_repeatBoundaryBlock;
      if (!repeatBoundaryBlock) {
        goto LABEL_48;
      }
      repeatBoundaryBlock[2]();
      if (!v4) {
        goto LABEL_56;
      }
      goto LABEL_54;
    default:
      goto LABEL_53;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPosition, 0);
  objc_storeStrong((id *)&self->_startPosition, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_destroyWeak((id *)&self->_musicBehavior);

  objc_storeStrong(&self->_repeatBoundaryBlock, 0);
}

- (MPSectionedIdentifierListPosition)endPosition
{
  return self->_endPosition;
}

- (MPSectionedIdentifierListPosition)startPosition
{
  return self->_startPosition;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)repeatBoundaryBlock
{
  return self->_repeatBoundaryBlock;
}

@end