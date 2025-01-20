@interface _MPCQueueControllerBehaviorMusicEnumerator
- (_MPCQueueControllerBehaviorMusicEnumerator)initWithQueueEnumerator:(id)a3 startingComponents:(id)a4;
- (_MPCQueueControllerEnumerator)queueEnumerator;
- (id)_loadingComponentsForHeadOfSection:(id)a3;
- (id)nextObject;
@end

@implementation _MPCQueueControllerBehaviorMusicEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueEnumerator, 0);
  objc_storeStrong((id *)&self->_repeatOneComponents, 0);

  objc_storeStrong((id *)&self->_startingComponents, 0);
}

- (_MPCQueueControllerBehaviorMusicEnumerator)initWithQueueEnumerator:(id)a3 startingComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_MPCQueueControllerBehaviorMusicEnumerator;
  v9 = [(_MPCQueueControllerBehaviorMusicEnumerator *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingComponents, a4);
    objc_storeStrong((id *)&v10->_queueEnumerator, a3);
    objc_initWeak(&location, v10);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __89___MPCQueueControllerBehaviorMusicEnumerator_initWithQueueEnumerator_startingComponents___block_invoke;
    v17 = &unk_2643C5FF0;
    objc_copyWeak(&v18, &location);
    [(_MPCQueueControllerEnumerator *)v10->_queueEnumerator setRepeatBoundaryBlock:&v14];
    if (([(_MPCQueueControllerEnumerator *)v10->_queueEnumerator mode] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v11 = [(_MPCQueueControllerEnumerator *)v10->_queueEnumerator musicBehavior];
      uint64_t v12 = [v11 repeatType];

      if (v12) {
        v10->_repeatIteration = [v8 repeatIteration];
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)nextObject
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v74 = [(_MPCQueueControllerEnumerator *)self->_queueEnumerator musicBehavior];
  int64_t v4 = [(_MPCQueueControllerEnumerator *)self->_queueEnumerator mode];
  char v70 = [(_MPCQueueControllerEnumerator *)self->_queueEnumerator options];
  if (v4 == 3 && [v74 repeatType] == 1)
  {
    repeatOneComponents = self->_repeatOneComponents;
    if (repeatOneComponents) {
      goto LABEL_59;
    }
    SEL v68 = a2;
    if (self->_startingComponents) {
      ++self->_repeatIteration;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v6 = self->_queueEnumerator;
    uint64_t v7 = [(_MPCQueueControllerEnumerator *)v6 countByEnumeratingWithState:&v79 objects:v90 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v80;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v80 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v79 + 1) + 8 * v10);
          if ([v11 entryType] == 3)
          {
            v44 = [v11 itemResult];
            v45 = [v44 sectionIdentifier];
            v46 = [v44 itemIdentifier];
            v47 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v45 itemID:v46];

            v48 = (MPCQueueControllerBehaviorMusicIdentifierComponents *)[v47 copyWithRepeatIteration:self->_repeatIteration];
            v49 = self->_repeatOneComponents;
            self->_repeatOneComponents = v48;

            goto LABEL_58;
          }
          if ([v11 entryType] == 2)
          {
            uint64_t v12 = [v11 trackingEntryResult];
            v13 = [v12 sectionIdentifier];
            uint64_t v14 = [(_MPCQueueControllerBehaviorMusicEnumerator *)self _loadingComponentsForHeadOfSection:v13];
            if (v14)
            {
              uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
              v16 = v15;
              SEL v17 = v68;
              id v18 = self;
              uint64_t v19 = 4024;
              objc_super v20 = @"Encountered unexpected loading section Head in Natural Repeat One enumerator";
LABEL_21:
              [v15 handleFailureInMethod:v17 object:v18 file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:v19 description:v20];
            }
          }
          else
          {
            if ([v11 entryType] != 4) {
              goto LABEL_18;
            }
            uint64_t v12 = [v11 trackingEntryResult];
            v13 = [v12 sectionIdentifier];
            v21 = [v74 dataSources];
            uint64_t v14 = [v21 objectForKeyedSubscript:v13];

            if ([v14 shouldRequestAdditionalItemsAtTail])
            {
              uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
              v16 = v15;
              SEL v17 = v68;
              id v18 = self;
              uint64_t v19 = 4031;
              objc_super v20 = @"Encountered unexpected loading section Tail in Natural Repeat One enumerator";
              goto LABEL_21;
            }
          }

LABEL_18:
          ++v10;
        }
        while (v8 != v10);
        uint64_t v22 = [(_MPCQueueControllerEnumerator *)v6 countByEnumeratingWithState:&v79 objects:v90 count:16];
        uint64_t v8 = v22;
      }
      while (v22);
    }
LABEL_58:

    repeatOneComponents = self->_repeatOneComponents;
    if (repeatOneComponents)
    {
LABEL_59:
      v50 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)repeatOneComponents copyWithRepeatIteration:self->_repeatIteration];
      v51 = self->_repeatOneComponents;
      self->_repeatOneComponents = v50;

      ++self->_repeatIteration;
      repeatOneComponents = self->_repeatOneComponents;
    }
    v40 = [(MPCQueueControllerBehaviorMusicIdentifierComponents *)repeatOneComponents contentItemID];
    goto LABEL_81;
  }
  SEL v69 = a2;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v73 = self;
  v23 = self->_queueEnumerator;
  uint64_t v24 = [(_MPCQueueControllerEnumerator *)v23 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v76;
  unint64_t v71 = v4 & 0xFFFFFFFFFFFFFFFELL;
  BOOL v27 = (v4 & 0xFFFFFFFFFFFFFFFELL) != 2 || (v70 & 8) != 0;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v76 != v26) {
        objc_enumerationMutation(v23);
      }
      v29 = *(void **)(*((void *)&v75 + 1) + 8 * i);
      uint64_t v30 = [v29 entryType];
      switch(v30)
      {
        case 2:
          if (v27) {
            continue;
          }
          v33 = [v29 trackingEntryResult];
          v34 = [v33 sectionIdentifier];
          v31 = [(_MPCQueueControllerBehaviorMusicEnumerator *)v73 _loadingComponentsForHeadOfSection:v34];
          if (v31)
          {
            v35 = v31;
            v40 = [v31 contentItemID];
LABEL_80:

            goto LABEL_81;
          }
          goto LABEL_43;
        case 4:
          v33 = [v29 trackingEntryResult];
          v34 = [v33 sectionIdentifier];
          v32 = [v74 dataSources];
          v35 = [v32 objectForKeyedSubscript:v34];

          if (![v35 isRadioDataSource]
            || ![v35 shouldRequestAdditionalItemsAtTail])
          {
            goto LABEL_42;
          }
          if (v4 == 1)
          {
            if ((v70 & 8) != 0)
            {
              v52 = [v74 host];
              v53 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = [v52 engineID];
                v55 = [v74 sessionID];
                *(_DWORD *)buf = 138543874;
                v84 = v54;
                __int16 v85 = 2114;
                v86 = v55;
                __int16 v87 = 2114;
                v88 = v34;
                _os_log_impl(&dword_21BB87000, v53, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] enumerator nextObject: | returning nil [encountered radio tail while reverse enumerating in display mode] sectionID=%{public}@", buf, 0x20u);
              }
            }
            v40 = 0;
            queueEnumerator = v73->_queueEnumerator;
            v73->_queueEnumerator = 0;
          }
          else
          {
            if (v71 != 2)
            {
LABEL_42:

LABEL_43:
              continue;
            }
            v57 = [MEMORY[0x263F12210] positionForTailOfSection:v34];
            queueEnumerator = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:v74 mode:0 options:8 startPosition:v57 endPosition:0];

            v58 = [queueEnumerator nextObject];
            v59 = v58;
            if (v58)
            {
              v72 = queueEnumerator;
              if ([v58 entryType] != 3)
              {
                v67 = [MEMORY[0x263F08690] currentHandler];
                objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v69, v73, @"_MPCQueueControllerBehaviorMusic.m", 4111, @"Encountered unexpected enumeration result type: %ld", objc_msgSend(v59, "entryType"));
              }
              v60 = [v59 itemResult];
              v61 = [v60 sectionIdentifier];
              v62 = [v60 itemIdentifier];
              v63 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v61 itemID:v62];
              v64 = (void *)[v63 copyAsDeferredWithLoadingSectionID:v34];

              v40 = [v64 contentItemID];

              queueEnumerator = v72;
            }
            else
            {
              v60 = +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:v34];
              v40 = [v60 contentItemID];
            }
          }
          goto LABEL_80;
        case 3:
          v33 = [v29 itemResult];
          v34 = [v33 sectionIdentifier];
          v35 = [v33 itemIdentifier];
          v36 = [v74 dataSources];
          v37 = [v36 objectForKeyedSubscript:v34];

          if (v37)
          {
            if ([v37 shouldUsePlaceholderForItem:v35 inSection:v34])
            {
              if (v71 == 2)
              {
                v38 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v34 itemID:v35];
                uint64_t v39 = [v38 copyAsPlaceholder];
              }
              else
              {
                uint64_t v39 = 0;
              }
              if (!v4 || (v70 & 8) != 0) {
                goto LABEL_75;
              }
              v41 = v73->_queueEnumerator;
              v73->_queueEnumerator = 0;
LABEL_74:

LABEL_75:
              v41 = (void *)v39;
              goto LABEL_76;
            }
            v43 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v34 itemID:v35];
            v41 = v43;
            if (v71 != 2)
            {
LABEL_76:
              v40 = [v41 contentItemID];

              goto LABEL_80;
            }
            uint64_t v42 = [v43 copyWithRepeatIteration:v73->_repeatIteration];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v66 = [MEMORY[0x263F08690] currentHandler];
              [v66 handleFailureInMethod:v69, v73, @"_MPCQueueControllerBehaviorMusic.m", 4053, @"Enumerated an itemResult that has no dataSourceState: sectionID=%@", v34 object file lineNumber description];
            }
            v41 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v34 itemID:v35];
            uint64_t v42 = [v41 copyAsPlaceholder];
          }
          uint64_t v39 = v42;
          goto LABEL_74;
      }
    }
    uint64_t v25 = [(_MPCQueueControllerEnumerator *)v23 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_46:

  v40 = 0;
LABEL_81:

  return v40;
}

- (_MPCQueueControllerEnumerator)queueEnumerator
{
  return self->_queueEnumerator;
}

- (id)_loadingComponentsForHeadOfSection:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_MPCQueueControllerEnumerator *)self->_queueEnumerator musicBehavior];
  v6 = [v5 dataSources];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = objc_msgSend(v5, "dataSources", 0);
    uint64_t v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) state] != 1)
          {

            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
  if ([v7 state] == 1)
  {
LABEL_13:
    uint64_t v14 = +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:v4];
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v14 = 0;
LABEL_16:

  return v14;
}

@end